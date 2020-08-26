package com.a528854302.gmall.seckill.service.impl;

import com.a528854302.common.utils.R;
import com.a528854302.gmall.provider.entity.SeckillSessionEntity;
import com.a528854302.gmall.provider.entity.SeckillSkuRelationEntity;
import com.a528854302.gmall.seckill.task.SeckillCallableTask;
import com.a528854302.gmall.seckill.constant.SeckillConst;
import com.a528854302.gmall.seckill.feign.ProviderClient;
import com.a528854302.gmall.seckill.service.SeckilService;
import com.a528854302.gmall.seckill.vo.SeckillSkuVo;
import com.alibaba.fastjson.JSON;
import javafx.scene.chart.BubbleChart;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RSemaphore;
import org.redisson.api.RedissonClient;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.BoundHashOperations;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import java.util.*;
import java.util.concurrent.*;
import java.util.stream.Collectors;

/**
 * @ClassName SeckilServiceImpl
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/23
 **/
@Service
@Slf4j
public class SeckilServiceImpl implements SeckilService {
    @Autowired
    StringRedisTemplate redisTemplate;
    @Autowired
    ProviderClient providerClient;
    @Autowired
    RedissonClient redissonClient;
    @Override
    public void upSeckillProducts() {
        List<SeckillSessionEntity> lastest3DaysSessions = providerClient.getLastest3DaysSessions();
        if (lastest3DaysSessions !=null && lastest3DaysSessions.size()>0){
            for (SeckillSessionEntity session : lastest3DaysSessions) {
                long endTime = session.getEndTime().getTime();
                String redisSessionKey = SeckillConst.SECKILL_SESSION_REDIS_PREFIX+session.getStartTime().getTime()
                        +"_"+ endTime;
                long ttl = endTime - new Date().getTime();
                if (!redisTemplate.hasKey(redisSessionKey)&& ttl>0){
                    BoundHashOperations<String, Object, Object> ops = redisTemplate.boundHashOps(redisSessionKey);
                    List<SeckillSkuVo> seckillSkuVos = saveRedisSeckillVos(ops,session,ttl, TimeUnit.MILLISECONDS);
                }
            }
        }
    }

    @Override
    public List<SeckillSkuVo> getLastestSessionRelateSeckillSkus() {
        Set<String> keys = redisTemplate.keys(SeckillConst.SECKILL_SESSION_REDIS_PREFIX + "*");
        long now = new Date().getTime();
        List<Long> startTimes = keys.stream().filter(j->{
            Long endTime = Long.parseLong(j.split("_")[2]);
            return endTime>now;
        }).map(i -> {
            String s = i.replace(SeckillConst.SECKILL_SESSION_REDIS_PREFIX, "");
            String startTime = s.split("_")[0];
            return Long.parseLong(startTime);
        }).collect(Collectors.toList());

        Long lastest = getlasestTime(startTimes);
        Iterator<String> iterator = redisTemplate.keys(SeckillConst.SECKILL_SESSION_REDIS_PREFIX + lastest + "*").iterator();
        if (iterator.hasNext()){
            String redisSessionKey = iterator.next();
            List<Object> jsonstrs = redisTemplate.boundHashOps(redisSessionKey).values();
            return jsonstrs.stream().map(i -> {
                SeckillSkuVo seckillSkuVo = JSON.parseObject((String) i, SeckillSkuVo.class);
                seckillSkuVo.setSeckillToken(null);
                seckillSkuVo.setRedisSessionKey(redisSessionKey);
                return seckillSkuVo;
            }).collect(Collectors.toList());
        }
        return null;
    }

    @Override
    public SeckillSkuVo getSeckillSkuVo(String sessionKey, String id) {
        String jsonStr = (String) redisTemplate.boundHashOps(sessionKey).get(id);
        Set<Object> keys = redisTemplate.boundHashOps(sessionKey).keys();
        SeckillSkuVo vo = JSON.parseObject(jsonStr, SeckillSkuVo.class);
        String replace = sessionKey.replace(SeckillConst.SECKILL_SESSION_REDIS_PREFIX, "");
        Long startTime = Long.parseLong(replace.split("_")[0]);
        Long endTime = Long.parseLong(replace.split("_")[1]);
        long now = new Date().getTime();
        String remainStock = redisTemplate.boundValueOps(SeckillConst.SECKILL_SKU_STOCK_SEMAPHOR_PREFIX
                + vo.getSeckillToken()).get();
        vo.setRemainStock(remainStock);
        if (now <startTime || now>endTime){
            vo.setSeckillToken(null);
            vo.setStart(false);
            vo.setStartOrEndMillies(startTime-now);
        }
        vo.setStartOrEndMillies(endTime-now);
        vo.setRedisSessionKey(sessionKey);
        return vo;
    }
    @Autowired
    ThreadPoolExecutor threadPoolExecutor;

    @Override
    public R seckill(String sessionKey, String id, String userId, String token) {
        RSemaphore semaphore = redissonClient
                .getSemaphore(SeckillConst.SECKILL_SKU_STOCK_SEMAPHOR_PREFIX + token);
        Future<R> future = threadPoolExecutor
                .submit(new SeckillCallableTask(sessionKey, id, userId, token
                , redisTemplate, semaphore));
        try {
            R r = future.get();
            return r;
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
        return null;
    }






    private List<SeckillSkuVo> saveRedisSeckillVos(BoundHashOperations operations, SeckillSessionEntity session
    ,Long time,TimeUnit timeUnit) {
        List<SeckillSkuRelationEntity> entities = session.getSeckillSkuRelationEntities();
        if (entities!=null&&entities.size()>0){
            List<SeckillSkuVo> vos = entities.stream().map(e -> {
                String token = UUID.randomUUID().toString().replace("-", "");
                SeckillSkuVo vo = new SeckillSkuVo();
                BeanUtils.copyProperties(e, vo);
                BeanUtils.copyProperties(e.getSkuInfoEntity(), vo);
                vo.setSeckillToken(token);
                operations.put(e.getId().toString(),JSON.toJSONString(vo));
                operations.expire(time,timeUnit);
                //设置库存信号量
                redisTemplate.boundValueOps(SeckillConst.SECKILL_SKU_STOCK_SEMAPHOR_PREFIX+vo.getSeckillToken())
                        .set(vo.getSeckillCount().toString(),time,timeUnit);
                log.info("上架商品:{}",JSON.toJSONString(vo));
                return vo;
            }).collect(Collectors.toList());
            return vos;
        }
        return null;
    }

    private void setSkuToken(SeckillSessionEntity session) {
        List<SeckillSkuRelationEntity> entities = session.getSeckillSkuRelationEntities();
        if (entities!=null&&entities.size()>0){
            entities.forEach(e->{
                String token = UUID.randomUUID().toString().replace("-", "");
                e.setSeckillToken(token);
            });
        }
    }



    private static Long getlasestTime(List<Long> startTimes) {
        if (startTimes!=null && startTimes.size()>1){
            Long min = null;
            for (int i = 0; i < startTimes.size()-1; i++) {
                min=startTimes.get(i);
                Long temp = startTimes.get(i + 1);
                if (min > temp){
                    min = temp;
                }
            }
            return min;
        }else if (startTimes!=null && startTimes.size()==1){
            return startTimes.get(0);
        }
        return null;
    }
}

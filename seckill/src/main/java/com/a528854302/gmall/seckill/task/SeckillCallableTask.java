package com.a528854302.gmall.seckill.task;

import com.a528854302.common.utils.R;
import com.a528854302.gmall.seckill.constant.SeckillConst;
import com.a528854302.gmall.seckill.excepiton.SeckillException;
import com.a528854302.gmall.seckill.vo.SeckillSkuVo;
import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.redisson.Redisson;
import org.redisson.api.RSemaphore;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.BoundValueOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.UUID;
import java.util.concurrent.Callable;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;

/**
 * @ClassName SeckillCallableTask
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/24
 **/
@Slf4j
public class SeckillCallableTask implements Callable<R> {

    private String sessionKey;
    private String id;
    private String userId;
    private String token;
    private StringRedisTemplate redisTemplate;
    private RSemaphore semaphore;

    public SeckillCallableTask(String sessionKey, String id, String userId, String token
            ,StringRedisTemplate redisTemplate, RSemaphore semaphore) {
        this.sessionKey = sessionKey;
        this.id = id;
        this.userId = userId;
        this.token = token;
        this.redisTemplate=redisTemplate;
        this.semaphore=semaphore;
    }

    @Override
    public R call() throws Exception {
        if (StringUtils.isEmpty(sessionKey)||"undefined".equals(sessionKey)){
            return R.ok().put("success",false).put("msg","非法参数");
        }
        String[] s = sessionKey.replace(SeckillConst.SECKILL_SESSION_REDIS_PREFIX, "").split("_");
        Long startTime = Long.parseLong(s[0]);
        long endtime = Long.parseLong(s[1]);
        long now = new Date().getTime();
        if (now<startTime){
            return R.ok().put("success",false).put("msg","秒杀未开始");
            //throw new SeckillException("秒杀未开始");
        }
        if (now>endtime){
            //throw new SeckillException("秒杀已结束");
            return R.ok().put("success",false).put("msg","秒杀已结束");
        }
        String jsonStr = (String) redisTemplate.boundHashOps(sessionKey).get(id);
        SeckillSkuVo seckillSkuVo = JSON.parseObject(jsonStr, SeckillSkuVo.class);
        if (!token.equals(seckillSkuVo.getSeckillToken())){
            throw new SeckillException("非法令牌");
        }
        boolean success = semaphore.tryAcquire(50, TimeUnit.MILLISECONDS);
        if (success){
            String orderSn = UUID.randomUUID().toString().replace("-", "");
            //TODO 调用rabbitTemplate将订单号，
            // 秒杀id,用户id封装成SeckillOrderVo发送给订单系统
            log.info("抢单成功");
            return R.ok().put("success",true).put("msg","抢单成功")
                    .put("orderSn",orderSn);
        }
        log.info("抢单失败");
        return R.ok().put("success",false).put("msg","很遗憾未抢到");
    }
}

package com.a528854302.gmall.seckill.task;

import com.a528854302.gmall.seckill.constant.SeckillConst;
import com.a528854302.gmall.seckill.vo.SeckillSkuVo;
import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RSemaphore;
import org.springframework.data.redis.core.BoundValueOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;

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
public class SeckillCallableTask implements Callable<String> {

    private String sessionKey;
    private String id;
    private String userId;
    private String token;
    private StringRedisTemplate redisTemplate;
    private RSemaphore semaphore;

    public SeckillCallableTask(String sessionKey, String id, String userId, String token
            , StringRedisTemplate redisTemplate, RSemaphore semaphore) {
        this.sessionKey = sessionKey;
        this.id = id;
        this.userId = userId;
        this.token = token;
        this.redisTemplate=redisTemplate;
        this.semaphore=semaphore;
    }

    @Override
    public String call() throws Exception {
        log.info("执行抢单方法");
        String[] s = sessionKey.replace(SeckillConst.SECKILL_SESSION_REDIS_PREFIX, "").split("_");
        Long startTime = Long.parseLong(s[0]);
        long endtime = Long.parseLong(s[1]);
        long now = new Date().getTime();
        if (now<startTime){
            throw new RuntimeException("秒杀未开始");
        }
        if (now>endtime){
            throw new RuntimeException("秒杀已结束");
        }
        String jsonStr = (String) redisTemplate.boundHashOps(sessionKey).get(id);
        SeckillSkuVo seckillSkuVo = JSON.parseObject(jsonStr, SeckillSkuVo.class);
        if (!token.equals(seckillSkuVo.getSeckillToken())){
            throw new RuntimeException("非法令牌");
        }
        boolean success = semaphore.tryAcquire(50, TimeUnit.MILLISECONDS);
        if (success){
            log.info("{}抢单成功！！",Thread.currentThread().getName());
            String orderSn = UUID.randomUUID().toString().replace("-", "");
            BoundValueOperations<String, String> ops = redisTemplate.boundValueOps("test");
            ops.increment();
            return orderSn;
        }
        return null;
    }
}

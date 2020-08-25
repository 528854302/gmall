package com.a528854302.gmall.seckill.scheduled;

import com.a528854302.gmall.provider.entity.SeckillSessionEntity;
import com.a528854302.gmall.seckill.service.SeckilService;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * 非阻塞定时任务
 * 定时任务配置类：TaskSchedulingAutoConfiguration
 * 异步任务配置类：TaskExecutionAutoConfiguration
 * @ClassName ScheduleTask
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/23
 **/
@Slf4j
@Component
@EnableAsync
@EnableScheduling
public class ScheduleTask {

    @Autowired
    SeckilService seckilService;
    @Autowired
    RedissonClient redissonClient;


    /**
     * 非阻塞定时上架最近三天秒杀商品
     */
    @Async
    @Scheduled(cron = "*/20 * * * * ?")
    public void upSeckillSkus(){
        log.info("scheduled task!!!");
        RLock lock = redissonClient.getLock("lock");
        lock.lock(3, TimeUnit.SECONDS);
        seckilService.upSeckillProducts();
        lock.unlock();
    }
}

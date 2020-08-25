package com.a528854302.gmall.seckill.task;

import org.redisson.api.RSemaphore;

import java.util.concurrent.Callable;
import java.util.concurrent.TimeUnit;

/**
 * @ClassName Seckill
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/24
 **/
public class Seckill implements Callable<Boolean> {
    private RSemaphore semaphore;
    //private Semaphore semaphore;
    public Seckill(RSemaphore semaphore) {
        this.semaphore=semaphore;
    }

    @Override
    public Boolean call() throws Exception {
        Boolean success = semaphore.tryAcquire(100, TimeUnit.MILLISECONDS);
        if (success){
            System.out.println(Thread.currentThread().getName()+ "抢到了,调用消息队列发送订单号");
        }else {
            System.out.println(Thread.currentThread().getName()+ "抢单失败");
        }
        return success;
    }
}

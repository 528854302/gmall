package com.a528854302.gmall.seckill;

import com.a528854302.gmall.seckill.constant.SeckillConst;
import lombok.SneakyThrows;
import org.redisson.Redisson;
import org.redisson.api.RSemaphore;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;

import java.util.concurrent.*;

/**
 * @ClassName TestRedisson
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/24
 **/
public class TestRedisson {
    public static void main(String[] args) throws InterruptedException, ExecutionException {
//        Config config = new Config();
//        config.useSingleServer().setAddress("redis://121.36.197.225:6379");
//        RedissonClient redissonClient = Redisson.create(config);
//        RSemaphore semaphore = redissonClient.getSemaphore("test");
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(2, 200,
                60, TimeUnit.SECONDS,
                new LinkedBlockingQueue<Runnable>(5), new  ThreadPoolExecutor.AbortPolicy());
        Semaphore semaphore = new Semaphore(5);
        long start = System.currentTimeMillis();
        for (int i = 0; i < 50; i++) {
            Future<Boolean> future = threadPoolExecutor.submit(new Sekill1(semaphore));
        }
        System.out.println(System.currentTimeMillis()-start);

    }
}
class Sekill implements Callable<Boolean>{
    private RSemaphore semaphore;
    //private Semaphore semaphore;
    public Sekill(RSemaphore semaphore) {
        this.semaphore=semaphore;
    }

    @Override
    public Boolean call() throws Exception {
        Thread.sleep(50);
        Boolean success = semaphore.tryAcquire(100, TimeUnit.MILLISECONDS);
        if (success){
            System.out.println(Thread.currentThread().getName()+ "抢到了,调用消息队列发送订单号");
        }else {
            System.out.println(Thread.currentThread().getName()+ "抢单失败");
        }
        return success;
    }
}

class Sekill1 implements Callable<Boolean>{
    //private RSemaphore semaphore;
    private Semaphore semaphore;
    public Sekill1(Semaphore semaphore) {
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

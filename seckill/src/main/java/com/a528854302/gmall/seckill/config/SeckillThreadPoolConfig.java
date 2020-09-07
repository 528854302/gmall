package com.a528854302.gmall.seckill.config;

import com.a528854302.common.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Component;

import java.util.concurrent.*;

/**
 * @ClassName SeckillThreadPool
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/24
 **/
@Configuration
public class SeckillThreadPoolConfig {
    @Bean
    public ExecutorCompletionService<R> seckillThreadPool(){
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(10
                , 200,
                30, TimeUnit.SECONDS,
                new LinkedBlockingQueue<Runnable>(200)
                , new ThreadPoolExecutor.AbortPolicy());
        return new ExecutorCompletionService(threadPoolExecutor);
    }

}

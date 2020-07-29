package com.a528854302.gmall.portal.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @ClassName ThreadPoolConfig
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/6/13
 **/
@Configuration
public class ThreadPoolConfig {
    @Bean
    public ThreadPoolExecutor threadPoolExecutor(){
        return new ThreadPoolExecutor(10,50,30,
                TimeUnit.MINUTES,new ArrayBlockingQueue<>(1000));
    }
}

package com.a528854302.gmall.seckill;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.amqp.RabbitAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @ClassName ProductApplication
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/18
 **/
@EnableRabbit
@EnableFeignClients
@EnableDiscoveryClient
@SpringBootApplication
@MapperScan("com.a528854302.gmall.sekill.dao")
public class SeckillApplication {
    public static void main(String[] args) {
        SpringApplication.run(SeckillApplication.class, args);
    }
}

package com.a528854302.gmall.portal;

import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

/**
 * @ClassName PortalApplication
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/22
 **/
@EnableRabbit
@EnableFeignClients
@EnableDiscoveryClient
@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
public class PortalApplication {
    public static void main(String[] args) {
        SpringApplication.run(PortalApplication.class,args);
    }
}

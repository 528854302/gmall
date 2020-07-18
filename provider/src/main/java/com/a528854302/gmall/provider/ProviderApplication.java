package com.a528854302.gmall.provider;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @ClassName ProductApplication
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/18
 **/
@EnableSwagger2
@EnableDiscoveryClient
@SpringBootApplication
@MapperScan("com.a528854302.gmall.provider.dao")
public class ProviderApplication {
    public static void main(String[] args) {
        SpringApplication.run(ProviderApplication.class, args);
    }
}

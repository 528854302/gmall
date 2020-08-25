package com.a528854302.gmall.seckill.config;

import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.Host;
import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @ClassName RedissionConfig
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/24
 **/
@Configuration
@Slf4j
public class RedissionConfig {
    @Value("${spring.redis.host}")
    String redisHost;
    @Value("${spring.redis.port}")
    String redisPort;

    @Bean(destroyMethod = "shutdown")
    public RedissonClient redisson(){
        Config config = new Config();
        //121.36.197.225
        String url = "redis://" + redisHost + ":" + redisPort;
        log.info("redisson启动{}",url);
        config.useSingleServer().setAddress(url);

        //config.useSingleServer().setAddress("redis://121.36.197.225:6379");
        return Redisson.create(config);
    }
}

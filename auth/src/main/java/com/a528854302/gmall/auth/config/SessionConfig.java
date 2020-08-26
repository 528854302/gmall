package com.a528854302.gmall.auth.config;

import com.alibaba.fastjson.support.spring.GenericFastJsonRedisSerializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;
import org.springframework.session.web.http.CookieSerializer;
import org.springframework.session.web.http.DefaultCookieSerializer;

/**
 * @ClassName SessionConfig
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/25
 **/
@EnableRedisHttpSession
@Configuration
public class SessionConfig {
    @Bean
    public CookieSerializer cookieSerializer(){
        DefaultCookieSerializer cookieSerializer = new DefaultCookieSerializer();
        cookieSerializer.setDomainName("localhost");
        cookieSerializer.setCookiePath("/");
        return cookieSerializer;
    }

    @Bean
    public RedisSerializer redisSerializer(){
        GenericFastJsonRedisSerializer serializer = new GenericFastJsonRedisSerializer();
        return serializer;
    }

}

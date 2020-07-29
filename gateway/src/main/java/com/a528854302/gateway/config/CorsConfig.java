package com.a528854302.gateway.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.reactive.CorsWebFilter;
import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource;
import org.springframework.web.reactive.config.CorsRegistry;

/**
 * @ClassName CorsConfig
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/18
 **/
@Configuration
public class CorsConfig {


    @Bean
    public CorsWebFilter corsWebFilter() {

        UrlBasedCorsConfigurationSource corsConfigurationSource = new UrlBasedCorsConfigurationSource();

        // 初始化CORS配置对象
        CorsConfiguration config = new CorsConfiguration();
        // 允许的域,不要写*，否则cookie就无法使用了
        config.addAllowedOrigin("*");
        // 允许的头信息
        config.addAllowedHeader("*");
        // 允许的请求方式
        config.addAllowedMethod("*");
        // 是否允许携带Cookie信息
        config.setAllowCredentials(true);

        // 添加映射路径，我们拦截一切请求
        corsConfigurationSource.registerCorsConfiguration("/**", config);

        return new CorsWebFilter(corsConfigurationSource);
    }



}
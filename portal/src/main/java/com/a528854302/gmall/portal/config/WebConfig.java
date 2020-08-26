package com.a528854302.gmall.portal.config;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import io.swagger.annotations.Authorization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.TimeZone;

/**
 * @ClassName WebConfig
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/12
 **/
@Configuration
public class WebConfig extends WebMvcConfigurationSupport {
//    @Autowired
//    LoginInterceptor loginInterceptor;
//    @Override
//    protected void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(loginInterceptor).addPathPatterns("/**","/cart.html","/portal/cart.html")
//                .excludePathPatterns("/index.html","/","/*.html");
//    }
}

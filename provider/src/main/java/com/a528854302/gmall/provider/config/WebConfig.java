package com.a528854302.gmall.provider.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

/**
 * @ClassName WebConfig
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/12
 **/
@Configuration
public class WebConfig extends WebMvcConfigurationSupport {

    @Value("${my-upload.upload-dir}")
    private String uploadDir;

    @Value("${my-upload.access-url}")
    private String accessUrl;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler(accessUrl+"**").addResourceLocations("file:" + uploadDir);
        registry.addResourceHandler("/**").addResourceLocations("classpath:/static/");
    }
}

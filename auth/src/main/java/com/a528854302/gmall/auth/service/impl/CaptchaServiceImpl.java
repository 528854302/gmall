package com.a528854302.gmall.auth.service.impl;

import com.a528854302.gmall.auth.exception.AuthException;
import com.a528854302.gmall.auth.service.CaptchaService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import com.google.code.kaptcha.Producer;
import java.awt.image.BufferedImage;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import java.util.concurrent.TimeUnit;

/**
 * @ClassName CaptchaServiceImpl
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/24
 **/
@Service
public class CaptchaServiceImpl implements CaptchaService {
    public static String UUID_PREFIX="kapcha_uuid:";

    @Autowired
    Producer producer;

    @Autowired
    StringRedisTemplate redisTemplate;

    @Override
    public boolean check(String uuid, String kaptcha) {
        if (StringUtils.isNotEmpty(kaptcha)){
            boolean isSuccess = kaptcha.equals(redisTemplate.boundValueOps(UUID_PREFIX + uuid).get());
            if(isSuccess){
                redisTemplate.boundValueOps(UUID_PREFIX + uuid).set(null,1,TimeUnit.MICROSECONDS);
                return true;
            }
            return false;
        }
        return false;
    }

    @Override
    public BufferedImage getCaptcha(String uuid) {
        if(StringUtils.isBlank(uuid)){
            throw new AuthException("uuid不能为空");
        }
        DefaultKaptcha kaptcha = new DefaultKaptcha();

        //生成文字验证码
        String code = producer.createText();
        redisTemplate.boundValueOps(
                UUID_PREFIX +uuid).set(code,5, TimeUnit.MINUTES);
        return producer.createImage(code);
    }
}

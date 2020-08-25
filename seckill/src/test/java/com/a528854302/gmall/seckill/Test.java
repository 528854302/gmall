package com.a528854302.gmall.seckill;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @ClassName Test
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/24
 **/
@SpringBootTest
@RunWith(SpringRunner.class)
public class Test {
    @Autowired
    StringRedisTemplate redisTemplate;
    public static void main(String[] args) {

        System.out.println(new Date().getTime());
    }

    private static Long getlasestTime(List<Long> startTimes) {
        if (startTimes!=null && startTimes.size()>0){
            Long min = null;
            for (int i = 0; i < startTimes.size()-1; i++) {
                min=startTimes.get(i);
                Long temp = startTimes.get(i + 1);
                if (min > temp){
                    min = temp;
                }
            }
            return min;
        }
        return null;
    }
}

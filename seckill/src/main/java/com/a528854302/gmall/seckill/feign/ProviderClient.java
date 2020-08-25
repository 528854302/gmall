package com.a528854302.gmall.seckill.feign;

import com.a528854302.gmall.provider.entity.SeckillSessionEntity;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@FeignClient("provider")
public interface ProviderClient {

    @RequestMapping("/provider/seckillsession/getLastest3DaysSessions")
    List<SeckillSessionEntity> getLastest3DaysSessions();
}

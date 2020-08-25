package com.a528854302.gmall.seckill.service;

import com.a528854302.common.utils.R;
import com.a528854302.gmall.provider.entity.SeckillSessionEntity;
import com.a528854302.gmall.seckill.vo.SeckillSkuVo;
import org.springframework.stereotype.Service;

import java.util.List;

public interface SeckilService {

    void upSeckillProducts();


    List<SeckillSkuVo> getLastestSessionRelateSeckillSkus();

    SeckillSkuVo getSeckillSkuVo(String sessionKey, String id);


    String seckill(String sessionKey, String id, String userId, String token);

    Boolean testSeckill();

    String seckill1(String sessionKey, String id, String userId, String token);
}

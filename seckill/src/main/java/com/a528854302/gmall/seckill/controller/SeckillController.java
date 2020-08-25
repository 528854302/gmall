package com.a528854302.gmall.seckill.controller;

import com.a528854302.common.utils.R;
import com.a528854302.gmall.seckill.service.SeckilService;
import com.a528854302.gmall.seckill.vo.SeckillSkuVo;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * @ClassName SeckillController
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/24
 **/
@RestController
public class SeckillController {
    @Autowired
    SeckilService seckilService;
    @Autowired
    ThreadPoolExecutor threadPoolExecutor;

    @RequestMapping("/getSeckillSkus")
    public List<SeckillSkuVo> getSeckillSession(){
        return seckilService.getLastestSessionRelateSeckillSkus();
    }

    @RequestMapping("/seckillSkuInfo/sessionKey/{sessionKey}/id/{id}")
    public SeckillSkuVo seckillSkuInfo(@PathVariable("sessionKey")String sessionKey
            ,@PathVariable("id")String id){
        return seckilService.getSeckillSkuVo(sessionKey,id);
    }

    @RequestMapping("/sekill/sessionKey/{sessionKey}/id/{id}/token/{token}")
    public R sekill(@PathVariable("sessionKey")String sessionKey
            ,@PathVariable("id")String id
            ,@PathVariable("token")String token){
        //Todo 获取userId
        String userId="4";
        String orderSn = seckilService.seckill(sessionKey,id,userId,token);
        if (StringUtils.isNotEmpty(orderSn)){
            return R.ok().put("msg","恭喜抢单成功！！");
        }
        return R.ok().put("msg","抢单失败");
    }

    @RequestMapping("/sekill1/sessionKey/{sessionKey}/id/{id}/token/{token}")
    public R sekill1(@PathVariable("sessionKey")String sessionKey
            ,@PathVariable("id")String id
            ,@PathVariable("token")String token){
        //Todo 获取userId
        String userId="4";
        String orderSn = seckilService.seckill1(sessionKey,id,userId,token);
        if (StringUtils.isNotEmpty(orderSn)){
            return R.ok().put("msg","恭喜抢单成功！！");
        }
        return R.ok().put("msg","抢单失败");
    }

    @RequestMapping("/sekill")
    public R sekill(){
        Boolean success = seckilService.testSeckill();
        if (success){
            return R.ok().put("msg","恭喜抢单成功！！");
        }
        return R.ok().put("msg","抢单失败");
    }

}

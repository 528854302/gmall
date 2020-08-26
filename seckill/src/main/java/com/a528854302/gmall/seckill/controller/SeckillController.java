package com.a528854302.gmall.seckill.controller;

import com.a528854302.common.utils.R;
import com.a528854302.gmall.provider.entity.MemberEntity;
import com.a528854302.gmall.seckill.service.SeckilService;
import com.a528854302.gmall.seckill.vo.SeckillSkuVo;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * @ClassName SeckillController
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/24
 **/
@Controller
public class SeckillController {
    @Autowired
    SeckilService seckilService;
    @Autowired
    ThreadPoolExecutor threadPoolExecutor;

    @ResponseBody
    @RequestMapping("/getSeckillSkus")
    public R getSeckillSession(){
        List<SeckillSkuVo> list = seckilService.getLastestSessionRelateSeckillSkus();

        return R.ok().put("data",list);
    }

    @RequestMapping("/seckillSkuInfo/sessionKey/{sessionKey}/id/{id}")
    public String seckillSkuInfo(@PathVariable("sessionKey")String sessionKey
            , @PathVariable("id")String id, Model model){
        SeckillSkuVo seckillSkuVo = seckilService.getSeckillSkuVo(sessionKey, id);
        model.addAttribute("vo",seckillSkuVo);
        return "sekillitem";
    }
    @ResponseBody
    @RequestMapping("/sekill/sessionKey/{sessionKey}/id/{id}/token/{token}")
    public R sekill(@PathVariable("sessionKey")String sessionKey
            ,@PathVariable("id")String id
            ,@PathVariable("token")String token,HttpSession session){
        MemberEntity user = (MemberEntity) session.getAttribute("user");
        if (user==null){
            return R.error("no login");
        }
        String userId=user.getId().toString();
        return seckilService.seckill(sessionKey,id,userId,token);
    }
    @ResponseBody
    @RequestMapping("/sekill1/sessionKey/{sessionKey}/id/{id}/token/{token}")
    public R sekill1(@PathVariable("sessionKey")String sessionKey
            , @PathVariable("id")String id
            , @PathVariable("token")String token, HttpSession session
    ,HttpSession httpSession){
        MemberEntity user = (MemberEntity) httpSession.getAttribute("user");
        if (user==null){
            return R.ok().put("success",false).put("msg","请先登录");
        }
        String userId=user.getId().toString();
//        String orderSn = seckilService.seckill(sessionKey,id,userId,token);
//        if (StringUtils.isNotEmpty(orderSn)){
//            return R.ok().put("msg","恭喜抢单成功！！");
//        }
        return R.ok().put("msg","抢单失败");
    }


}

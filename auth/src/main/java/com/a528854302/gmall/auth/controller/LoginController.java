package com.a528854302.gmall.auth.controller;

import com.a528854302.gmall.auth.ProviderFeign;
import com.a528854302.gmall.auth.service.CaptchaService;
import com.a528854302.gmall.auth.vo.LoginVo;
import com.a528854302.gmall.provider.entity.MemberEntity;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * @ClassName LoginController
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/24
 **/
@Controller
public class LoginController {

    @Autowired
    CaptchaService captchaService;


    @Autowired
    ProviderFeign providerFeign;

    @RequestMapping({"/","/index.html"})
    public String loginPage(){
        return "index";
    }


    /**
     * 验证码
     */
    @GetMapping("captcha.jpg")
    public void captcha(HttpServletResponse response, String uuid)throws IOException {
        response.setHeader("Cache-Control", "no-store, no-cache");
        response.setContentType("image/jpeg");

        //获取图片验证码
        BufferedImage image = captchaService.getCaptcha(uuid);

        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(image, "jpg", out);
        IOUtils.closeQuietly(out);
    }

    @PostMapping("/login")
    public String login(@Valid LoginVo loginVo
            , BindingResult result, Model model){
        if (result.hasErrors()){
            throw new RuntimeException("用户名或者密码错误");
        }
        MemberEntity memberEntity = providerFeign.selectMemberByUserName(loginVo.getUsername());
        if (memberEntity.getPassword().equals(loginVo.getPassword())){
            //login success
            return "http://127.0.0.1:88/portal/index.html";
        }else {
            throw new RuntimeException("用户名或者密码错误");
        }
    }

}

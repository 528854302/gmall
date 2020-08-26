package com.a528854302.gmall.auth.controller;

import com.a528854302.common.utils.R;
import com.a528854302.gmall.auth.exception.AuthException;
import com.a528854302.gmall.auth.feign.ProviderFeign;
import com.a528854302.gmall.auth.service.CaptchaService;
import com.a528854302.gmall.auth.vo.MenberRigsterVo;
import com.a528854302.gmall.provider.entity.MemberEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.Date;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @ClassName RegisterController
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/24
 **/
@Controller
public class RegisterController {

    @RequestMapping({"/register.html","/reg.html"})
    public String registerPage(){
        return "register";
    }

    @Autowired
    ProviderFeign providerFeign;
    @Autowired
    CaptchaService captchaService;

    @PostMapping("/register")
    public String register(@Valid MenberRigsterVo menberRigsterVo
            , BindingResult result, RedirectAttributes redirectAttributes
            , Model model){
        if (result.hasErrors()){
            Map<String, String> map = result.getFieldErrors().stream().collect(Collectors.toMap(k -> k.getField()
                    , v -> v.getDefaultMessage()));
            model.addAttribute("errors",map);
            return "register";
        }
        if (!captchaService.check(menberRigsterVo.getUuid(),menberRigsterVo.getKaptcha())){
            throw new AuthException("验证码错误");
        }
        MemberEntity memberEntity = providerFeign.selectMemberByUserName(menberRigsterVo.getUsername());
        if (memberEntity!=null){
            throw new AuthException("用户名已注册");
        }
        memberEntity=new MemberEntity();
        memberEntity.setUsername(menberRigsterVo.getUsername());
        memberEntity.setLevelId(0L);
        memberEntity.setNickname(menberRigsterVo.getNickname());
        memberEntity.setPassword(menberRigsterVo.getPassword());
        memberEntity.setCreateTime(new Date());
        R r = providerFeign.save(memberEntity);
        if (r.getCode()==0){
            return "redirect:/portal/login.html";
        }
        return "register";
    }

}

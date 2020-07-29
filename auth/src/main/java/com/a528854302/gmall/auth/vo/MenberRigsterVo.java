package com.a528854302.gmall.auth.vo;

import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

/**
 * @ClassName RigsterVo
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/24
 **/
@Data
public class MenberRigsterVo {
    @NotEmpty(message = "用户名不能为空")
    @Length(min = 3,max = 18,message = "用户名长度为3-18")
    private String username;
    @NotEmpty(message = "昵称不能为空")
    private String nickname;
    @NotEmpty(message = "密码不能为空")
    @Length(min = 6,max = 18,message = "密码长度为3-18")
    private String password;
    //@Pattern(regexp = "^[1]([3-9])[0-9]{9}$",message = "手机号格式不正确")
    //private String phone;
    @NotEmpty(message = "验证码不能为空")
    private String kaptcha;
    private String uuid;
}

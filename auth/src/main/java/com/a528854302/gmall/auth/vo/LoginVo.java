package com.a528854302.gmall.auth.vo;

import lombok.Data;

import javax.validation.constraints.NotEmpty;

/**
 * @ClassName LoginVo
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/24
 **/
@Data
public class LoginVo {
    @NotEmpty(message = "用户名不能为空")
    private String username;
    @NotEmpty(message = "密码不能为空")
    private String password;
}

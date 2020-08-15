package com.a528854302.gmall.portal.vo;

import io.swagger.models.auth.In;
import lombok.Data;

/**
 * @ClassName AddressVo
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/29
 **/
@Data
public class AddressVo {
    private String name;
    private String address;
    private String phone;
    private Integer defaultAddr=0;
}

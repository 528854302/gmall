package com.a528854302.gmall.portal.vo;

import lombok.Data;

/**
 * @ClassName OrderSubmitVo
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/29
 **/
@Data
public class OrderSubmitVo {
    private String orderToken;
    private String name;
    private String phone;
    private String address;
    private String note;

}

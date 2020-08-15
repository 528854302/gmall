package com.a528854302.gmall.portal.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * @ClassName TradeVo
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/29
 **/

public class TradeVo {
    private Cart cart;

    private String token;

    private List<AddressVo> addresses;

    private BigDecimal reduce=new BigDecimal(0);

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public BigDecimal getTotalPrice() {
        return this.cart.getTotalAmount().subtract(this.reduce);
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    private BigDecimal totalPrice;

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public List<AddressVo> getAddresses() {
        return addresses;
    }

    public void setAddresses(List<AddressVo> addresses) {
        this.addresses = addresses;
    }

    public BigDecimal getReduce() {
        return reduce;
    }

    public void setReduce(BigDecimal reduce) {
        this.reduce = reduce;
    }
}

package com.a528854302.gmall.portal.service;

import com.a528854302.gmall.portal.vo.Cart;
import com.a528854302.gmall.portal.vo.CartItem;

/**
 * @ClassName CartService
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/28
 **/
public interface CartService {
    CartItem addToCart(Long userId, String skuId, Integer num);

    Cart getCart(Long userId);

    Cart updateCart(Long userId, String skuId, Integer num);

}

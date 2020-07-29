package com.a528854302.gmall.portal.service.impl;

import com.a528854302.common.utils.R;
import com.a528854302.gmall.portal.constant.CartConstant;
import com.a528854302.gmall.portal.feign.ProviderClient;
import com.a528854302.gmall.portal.service.CartService;
import com.a528854302.gmall.portal.vo.Cart;
import com.a528854302.gmall.portal.vo.CartItem;
import com.a528854302.gmall.provider.entity.SkuInfoEntity;
import com.a528854302.gmall.provider.entity.SkuSaleAttrValueEntity;
import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.BoundHashOperations;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @ClassName CartServiceImpl
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/28
 **/
@Service
public class CartServiceImpl implements CartService {


    @Autowired
    StringRedisTemplate redisTemplate;
    @Autowired
    ProviderClient providerClient;
    @Override
    public CartItem addToCart(Long userId, String skuId, Integer num) {
        if (null==num||num==0){
            num=1;
        }
        BoundHashOperations<String, Object, Object> hashOps =
                redisTemplate.boundHashOps(CartConstant.CART_PREFIX + userId);
        CartItem cartItem=null;
        if (hashOps.hasKey(skuId)){
            cartItem = JSON.parseObject((String) hashOps.get(skuId),CartItem.class);
            cartItem.setCount(cartItem.getCount()+num);
            hashOps.put(skuId,JSON.toJSONString(cartItem));
        }else {
            SkuInfoEntity skuInfo = providerClient.getSkuInfo(Long.parseLong(skuId));
            List<SkuSaleAttrValueEntity> skuSaleAttrValue = providerClient.getSkuSaleAttrValue(Long.parseLong(skuId));
            List<String> attrValues = skuSaleAttrValue.stream().map(i -> i.getAttrValue()).collect(Collectors.toList());
            cartItem = new CartItem();
            cartItem.setSkuAttr(attrValues);
            cartItem.setCount(num);
            cartItem.setSkuId(Long.parseLong(skuId));
            cartItem.setTitle(skuInfo.getSkuTitle());
            cartItem.setPrice(skuInfo.getPrice());
            cartItem.setImage(skuInfo.getSkuDefaultImg());
            hashOps.put(skuId,JSON.toJSONString(cartItem));
        }
        return cartItem;
    }

    @Override
    public Cart getCart(Long userId) {
        BoundHashOperations<String, Object, Object> hashOps =
                redisTemplate.boundHashOps(CartConstant.CART_PREFIX + userId);
        List<Object> cartItemJsons = hashOps.values();
        List<CartItem> cartItems=null;
        if (null!=cartItemJsons|| cartItemJsons.size()>0){
             cartItems = cartItemJsons.stream().map(i -> {
                return JSON.parseObject((String) i, CartItem.class);
            }).collect(Collectors.toList());
        }
        Cart cart = new Cart();
        cart.setItems(cartItems);
        return cart;
    }

    @Override
    public Cart updateCart(Long userId, String skuId, Integer num) {
        BoundHashOperations<String, Object, Object> hashOps =
                redisTemplate.boundHashOps(CartConstant.CART_PREFIX + userId);

        if (StringUtils.isEmpty(skuId)){
            //清空购物车
            for (Object key : hashOps.keys()) {
                hashOps.delete(key);
            }
        }
        else{
            if (num==null||num==0){
                //删除某一项
                hashOps.delete(skuId);
            }else {
                //修改购物车某一项数据
                CartItem cartItem = JSON.parseObject((String) hashOps.get(skuId), CartItem.class);
                cartItem.setCount(num);
                hashOps.put(skuId, JSON.toJSONString(cartItem));
            }
        }
        return getCart(userId);
    }




}

package com.a528854302.gmall.portal.controller;

import com.a528854302.gmall.portal.service.CartService;
import com.a528854302.gmall.portal.vo.Cart;
import com.a528854302.gmall.portal.vo.CartItem;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @ClassName CartController
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/28
 **/
@Controller
public class CartController {
    @Autowired
    CartService cartService;

    @RequestMapping("cart.html")
    public String cartList(Model model){
        Cart cart = cartService.getCart(4L);
        model.addAttribute("cart",cart);
        return "cartList";
    }

    @RequestMapping("/addToCart")
    public String addToCart(@RequestParam("skuId") Long skuId, Model model,
                            @RequestParam(value = "num",required = false) Integer num){

        CartItem cartItem = cartService.addToCart(Long.parseLong("4"),skuId.toString(),num);
        model.addAttribute("cartItem",cartItem);
        return "success";
    }
    @RequestMapping("/updateCart")
    public String updateCart(@RequestParam(value = "skuId",required = false) Long skuId, Model model,
                            @RequestParam(value = "num",required = false) Integer num){

        Cart cart = cartService.updateCart(Long.parseLong("4"),skuId==null?null:skuId.toString(),num);
        model.addAttribute("cart",cart);
        return "cartList";
    }



}

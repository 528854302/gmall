package com.a528854302.gmall.portal.controller;

import com.a528854302.common.utils.R;
import com.a528854302.gmall.portal.aspect.LoginAspect;
import com.a528854302.gmall.portal.service.CartService;
import com.a528854302.gmall.portal.vo.Cart;
import com.a528854302.gmall.portal.vo.CartItem;
import com.a528854302.gmall.provider.entity.MemberEntity;
import com.sun.org.apache.regexp.internal.RE;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

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
    public String cartList(Model model, HttpServletRequest request
            , HttpServletResponse response) throws IOException {
        MemberEntity memberEntity = LoginAspect.threadLocal.get();
        Cart cart = cartService.getCart(memberEntity.getId());
        model.addAttribute("cart",cart);
        return "cartList";
    }

    @RequestMapping("/addToCart")
    public String addToCart(@RequestParam("skuId") Long skuId, Model model,
                            @RequestParam(value = "num",required = false) Integer num){
        MemberEntity memberEntity = LoginAspect.threadLocal.get();
        CartItem cartItem = cartService.addToCart(memberEntity.getId(),skuId.toString(),num);
        model.addAttribute("cartItem",cartItem);
        return "success";
    }
    @RequestMapping("/updateCart")
    public String updateCart(@RequestParam(value = "skuId",required = false) Long skuId, Model model,
                            @RequestParam(value = "num",required = false) Integer num){
        MemberEntity memberEntity = LoginAspect.threadLocal.get();
        Cart cart = cartService.updateCart(memberEntity.getId(),skuId==null?null:skuId.toString(),num);
        model.addAttribute("cart",cart);
        return "cartList";
    }



}

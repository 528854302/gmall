package com.a528854302.gmall.portal.controller;

import com.a528854302.gmall.portal.service.OrderService;
import com.a528854302.gmall.portal.vo.OrderSubmitVo;
import com.a528854302.gmall.portal.vo.TradeVo;
import com.a528854302.gmall.provider.entity.OrderEntity;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * @ClassName OrderController
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/29
 **/
@Controller
public class OrderController {
    @Autowired
    OrderService orderService;

    @RequestMapping("trade.html")
    public String order(Model model){
        TradeVo tradeVo = orderService.getTradeVo();
        model.addAttribute("tradeVo",tradeVo);
        return "trade";
    }

    @RequestMapping("submitOrder")
    public String submitOrder(OrderSubmitVo orderSubmitVo,Model model){
        //TODO
//        if (orderSubmitVo==null){
//            orderSubmitVo=new OrderSubmitVo();
//            orderSubmitVo.setName("chaoge");
//            orderSubmitVo.setAddress("江西省抚州市临川区");
//            orderSubmitVo.setPhone("18379460011");
//        }


        OrderEntity orderEntity = orderService.submitOrder(orderSubmitVo);
        model.addAttribute("order",orderEntity);
        return "waittopay";
    }

    @RequestMapping("waittopay")
    public String submitOrder(Model model){
        OrderEntity orderEntity = new OrderEntity();
        orderEntity.setId(IdWorker.getId());
        orderEntity.setCreateTime(new Date());
        model.addAttribute("order",orderEntity);
        return "waittopay";
    }
    @Autowired
    RabbitTemplate rabbitTemplate;


    @ResponseBody
    @RequestMapping("test")
    public String test(){
        OrderEntity orderEntity = new OrderEntity();
        orderEntity.setId(1232l);
        orderEntity.setOrderSn("asdsad");
        rabbitTemplate.convertAndSend("order-event-exchange","order.create.order"
                ,orderEntity);
        return "ok";
    }
}

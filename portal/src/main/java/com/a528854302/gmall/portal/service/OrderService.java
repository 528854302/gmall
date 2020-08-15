package com.a528854302.gmall.portal.service;

import com.a528854302.gmall.portal.vo.OrderSubmitVo;
import com.a528854302.gmall.portal.vo.TradeVo;
import com.a528854302.gmall.provider.entity.OrderEntity;

/**
 * @ClassName OrderService
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/2
 **/
public interface OrderService {
    TradeVo getTradeVo();

    OrderEntity submitOrder(OrderSubmitVo orderSubmitVo);
}

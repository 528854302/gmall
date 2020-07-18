package com.a528854302.gmall.provider.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.gmall.provider.entity.OrderItemEntity;

import java.util.Map;

/**
 * 订单项信息
 *
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:50:49
 */
public interface OrderItemService extends IService<OrderItemEntity> {

    PageUtils queryPage(Map<String, Object> params);
}


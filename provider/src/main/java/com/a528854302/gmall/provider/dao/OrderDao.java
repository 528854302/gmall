package com.a528854302.gmall.provider.dao;

import com.a528854302.gmall.provider.entity.OrderEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单
 * 
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:50:49
 */
@Mapper
public interface OrderDao extends BaseMapper<OrderEntity> {
	
}

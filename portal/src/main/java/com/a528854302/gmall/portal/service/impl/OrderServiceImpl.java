package com.a528854302.gmall.portal.service.impl;

import com.a528854302.common.utils.Constant;
import com.a528854302.common.utils.R;
import com.a528854302.gmall.portal.constant.CartConstant;
import com.a528854302.gmall.portal.constant.OrderContstant;
import com.a528854302.gmall.portal.feign.ProviderClient;
import com.a528854302.gmall.portal.service.OrderService;
import com.a528854302.gmall.portal.vo.*;
import com.a528854302.gmall.provider.entity.OrderEntity;
import com.a528854302.gmall.provider.entity.OrderItemEntity;
import com.a528854302.gmall.provider.entity.SkuInfoEntity;
import com.a528854302.gmall.provider.to.StockLockTo;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import org.apache.commons.lang3.StringUtils;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.data.redis.core.BoundHashOperations;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.script.DefaultRedisScript;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

/**
 * @ClassName OrderServiceImpl
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/29
 **/
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    StringRedisTemplate redisTemplate;
    @Autowired
    ProviderClient providerClient;
    @Override
    public TradeVo getTradeVo() {
        //todo 获取用户id
        String userId="4";
        BoundHashOperations<String, Object, Object> hashOps =
                redisTemplate.boundHashOps(CartConstant.CART_PREFIX + userId);
        List<CartItem> cartItems = getCartItems(hashOps);
        TradeVo tradeVo = new TradeVo();
        tradeVo.setCart(new Cart(cartItems));
        //todo    feign查询收货地址
        AddressVo addressVo = new AddressVo();
        addressVo.setName("chaoge");
        addressVo.setAddress("江西省抚州市临川区抚州一中");
        addressVo.setPhone("18379460011");
        addressVo.setDefaultAddr(1);

        AddressVo addressVo1 = new AddressVo();
        addressVo1.setName("chaoge");
        addressVo1.setAddress("江西省南昌市天祥大道");
        addressVo1.setPhone("18379460011");
        //TODO 查询优惠信息
        //tradeVo.setReduce();
        ArrayList<AddressVo> addressVos = new ArrayList<>();
        addressVos.add(addressVo);
        addressVos.add(addressVo1);
        tradeVo.setAddresses(addressVos);

        //设置防重复提交令牌
        String token = UUID.randomUUID().toString().replace("-", "");
        redisTemplate.boundValueOps(OrderContstant.USER_TOKEN_PRIFIX+userId)
                .set(token,15, TimeUnit.MINUTES);
        tradeVo.setToken(token);
        return tradeVo;
    }

    private List<CartItem> getCartItems(BoundHashOperations<String, Object, Object> hashOps) {
        List<Object> valueJsons = hashOps.values();
        return valueJsons.stream().map(i -> {
                    CartItem cartItem = JSON.parseObject((String) i, CartItem.class);
                    SkuInfoEntity skuInfo = providerClient.getSkuInfo(cartItem.getSkuId());
                    cartItem.setPrice(skuInfo.getPrice());
                    return cartItem;
                }).collect(Collectors.toList());
    }

    @Autowired
    RabbitTemplate rabbitTemplate;



    @Override
    public OrderEntity submitOrder(OrderSubmitVo orderSubmitVo) {
        String orderToken = orderSubmitVo.getOrderToken();


        //todo 获取用户id
        String userId="4";
        //调用lua脚本保证原子性
        String script="if redis.call('get',KEYS[1])== ARGV[1] then return redis.call('del',KEYS[1]) else return 0 end";
        String userKey=OrderContstant.USER_TOKEN_PRIFIX + userId;
        Long result = redisTemplate.execute(new DefaultRedisScript<Long>(script, Long.class),
                Arrays.asList(userKey),
                orderToken);
        if (result==0L){
            //令牌验证失败
            throw new RuntimeException("请勿重复提交订单");
        }


        BoundHashOperations<String, Object, Object> hashOps =
                redisTemplate.boundHashOps(CartConstant.CART_PREFIX + userId);
        List<CartItem> cartItems = getCartItems(hashOps);
        Long orderId = IdWorker.getId();
        String orderSn = UUID.randomUUID().toString();
        //锁库存
        StockLockTo stockLockTo = new StockLockTo(orderSn,orderId,cartItems);
        R  stockLockResult = providerClient.stockLock(stockLockTo);
        Integer code = stockLockResult.getCode();
        if (!code.equals(0)){
            //锁定库存失败
            throw new RuntimeException((String) stockLockResult.get("msg"));
        }

        Cart cart = new Cart(cartItems);
        OrderEntity orderEntity = new OrderEntity();
        orderEntity.setId(orderId);
        orderEntity.setMemberId(4L);
        orderEntity.setTotalAmount(cart.getTotalAmount());
        orderEntity.setPayAmount(cart.getTotalAmount());
        orderEntity.setStatus(0);
        orderEntity.setReceiverName(orderSubmitVo.getName());
        orderEntity.setReceiverPhone(orderSubmitVo.getPhone());
        orderEntity.setReceiverDetailAddress(orderSubmitVo.getAddress());
        orderEntity.setOrderSn(orderSn);
        orderEntity.setCreateTime(new Date());

        providerClient.saveOrder(orderEntity);

        List<OrderItemEntity> orderItemEntities = cartItems.stream().map(cartItem -> {
            OrderItemEntity itemEntity = new OrderItemEntity();
            itemEntity.setOrderId(orderEntity.getId());
            itemEntity.setSkuId(cartItem.getSkuId());
            itemEntity.setSkuName(cartItem.getTitle());
            itemEntity.setSkuPic(cartItem.getImage());
            itemEntity.setSkuAttrsVals(JSON.toJSONString(cartItem.getSkuAttr()));
            itemEntity.setSkuPic(cartItem.getTotalPrice().toString());
            itemEntity.setSkuQuantity(cartItem.getCount());
            return itemEntity;
        }).collect(Collectors.toList());
        R r = providerClient.saveOrderItems(orderItemEntities);

        //clear cart
        Object[] keys = hashOps.keys().toArray();
        hashOps.delete(keys);

        rabbitTemplate.convertAndSend("order-event-exchange","order.create.order"
                ,orderEntity);
        return orderEntity;
    }
}

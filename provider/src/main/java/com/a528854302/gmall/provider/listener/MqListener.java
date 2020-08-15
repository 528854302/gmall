package com.a528854302.gmall.provider.listener;

import com.a528854302.gmall.provider.dao.OrderDao;
import com.a528854302.gmall.provider.dao.WareOrderTaskDao;
import com.a528854302.gmall.provider.dao.WareOrderTaskDetailDao;
import com.a528854302.gmall.provider.dao.WareSkuDao;
import com.a528854302.gmall.provider.entity.OrderEntity;
import com.a528854302.gmall.provider.entity.WareOrderTaskDetailEntity;
import com.a528854302.gmall.provider.entity.WareOrderTaskEntity;
import com.a528854302.gmall.provider.service.WareSkuService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.rabbitmq.client.Channel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.List;

/**
 * @ClassName MqListener
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/14
 **/
@Slf4j
@Service
@Transactional
public class MqListener {


    @Autowired
    WareOrderTaskDao wareOrderTaskDao;
    @Autowired
    WareOrderTaskDetailDao wareOrderTaskDetailDao;
    @Autowired
    OrderDao orderDao;
    @Autowired
    WareSkuDao wareSkuDao;
    @Autowired
    RabbitTemplate rabbitTemplate;

    /**
     * 处理解锁库存消息
     * @param message
     * @param detailEntity
     * @param channel
     * @throws IOException
     */
    @RabbitListener(queues = "stock.release.stock.queue")
    public void handleStockLockRelease(Message message
            , WareOrderTaskDetailEntity detailEntity, Channel channel) throws IOException {
        try {
            log.info("处理解锁库存消息");
            log.info(detailEntity.toString());
            if (detailEntity != null) {
                Long taskId = detailEntity.getTaskId();
                WareOrderTaskEntity taskEntity = wareOrderTaskDao.selectById(taskId);
                Long orderId = taskEntity.getOrderId();
                OrderEntity orderEntity = orderDao.selectById(orderId);
                if (orderEntity == null || orderEntity.getStatus().equals(4)) {
                    //订单未提交成功或者订单已经关闭
                    //解锁库存
                    wareSkuDao.releaseStockLock(detailEntity.getSkuId(), detailEntity.getSkuNum());
                    detailEntity.setLockStatus(2);
                } else {
                    //订单正常支付
                    detailEntity.setLockStatus(3);
                }
                wareOrderTaskDetailDao.updateById(detailEntity);
                channel.basicAck(message.getMessageProperties().getDeliveryTag(),
                        false);
            }
        }catch (Exception e){
            //消息拒绝重新放入队列
            channel.basicReject(message.getMessageProperties().getDeliveryTag(),true);
            e.printStackTrace();
        }
    }

    /**
     * 处理订单超时消息，关闭订单，同时发送一个关闭订单的消息
     * @param orderEntity
     * @param channel
     * @param message
     * @throws IOException
     */
    @RabbitListener(queues = "order.release.order.queue")
    public void handleOrderDelay(OrderEntity orderEntity, Channel channel, Message message) throws IOException {
        try {
            OrderEntity order = orderDao.selectById(orderEntity.getId());
            if (order.getStatus().equals(0)){
                log.error("订单超时未支付，订单号:{}",orderEntity.getOrderSn());
                order.setStatus(4);
                orderDao.updateById(order);
                rabbitTemplate.convertAndSend("order-event-exchange"
                        ,"order.release.other",order);
            }
            channel.basicAck(message.getMessageProperties().getDeliveryTag(),false);
        }catch (Exception e){
            //消息拒绝重新放入队列
            channel.basicReject(message.getMessageProperties().getDeliveryTag(),true);
            e.printStackTrace();
            e.printStackTrace();
        }
    }


    /**
     * 处理订单超时关闭后收到的消息，防止处理解锁库存的消息比处理超时订单的消息提前到达，导致库存永远解不了锁
     * @param orderEntity
     * @param channel
     * @param message
     * @throws IOException
     */
    @RabbitListener(queues = "stock.release.stock.queue")
    public void handleOrderDelayClose(OrderEntity orderEntity, Channel channel, Message message) throws IOException {
        try {
            WareOrderTaskEntity taskEntity = wareOrderTaskDao.selectOne(new QueryWrapper<WareOrderTaskEntity>().eq("order_id",
                    orderEntity.getId()));
            List<WareOrderTaskDetailEntity> detailEntities = wareOrderTaskDetailDao.selectList(new QueryWrapper<WareOrderTaskDetailEntity>()
                    .eq("task_id", taskEntity.getId()).eq("lock_status", 1));
            if (detailEntities!=null&&detailEntities.size()>0){
                detailEntities.stream().forEach(i->{
                    wareSkuDao.releaseStockLock(i.getSkuId(),i.getSkuNum());
                });
            }
            channel.basicAck(message.getMessageProperties().getDeliveryTag(),false);
        }catch (Exception e){
            //消息拒绝重新放入队列
            channel.basicReject(message.getMessageProperties().getDeliveryTag(),true);
            e.printStackTrace();
            e.printStackTrace();
        }
    }



}

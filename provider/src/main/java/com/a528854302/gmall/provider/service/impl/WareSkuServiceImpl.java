package com.a528854302.gmall.provider.service.impl;

import com.a528854302.common.utils.R;
import com.a528854302.gmall.portal.vo.CartItem;
import com.a528854302.gmall.provider.dao.OrderDao;
import com.a528854302.gmall.provider.dao.WareOrderTaskDao;
import com.a528854302.gmall.provider.dao.WareOrderTaskDetailDao;
import com.a528854302.gmall.provider.entity.OrderEntity;
import com.a528854302.gmall.provider.entity.WareOrderTaskDetailEntity;
import com.a528854302.gmall.provider.entity.WareOrderTaskEntity;
import com.a528854302.gmall.provider.service.OrderService;
import com.a528854302.gmall.provider.to.StockLockTo;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.rabbitmq.client.Channel;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.common.utils.Query;
import com.a528854302.gmall.provider.dao.WareSkuDao;
import com.a528854302.gmall.provider.entity.WareSkuEntity;
import com.a528854302.gmall.provider.service.WareSkuService;
import org.springframework.transaction.annotation.Transactional;
@Transactional
@Service("wareSkuService")
public class WareSkuServiceImpl extends ServiceImpl<WareSkuDao, WareSkuEntity> implements WareSkuService {

    @Autowired
    WareOrderTaskDao wareOrderTaskDao;
    @Autowired
    WareOrderTaskDetailDao wareOrderTaskDetailDao;
    @Autowired
    RabbitTemplate rabbitTemplate;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<WareSkuEntity> page = this.page(
                new Query<WareSkuEntity>().getPage(params),
                new QueryWrapper<WareSkuEntity>()
        );

        return new PageUtils(page);
    }



    @Override
    public R stockLock(StockLockTo stockLockTo) {
        Long taskId= IdWorker.getId();
        WareOrderTaskEntity wareOrderTaskEntity = new WareOrderTaskEntity();
        wareOrderTaskEntity.setOrderId(stockLockTo.getOrderId());
        wareOrderTaskEntity.setOrderSn(stockLockTo.getOrderSn());
        wareOrderTaskEntity.setId(taskId);
        wareOrderTaskEntity.setCreateTime(new Date());
        wareOrderTaskDao.insert(wareOrderTaskEntity);
        for (CartItem i : stockLockTo.getCartItems()) {
            Long skuId = i.getSkuId();
            Integer num = i.getCount();
            String skuTitle = i.getTitle();
            Integer count = baseMapper.stockLock(skuId, num);
            if (count>0){
                WareOrderTaskDetailEntity detailEntity = new WareOrderTaskDetailEntity();
                detailEntity.setSkuId(skuId);
                detailEntity.setTaskId(taskId);
                detailEntity.setLockStatus(1);
                detailEntity.setSkuName(skuTitle);
                detailEntity.setSkuNum(num);
                wareOrderTaskDetailDao.insert(detailEntity);
                rabbitTemplate.convertAndSend("stock-event-exchange"
                        ,"stock.locked",detailEntity);
            }else {
                return R.error(skuTitle+"库存不足,"+"sku_id:"+skuId);
            }
        }

        return R.ok();
    }




}
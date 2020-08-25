package com.a528854302.gmall.provider.service;

import com.a528854302.common.utils.R;
import com.a528854302.gmall.portal.vo.CartItem;
import com.a528854302.gmall.provider.to.StockLockTo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.gmall.provider.entity.WareSkuEntity;

import java.util.List;
import java.util.Map;

/**
 * 商品库存
 *
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:55:07
 */
public interface WareSkuService extends IService<WareSkuEntity> {

    PageUtils queryPage(Map<String, Object> params);


    R stockLock(StockLockTo stockLockTo);


}


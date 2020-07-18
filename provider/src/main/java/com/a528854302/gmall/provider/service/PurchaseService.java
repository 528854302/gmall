package com.a528854302.gmall.provider.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.gmall.provider.entity.PurchaseEntity;

import java.util.Map;

/**
 * 采购信息
 *
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:55:07
 */
public interface PurchaseService extends IService<PurchaseEntity> {

    PageUtils queryPage(Map<String, Object> params);
}


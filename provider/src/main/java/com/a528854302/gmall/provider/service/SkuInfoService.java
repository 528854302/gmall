package com.a528854302.gmall.provider.service;

import com.a528854302.gmall.portal.vo.SkuItemVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.gmall.provider.entity.SkuInfoEntity;

import java.util.Map;

/**
 * sku信息
 *
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:52:13
 */
public interface SkuInfoService extends IService<SkuInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);

    PageUtils queryPage(QueryWrapper<com.a528854302.gmall.provider.entity.SkuInfoEntity> queryWrapper,Integer page);

    SkuItemVo item(Long skuId);
}


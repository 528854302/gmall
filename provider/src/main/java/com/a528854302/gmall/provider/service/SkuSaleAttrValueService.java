package com.a528854302.gmall.provider.service;

import com.a528854302.gmall.portal.vo.SkuItemSalesAttrVo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.gmall.provider.entity.SkuSaleAttrValueEntity;

import java.util.List;
import java.util.Map;

/**
 * sku销售属性&值
 *
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:52:13
 */
public interface SkuSaleAttrValueService extends IService<SkuSaleAttrValueEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<SkuItemSalesAttrVo> selectSaleAttrVosBySpuId(Long spuId);

    List<SkuSaleAttrValueEntity> getBySkuId(Long skuId);
}


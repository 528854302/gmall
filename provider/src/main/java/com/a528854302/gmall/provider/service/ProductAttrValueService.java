package com.a528854302.gmall.provider.service;

import com.a528854302.gmall.portal.vo.SpuItemBaseAttrVo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.gmall.provider.entity.ProductAttrValueEntity;

import java.util.List;
import java.util.Map;

/**
 * spu属性值
 *
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:52:13
 */
public interface ProductAttrValueService extends IService<ProductAttrValueEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<SpuItemBaseAttrVo> selectSpuItemBaseAttrVo(Long catelogId, Long spuId);
}


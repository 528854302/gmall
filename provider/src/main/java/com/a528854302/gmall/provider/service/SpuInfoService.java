package com.a528854302.gmall.provider.service;

import com.a528854302.common.utils.R;
import com.a528854302.gmall.portal.vo.SkuItemVo;
import com.a528854302.gmall.provider.vo.ProductSaveVo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.gmall.provider.entity.SpuInfoEntity;

import java.util.Map;

/**
 * spu信息
 *
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:52:13
 */
public interface SpuInfoService extends IService<SpuInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void save(ProductSaveVo productSaveVo);

    R productUp(Long spuId);

}


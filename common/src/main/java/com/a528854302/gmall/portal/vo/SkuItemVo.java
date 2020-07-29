package com.a528854302.gmall.portal.vo;

import com.a528854302.gmall.provider.entity.SkuInfoEntity;
import com.a528854302.gmall.provider.entity.SpuImagesEntity;
import com.a528854302.gmall.provider.entity.SpuInfoDescEntity;
import com.a528854302.gmall.provider.entity.SpuInfoEntity;
import lombok.Data;

import java.util.List;

/**
 * @ClassName SkuItemVo
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/6/12
 **/
@Data
public class SkuItemVo {
    private SkuInfoEntity skuInfo;
    private String defaultImgUrl;
    private List<SpuImagesEntity> spuImages;
    private List<SkuItemSalesAttrVo> saleAttr;
    private SpuInfoEntity spuInfo;
    private SpuInfoDescEntity spuInfoDesc;
    private List<SpuItemBaseAttrVo> spuItemBaseAttr;
}

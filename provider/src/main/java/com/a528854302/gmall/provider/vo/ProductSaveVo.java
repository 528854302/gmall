package com.a528854302.gmall.provider.vo;

import com.a528854302.common.to.MemberPrice;
import com.a528854302.gmall.provider.entity.SkuImagesEntity;
import com.a528854302.gmall.provider.entity.SkuInfoEntity;
import com.a528854302.gmall.provider.entity.SpuInfoEntity;
import com.sun.jmx.remote.internal.ArrayQueue;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.ArrayDeque;
import java.util.List;
import java.util.Queue;

/**
 * @ClassName ProductSaveVo
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/19
 **/
@Data
public class ProductSaveVo extends SpuInfoEntity {

    private List<String> descriptionImgs;//描述图片
    private List<String> images;
    private BoundsVo bounds;
    private List<BaseAttrVo> baseAttrs;
    private List<SkuVo> skus;


    @Data
    @NoArgsConstructor
    public static class BoundsVo{
        private BigDecimal buyBounds;
        private BigDecimal growBounds;
    }
    @Data
    @NoArgsConstructor
    public static class BaseAttrVo{
        private Long attrId;
        private String attrValues;
        private Integer showDesc;
    }
    @Data
    @NoArgsConstructor
    public static class AttrVo{
        private Long attrId;
        private String attrName;
        private String attrValue;
    }
    @Data
    @NoArgsConstructor
    public static class SkuVo extends SkuInfoEntity {
        private List<AttrVo> attr;
        private List<SkuImageVo> images;
        private List<String> descar;
        private int fullCount;
        private BigDecimal discount;
        private int countStatus;
        private BigDecimal fullPrice;
        private BigDecimal reducePrice;
        private int priceStatus;
        private List<MemberPriceVo> memberPrice;
    }
    @Data
    @NoArgsConstructor
    public static class SkuImageVo{
        private String imgUrl;
        private int defaultImg;
    }
    @Data
    @NoArgsConstructor
    public static class MemberPriceVo{
        private Long id;
        private String name;
        private BigDecimal price;
    }


}

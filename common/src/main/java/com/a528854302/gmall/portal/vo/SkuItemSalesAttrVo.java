package com.a528854302.gmall.portal.vo;

import lombok.Data;

import java.util.List;

/**
 * @ClassName SkuItemSalesAttrVo
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/6/12
 **/
@Data
public class SkuItemSalesAttrVo {
    private Long attrId;
    private String attrName;
    private List<AttrValueVo> attrValues;

}

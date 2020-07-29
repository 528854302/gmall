package com.a528854302.gmall.portal.vo;

import lombok.Data;

import java.util.List;

/**
 * @ClassName SpuItemBaseAttr
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/6/12
 **/
@Data
public class SpuItemBaseAttrVo {
    private String groupName;
    private List<SpuBaseAttrVo> attrValues;
}

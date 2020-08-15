package com.a528854302.gmall.portal.vo;

import lombok.Data;

import java.util.List;

/**
 * @ClassName SearchParam
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/22
 **/
@Data
public class SearchParam {
    /**
     *搜索关键字
     */
    private String keyword;
    /**
     *三级分类id
     */
    private Long catelog3Id;

    /**
     *排序条件
     */
    private String sort;

    private Integer hasStock;
    /**
     *价格区间查询
     * 1000_2000
     */
    private String price;

    private List<Long> brandId;
    /**
     *按属性筛选
     */
    private List<String> attrs;

    private Integer page;
}

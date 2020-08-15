package com.a528854302.gmall.portal.vo;

import com.a528854302.gmall.provider.vo.ProductSaveVo;
import lombok.AllArgsConstructor;
import lombok.Data;
import com.a528854302.gmall.provider.entity.SkuInfoEntity;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @ClassName SearchResult
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/22
 **/
@Data
public class SearchResult {
    private List<SkuInfoEntity> products;
    private Integer pageNumber;
    private Integer total;
    private Integer totalPages;
    private Integer currentPage;
    private List<BrandVo> brands;
    private List<AttrVo> attrs;
    private List<CatelogVo> catelogs;

    /**
     * 面包屑筛选条件导航
     */
    private List<Nav> navs;

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class Nav{
        private String attr;
        private String name;
        private String value;
    }


    @Data
    public static class BrandVo{
        private Long brandId;
        private String name;
        private String logo;
    }
    @Data
    public static class AttrVo{
        private Long attrId;
        private String attrName;
        private List<String> attrValue;
    }
    @Data
    public static class CatelogVo{
        private Long catId;
        private String name;
    }

}

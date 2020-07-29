package com.a528854302.gmall.provider.service.impl;

import com.a528854302.common.utils.PageUtils;
import com.a528854302.common.utils.R;
import com.a528854302.gmall.provider.dao.SkuInfoDao;
import com.a528854302.gmall.provider.entity.SkuInfoEntity;
import com.a528854302.gmall.provider.service.*;
import com.a528854302.gmall.portal.vo.SearchParam;
import com.a528854302.gmall.portal.vo.SearchResult;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

/**
 * @ClassName SearchServiceImpl
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/22
 **/
@Service
public class SearchServiceImpl implements SearchService {
    @Autowired
    SkuInfoService skuInfoService;
    @Autowired
    AttrService attrService;

    @Autowired
    BrandService brandService;

    @Autowired
    CategoryService categoryService;

    @Override
    public SearchResult search(SearchParam searchParam) {
        SearchResult searchResult = buildSearchResultBySearchParam(searchParam);

        List<com.a528854302.gmall.provider.entity.AttrEntity> attrList = attrService.selectAttrByCatelogId(searchParam.getCatelog3Id());
        if (null!=attrList && attrList.size()>0){
            List<SearchResult.AttrVo> attrVos = attrList.stream().filter(item->item.getSearchType()==1).map(item -> {
                SearchResult.AttrVo attrVo = new SearchResult.AttrVo();
                BeanUtils.copyProperties(item, attrVo);
                attrVo.setAttrValue(Arrays.asList(item.getValueSelect().split(";")));
                return attrVo;
            }).collect(Collectors.toList());
            searchResult.setAttrs(attrVos);
        }
        List<com.a528854302.gmall.provider.entity.BrandEntity> brandEntities =
                brandService.listByCategoryId(searchParam.getCatelog3Id());
        if (null!=brandEntities && brandEntities.size()>0){
            searchResult.setBrands(brandEntities.stream().map(item->{
                SearchResult.BrandVo brandVo = new SearchResult.BrandVo();
                BeanUtils.copyProperties(item,brandVo);
                return brandVo;
            }).collect(Collectors.toList()));
            brandEntities.stream().forEach(brandEntity -> {
                List<SearchResult.Nav> navs = searchResult.getNavs();
                if (null!=navs && navs.contains(brandEntity.getBrandId())){
                    searchResult.getNavs().add(new SearchResult.Nav("brandId","品牌",brandEntity.getName()));
                }
            });
        }
        return searchResult;
    }

    private SearchResult buildSearchResultBySearchParam(SearchParam searchParam) {
        SearchResult searchResult = new SearchResult();
        QueryWrapper<SkuInfoEntity> queryWrapper = new QueryWrapper<SkuInfoEntity>();
        String keyword = searchParam.getKeyword();
        ArrayList<SearchResult.Nav> navs = new ArrayList<>();
        if (StringUtils.isNotEmpty(keyword)){
            //这里必须使用and，给or条件加上括号
            //(sku_name LIKE '%x10%' OR sku_title LIKE '%x10%' OR sku_subtitle LIKE '%x10%')
            queryWrapper.and(i -> i.like("sku_name",keyword).or().like("sku_title",keyword)
                    .or().like("sku_subtitle",keyword));
            navs.add(new SearchResult.Nav("kewyord","关键字",keyword));
        }
        List<Long> brandIds = searchParam.getBrandId();
        if (null!=brandIds && brandIds.size()>0){
            queryWrapper.in("brand_id",brandIds);
        }
        String price = searchParam.getPrice();
        if (StringUtils.isNotEmpty(price) && price.length()>1){
            navs.add(new SearchResult.Nav("price","价格区间",price.replaceAll("_","-")));
            String[] split = price.split("_");
            if (split.length==1){
                int indexOf = price.indexOf("_");
                if (indexOf==0){//_1000
                    String hight=split[1];
                    queryWrapper.le("price",hight);
                }else {//1000_
                    String low=split[0];
                    queryWrapper.ge("price",low);
                }
            }else if (split.length==2){
                String low=split[0];
                String hight=split[1];
                queryWrapper.between("price",low,hight);
            }else {
                throw new RuntimeException("price参数不合法");
            }
        }
        Long catalog3Id = searchParam.getCatelog3Id();
        if (null != catalog3Id){
            queryWrapper.eq("catelog_id",catalog3Id);
            navs.add(new SearchResult.Nav("catalog3Id","分类",categoryService.getById(catalog3Id).getName()));
        }
        PageUtils pageUtils = skuInfoService.queryPage(queryWrapper, searchParam.getPage());
        if (StringUtils.isNotEmpty(keyword)){
            pageUtils.setList(keywordHighLight(pageUtils,keyword));
        }
        searchResult.setProducts((List<SkuInfoEntity>) pageUtils.getList());
        searchResult.setNavs(navs);
        searchResult.setTotalPages(pageUtils.getTotalPage());
        searchResult.setTotal(pageUtils.getTotalCount());
        searchResult.setCurrentPage(pageUtils.getCurrPage());
        return searchResult;
    }

    /**
     * 检索关键字高亮
     * @param pageUtils
     * @param keyword
     * @return
     */
    private List<SkuInfoEntity> keywordHighLight(PageUtils pageUtils,String keyword) {
        return ((List<SkuInfoEntity>) pageUtils.getList()).stream().map(i->{
            String redKeyword="<font color=\"#FF0000\">"+keyword.toUpperCase()+"</font>";
            String pattern="(?i)"+keyword;
            i.setSkuTitle(i.getSkuTitle().replaceAll(pattern,redKeyword));
            return i;
        }).collect(Collectors.toList());
    }

    private PageUtils getProductPageUtilsBySearParams(SearchParam searchParam) {
        QueryWrapper<SkuInfoEntity> queryWrapper = new QueryWrapper<SkuInfoEntity>();
        String keyword = searchParam.getKeyword();
        ArrayList<SearchResult.Nav> navs = new ArrayList<>();
        if (StringUtils.isNotEmpty(keyword)){
            //这里必须使用and，给or条件加上括号
            //(sku_name LIKE '%x10%' OR sku_title LIKE '%x10%' OR sku_subtitle LIKE '%x10%')
            queryWrapper.and(i -> i.like("sku_name",keyword).or().like("sku_title",keyword)
                    .or().like("sku_subtitle",keyword));
            navs.add(new SearchResult.Nav("kewyord","关键字",keyword));
        }
        List<Long> brandIds = searchParam.getBrandId();
        if (null!=brandIds && brandIds.size()>0){
            queryWrapper.in("brand_id",brandIds);
        }
        String price = searchParam.getPrice();
        if (StringUtils.isNotEmpty(price) && price.length()>1){
            navs.add(new SearchResult.Nav("price","价格区间",price.replaceAll("_","-")));
            String[] split = price.split("_");
            if (split.length==1){
                int indexOf = price.indexOf("_");
                if (indexOf==0){//_1000
                    String hight=split[1];
                    queryWrapper.le("price",hight);
                }else {//1000_
                    String low=split[0];
                    queryWrapper.ge("price",low);
                }
            }else if (split.length==2){
                String low=split[0];
                String hight=split[1];
                queryWrapper.between("price",low,hight);
            }else {
                throw new RuntimeException("price参数不合法");
            }
        }
        Long catalog3Id = searchParam.getCatelog3Id();
        if (null != catalog3Id){
            queryWrapper.eq("catelog_id",catalog3Id);
            navs.add(new SearchResult.Nav("catalog3Id","分类",categoryService.getById(catalog3Id).getName()));
        }
        PageUtils pageUtils = skuInfoService.queryPage(queryWrapper, searchParam.getPage());
        if (StringUtils.isNotEmpty(keyword)){
            pageUtils.setList(keywordHighLight(pageUtils,keyword));
        }
        return pageUtils;
    }
}

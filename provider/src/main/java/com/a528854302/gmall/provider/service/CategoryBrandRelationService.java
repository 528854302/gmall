package com.a528854302.gmall.provider.service;

import com.a528854302.common.utils.PageUtils;
import com.a528854302.gmall.provider.entity.BrandEntity;
import com.a528854302.gmall.provider.entity.CategoryBrandRelationEntity;
import com.a528854302.gmall.provider.entity.CategoryEntity;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * @ClassName CategoryBrandRelationService
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/2
 **/
public interface CategoryBrandRelationService extends IService<CategoryBrandRelationEntity> {
    PageUtils queryPage(Map<String, Object> params);

    List<BrandEntity> listBrandByCatId(Long catId);

    List<CategoryEntity> listCategoryByBrandId(Long brandId);
}

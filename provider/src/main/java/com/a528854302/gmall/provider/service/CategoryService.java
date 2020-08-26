package com.a528854302.gmall.provider.service;

import com.a528854302.gmall.provider.vo.Catelog2Vo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.gmall.provider.entity.CategoryEntity;

import java.util.List;
import java.util.Map;

/**
 * 商品三级分类
 *
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:52:13
 */
public interface CategoryService extends IService<CategoryEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<CategoryEntity> listTree();

    List<CategoryEntity> listLevel1Categories();

    Map<Long, List<Catelog2Vo>> getCatelogJson();

    Map getCatelogJsonStringFromRedis();
}


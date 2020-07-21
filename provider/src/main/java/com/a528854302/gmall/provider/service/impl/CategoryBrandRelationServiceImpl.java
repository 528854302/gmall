package com.a528854302.gmall.provider.service.impl;

import com.a528854302.gmall.provider.dao.BrandDao;
import com.a528854302.gmall.provider.entity.BrandEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.common.utils.Query;

import com.a528854302.gmall.provider.dao.CategoryBrandRelationDao;
import com.a528854302.gmall.provider.entity.CategoryBrandRelationEntity;
import com.a528854302.gmall.provider.service.CategoryBrandRelationService;


@Service("categoryBrandRelationService")
public class CategoryBrandRelationServiceImpl extends ServiceImpl<CategoryBrandRelationDao, CategoryBrandRelationEntity> implements CategoryBrandRelationService {

    @Autowired
    BrandDao brandDao;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<CategoryBrandRelationEntity> page = this.page(
                new Query<CategoryBrandRelationEntity>().getPage(params),
                new QueryWrapper<CategoryBrandRelationEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public List<BrandEntity> listBrandByCatId(Long catId) {
        QueryWrapper<CategoryBrandRelationEntity> relationEntityQueryWrapper = new QueryWrapper<>();
        if (catId!=0&&null!=catId){
            relationEntityQueryWrapper.eq("catelog_id",catId);
        }
        List<Long> brandIds = baseMapper.selectList(relationEntityQueryWrapper).stream()
                .map(item -> item.getBrandId()).collect(Collectors.toList());
        if (brandIds.size()>0&&null!=brandIds){
            return brandDao.selectBatchIds(brandIds);
        }
        return null;
    }

}
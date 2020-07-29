package com.a528854302.gmall.provider.service.impl;

import com.a528854302.gmall.provider.dao.CategoryBrandRelationDao;
import com.a528854302.gmall.provider.entity.CategoryBrandRelationEntity;
import com.a528854302.gmall.provider.service.CategoryBrandRelationService;
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

import com.a528854302.gmall.provider.dao.BrandDao;
import com.a528854302.gmall.provider.entity.BrandEntity;
import com.a528854302.gmall.provider.service.BrandService;


@Service("brandService")
public class BrandServiceImpl extends ServiceImpl<BrandDao, BrandEntity> implements BrandService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<BrandEntity> page = this.page(
                new Query<BrandEntity>().getPage(params),
                new QueryWrapper<BrandEntity>()
        );

        return new PageUtils(page);
    }

    @Autowired
    CategoryBrandRelationDao categoryBrandRelationDao;
    @Override
    public List<BrandEntity> listByCategoryId(Long catalog3Id) {
        if (null==catalog3Id){
            return null;
        }
        QueryWrapper<CategoryBrandRelationEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("catelog_id", catalog3Id);
        List<Long> brandIds = categoryBrandRelationDao.selectList(queryWrapper).stream()
                .map(item -> item.getBrandId()).collect(Collectors.toList());
        if (null!= brandIds && brandIds.size()>0){
            return baseMapper.selectBatchIds(brandIds);
        }
        return null;
    }

}
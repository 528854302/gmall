package com.a528854302.gmall.provider.service.impl;

import com.a528854302.gmall.portal.vo.SpuItemBaseAttrVo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.common.utils.Query;

import com.a528854302.gmall.provider.dao.ProductAttrValueDao;
import com.a528854302.gmall.provider.entity.ProductAttrValueEntity;
import com.a528854302.gmall.provider.service.ProductAttrValueService;


@Service("productAttrValueService")
public class ProductAttrValueServiceImpl extends ServiceImpl<ProductAttrValueDao, ProductAttrValueEntity> implements ProductAttrValueService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ProductAttrValueEntity> page = this.page(
                new Query<ProductAttrValueEntity>().getPage(params),
                new QueryWrapper<ProductAttrValueEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public List<SpuItemBaseAttrVo> selectSpuItemBaseAttrVo(Long catelogId, Long spuId) {
        return baseMapper.selectSpuItemBaseAttrVo(catelogId,spuId);
    }

}
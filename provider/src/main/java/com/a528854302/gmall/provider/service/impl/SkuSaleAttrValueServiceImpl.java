package com.a528854302.gmall.provider.service.impl;

import com.a528854302.gmall.portal.vo.SkuItemSalesAttrVo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.common.utils.Query;

import com.a528854302.gmall.provider.dao.SkuSaleAttrValueDao;
import com.a528854302.gmall.provider.entity.SkuSaleAttrValueEntity;
import com.a528854302.gmall.provider.service.SkuSaleAttrValueService;


@Service("skuSaleAttrValueService")
public class SkuSaleAttrValueServiceImpl extends ServiceImpl<SkuSaleAttrValueDao, SkuSaleAttrValueEntity> implements SkuSaleAttrValueService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SkuSaleAttrValueEntity> page = this.page(
                new Query<SkuSaleAttrValueEntity>().getPage(params),
                new QueryWrapper<SkuSaleAttrValueEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public List<SkuItemSalesAttrVo> selectSaleAttrVosBySpuId(Long spuId) {
        return baseMapper.selectSaleAttrVosBySpuId(spuId);
    }

    @Override
    public List<SkuSaleAttrValueEntity> getBySkuId(Long skuId) {
        return baseMapper.selectList(new QueryWrapper<SkuSaleAttrValueEntity>()
        .eq("sku_id",skuId));
    }

}
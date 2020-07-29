package com.a528854302.gmall.provider.service.impl;

import com.a528854302.common.utils.Constant;
import com.a528854302.gmall.portal.vo.SkuItemVo;
import com.a528854302.gmall.provider.dao.*;
import com.a528854302.gmall.provider.entity.SpuImagesEntity;
import com.a528854302.gmall.provider.entity.SpuInfoEntity;
import com.a528854302.gmall.provider.vo.ProductSaveVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.common.utils.Query;

import com.a528854302.gmall.provider.entity.SkuInfoEntity;
import com.a528854302.gmall.provider.service.SkuInfoService;
import org.springframework.transaction.annotation.Transactional;


@Service("skuInfoService")
public class SkuInfoServiceImpl extends ServiceImpl<SkuInfoDao, SkuInfoEntity> implements SkuInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SkuInfoEntity> page = this.page(
                new Query<SkuInfoEntity>().getPage(params),
                new QueryWrapper<SkuInfoEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPage(QueryWrapper<SkuInfoEntity> queryWrapper,Integer page) {
        HashMap<String, Object> params = new HashMap<>();
        if (null == page){
            page=1;
        }
        params.put(Constant.LIMIT,"20");
        params.put(Constant.PAGE,page.toString());
        IPage<SkuInfoEntity> ipage = this.page(
                new Query<SkuInfoEntity>().getPage(params),
                queryWrapper
        );
        return new PageUtils(ipage);
    }

    @Autowired
    SkuInfoDao skuInfoMapper;
    @Autowired
    SpuImagesDao spuImagesMapper;
    @Autowired
    SpuInfoDescDao spuInfoDescMapper;
    @Autowired
    ProductAttrValueDao productAttrValueMapper;
    @Autowired
    SkuSaleAttrValueDao skuSaleAttrValueMapper;
    @Autowired
    SpuInfoDao spuInfoMapper;

    @Autowired
    ThreadPoolExecutor threadPoolExecutor;

    @Override
    public SkuItemVo item(Long skuId) {
        SkuItemVo itemVo = new SkuItemVo();
        CompletableFuture<SkuInfoEntity> skufuture = CompletableFuture.supplyAsync(() -> {
            SkuInfoEntity skuInfo = skuInfoMapper.selectById(skuId);
            itemVo.setSkuInfo(skuInfo);
            return skuInfo;
        },threadPoolExecutor);
        CompletableFuture<Void> spuFuture = skufuture.thenAcceptAsync((skuInfo) -> {
            itemVo.setSpuInfoDesc(spuInfoDescMapper.selectById(skuInfo.getSpuId()));
            itemVo.setSpuInfo(spuInfoMapper.selectById(skuInfo.getSpuId()));
            List<SpuImagesEntity> spuImages = spuImagesMapper.selectList(new QueryWrapper<SpuImagesEntity>()
                    .eq("spu_id", itemVo.getSkuInfo().getSpuId()));
            itemVo.setDefaultImgUrl(spuImages.stream()
                    .filter(item -> item.getDefaultImg() == 1)
                    .map(item -> item.getImgUrl()).collect(Collectors.joining()));
            itemVo.setSpuImages(spuImages);
        },threadPoolExecutor);
        CompletableFuture<Void> spuBaseAttrFuture = skufuture.thenAcceptAsync((skuInfo) -> {
            itemVo.setSpuItemBaseAttr(productAttrValueMapper
                    .selectSpuItemBaseAttrVo(skuInfo.getCatelogId(),skuInfo.getSpuId()));
        },threadPoolExecutor);
        CompletableFuture<Void> saleAttrValueFuture = skufuture.thenAcceptAsync((skuInfo) -> {
            itemVo.setSaleAttr(skuSaleAttrValueMapper.selectSaleAttrVosBySpuId(skuInfo.getSpuId()));
        },threadPoolExecutor);
        try {
            CompletableFuture.allOf(skufuture,spuFuture,spuBaseAttrFuture,saleAttrValueFuture).get();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return itemVo;
    }


}
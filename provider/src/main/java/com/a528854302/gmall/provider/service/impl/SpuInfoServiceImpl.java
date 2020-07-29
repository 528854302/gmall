package com.a528854302.gmall.provider.service.impl;

import com.a528854302.common.utils.R;
import com.a528854302.gmall.portal.vo.SkuItemVo;
import com.a528854302.gmall.provider.dao.AttrDao;
import com.a528854302.gmall.provider.dao.SpuImagesDao;
import com.a528854302.gmall.provider.dao.SpuInfoDescDao;
import com.a528854302.gmall.provider.service.*;
import com.a528854302.gmall.provider.vo.ProductSaveVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.a528854302.gmall.provider.entity.ProductAttrValueEntity;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import com.a528854302.gmall.provider.entity.SkuInfoEntity;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.common.utils.Query;
import com.a528854302.gmall.provider.dao.SpuInfoDao;
import org.springframework.transaction.annotation.Transactional;
import com.a528854302.gmall.provider.entity.SpuInfoEntity;
import com.a528854302.gmall.provider.entity.SpuInfoDescEntity;
import com.a528854302.gmall.provider.entity.SpuImagesEntity;
import com.a528854302.gmall.provider.entity.SkuImagesEntity;
import com.a528854302.gmall.provider.entity.SkuSaleAttrValueEntity;
import com.a528854302.gmall.provider.entity.SkuLadderEntity;
import com.a528854302.gmall.provider.entity.SkuFullReductionEntity;
import com.a528854302.gmall.provider.entity.MemberPriceEntity;
import com.a528854302.gmall.provider.entity.SpuBoundsEntity;
@Service("spuInfoService")
public class SpuInfoServiceImpl extends ServiceImpl<SpuInfoDao, SpuInfoEntity> implements SpuInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SpuInfoEntity> page = this.page(
                new Query<SpuInfoEntity>().getPage(params),
                new QueryWrapper<SpuInfoEntity>()
        );

        return new PageUtils(page);
    }

    @Autowired
    SpuInfoDescDao spuInfoDescDao;

    @Autowired
    AttrDao attrDao;

    @Autowired
    SpuImagesService spuImagesService;

    @Autowired
    ProductAttrValueService productAttrValueService;

    @Autowired
    SkuInfoService skuInfoService;

    @Autowired
    SkuImagesService skuImagesService;

    @Autowired
    SkuSaleAttrValueService skuSaleAttrValueService;

    @Autowired
    SpuBoundsService spuBoundsService;

    @Autowired
    SkuLadderService skuLadderService;

    @Autowired
    SkuFullReductionService skuFullReductionService;

    @Autowired
    MemberPriceService memberPriceService;

    @Transactional
    @Override
    public void save(ProductSaveVo productSaveVo) {
        SpuInfoEntity spuInfoEntity = new SpuInfoEntity();
        BeanUtils.copyProperties(productSaveVo,spuInfoEntity);
        spuInfoEntity.setCreateTime(new Date());
        spuInfoEntity.setUpdateTime(new Date());
        baseMapper.insert(spuInfoEntity);//插入后id后自动封装
        Long spuId = spuInfoEntity.getId();

        //保存spu描述图片
        SpuInfoDescEntity spuInfoDescEntity = new SpuInfoDescEntity();
        //需要设置@TableId(type = IdType.INPUT)
        spuInfoDescEntity.setSpuId(spuId);
        List<String> descriptionImgs = productSaveVo.getDescriptionImgs();
        spuInfoDescEntity.setDecript(String.join(",",descriptionImgs));
        spuInfoDescDao.insert(spuInfoDescEntity);

        //保存spu图片
        List<String> spuImages = productSaveVo.getImages();
        if (spuImages.size()>0 && null!=spuImages){
            List<SpuImagesEntity> spuImagesEntities = spuImages.stream().map(spuImg -> {
                SpuImagesEntity spuImagesEntity = new SpuImagesEntity();
                spuImagesEntity.setSpuId(spuId);
                spuImagesEntity.setImgUrl(spuImg);
                return spuImagesEntity;
            }).filter(spuImg->StringUtils.isNotEmpty(spuImg.getImgUrl())).collect(Collectors.toList());
            spuImagesService.saveBatch(spuImagesEntities);
        }

        //保存spu规格参数
        List<ProductSaveVo.BaseAttrVo> baseAttrs = productSaveVo.getBaseAttrs();
        if (baseAttrs.size()>0 && null!=baseAttrs){
            List<ProductAttrValueEntity> productAttrValueEntities = baseAttrs.stream().map(i -> {
                ProductAttrValueEntity productAttrValueEntity = new ProductAttrValueEntity();
                productAttrValueEntity.setAttrId(i.getAttrId());
                productAttrValueEntity.setSpuId(spuId);
                productAttrValueEntity.setAttrName(attrDao.selectById(i.getAttrId()).getAttrName());
                productAttrValueEntity.setAttrValue(i.getAttrValues());
                productAttrValueEntity.setQuickShow(i.getShowDesc());
                return productAttrValueEntity;
            }).collect(Collectors.toList());
            productAttrValueService.saveBatch(productAttrValueEntities);
        }

        //保存sku
        List<ProductSaveVo.SkuVo> skuVos = productSaveVo.getSkus();
        skuVos.stream().forEach(i->{
            SkuInfoEntity skuInfoEntity = new SkuInfoEntity();
            BeanUtils.copyProperties(i,skuInfoEntity);
            skuInfoEntity.setSpuId(spuId);
            skuInfoEntity.setCatelogId(spuInfoEntity.getCatalogId());
            skuInfoEntity.setBrandId(spuInfoEntity.getBrandId());
            skuInfoEntity.setSaleCount(0L);
            String defaultImg=null;
            List<ProductSaveVo.SkuImageVo> skuImages = i.getImages();
            for (ProductSaveVo.SkuImageVo image : skuImages) {
                if (image.getDefaultImg()==1){
                    defaultImg=image.getImgUrl();
                }
            }
            if (StringUtils.isEmpty(defaultImg)){
                if (skuImages.size()>0 && null!=skuImages){
                    defaultImg=skuImages.get(0).getImgUrl();
                }
            }
            skuInfoEntity.setSkuDefaultImg(defaultImg);
            skuInfoService.save(skuInfoEntity);
            Long skuId=skuInfoEntity.getSkuId();


            List<SkuImagesEntity> skuImagesEntities = skuImages.stream().map(img -> {
                SkuImagesEntity skuImagesEntity = new SkuImagesEntity();
                skuImagesEntity.setSkuId(skuId);
                skuImagesEntity.setImgUrl(img.getImgUrl());
                skuImagesEntity.setDefaultImg(img.getDefaultImg());
                return skuImagesEntity;
            }).filter(skuImagesEntity -> StringUtils.isNotEmpty(skuImagesEntity.getImgUrl())).collect(Collectors.toList());
            skuImagesService.saveBatch(skuImagesEntities);

            //保存sku销售属性
            List<ProductSaveVo.AttrVo> attrVos = i.getAttr();
            List<SkuSaleAttrValueEntity> skuSaleAttrValueEntities = attrVos.stream().map(attrVo -> {
                SkuSaleAttrValueEntity skuSaleAttrValueEntity = new SkuSaleAttrValueEntity();
                skuSaleAttrValueEntity.setSkuId(skuId);
                skuSaleAttrValueEntity.setAttrId(attrVo.getAttrId());
                skuSaleAttrValueEntity.setAttrName(attrVo.getAttrName());
                skuSaleAttrValueEntity.setAttrValue(attrVo.getAttrValue());
                return skuSaleAttrValueEntity;
            }).collect(Collectors.toList());
            skuSaleAttrValueService.saveBatch(skuSaleAttrValueEntities);


            SkuLadderEntity skuLadderEntity = new SkuLadderEntity();
            skuLadderEntity.setSkuId(skuId);
            skuLadderEntity.setFullCount(i.getFullCount());
            skuLadderEntity.setDiscount(i.getDiscount());
            skuLadderEntity.setAddOther(i.getCountStatus());


            SkuFullReductionEntity skuFullReductionEntity = new SkuFullReductionEntity();
            skuFullReductionEntity.setSkuId(skuId);
            skuFullReductionEntity.setFullPrice(i.getFullPrice());
            skuFullReductionEntity.setReducePrice(i.getReducePrice());

            List<ProductSaveVo.MemberPriceVo> memberPriceVos = i.getMemberPrice();
            List<MemberPriceEntity> memberPriceEntities = memberPriceVos.stream().map(memberPriceVo -> {
                MemberPriceEntity memberPriceEntity = new MemberPriceEntity();
                memberPriceEntity.setSkuId(skuId);
                memberPriceEntity.setMemberLevelName(memberPriceVo.getName());
                memberPriceEntity.setMemberPrice(memberPriceVo.getPrice());
                memberPriceEntity.setMemberLevelId(memberPriceVo.getId());
                return memberPriceEntity;
            }).collect(Collectors.toList());
            memberPriceService.saveBatch(memberPriceEntities);
        });

        //积分
        ProductSaveVo.BoundsVo bounds = productSaveVo.getBounds();
        SpuBoundsEntity spuBoundsEntity = new SpuBoundsEntity();
        spuBoundsEntity.setSpuId(spuId);
        BeanUtils.copyProperties(bounds,spuBoundsEntity);
        spuBoundsService.save(spuBoundsEntity);




    }

    @Override
    public R productUp(Long spuId) {
        SpuInfoEntity spuInfoEntity = new SpuInfoEntity();
        spuInfoEntity.setId(spuId);
        spuInfoEntity.setPublishStatus(1);
        boolean isSuccess = this.updateById(spuInfoEntity);
        if (isSuccess){
            return R.ok();
        }else {
            return R.error();
        }
    }


}
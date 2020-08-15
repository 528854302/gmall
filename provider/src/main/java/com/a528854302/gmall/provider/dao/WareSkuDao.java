package com.a528854302.gmall.provider.dao;

import com.a528854302.gmall.provider.entity.WareSkuEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/**
 * 商品库存
 * 
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:55:07
 */
@Mapper
public interface WareSkuDao extends BaseMapper<WareSkuEntity> {
    @Update("UPDATE `wms_ware_sku` SET stock_locked=stock_locked+#{num} \n" +
            "WHERE sku_id=#{skuId} AND stock>=stock_locked+#{num}")
    Integer stockLock(@Param("skuId") Long skuId,@Param("num") Integer num);

    @Update("UPDATE `wms_ware_sku` SET stock_locked=stock_locked-#{num} WHERE sku_id=#{skuId}")
    Integer releaseStockLock(@Param("skuId") Long skuId,@Param("num") Integer num);
}

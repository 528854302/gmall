package com.a528854302.gmall.provider.dao;

import com.a528854302.gmall.portal.vo.SpuItemBaseAttrVo;
import com.a528854302.gmall.provider.entity.ProductAttrValueEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * spu属性值
 * 
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:52:13
 */
@Mapper
public interface ProductAttrValueDao extends BaseMapper<ProductAttrValueEntity> {

    List<SpuItemBaseAttrVo> selectSpuItemBaseAttrVo(@Param("catelogId") Long catelogId
            ,@Param("spuId") Long spuId);
}

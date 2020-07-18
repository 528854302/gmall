package com.a528854302.gmall.provider.dao;

import com.a528854302.gmall.provider.entity.CategoryEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 商品三级分类
 * 
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:52:13
 */
@Mapper
public interface CategoryDao extends BaseMapper<CategoryEntity> {
	
}

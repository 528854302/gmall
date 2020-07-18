package com.a528854302.gmall.provider.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.gmall.provider.entity.AttrEntity;

import java.util.Map;

/**
 * 商品属性
 *
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:52:13
 */
public interface AttrService extends IService<AttrEntity> {

    PageUtils queryPage(Map<String, Object> params);
}


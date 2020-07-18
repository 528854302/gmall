package com.a528854302.gmall.provider.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.gmall.provider.entity.HomeSubjectSpuEntity;

import java.util.Map;

/**
 * 专题商品
 *
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:53:09
 */
public interface HomeSubjectSpuService extends IService<HomeSubjectSpuEntity> {

    PageUtils queryPage(Map<String, Object> params);
}


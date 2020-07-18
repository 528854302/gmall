package com.a528854302.gmall.provider.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.gmall.provider.entity.SpuCommentEntity;

import java.util.Map;

/**
 * 商品评价
 *
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:52:13
 */
public interface SpuCommentService extends IService<SpuCommentEntity> {

    PageUtils queryPage(Map<String, Object> params);
}


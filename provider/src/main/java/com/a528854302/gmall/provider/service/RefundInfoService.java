package com.a528854302.gmall.provider.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.gmall.provider.entity.RefundInfoEntity;

import java.util.Map;

/**
 * 退款信息
 *
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:50:48
 */
public interface RefundInfoService extends IService<RefundInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);
}


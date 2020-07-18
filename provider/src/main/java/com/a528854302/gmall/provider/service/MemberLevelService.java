package com.a528854302.gmall.provider.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.gmall.provider.entity.MemberLevelEntity;

import java.util.Map;

/**
 * 会员等级
 *
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:54:24
 */
public interface MemberLevelService extends IService<MemberLevelEntity> {

    PageUtils queryPage(Map<String, Object> params);
}


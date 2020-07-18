package com.a528854302.gmall.provider.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.gmall.provider.entity.MemberCollectSubjectEntity;

import java.util.Map;

/**
 * 会员收藏的专题活动
 *
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:54:24
 */
public interface MemberCollectSubjectService extends IService<MemberCollectSubjectEntity> {

    PageUtils queryPage(Map<String, Object> params);
}


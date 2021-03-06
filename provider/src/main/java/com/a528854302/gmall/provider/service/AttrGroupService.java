package com.a528854302.gmall.provider.service;

import com.a528854302.gmall.provider.entity.AttrEntity;
import com.baomidou.mybatisplus.extension.service.IService;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.gmall.provider.entity.AttrGroupEntity;

import java.util.List;
import java.util.Map;

/**
 * 属性分组
 *
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:52:13
 */
public interface AttrGroupService extends IService<AttrGroupEntity> {

    PageUtils queryPage(Map<String, Object> params);


    PageUtils listByCatelogId(Map<String, Object> params,Long catelogId);

    List<AttrEntity> listAttrByAttrgroupId(Long attrgroupId);

    PageUtils listNoAttrByAttrgroupId(Long attrgroupId,Map<String, Object> params);

    List<AttrGroupEntity> listAttrAttrGroupByCatelogId(Long catelogId);
}


package com.a528854302.gmall.provider.service.impl;

import com.a528854302.gmall.provider.dao.AttrAttrgroupRelationDao;
import com.a528854302.gmall.provider.dao.AttrDao;
import com.a528854302.gmall.provider.entity.AttrAttrgroupRelationEntity;
import com.a528854302.gmall.provider.entity.AttrEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.common.utils.Query;

import com.a528854302.gmall.provider.dao.AttrGroupDao;
import com.a528854302.gmall.provider.entity.AttrGroupEntity;
import com.a528854302.gmall.provider.service.AttrGroupService;


@Service("attrGroupService")
public class AttrGroupServiceImpl extends ServiceImpl<AttrGroupDao, AttrGroupEntity> implements AttrGroupService {

    @Autowired
    AttrAttrgroupRelationDao attrAttrgroupRelationDao;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<AttrGroupEntity> page = this.page(
                new Query<AttrGroupEntity>().getPage(params),
                new QueryWrapper<AttrGroupEntity>()
        );

        return new PageUtils(page);
    }

    public PageUtils listByCatelogId(Map<String, Object> params,Long catelogId) {
        QueryWrapper<AttrGroupEntity> queryWrapper = new QueryWrapper<>();
        if (catelogId!=0 && null!=catelogId){
            queryWrapper.eq("catelog_id",catelogId);
        }
        IPage<AttrGroupEntity> page = this.page(
                new Query<AttrGroupEntity>().getPage(params),
                queryWrapper
        );
        return new PageUtils(page);
    }

    @Autowired
    AttrDao attrDao;

    @Override
    public List<AttrEntity> listAttrByAttrgroupId(Long attrgroupId) {
        QueryWrapper<AttrAttrgroupRelationEntity> relationEntityQueryWrapper = new QueryWrapper<>();
        if (attrgroupId!=0&&null!=attrgroupId){
            relationEntityQueryWrapper.eq("attr_group_id",attrgroupId);
        }
        List<Long> attrIds = attrAttrgroupRelationDao.selectList(relationEntityQueryWrapper).stream()
                .map(i -> i.getAttrId()).collect(Collectors.toList());
        if (attrIds.size()>0 && null!=attrgroupId){
            return attrDao.selectBatchIds(attrIds);
        }
        return null;
    }


    @Override
    public PageUtils listNoAttrByAttrgroupId(Long attrgroupId,Map<String, Object> params) {
        QueryWrapper<AttrAttrgroupRelationEntity> relationEntityQueryWrapper = new QueryWrapper<>();
        if (attrgroupId!=0&&null!=attrgroupId){
            relationEntityQueryWrapper.eq("attr_group_id",attrgroupId);
        }
        List<Long> attrIds = attrAttrgroupRelationDao.selectList(relationEntityQueryWrapper).stream()
                .map(i -> i.getAttrId()).collect(Collectors.toList());
        QueryWrapper<AttrEntity> attrEntityQueryWrapper = new QueryWrapper<>();
        if (attrIds.size()>0 && null!=attrgroupId){
            attrEntityQueryWrapper.notIn("attr_id",attrIds);
        }
        IPage<AttrEntity> page = attrDao.selectPage(
                new Query<AttrEntity>().getPage(params),
                attrEntityQueryWrapper
        );
        return new PageUtils(page);
    }

    @Override
    public List<AttrGroupEntity> listAttrAttrGroupByCatelogId(Long catelogId) {
        QueryWrapper<AttrGroupEntity> attrGroupEntityQueryWrapper = new QueryWrapper<>();
        if (catelogId!=0&&null!=catelogId){
            attrGroupEntityQueryWrapper.eq("catelog_id",catelogId);
        }
        return baseMapper.selectList(attrGroupEntityQueryWrapper).stream()
                .map(i -> {
                    List<Long> attrIds = attrAttrgroupRelationDao.selectList(new QueryWrapper<AttrAttrgroupRelationEntity>()
                            .eq("attr_group_id", i.getAttrGroupId()))
                            .stream()
                            .map(item -> item.getAttrId())
                            .collect(Collectors.toList());
                    i.setAttrs(attrDao.selectBatchIds(attrIds));
                    return i;
                }).collect(Collectors.toList());
    }

}
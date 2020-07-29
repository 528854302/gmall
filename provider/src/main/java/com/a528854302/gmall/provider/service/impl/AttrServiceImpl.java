package com.a528854302.gmall.provider.service.impl;

import com.a528854302.gmall.provider.dao.AttrAttrgroupRelationDao;
import com.a528854302.gmall.provider.dao.AttrGroupDao;
import com.a528854302.gmall.provider.dao.CategoryDao;
import com.a528854302.gmall.provider.entity.AttrAttrgroupRelationEntity;
import com.a528854302.gmall.provider.entity.AttrGroupEntity;
import com.a528854302.gmall.provider.entity.CategoryEntity;
import com.a528854302.gmall.provider.vo.AttrEntityVo;
import com.a528854302.gmall.provider.vo.AttrSaleEntityVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
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
import com.a528854302.gmall.provider.dao.AttrDao;
import com.a528854302.gmall.provider.entity.AttrEntity;
import com.a528854302.gmall.provider.service.AttrService;


@Service("attrService")
public class AttrServiceImpl extends ServiceImpl<AttrDao, AttrEntity> implements AttrService {
    @Autowired
    CategoryDao categoryDao;

    @Autowired
    AttrGroupDao attrGroupDao;

    @Autowired
    AttrAttrgroupRelationDao attrAttrgroupRelationDao;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<AttrEntity> page = this.page(
                new Query<AttrEntity>().getPage(params),
                new QueryWrapper<AttrEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public PageUtils listBaseAttrByCatelogIdByPage(Long catelogId, Map<String, Object> params) {
        QueryWrapper<AttrEntity> queryWrapper = new QueryWrapper<>();
        if (catelogId!=0 && null!=catelogId){
            queryWrapper.eq("catelog_id",catelogId);
        }
        String key = (String)params.get("key");
        if (StringUtils.isNotEmpty(key)){
            queryWrapper.and(wrapper->wrapper.eq("attr_id",key)
                    .or().like("attr_name",key));
        }
        IPage<AttrEntity> page = this.page(
                new Query<AttrEntity>().getPage(params),
                queryWrapper
        );
        List<AttrEntityVo> AttrEntityVoS = page.getRecords().stream().map(i -> {
            AttrEntityVo AttrEntityVo = new AttrEntityVo();
            BeanUtils.copyProperties(i, AttrEntityVo);
            CategoryEntity categoryEntity = categoryDao.selectOne(new QueryWrapper<CategoryEntity>().eq("cat_id", i.getCatelogId()));
            if (null != categoryEntity) {
                AttrEntityVo.setCatelogName(categoryEntity.getName());
            }
            AttrAttrgroupRelationEntity relationEntity = attrAttrgroupRelationDao.selectOne(new QueryWrapper<AttrAttrgroupRelationEntity>()
                    .eq("attr_id", i.getAttrId()));
            if (null != relationEntity) {
                AttrGroupEntity attrGroupEntity = attrGroupDao.selectById(relationEntity.getAttrGroupId());
                AttrEntityVo.setGroupName(attrGroupEntity.getAttrGroupName());
            }
            return AttrEntityVo;
        }).collect(Collectors.toList());
        PageUtils pageUtils = new PageUtils(page);
        pageUtils.setList(AttrEntityVoS);
        return pageUtils;
    }

    @Override
    public PageUtils listSaleAttrByCatelogIdByPage(Long catelogId, Map<String, Object> params) {
        QueryWrapper<AttrEntity> queryWrapper = new QueryWrapper<>();
        if (catelogId!=0 && null!=catelogId){
            queryWrapper.eq("catelog_id",catelogId);
        }
        IPage<AttrEntity> page = this.page(
                new Query<AttrEntity>().getPage(params),
                queryWrapper.eq("attr_type",0)
        );

        PageUtils pageUtils = new PageUtils(page);
        pageUtils.setList(page.getRecords().stream().map(item->{
            AttrSaleEntityVo vo = new AttrSaleEntityVo();
            BeanUtils.copyProperties(item,vo);
            vo.setCatelogName(categoryDao.selectById(item.getCatelogId()).getName());
            return vo;
        }).collect(Collectors.toList()));
        return pageUtils;
    }

    @Override
    public List<AttrEntity> selectAttrByCatelogId(Long catalog3Id) {
        if (null == catalog3Id){
            return null;
        }
        return this.list(new QueryWrapper<AttrEntity>().eq("catelog_id",catalog3Id));
    }

}
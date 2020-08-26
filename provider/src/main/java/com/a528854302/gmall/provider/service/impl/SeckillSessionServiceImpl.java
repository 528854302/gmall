package com.a528854302.gmall.provider.service.impl;

import com.a528854302.gmall.provider.entity.SeckillSkuRelationEntity;
import com.a528854302.gmall.provider.entity.SkuInfoEntity;
import com.a528854302.gmall.provider.service.SeckillSkuRelationService;
import com.a528854302.gmall.provider.service.SkuInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.common.utils.Query;

import com.a528854302.gmall.provider.dao.SeckillSessionDao;
import com.a528854302.gmall.provider.entity.SeckillSessionEntity;
import com.a528854302.gmall.provider.service.SeckillSessionService;


@Service("seckillSessionService")
public class SeckillSessionServiceImpl extends ServiceImpl<SeckillSessionDao, SeckillSessionEntity> implements SeckillSessionService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SeckillSessionEntity> page = this.page(
                new Query<SeckillSessionEntity>().getPage(params),
                new QueryWrapper<SeckillSessionEntity>()
        );
        return new PageUtils(page);
    }
    @Autowired
    SeckillSkuRelationService seckillSkuRelationService;
    @Autowired
    SkuInfoService skuInfoService;

    @Override
    public List<SeckillSessionEntity> getLastest3DaysSessions() {
        String startTime = getStartTime();
        String endTime = getEndTime();
        QueryWrapper<SeckillSessionEntity> queryWrapper = new QueryWrapper<SeckillSessionEntity>().between("start_time",
                startTime, endTime);
        queryWrapper.eq("status",1);
        List<SeckillSessionEntity> entities = baseMapper.selectList(queryWrapper);
        if (entities!=null&&entities.size()>0){
            entities.stream().map(i->{
                List<SeckillSkuRelationEntity> relationEntities = seckillSkuRelationService.list(
                        new QueryWrapper<SeckillSkuRelationEntity>().eq("promotion_session_id",
                                i.getId())).stream().map(j->{
                    SkuInfoEntity skuInfoEntity = skuInfoService.getById(j.getSkuId());
                    j.setSkuInfoEntity(skuInfoEntity);
                    return j;
                }).collect(Collectors.toList());
                i.setSeckillSkuRelationEntities(relationEntities);
                return i;
            }).collect(Collectors.toList());
        }
        return entities;
    }

    private String getEndTime() {
        LocalDateTime of = LocalDateTime.of(LocalDate.now().plusDays(2), LocalTime.MAX);
        String format = of.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        return format;
    }

    private String getStartTime() {
        LocalDateTime of = LocalDateTime.of(LocalDate.now(), LocalTime.MIN);
        String format = of.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        return format;
    }

}
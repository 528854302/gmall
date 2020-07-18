package com.a528854302.gmall.provider.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.common.utils.Query;

import com.a528854302.gmall.provider.dao.CouponHistoryDao;
import com.a528854302.gmall.provider.entity.CouponHistoryEntity;
import com.a528854302.gmall.provider.service.CouponHistoryService;


@Service("couponHistoryService")
public class CouponHistoryServiceImpl extends ServiceImpl<CouponHistoryDao, CouponHistoryEntity> implements CouponHistoryService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<CouponHistoryEntity> page = this.page(
                new Query<CouponHistoryEntity>().getPage(params),
                new QueryWrapper<CouponHistoryEntity>()
        );

        return new PageUtils(page);
    }

}
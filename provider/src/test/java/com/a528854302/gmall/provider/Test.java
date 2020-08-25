package com.a528854302.gmall.provider;

import com.a528854302.common.utils.Constant;
import com.a528854302.common.utils.Query;
import com.a528854302.gmall.portal.vo.SkuItemSalesAttrVo;
import com.a528854302.gmall.provider.dao.SkuInfoDao;
import com.a528854302.gmall.provider.dao.SkuSaleAttrValueDao;
import com.a528854302.gmall.provider.dao.WareSkuDao;
import com.a528854302.gmall.provider.entity.SeckillSessionEntity;
import com.a528854302.gmall.provider.service.SeckillSessionService;
import com.a528854302.gmall.provider.service.WareSkuService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.List;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * @ClassName Test
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/22
 **/
@SpringBootTest
@RunWith(SpringRunner.class)
public class Test {
    @Autowired
    WareSkuService wareSkuService;
    @Autowired
    WareSkuDao wareSkuDao;
    @Autowired
    SeckillSessionService seckillSessionService;

    static int count=0;
    @org.junit.Test
    public void test(){
        List<SeckillSessionEntity> sessions = seckillSessionService.getLastest3DaysSessions();
        System.out.println(sessions);

    }
}

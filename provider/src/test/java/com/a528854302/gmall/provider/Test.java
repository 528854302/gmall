package com.a528854302.gmall.provider;

import com.a528854302.common.utils.Constant;
import com.a528854302.common.utils.Query;
import com.a528854302.gmall.portal.vo.SkuItemSalesAttrVo;
import com.a528854302.gmall.provider.dao.SkuInfoDao;
import com.a528854302.gmall.provider.dao.SkuSaleAttrValueDao;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.List;

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
    SkuInfoDao skuInfoDao;
    @Autowired
    SkuSaleAttrValueDao skuSaleAttrValueDao;

    @org.junit.Test
    public void test(){
        List<SkuItemSalesAttrVo> vos = skuSaleAttrValueDao.selectSaleAttrVosBySpuId(13l);
        System.out.println(vos);
    }
}

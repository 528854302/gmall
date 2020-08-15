package com.a528854302.gmall.portal.service.impl;

import com.a528854302.gmall.portal.feign.ProviderClient;
import com.a528854302.gmall.portal.service.ItemService;
import com.a528854302.gmall.portal.vo.SkuItemVo;
import com.a528854302.gmall.provider.entity.SkuInfoEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

/**
 * @ClassName ItemServiceImpl
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/31
 **/
@Service
public class ItemServiceImpl implements ItemService {
    @Autowired
    ProviderClient providerClient;
    @Autowired
    TemplateEngine templateEngine;

    @Override
    public void createStaticPage(Long spuId) {
        List<SkuInfoEntity> skuInfoEntities = providerClient.listSkuInfoBySpuId(spuId);
        skuInfoEntities.stream().forEach(skuInfoEntity -> {
            SkuItemVo skuItemVo = providerClient.item(skuInfoEntity.getSkuId());
            Context context = new Context();
            HashMap data = new HashMap();
            data.put("skuItemVo",skuItemVo);
            context.setVariables(data);
            FileWriter fileWriter = null;
            try {
                fileWriter = new FileWriter("D:/mytmp/" + skuInfoEntity.getSkuId() + ".html");
                templateEngine.process("item",context,fileWriter);
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
    }
}

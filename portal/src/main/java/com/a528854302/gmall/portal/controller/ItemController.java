package com.a528854302.gmall.portal.controller;

import com.a528854302.common.utils.R;
import com.a528854302.gmall.portal.feign.ProviderClient;
import com.a528854302.gmall.portal.service.ItemService;
import com.a528854302.gmall.portal.vo.AttrValueVo;
import com.a528854302.gmall.portal.vo.SkuItemSalesAttrVo;
import com.a528854302.gmall.portal.vo.SkuItemVo;
import com.a528854302.gmall.provider.entity.SkuInfoEntity;
import com.a528854302.gmall.provider.entity.SkuSaleAttrValueEntity;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @ClassName ItemController
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/31
 **/
@Controller
public class ItemController {
    @Autowired
    ProviderClient providerClient;

    @RequestMapping("/{skuId}.html")
    public String item(@PathVariable("skuId") Long skuId, Model model){
        SkuItemVo skuItemVo = providerClient.item(skuId);
        model.addAttribute("skuItemVo",skuItemVo);
        List<SkuSaleAttrValueEntity> skuSaleAttrValue = providerClient.getSkuSaleAttrValue(skuId);
        System.out.println(skuSaleAttrValue);
        return "item";
    }
    

    @Autowired
    ItemService itemService;
    //页面静态化  http://localhost:88/item/{skuId}.html
    @ResponseBody
    @RequestMapping("/createPage/{spuId}")
    public R itemtest(@PathVariable("spuId") Long spuId){
        itemService.createStaticPage(spuId);
        return R.ok();
    }
}

package com.a528854302.gmall.portal.controller;

import com.a528854302.common.utils.R;
import com.a528854302.gmall.portal.feign.ProviderClient;
import com.a528854302.gmall.portal.vo.SearchParam;
import com.a528854302.gmall.portal.vo.SearchResult;
import com.a528854302.gmall.portal.vo.SkuItemVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;
import java.util.Map;

/**
 * @ClassName IndexController
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/21
 **/
@Controller
public class IndexController {

    @Autowired
    ProviderClient providerClient;


    @RequestMapping({"/index.html","/"})
    public String index(Model model){
        model.addAttribute("categories",providerClient.listLevel1Categories());
        return "index";
    }

    @RequestMapping({"/search.html"})
    public String search(SearchParam searchParam, Model model){
        SearchResult result = providerClient.search(searchParam);
        model.addAttribute("result",result);
        model.addAttribute("categories",providerClient.listLevel1Categories());
        return "search";
    }

    @RequestMapping("/{skuId}.html")
    public String item(@PathVariable("skuId") Long skuId,Model model){
        SkuItemVo skuItemVo = providerClient.item(skuId);
        model.addAttribute("skuItemVo",skuItemVo);
        return "item";
    }



}

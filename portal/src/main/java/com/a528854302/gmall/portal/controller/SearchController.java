package com.a528854302.gmall.portal.controller;

import com.a528854302.gmall.portal.feign.ProviderClient;
import com.a528854302.gmall.portal.vo.SearchParam;
import com.a528854302.gmall.portal.vo.SearchResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName SearchController
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/31
 **/
@Controller
public class SearchController {

    @Autowired
    ProviderClient providerClient;

    @RequestMapping({"/search.html"})
    public String search(SearchParam searchParam, Model model){
        SearchResult result = providerClient.search(searchParam);
        model.addAttribute("result",result);
        model.addAttribute("categories",providerClient.listLevel1Categories());
        return "search";
    }
}

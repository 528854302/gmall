package com.a528854302.gmall.portal.controller;

import com.a528854302.common.utils.R;
import com.a528854302.gmall.portal.feign.ProviderClient;
import com.a528854302.gmall.portal.vo.SearchParam;
import com.a528854302.gmall.portal.vo.SearchResult;
import com.a528854302.gmall.portal.vo.SkuItemVo;
import com.alibaba.fastjson.JSON;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
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
    public String index(Model model, HttpSession session){
        Object user = session.getAttribute("user");
        System.out.println(JSON.toJSONString(user));

        model.addAttribute("categories",providerClient.listLevel1Categories());
        return "index";
    }






}

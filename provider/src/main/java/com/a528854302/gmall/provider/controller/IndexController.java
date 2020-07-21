package com.a528854302.gmall.provider.controller;

import com.a528854302.common.utils.R;
import com.a528854302.gmall.provider.entity.CategoryEntity;
import com.a528854302.gmall.provider.service.CategoryService;
import com.a528854302.gmall.provider.vo.Catelog2Vo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName IndexController
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/21
 **/
@Controller
@RequestMapping("provider")
public class IndexController {

    @Autowired
    CategoryService categoryService;

    @RequestMapping("/{name}.html")
    public ModelAndView getPage(@PathVariable("name") String name, ModelAndView modelAndView){
        if (StringUtils.isEmpty(name)){
            throw new  RuntimeException("找不到该页面");
        }
        if (name.equals("index")){
            this.index(modelAndView);
        }
        modelAndView.setViewName(name);
        return modelAndView;
    }

    private void index(ModelAndView modelAndView) {
        List<CategoryEntity> categoryEntities = categoryService.listLevel1Categories();
        modelAndView.addObject("categories",categoryEntities);
    }

    @ResponseBody
    @RequestMapping("/catelog.json")
    public Map<Long, List<Catelog2Vo>> getCatelog(){
        return categoryService.getCatelogJson();
    }


}

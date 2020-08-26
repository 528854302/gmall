package com.a528854302.gmall.provider.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.a528854302.gmall.provider.vo.Catelog2Vo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.a528854302.gmall.provider.entity.CategoryEntity;
import com.a528854302.gmall.provider.service.CategoryService;
import com.a528854302.common.utils.R;

import javax.servlet.http.HttpServletResponse;


/**
 * 商品三级分类
 *
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:52:13
 */
@RestController
@RequestMapping("provider/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    /**
     * 获取一级分类列表
     * @return
     */
    @RequestMapping("/listLevel1Categories")
    //@RequiresPermissions("provider:category:list")
    public List<CategoryEntity> listLevel1Categories(){
        return categoryService.listLevel1Categories();
    }

    /**
     * 获取category.json
     * @return
     */
    @RequestMapping("/catelog.json")
    //@RequiresPermissions("provider:category:list")
    public Map getCatelogJson(HttpServletResponse response) throws IOException {
        return categoryService.getCatelogJsonStringFromRedis();
//        response.setCharacterEncoding("utf-8");
//        response.setContentType("application/json; charset=utf-8");
//        PrintWriter writer = response.getWriter();
//        writer.write(json);

    }

    /**
     * 列表
     */
    @RequestMapping("/list/tree")
    //@RequiresPermissions("provider:category:list")
    public R listTree(@RequestParam Map<String, Object> params){
        List<CategoryEntity> categoryEntities = categoryService.listTree();
        return R.ok().put("data", categoryEntities);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{catId}")
    //@RequiresPermissions("provider:category:info")
    public R info(@PathVariable("catId") Long catId){
		CategoryEntity category = categoryService.getById(catId);

        return R.ok().put("category", category);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("provider:category:save")
    public R save(@RequestBody CategoryEntity category){
		categoryService.save(category);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("provider:category:update")
    public R update(@RequestBody CategoryEntity category){
		categoryService.updateById(category);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("provider:category:delete")
    public R delete(@RequestBody Long[] catIds){
		categoryService.removeByIds(Arrays.asList(catIds));

        return R.ok();
    }

}

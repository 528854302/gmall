package com.a528854302.gmall.provider.controller;

import java.util.Arrays;
import java.util.Map;

import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.a528854302.gmall.provider.entity.AttrEntity;
import com.a528854302.gmall.provider.service.AttrService;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.common.utils.R;



/**
 * 商品属性
 *
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:52:13
 */
@RestController
@RequestMapping("provider/attr")
public class AttrController {
    @Autowired
    private AttrService attrService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("provider:attr:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = attrService.queryPage(params);

        return R.ok().put("page", page);
    }

    /**
     * 获取分类规格参数
     */
    @ApiOperation("获取分类规格参数")
    @RequestMapping("/base/list/{catelogId}")
    //@RequiresPermissions("provider:attr:list")
    public R listBaseAttrByCatelogId(@RequestParam Map<String, Object> params
            ,@PathVariable("catelogId") Long catelogId){
        PageUtils page = attrService.listBaseAttrByCatelogIdByPage(catelogId,params);

        return R.ok().put("page", page);
    }

    /**
     * 获取分类销售属性
     */
    @ApiOperation("获取分类销售属性")
    @RequestMapping("/sale/list/{catelogId}")
    //@RequiresPermissions("provider:attr:list")
    public R listSalesAttrByCatelogId(@RequestParam Map<String, Object> params
            ,@PathVariable("catelogId") Long catelogId){
        PageUtils page = attrService.listSaleAttrByCatelogIdByPage(catelogId,params);
        return R.ok().put("page", page);
    }



    /**
     * 信息
     */
    @RequestMapping("/info/{attrId}")
    //@RequiresPermissions("provider:attr:info")
    public R info(@PathVariable("attrId") Long attrId){
		AttrEntity attr = attrService.getById(attrId);

        return R.ok().put("attr", attr);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("provider:attr:save")
    public R save(@RequestBody AttrEntity attr){
		attrService.save(attr);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("provider:attr:update")
    public R update(@RequestBody AttrEntity attr){
		attrService.updateById(attr);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("provider:attr:delete")
    public R delete(@RequestBody Long[] attrIds){
		attrService.removeByIds(Arrays.asList(attrIds));

        return R.ok();
    }

}

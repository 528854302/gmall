package com.a528854302.gmall.provider.controller;

import java.util.Arrays;
import java.util.Map;

import com.a528854302.gmall.portal.vo.SkuItemVo;
import com.a528854302.gmall.provider.vo.ProductSaveVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.a528854302.gmall.provider.entity.SpuInfoEntity;
import com.a528854302.gmall.provider.service.SpuInfoService;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.common.utils.R;



/**
 * spu信息
 *
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:52:13
 */
@RestController
@RequestMapping("provider/spuinfo")
public class SpuInfoController {
    @Autowired
    private SpuInfoService spuInfoService;

    /**
     * 商品上架
     */
    @RequestMapping("/{spuId}/up")
    //@RequiresPermissions("provider:spuinfo:list")
    public R up(@PathVariable("spuId") Long spuId){
        return spuInfoService.productUp(spuId);
    }

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("provider:spuinfo:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = spuInfoService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("provider:spuinfo:info")
    public R info(@PathVariable("id") Long id){
		SpuInfoEntity spuInfo = spuInfoService.getById(id);
        return R.ok().put("spuInfo", spuInfo);
    }

    @RequestMapping("/selectBySpuId/{spuId}")
    //@RequiresPermissions("provider:spuinfo:info")
    public SpuInfoEntity selectBySpuId(@PathVariable("spuId") Long spuId){
        return spuInfoService.getById(spuId);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("provider:spuinfo:save")
    public R save(@RequestBody ProductSaveVo productSaveVo){
		spuInfoService.save(productSaveVo);
        return R.ok();
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("provider:spuinfo:update")
    public R update(@RequestBody SpuInfoEntity spuInfo){
		spuInfoService.updateById(spuInfo);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("provider:spuinfo:delete")
    public R delete(@RequestBody Long[] ids){
		spuInfoService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}

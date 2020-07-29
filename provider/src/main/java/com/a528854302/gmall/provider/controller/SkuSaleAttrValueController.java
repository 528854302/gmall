package com.a528854302.gmall.provider.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.a528854302.gmall.portal.vo.SkuItemSalesAttrVo;
import com.a528854302.gmall.provider.entity.SkuInfoEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.a528854302.gmall.provider.entity.SkuSaleAttrValueEntity;
import com.a528854302.gmall.provider.service.SkuSaleAttrValueService;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.common.utils.R;



/**
 * sku销售属性&值
 *
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:52:13
 */
@RestController
@RequestMapping("provider/skusaleattrvalue")
public class SkuSaleAttrValueController {
    @Autowired
    private SkuSaleAttrValueService skuSaleAttrValueService;

    @RequestMapping("/provider/skusaleattrvalue/selectVos/{spuId}")
    public List<SkuItemSalesAttrVo> selectSaleAttrVosBySpuId(@PathVariable("spuId") Long spuId){
        return skuSaleAttrValueService.selectSaleAttrVosBySpuId(spuId);
    }

    @RequestMapping("/select/{skuId}")
    public List<SkuSaleAttrValueEntity> selectSkuInfoBySkuId(@PathVariable("skuId") Long skuId){
        return skuSaleAttrValueService.getBySkuId(skuId);
    }


    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("provider:skusaleattrvalue:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = skuSaleAttrValueService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("provider:skusaleattrvalue:info")
    public R info(@PathVariable("id") Long id){
		SkuSaleAttrValueEntity skuSaleAttrValue = skuSaleAttrValueService.getById(id);

        return R.ok().put("skuSaleAttrValue", skuSaleAttrValue);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("provider:skusaleattrvalue:save")
    public R save(@RequestBody SkuSaleAttrValueEntity skuSaleAttrValue){
		skuSaleAttrValueService.save(skuSaleAttrValue);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("provider:skusaleattrvalue:update")
    public R update(@RequestBody SkuSaleAttrValueEntity skuSaleAttrValue){
		skuSaleAttrValueService.updateById(skuSaleAttrValue);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("provider:skusaleattrvalue:delete")
    public R delete(@RequestBody Long[] ids){
		skuSaleAttrValueService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}

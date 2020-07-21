package com.a528854302.gmall.provider.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import com.a528854302.gmall.provider.entity.AttrEntity;
import com.a528854302.gmall.provider.entity.AttrGroupEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.a528854302.gmall.provider.service.AttrGroupService;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.common.utils.R;



/**
 * 属性分组
 *
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:52:13
 */
@RestController
@RequestMapping("provider/attrgroup")
public class AttrGroupController {
    @Autowired
    private AttrGroupService attrGroupService;


    /**
     * 获取分类下所有分组&关联属性
     */
    @RequestMapping("/{catelogId}/withattr")
    //@RequiresPermissions("provider:attrgroup:list")
    public R listAttrAttrGroupByCatelogId(@PathVariable("catelogId") Long catelogId){
        List<AttrGroupEntity> entities = attrGroupService.listAttrAttrGroupByCatelogId(catelogId);
        return R.ok().put("data", entities);
    }

    /**
     * 获取属性分组的关联的所有属性
     */
    @RequestMapping("/{attrgroupId}/attr/relation")
    //@RequiresPermissions("provider:attrgroup:list")
    public R listAttrByAttrgroupId(@PathVariable("attrgroupId") Long attrgroupId){
        List<AttrEntity> attrEntities = attrGroupService.listAttrByAttrgroupId(attrgroupId);
        return R.ok().put("data", attrEntities);
    }

    /**
     * 获取属性分组没有关联的其他属性
     */
    @RequestMapping("/{attrgroupId}/noattr/relation")
    //@RequiresPermissions("provider:attrgroup:list")
    public R listNoAttrByAttrgroupId(@PathVariable("attrgroupId") Long attrgroupId,@RequestParam Map<String, Object> params){
        PageUtils page = attrGroupService.listNoAttrByAttrgroupId(attrgroupId,params);
        return R.ok().put("page", page);
    }

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("provider:attrgroup:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = attrGroupService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 获取分类属性分组
     * @param
     * @return
     */
    @RequestMapping("/list/{catelogId}")
    //@RequiresPermissions("provider:attrgroup:list")
    public R listByCatelogId(@RequestParam Map<String, Object> params,@PathVariable("catelogId") Long catelogId){
        PageUtils page = attrGroupService.listByCatelogId(params,catelogId);
        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{attrGroupId}")
    //@RequiresPermissions("provider:attrgroup:info")
    public R info(@PathVariable("attrGroupId") Long attrGroupId){
		AttrGroupEntity attrGroup = attrGroupService.getById(attrGroupId);

        return R.ok().put("attrGroup", attrGroup);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("provider:attrgroup:save")
    public R save(@RequestBody AttrGroupEntity attrGroup){
		attrGroupService.save(attrGroup);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("provider:attrgroup:update")
    public R update(@RequestBody AttrGroupEntity attrGroup){
		attrGroupService.updateById(attrGroup);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("provider:attrgroup:delete")
    public R delete(@RequestBody Long[] attrGroupIds){
		attrGroupService.removeByIds(Arrays.asList(attrGroupIds));

        return R.ok();
    }

}

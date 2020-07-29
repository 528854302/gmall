package com.a528854302.gmall.provider.controller;

import java.util.Arrays;
import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.a528854302.gmall.provider.entity.MemberEntity;
import com.a528854302.gmall.provider.service.MemberService;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.common.utils.R;



/**
 * 会员
 *
 * @author 528854302
 * @email 528854302@qq.com
 * @date 2020-07-18 19:54:24
 */
@RestController
@RequestMapping("provider/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @RequestMapping("/selectByUserName/{username}")
    public MemberEntity selectMemberByUserName(@PathVariable("username") String username){
        return memberService.getOne(new QueryWrapper<MemberEntity>().eq("username",username));
    }

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("provider:member:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = memberService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("provider:member:info")
    public R info(@PathVariable("id") Long id){
		MemberEntity member = memberService.getById(id);

        return R.ok().put("member", member);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("provider:member:save")
    public R save(@RequestBody MemberEntity member){
        if (memberService.save(member)){
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("provider:member:update")
    public R update(@RequestBody MemberEntity member){
		memberService.updateById(member);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("provider:member:delete")
    public R delete(@RequestBody Long[] ids){
		memberService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}

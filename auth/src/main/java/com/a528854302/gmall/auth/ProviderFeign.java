package com.a528854302.gmall.auth;

import com.a528854302.common.utils.R;
import com.a528854302.gmall.provider.entity.MemberEntity;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName ProviderFeign
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/24
 **/
@FeignClient(name = "provider")
public interface ProviderFeign {

    @RequestMapping("/provider/member/selectByUserName/{username}")
    public MemberEntity selectMemberByUserName(@PathVariable("username") String username);

    @RequestMapping("/provider/member/save")
    R save(@RequestBody MemberEntity memberEntity);
}

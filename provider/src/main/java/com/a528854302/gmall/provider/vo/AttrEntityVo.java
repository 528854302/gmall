package com.a528854302.gmall.provider.vo;

import com.a528854302.gmall.provider.entity.AttrEntity;
import lombok.Data;
import sun.plugin.dom.core.Attr;

/**
 * @ClassName AttrEntityVO
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/18
 **/
@Data
public class AttrEntityVo extends AttrEntity {
    private String catelogName;

    private String groupName;
}

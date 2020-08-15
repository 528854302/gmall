package com.a528854302.gmall.portal.vo;

import lombok.Data;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @ClassName AttrValueVo
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/6/12
 **/
@Data
public class AttrValueVo {
    private String value;
    private List<String> skuIds;

    private boolean checked;
    private String skuId;

}

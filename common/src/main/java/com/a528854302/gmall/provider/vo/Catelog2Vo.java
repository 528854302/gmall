package com.a528854302.gmall.provider.vo;

import lombok.Data;

import java.util.List;

/**
 * @ClassName CategoryVo
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/21
 **/
@Data
public class Catelog2Vo {
    private Long catalog1Id;

    private List<com.a528854302.gmall.provider.vo.Catelog3Vo> catelog3List;

    private Long id;

    private String name;
}

package com.a528854302.gmall.seckill.vo;

import com.a528854302.gmall.provider.entity.SkuInfoEntity;
import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @ClassName SekillSkuVo
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/24
 **/
@Data
public class SeckillSkuVo {
    private Long id;
    /**
     * 活动id
     */
    private Long promotionId;
    /**
     * 活动场次id
     */
    private Long promotionSessionId;
    /**
     * 商品id
     */
    private Long skuId;
    /**
     * 秒杀价格
     */
    private BigDecimal seckillPrice;
    /**
     * 秒杀总量
     */
    private Integer seckillCount;
    /**
     * 每人限购数量
     */
    private Integer seckillLimit;
    /**
     * 排序
     */
    private Integer seckillSort;

    /**
     * spuId
     */
    private Long spuId;
    /**
     * sku名称
     */
    private String skuName;
    /**
     * sku介绍描述
     */
    private String skuDesc;
    /**
     * 所属分类id
     */
    private Long catelogId;
    /**
     * 品牌id
     */
    private Long brandId;
    /**
     * 默认图片
     */
    private String skuDefaultImg;
    /**
     * 标题
     */
    private String skuTitle;
    /**
     * 副标题
     */
    private String skuSubtitle;
    /**
     * 价格
     */
    private BigDecimal price;
    /**
     * 销量
     */
    private Long saleCount;

    private String seckillToken;

    private String redisSessionKey;

    private String starttime;

    private String endtime;

    private String remainStock;

    private Boolean start=true;
    //距离秒杀开始或者结束的时间
    private Long startOrEndMillies;

    public String getStarttime() {
        if (redisSessionKey==null){
            return null;
        }
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String replace = this.redisSessionKey.replace("SECKILL_SESSION:", "");
        return format.format(new Date(Long.parseLong(replace.split("_")[0])));
    }

    public String getEndtime() {
        if (redisSessionKey==null){
            return null;
        }
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String replace = this.redisSessionKey.replace("SECKILL_SESSION:", "");
        return format.format(new Date(Long.parseLong(replace.split("_")[1])));
    }
}

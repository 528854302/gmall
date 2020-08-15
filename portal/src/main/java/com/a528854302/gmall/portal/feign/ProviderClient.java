package com.a528854302.gmall.portal.feign;

import com.a528854302.common.utils.R;
import com.a528854302.gmall.portal.vo.*;
import com.a528854302.gmall.provider.entity.*;
import com.a528854302.gmall.provider.to.StockLockTo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@FeignClient("provider")
public interface ProviderClient {

    @RequestMapping("/provider/category/listLevel1Categories")
    public List<CategoryEntity> listLevel1Categories();

    @RequestMapping("/provider/search")
    public SearchResult search(@RequestBody(required = false) SearchParam searchParam);

    @RequestMapping("/provider/skuinfo/item/{skuId}")
    public SkuItemVo item(@PathVariable("skuId") Long skuId);

    @RequestMapping("/provider/skuinfo/select/{skuId}")
    SkuInfoEntity getSkuInfo(@PathVariable("skuId") Long skuId);

    @RequestMapping("/provider/skusaleattrvalue/select/{skuId}")
    List<SkuSaleAttrValueEntity> getSkuSaleAttrValue(@PathVariable("skuId") Long skuId);

    @RequestMapping("/provider/skuinfo/listBySpuId/{spuId}")
    List<SkuInfoEntity> listSkuInfoBySpuId(@PathVariable("spuId") Long spuId);

    @RequestMapping("/provider/orderitem/saveBatch")
    R saveOrderItems(@RequestBody List<OrderItemEntity> orderItemEntities);

    @RequestMapping("/provider/order/save")
    R saveOrder(@RequestBody OrderEntity orderEntity);

    @RequestMapping("/provider/waresku/stockLock")
    R stockLock(@RequestBody StockLockTo stockLockTo);
}

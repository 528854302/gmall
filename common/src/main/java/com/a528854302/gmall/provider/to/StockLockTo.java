package com.a528854302.gmall.provider.to;

import com.a528854302.gmall.portal.vo.CartItem;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @ClassName StockLockTo
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/14
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class StockLockTo{
    private String orderSn;
    private Long orderId;
    private List<CartItem> cartItems;

}

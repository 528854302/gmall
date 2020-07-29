package com.a528854302.gmall.portal.vo;

import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

/**
 * @ClassName Cart
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/7/27
 **/
@NoArgsConstructor
public class  Cart {

    private List<CartItem> items;

    private Integer countNum;

    private Integer countType;

    private BigDecimal totalAmount;

    private BigDecimal reduce = new BigDecimal(0);

    public Cart(List<CartItem> items) {
        this.items = items;
    }

    public List<CartItem> getItems() {
        return items;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }

    public Integer getCountNum() {
        Integer count=0;
        if (null != this.items && this.items.size()>0){
            for (CartItem item : this.items) {
                count+=item.getCount();
            }
        }
        return count;
    }

    public void setCountNum(Integer countNum) {
        this.countNum = countNum;
    }

    public Integer getCountType() {
        Integer count=0;
        if (null != this.items && this.items.size()>0){
            for (CartItem item : this.items) {
                count+=1;
            }
        }
        return count;
    }

    public void setCountType(Integer countType) {
        this.countType = countType;
    }

    public BigDecimal getTotalAmount() {
        BigDecimal amount=new BigDecimal(0);
        if (null != this.items && this.items.size()>0){
            for (CartItem item : this.items) {
                amount = amount.add(item.getTotalPrice());
            }
        }
        return amount.subtract(getReduce());
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public BigDecimal getReduce() {
        return reduce;
    }

    public void setReduce(BigDecimal reduce) {
        this.reduce = reduce;
    }
}

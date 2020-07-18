package com.a528854302.common.to;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class SpuBoundTo {

    private Long spuId;
    private BigDecimal buyBounds;
    private BigDecimal growBounds;
}

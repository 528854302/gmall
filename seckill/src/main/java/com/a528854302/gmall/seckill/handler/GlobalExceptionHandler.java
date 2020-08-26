package com.a528854302.gmall.seckill.handler;

import com.a528854302.common.utils.R;
import com.a528854302.gmall.seckill.excepiton.SeckillException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * @ClassName ControllerAdvicer
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/26
 **/
@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(SeckillException.class)
    public R sekillExceptionHandler(Exception e){
        return R.ok().put("success",false).put("msg",e.getMessage());
    }
}

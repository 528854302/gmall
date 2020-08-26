package com.a528854302.gmall.portal.aspect;

import com.a528854302.gmall.provider.entity.MemberEntity;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * @ClassName LoginAspect
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/25
 **/
@Aspect
@Component
public class LoginAspect {
    public static ThreadLocal<MemberEntity> threadLocal = new ThreadLocal<>();

    private List<String> nologinUrls=Arrays.asList("/portal/index.html","/portal/search.html","/portal/");

    @Around("execution(* com.a528854302.gmall.portal.controller.*.*(..))")
    public Object transactionAround(ProceedingJoinPoint pjp) {
        System.out.println("执行LoginAspect方法"+new Date());
        HttpServletRequest request = ((ServletRequestAttributes)
                RequestContextHolder.getRequestAttributes()).getRequest();
        HttpServletResponse response = ((ServletRequestAttributes)
                RequestContextHolder.getRequestAttributes()).getResponse();
        Object rtValue = null;
        String uri = request.getRequestURI();
        Object[] args = pjp.getArgs();

        try {
            if (nologinUrls.contains(uri)){
                rtValue = pjp.proceed(args);

            }else {
                Object user = request.getSession().getAttribute("user");
                if (user==null){
                    return "redirect:http://localhost:88/auth/index.html";
                }else {
                    MemberEntity memberEntity = (MemberEntity) user;
                    threadLocal.set(memberEntity);
                    rtValue = pjp.proceed(args);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        return rtValue;
    }


}

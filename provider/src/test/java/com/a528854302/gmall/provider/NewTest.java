package com.a528854302.gmall.provider;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Calendar;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Semaphore;

/**
 * @ClassName NewTest
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/14
 **/
public class NewTest {

    public static void main(String[] args) throws InterruptedException {
        LocalDate now = LocalDate.now();
        System.out.println(now);
        LocalTime now1 = LocalTime.now();
        System.out.println(now1);
        LocalDateTime of = LocalDateTime.of(now, now1);
        System.out.println(of);
        
    }



}



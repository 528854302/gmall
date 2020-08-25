package com.a528854302.gmall.provider.juc;

import lombok.extern.slf4j.Slf4j;

/**
 * @ClassName Number
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/15
 **/
@Slf4j(topic = "c.Number")
class Number{
    public synchronized void a() {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        log.debug("1");
    }
    public synchronized void b() {

        log.debug("2");
    }

    public static void main(String[] args) {
        Number n1 = new Number();
        new Thread(()->{ n1.a(); }).start();
        new Thread(()->{ n1.b(); }).start();
    }
}


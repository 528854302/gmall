package com.a528854302.gmall.provider;

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

    public static void main(String[] args) {

        Ticket ticket = new Ticket();
        for (int i = 0; i < 20; i++) {
            Thread thread = new Thread(ticket, "t" + i);
            thread.start();
        }


    }


}

 class Ticket implements Runnable {

    private int num = 0; // 出票数
    private int count = 10; // 剩余票数
     private Semaphore semaphore = new Semaphore(10);



    @Override
    public void run() {

        while (true) {

            // 没有余票时，跳出循环
            if (semaphore.availablePermits() <= 0) {
                break;
            }

            try {
                Thread.sleep(50);// 模拟网络延时
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            if (semaphore.tryAcquire()){
                System.out.println("显示出票信息：" + Thread.currentThread().getName()
                        + "抢到第" + semaphore.drainPermits() + "张票，剩余" + semaphore.availablePermits() + "张票");
            }

        }
    }

}

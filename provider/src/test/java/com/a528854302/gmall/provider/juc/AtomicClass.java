package com.a528854302.gmall.provider.juc;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * @ClassName AtomicClass
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/15
 **/
public class AtomicClass {
    static int n = 0;
    //static AtomicInteger n = new AtomicInteger(0);
    public static void main(String[] args) throws InterruptedException {


    }
    //3511
//    public static void atomic(){
//        int j = 0;
//        long start = System.currentTimeMillis();
//        while(j<10000){
//            n.set(0);
//            Thread t1 = new Thread(){
//                public void run(){
//                    for(int i=0; i<1000; i++){
//                        n.incrementAndGet();
//                    }
//                }
//            };
//            Thread t2 = new Thread(){
//                public void run(){
//                    for(int i=0; i<1000; i++){
//                        n.incrementAndGet();
//                    }
//                }
//            };
//            t1.start();
//            t2.start();
//            try {
//                t1.join();
//                t2.join();
//            } catch (InterruptedException e) {
//                e.printStackTrace();
//            }
//            System.out.println("n的最终值是："+n.get());
//            j++;
//        }
//        long end = System.currentTimeMillis();
//        System.out.println("time:"+(end-start));
//    }
    //
    public static void syc(){
        Object lock = new Object();
        int j = 0;
        long start = System.currentTimeMillis();
        while(j<10000){
            n=0;
            Thread t1 = new Thread(){
                public void run(){
                    for(int i=0; i<1000; i++){
                        synchronized (lock){
                            n++;
                        }
                    }
                }
            };
            Thread t2 = new Thread(){
                public void run(){
                    for(int i=0; i<1000; i++){
                        synchronized (lock){
                            n++;
                        }
                    }
                }
            };
            t1.start();
            t2.start();
            try {
                t1.join();
                t2.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("n的最终值是："+n);
            j++;
        }
        long end = System.currentTimeMillis();
        System.out.println("time:"+(end-start));
    }

}

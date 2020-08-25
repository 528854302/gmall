package com.a528854302.gmall.provider.juc;

import sun.misc.Unsafe;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

interface Account {
    // 获取余额
    Integer getBalance();
    // 取款
    void withdraw(Integer amount);
    /**
     * 方法内会启动 1000 个线程，每个线程做 -10 元 的操作
     * 如果初始余额为 10000 那么正确的结果应当是 0
     */
    static void demo(Account account) {
        List<Thread> ts = new ArrayList<>();
        long start = System.nanoTime();
        for (int i = 0; i < 1000; i++) {
            ts.add(new Thread(() -> {
                account.withdraw(10);
            }));
        }
        ts.forEach(Thread::start);
        ts.forEach(t -> {
            try {
                t.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        });
        long end = System.nanoTime();
        System.out.println(account.getBalance()
                + " cost: " + (end-start)/1000_000 + " ms");

        Unsafe unsafe = Unsafe.getUnsafe();

    }
}
class AccountUnsafe implements Account{
    private Integer balance;
    public AccountUnsafe(Integer balance) {
        this.balance = balance;
    }

    @Override
    public Integer getBalance() {
        return balance;
    }
    @Override
    public void withdraw(Integer amount) {
        synchronized (this){
            balance -= amount;
        }
    }

}
class TestAccount{
    public static void main(String[] args) {
        System.out.print("cas:");
        AccountUnsafe accountUnsafe = new AccountUnsafe(10000);
        Account.demo(accountUnsafe);
        System.out.print("synchronized:");
        AccountCas accountCas = new AccountCas(10000);
        Account.demo(accountCas);
    }
}
class AccountCas implements Account{
    private AtomicInteger balance;
    public AccountCas(int balance) {
        this.balance = new AtomicInteger(balance);
    }

    @Override
    public Integer getBalance() {
        return balance.get();
    }
    @Override
    public void withdraw(Integer amount) {
//        while (true) {
//            int prev = balance.get();
//            int next = prev - amount;
//            if (balance.compareAndSet(prev, next)) {
//                break;
//            }
//        }
        // 可以简化为下面的方法
         balance.addAndGet(-1 * amount);
    }

}
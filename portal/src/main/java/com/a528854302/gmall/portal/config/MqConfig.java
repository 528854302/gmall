package com.a528854302.gmall.portal.config;

import com.a528854302.gmall.provider.entity.OrderEntity;
import com.rabbitmq.client.Channel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.*;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.util.HashMap;

/**
 * @ClassName MqConfig
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/8/14
 **/
@Slf4j
@Configuration
public class MqConfig {




    /**
     * 延时队列
     * @return
     */
    @Bean
    public Queue orderDelayQueue(){
        HashMap<String, Object> args = new HashMap<>();
        args.put("x-dead-letter-exchange","order-event-exchange");
        args.put("x-dead-letter-routing-key","order.release.order");
        args.put("x-message-ttl",60000);
        return new Queue("order.delay.queue",true,false,false,args);
    }
    @Bean
    public Queue orderReleaseQueue(){
        return new Queue("order.release.order.queue",true,false,false);
    }
    @Bean
    public Exchange orderEventExchange(){
        return new TopicExchange("order-event-exchange",true,false);
    }
    @Bean
    public Binding orderCreateBinding(){
        return new Binding("order.delay.queue", Binding.DestinationType.QUEUE,
                "order-event-exchange","order.create.order"
                 ,null);
    }
    @Bean
    public Binding orderReleaseBinding(){
        return new Binding("order.release.order.queue", Binding.DestinationType.QUEUE,
                "order-event-exchange","order.release.order"
                ,null);
    }

    /**
     *
     * @return
     */
    @Bean
    public Binding orderReleaseOtherBinding(){
        return new Binding("stock.release.stock.queue", Binding.DestinationType.QUEUE,
                "order-event-exchange","order.release.order.#"
                ,null);
    }
}

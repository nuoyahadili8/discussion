package com.ledict.web;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * @Author An
 * @Description:
 * @Date: create in 2018/4/1
 * @Modified By:
 */
@SpringBootApplication
@MapperScan("com.ledict.dao")
@ComponentScan(basePackages = {"com.ledict.core","com.ledict.web"})
public class DiscussionApplication {

    public static void main(String[] args) {
        SpringApplication.run(DiscussionApplication.class,args);
    }
}

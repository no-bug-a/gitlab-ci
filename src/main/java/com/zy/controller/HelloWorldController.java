package com.zy.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author zhangyi
 * @date 2022-05-26 14:33
 */
@RestController
public class HelloWorldController {

    @GetMapping("/")
    public String hello() {
        return "HelloWorld!";
    }
}

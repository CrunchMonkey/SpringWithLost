package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan(basePackages = {"com.example.demo.sample.mapper"})
@SpringBootApplication
public class Myapp1Application {

	public static void main(String[] args) {
		SpringApplication.run(Myapp1Application.class, args);
	}
}

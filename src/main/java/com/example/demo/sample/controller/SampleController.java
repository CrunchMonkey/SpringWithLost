package com.example.demo.sample.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.sample.service.SampleService;

@Controller
public class SampleController {
	@Autowired
	private SampleService sampleService;
	
	@RequestMapping(value="/index", method = {RequestMethod.POST, RequestMethod.GET})
	public String index() {
		System.out.println("인덱스 페이지 호출");
		String test = "index";//sampleService.selectTest();
		System.out.println("조회 테스트 : "+test);
		return "index";
	}
	
	@RequestMapping(value="/main", method = {RequestMethod.POST, RequestMethod.GET})
	public String main() {
		return "main";
	}
}

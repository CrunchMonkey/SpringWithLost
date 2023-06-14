package com.example.demo.sample.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.sample.mapper.mainMapper;

@Service
public class mainService {
	
	@Autowired
	private mainMapper mainMapper;
	
	public String selectTest() {
		System.out.println("오됨");
		return mainMapper.selectTest();
	}

}

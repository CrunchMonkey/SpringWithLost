package com.example.demo.sample.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.sample.mapper.SampleMapper;

@Service
public class SampleService {
	
	@Autowired
	private SampleMapper sampleMapper;
	
	public String selectTest() {
		System.out.println("오됨");
		return sampleMapper.selectTest();
	}

}

package com.example.demo.sample.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SampleMapper {
	// 샘플 조회
	String selectTest();
}
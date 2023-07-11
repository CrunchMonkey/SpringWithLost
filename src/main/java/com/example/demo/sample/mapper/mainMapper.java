package com.example.demo.sample.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.sample.model.mainModel;

@Mapper
public interface mainMapper {
	// 스킬 조회
	ArrayList<mainModel> selectSkill();
}
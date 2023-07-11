package com.example.demo.sample.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.sample.mapper.mainMapper;
import com.example.demo.sample.model.mainModel;

@Service
public class mainService {
	
	@Autowired
	private mainMapper mainMapper;
	
	public ArrayList<mainModel> selectSkill() {
		return mainMapper.selectSkill();
	}

}

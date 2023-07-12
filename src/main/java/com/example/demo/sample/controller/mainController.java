package com.example.demo.sample.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.sample.model.mainModel;
import com.example.demo.sample.service.mainService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class mainController {
	@Autowired
	private mainService mainService;
	
	@RequestMapping(value="/index", method = {RequestMethod.POST, RequestMethod.GET})
	public String index() {
		//ArrayList<mainModel> test = mainService.selectTest();
		
		return "index";
	}
	
	@RequestMapping(value="/main", method = {RequestMethod.POST, RequestMethod.GET})
	public String main(Model model) throws Exception {
		ObjectMapper mapper = new ObjectMapper();
		ArrayList<mainModel> skill = mainService.selectSkill();
		
		String jsonSkillString = mapper.writeValueAsString(skill);
		model.addAttribute("jsonSkillString", jsonSkillString);
		return "main";
	}
}

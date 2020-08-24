package com.spring.lifecare.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	// HomeController.java는 주석처리
	@RequestMapping("/")
	public String home(Model model) {
		
		return "main";
	}
	
	@RequestMapping("HiPassCard")
	public String HiPassCard(Model model) {
		return "HiPassCard";
	}
}
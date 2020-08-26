package com.spring.lifecare.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	// HomeController.java는 주석처리
	@RequestMapping("/")
	public String main(Model model) {
		
		return "main";
	}
	
	@RequestMapping("login")
	public String login(Model model) {
		
		return "login";
	}
	
	@RequestMapping("HiPassCard")
	public String HiPassCard(Model model) {
		return "HiPassCard";
	}
}
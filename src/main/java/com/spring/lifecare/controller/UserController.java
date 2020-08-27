package com.spring.lifecare.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	// HomeController.java는 주석처리
	@RequestMapping(value= {"/","/guest/main","/main"})
	public String main(Model model) {
		
		return "guest/main";
	}
	
	@RequestMapping("login")
	public String login(Model model) {
		
		return "guest/login";
	}
}
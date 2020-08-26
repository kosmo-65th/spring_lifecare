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
	
	// 팝업창 
	@RequestMapping("popup")
	public String popup(Model model) {
		return "popup";
	}
	
	// 카카오페이 결제 페이지(새창)
	@RequestMapping("kakaopay")
	public String kakaopay(Model model) {
		return "kakaopay";
	}
}
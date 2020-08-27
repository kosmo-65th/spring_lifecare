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
	
	@RequestMapping("/popup")
	public String popup(Model model) {
		
		return "common/popup";
	}
	
	
	// 회원 로그인 이후 이용가능(테스트라 맵핑 설정 안함)
	@RequestMapping("/payment")
	public String payment(Model model) {
		
		return "customer/payment";
	}
	
	@RequestMapping("/kakaopay")
	public String kakaopay(Model model) {
		
		return "customer/kakaopay";
	}
	
	@RequestMapping("/diagnosis")
	public String diagnosis(Model model) {
		
		return "customer/diagnosis";
	}
	
	@RequestMapping("/medicalNote")
	public String medicalNote(Model model) {
		
		return "customer/medicalNote";
	}
	
	@RequestMapping("/prescription")
	public String prescription(Model model) {
		
		return "customer/prescription";
	}
}
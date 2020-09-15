package com.spring.lifecare.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DlrController {
	//로그인 페이지
	@RequestMapping("/login")
	public String login(Model model) {
		
		return "guest/login";
	}
	/*
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req,Model model,HttpSession session) {
		//session.invalidate();
		//SecurityContextHolder.clearContext();
		
		return "main";
	}
<<<<<<< HEAD
	*/
=======
	
	//문진표
	@RequestMapping("/questionnaire")
	public String questionnaire(HttpServletRequest req,Model model) {
		
		return "customer/Questionnaire/questionnaire";
	}
	
	//문진표 문항1
	@RequestMapping("/index1")
	public String index1(HttpServletRequest req,Model model) {
		
		return "customer/Questionnaire/index1";
	}
	
	//문진표 문항2
	@RequestMapping("/index2")
	public String index2(HttpServletRequest req,Model model) {
		
		return "customer/Questionnaire/index2";
	}
	
	//문진표 문항3
	@RequestMapping("/index3")
	public String index3(HttpServletRequest req,Model model) {
		
		return "customer/Questionnaire/index3";
	}
	
	//문진표 문항4
	@RequestMapping("/index4")
	public String index4(HttpServletRequest req,Model model) {
		
		return "customer/Questionnaire/index4";
	}
>>>>>>> dlr
}

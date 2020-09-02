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
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req,Model model,HttpSession session) {
		session.invalidate();
		SecurityContextHolder.clearContext();
		
		return "guest/main";
	}
}

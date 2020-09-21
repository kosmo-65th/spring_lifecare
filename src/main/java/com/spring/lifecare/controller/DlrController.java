package com.spring.lifecare.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.lifecare.service.questionnaireService;

@Controller
public class DlrController {
	
	questionnaireService questionnaireservice;
	
	//로그인 페이지
	@RequestMapping("/login")
	public String login(Model model) {
		
		return "guest/login";
	}
	
	//문진표시작
	@RequestMapping("/questionnaire")
	public String questionnaire(HttpServletRequest req,Model model) {
		
		return "customer/Questionnaire/questionnaire";
	}
	
	//문진표 문항
	@RequestMapping("/index1")
	public String index1(HttpServletRequest req,Model model) {
		questionnaireservice.munjinsave(req,model);
		
		return "customer/Questionnaire/index1";
	}
	
	//코로나 정보
	@RequestMapping("/covid19")
	public String covid19(HttpServletRequest req,Model model) {
		
		return "guest/covid19";
	}
}

package com.spring.lifecare.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.lifecare.service.FooterService;

@Controller
public class JmyController {
	
	
	@Autowired
	FooterService ser;
	
	
	//환자권리장전
	@RequestMapping("/pbor")
	public String pbor() {
		
		
		return "/guest/patientBillOfRight";
	}
	
	//이용약관
	@RequestMapping("/conditions")
	public String conditions() {
		
		
		return "/guest/conditions";
	}
	
	//개인정보 처리방침
	@RequestMapping("/PI")
	public String PI() {
		
		return "/guest/personaLinfomation";
	}
	
	//정보공개
	@RequestMapping("/OI")
	public String OI() {
		
		
		return "/guest/openInfomation";
	}
	
	//비급여목록 
	@RequestMapping("/nonpayment")
	public String nonpayment(HttpServletRequest req, Model model) {
		
		String code=req.getParameter("code");
		if(code==null) {
			code="1";
		}
		ser.treatment(req, model, code);
		
		
		return "/guest/nonpayment";
	}
	
	//챗봇 로그인 확인 후 이동
	@RequestMapping("/customer/chatbot")
	public String chatbot(HttpServletRequest req, Model model) {
		//시큐리티 인증을 거쳐야 챗봇 open
		
		
		return "/common/chatbot_open";
	}
	
}

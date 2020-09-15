package com.spring.lifecare.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JmyController {
	
	//환자권리장전
	@RequestMapping("/guest/pbor")
	public String pbor() {
		
		
		return "/guest/patientBillOfRight";
	}
	//이용약관
	@RequestMapping("/guest/conditions")
	public String conditions() {
		
		
		return "/guest/conditions";
	}
	//개인정보 처리방침
	@RequestMapping("/guest/PI")
	public String PI() {
		
		return "/guest/personaLinfomation";
	}
	
	//정보공개
	@RequestMapping("/guest/OI")
	public String OI() {
		
		
		return "/guest/openInfomation";
	}
	@RequestMapping("/guest/nonpayment")
	public String nonpayment(HttpServletRequest req, Model model) {
		
		String code=req.getParameter("code");
		if(code==null) {
			code="1";
		}
		
		model.addAttribute("code",code);
		
		
		return "/guest/nonpayment";
	}
}

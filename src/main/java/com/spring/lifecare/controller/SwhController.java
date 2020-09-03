package com.spring.lifecare.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SwhController {
//
	//메인페이지
	@RequestMapping(value= {"/","/guest/main","/main"})
	public String main(Model model) {
		
		return "main";
	}
	
	//404 에러 페이지
	@RequestMapping("/error_404")
	public String error_404(HttpServletRequest request, Model model) {
		return "error/error_404";
	}

}



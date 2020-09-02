package com.spring.lifecare.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SwhController {
//
	//메인페이지
	@RequestMapping(value= {"/","/guest/main","/main"})
	public String main(Model model) {
		
		return "guest/main";
	}
}

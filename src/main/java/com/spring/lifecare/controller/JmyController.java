package com.spring.lifecare.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JmyController {
	
	
	@RequestMapping("/guest/pbor")
	public String pbor() {
		
		
		
		return "/guest/pbor";
	}
}

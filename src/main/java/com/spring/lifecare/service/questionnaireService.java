package com.spring.lifecare.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;


public interface questionnaireService {
	
	//문진표 저장
	public void munjinsave(HttpServletRequest req,Model model);
	
}

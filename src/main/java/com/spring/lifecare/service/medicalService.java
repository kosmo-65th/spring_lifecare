package com.spring.lifecare.service;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

public interface medicalService {
	
	//회원-진료 목록
	public void medicalList(HttpServletRequest req, Model model);
	
	//회원-진료내용 상세 페이지
	public void medicalcontentForm(HttpServletRequest req, Model model);
	
}

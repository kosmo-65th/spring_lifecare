package com.spring.lifecare.service;


import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;


public interface MyPageService {
	
	//비밀번호 입력
	public int putPassword(HttpServletRequest req, Model model);

	//내 정보 수정
	public int modifyPro(HttpServletRequest req, Model model);

	//마이 페이지 비밀번호 변경
	public int modifyPassword(HttpServletRequest req, Model model);
	 
	
	
	 
	 
	 
	 
	 
	 
	 
	 
	 
}

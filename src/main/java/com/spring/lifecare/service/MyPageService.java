package com.spring.lifecare.service;


import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.spring.lifecare.vo.CustomerVO;


public interface MyPageService {
	
	//비밀번호 입력
	public int putPassword(HttpServletRequest req, Model model);

	//내 정보 가져오기
	public CustomerVO myInfo(String customer_id);
	
	//내 정보 수정하기
	public int updateMember(HttpServletRequest req, Model model);
	
	//마이 페이지 비밀번호 변경
	public int modifyPassword(HttpServletRequest req, Model model);
	 
	//회원 휴먼처리 과정
    public int removeMember(HttpServletRequest req, Model model);
	 
	
	 
	 
	 
	 
	 
	 
	 
	 
	 
}

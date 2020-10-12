package com.spring.lifecare.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.lifecare.vo.CustomerVO;
import com.spring.lifecare.vo.DoctorVO;

public interface AdminService {
	
	//회원목록 가져오기
	public void memberList(HttpServletRequest req, Model model);
	
	//의사목록 가져오기
	public void doctorList(HttpServletRequest req, Model model);
	
	//관리자 회원 상세 목록
	public CustomerVO memberInfo(String customer_id);
	
	//의사 상세 목록
	public DoctorVO doctorInform(String doctor_id);
	
	//회원 휴먼 처리
	public int removeMem(HttpServletRequest req, Model model);
	
	//의사 퇴사 처리
	public int doctorQuit(HttpServletRequest req, Model model);
	
	//결산 
	public void summary(HttpServletRequest request, Model model);
	
}

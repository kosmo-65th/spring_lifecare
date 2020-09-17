package com.spring.lifecare.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public interface DoctorService  {
	
	  //의사 아이디 중복확인
	  public int doctorId(String doctor_id);
			
	  //의사 전화번호 중복확인
	  public int doctorPhone(String doctor_phone);
	 				
	  //의사 이메일 중복확인
	  public int doctorEmail(String doctor_email);
	  
	  //의사 면허 중복 확인
	  public int doctorNum(String doctor_num);
	  
	  //의사 회원가입 처리
	  public void doctorJoin(MultipartHttpServletRequest req, Model model);

	  //의사 리스트
	  public void doctorList(HttpServletRequest req, Model model);
	  
	  //환자검색리스트
	  public void customerList(HttpServletRequest req, Model model);
	  
	  //회원정보 불러오기
	  public void loadCustomerInfo(HttpServletRequest req, Model model);
}

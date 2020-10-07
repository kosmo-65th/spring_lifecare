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
	  
	  //의사정보 불러오기
	  public void loadDoctorInfo(HttpServletRequest req, Model model);
	  
	  //의사예약정보 리스트 불러오기
	  public void appointList(HttpServletRequest req, Model model);
	  
	  //예약가능시간 설정
	  public void appointSet(HttpServletRequest req, Model model);
	  
	  //스케쥴에 뿌려주는 url
	  public void reservationList(HttpServletRequest req, Model model);
	  
	  // 질병리스트 뿌리기
	  public void diseaseList(HttpServletRequest req, Model model);
	  
	  // 질병리스트 뿌리기
	  public void drugList(HttpServletRequest req, Model model);
	  
	  // 진료기록 저장
	  public void saveDiagonosis(HttpServletRequest req, Model model);
	  
	  // 기초검사결과 기록 저장
	  public void saveBasicEx(HttpServletRequest req, Model model);
	  
	  // 최근 진료내역 리스트
	  public void diagnosisList(HttpServletRequest req, Model model);
	  
	  // 기초검사결과 리스트 뿌리기
	  public void basicExList(HttpServletRequest req, Model model);
	  
	  //기초검사결과 불러오기
	  public void loadBasicExInfo(HttpServletRequest req, Model model);
	  
	  // 암검사결과 리스트 뿌리기
	  public void cancerList(HttpServletRequest req, Model model);
	  
	  // 암검사결과 불러오기
	  public void loadCancerExInfo(HttpServletRequest req, Model model);
	  
	  // x-ray 검사결과 리스트 뿌리기
	  public void xrayList(HttpServletRequest req, Model model);
	  
	  // x-ray 검사결과 불러오기
	  public void loadXrayExInfo(HttpServletRequest req, Model model);
}

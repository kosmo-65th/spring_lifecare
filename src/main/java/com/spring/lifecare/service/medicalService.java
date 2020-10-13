package com.spring.lifecare.service;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

public interface medicalService {
	
	//회원-진료 목록
	public void medicalList(HttpServletRequest req, Model model);
	
	//회원-진료내용 상세 페이지
	public void medicalcontentForm(HttpServletRequest req, Model model);
	
	//회원-처방내용 상세 페이지
	public void prescriptioncontentForm(HttpServletRequest req, Model model);
	
	//회원-결제된 진료내역 print
	public void medicalprint(HttpServletRequest req, Model model);
	
	//회원-결제된 처방내용 print
	public void prescriptionprint(HttpServletRequest req, Model model);
	
	//회원-결제된 진단내용 print
	public void diagnosisprint(HttpServletRequest req, Model model);
	
}

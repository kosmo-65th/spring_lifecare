package com.spring.lifecare.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.spring.lifecare.vo.KakaoPayApprovalVO;

public interface KakaoPayService {
	
	// 카카오 결재 실행
	public String kakaoPayReady(HttpServletRequest req, Model model);
	
	// 카카오 결재 모바일
	public String kakaoPayReady2(HttpServletRequest req, Model model);
	
	// 카카오 결재 성공시 출력
	public KakaoPayApprovalVO kakaoPayInfo(String pg_token);
}

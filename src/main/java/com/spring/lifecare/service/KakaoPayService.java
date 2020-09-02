package com.spring.lifecare.service;

import com.spring.lifecare.vo.KakaoPayApprovalVO;

public interface KakaoPayService {
	
	// 카카오 결재 실행
	public String kakaoPayReady();
	
	// 카카오 결재 성공시 출력
	public KakaoPayApprovalVO kakaoPayInfo(String pg_token);
}

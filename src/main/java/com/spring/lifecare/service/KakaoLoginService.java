package com.spring.lifecare.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface KakaoLoginService {
	//카카오에서 token 받아오기
	public String getAccessToken (String authorize_code);
	
	//카카오에서 userInfo 가져오기
    public HashMap<String, Object> getUserInfo (String access_Token);
    
    //카카오 토큰 id가 데이터베이스에 있는지 확인
    public Map<String, String> checkKakaoId(HashMap<String, Object> userInfo);
    
    //userInfo에 권한 주기
    public void kakaoAutehntication(HttpServletRequest request, HttpServletResponse response, HashMap<String, String> user);
}

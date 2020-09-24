package com.spring.lifecare.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface LoginService {
	public Map<String, String> androidLogin(HttpServletRequest req);
	
	public Map<String, String> kakaoSignIn(HttpServletRequest req);
	
	public Map<String, String> naversignIn(HttpServletRequest req);
}

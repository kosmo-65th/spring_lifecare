package com.spring.lifecare.service;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface NaverLoginService {
	public HashMap<String, Object> callback(HttpServletRequest request) throws UnsupportedEncodingException;
	
	public Map<String, String> checkNaverId(HashMap<String, Object> userInfo);
	
	public void naverAutehntication(HttpServletRequest request, HttpServletResponse response, Map<String, String> user);
}

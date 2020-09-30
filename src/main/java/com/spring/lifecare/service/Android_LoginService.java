package com.spring.lifecare.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.spring.lifecare.vo.CustomerVO;

public interface Android_LoginService {
	
	//지문 저장	
	public int jimunSave(HttpServletRequest req,Model model);
	
	//지문로그인	
	public Map<String,Object> jimunLogin(HttpServletRequest req);
}

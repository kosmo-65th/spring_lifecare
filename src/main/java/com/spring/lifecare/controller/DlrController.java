package com.spring.lifecare.controller;

import java.security.Provider.Service;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.lifecare.service.Android_LoginService;
import com.spring.lifecare.service.questionnaireService;
import com.spring.lifecare.vo.CustomerVO;

@Controller
public class DlrController {
	
	//문진표 서비스	
	@Autowired
	questionnaireService questionnaireservice;
	//안드로이드 로그인 서비스
	@Autowired
	Android_LoginService android_LoginService;
	
	
	//로그인 페이지
	@RequestMapping("/login")
	public String login(Model model) {
		
		return "guest/login";
	}
	
	//문진표시작
	@RequestMapping("/questionnaire")
	public String questionnaire(HttpServletRequest req,Model model) {
		
		return "customer/Questionnaire/questionnaire";
	}
	
	//문진표 문항
	@RequestMapping("/index1")
	public String index1(HttpServletRequest req,Model model) {
		
		return "customer/Questionnaire/index1";
	}
	
	//코로나 정보
	@RequestMapping("/covid19")
	public String covid19(HttpServletRequest req,Model model) {
		
		return "guest/covid19";
	}
	
	///////////////////////////////안드로이드 //////////////////////////////////
	
	//지문 등록
	@ResponseBody
	@RequestMapping("/android/jimunSave")
	public Map<String,Object> jimunSave(HttpServletRequest req,Model model) {
		int UpdateCnt = android_LoginService.jimunSave(req, model);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("jimunUpdateCnt", UpdateCnt);
		
		return map;
	}
	
	//지문 로그인
	@ResponseBody
	@RequestMapping("/android/jimunLogin")
	public Map<String,Object> jimunLogin(HttpServletRequest req) {
		return android_LoginService.jimunLogin(req);
	}
	
}

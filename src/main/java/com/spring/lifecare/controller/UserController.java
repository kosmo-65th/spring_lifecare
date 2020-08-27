package com.spring.lifecare.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	// HomeController.java는 주석처리
	@RequestMapping("/")
	public String main(Model model) {
		
		return "guest/main";
	}
	
	@RequestMapping("/login")
	public String login(Model model) {
		
		return "guest/login";
	}
	
	//회원가입 방법
	@RequestMapping("/guest/preJoinIn")
	public String preJoinIn (Model model) {
		return "guest/preJoinIn";		
	}
	
	//회원가입
	@RequestMapping("/guest/JoinInForm")
	public String joinInForm(Model model) {
		return "guest/JoinInForm";		
	}
	//아이디 찾기
	@RequestMapping("/guest/findId")
	public String findId(Model model) {
		return "guest/findId";		
	}
	//비밀번호 찾기
	@RequestMapping("/guest/findPassword")
	public String findPassword(Model model) {
		return "guest/findPassword";		
	}
	//회원탈퇴
	@RequestMapping("/customer/remove")
	public String remove(Model model) {
		return "customer/remove";		
	}
	//회원수정전 비밀번호 입력
	@RequestMapping("/customer/preModify")
	public String preModify(Model model) {
		return "customer/preModify";		
	}
	//회원수정 폼
	@RequestMapping("/customer/modify")
	public String modify(Model model) {
		return "customer/modify";		
	}
	//의사 회원가입 폼
	@RequestMapping("/guest/doctorJoin")
	public String doctorJoin(Model model) {
		return "guest/doctorJoin";		
	}
}
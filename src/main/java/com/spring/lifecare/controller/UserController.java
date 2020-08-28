package com.spring.lifecare.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	// HomeController.java는 주석처리
	@RequestMapping(value= {"/","/guest/main","/main"})
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
	
	@RequestMapping("/popup")
	public String popup(Model model) {
		
		return "common/popup";
	}
	
	// 회원 로그인 이후 이용가능(테스트라 맵핑 설정 안함)
	@RequestMapping("/payment")
	public String payment(Model model) {
		
		return "customer/payment";
	}
	
	@RequestMapping("/kakaopay")
	public String kakaopay(Model model) {
		
		return "customer/kakaopay";
	}
	
	@RequestMapping("/diagnosis")
	public String diagnosis(Model model) {
		
		return "customer/diagnosis";
	}
	
	@RequestMapping("/medicalNote")
	public String medicalNote(Model model) {
		
		return "customer/medicalNote";
	}
	
	@RequestMapping("/prescription")
	public String prescription(Model model) {
		
		return "customer/prescription";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req,Model model,HttpSession session) {
		session.invalidate();
		SecurityContextHolder.clearContext();
		
		return "guest/main";
	}
	
	@RequestMapping("/Mypage")
	public String Mypage(Model model) {
		
		return "customer/Mypage";
	}
}
package com.spring.lifecare.service;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.spring.lifecare.vo.UserVO;

// 로그인이 성공한 경우 자동으로 실행
public class UserLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		if(authentication.getPrincipal() instanceof UserVO) {
			UserVO vo = (UserVO) authentication.getPrincipal();
			
			request.getSession().setAttribute("userSession", vo.getUserid());
			System.out.println("UserVO ==> " + vo);
		}else if(authentication.getPrincipal() instanceof String) {
			request.getSession().setAttribute("userSession", (String)authentication.getPrincipal());
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/");
		
		//권한에 따른 이동 위치
		Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		String auth_text = authorities.toString();
		
		System.out.println("success Handler 출력 : " +auth_text);
		if(auth_text.equals("[ROLE_DOCTOR]")) {
			dispatcher = request.getRequestDispatcher("/doctor/doctor_main");
		}else if(auth_text.equals("[ROLE_ADMIN]")) {
			dispatcher = request.getRequestDispatcher("/admin/summary");
		}
		
		dispatcher.forward(request, response);
		
	}
}

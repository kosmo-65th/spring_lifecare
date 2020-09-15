package com.spring.lifecare.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
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
		dispatcher.forward(request, response);
		
	}
}

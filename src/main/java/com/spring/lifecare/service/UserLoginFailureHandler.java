package com.spring.lifecare.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

//로그인이 실패한 경우 자동으로 실행
public class UserLoginFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String errormsg ="";
		
		System.out.println(exception.getMessage());
		 if(exception instanceof BadCredentialsException) {
	            errormsg = "아이디나 비밀번호가 일치하지 않습니다";
        } else if(exception instanceof LockedException) {
            errormsg = "이메일인증을 하지 않았습니다.";
        } else if(exception instanceof DisabledException) {
            errormsg = "탈퇴한 아이디입니다";
        } else if(exception instanceof InternalAuthenticationServiceException) {
            errormsg = "회원가입하지 않은 아이디 입니다.";
        } 
        	
		request.setAttribute("fail", "1");
		request.setAttribute("errMsg", errormsg);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/guest/login.jsp");
		dispatcher.forward(request, response);
	}
}

/*
 BadCredentialException  비밀번호가 일치하지 않을 때 던지는 예외
 InternalAuthenticationServiceException  존재하지 않는 아이디일 때 던지는 예외
 AuthenticationCredentialNotFoundException  인증 요구가 거부됐을 때 던지는 예외
 LockedException  인증 거부 - 잠긴 계정
 DisabledException  인증 거부 - 계정 비활성화
 AccountExpiredException 인증 거부 - 계정 유효기간 만료
 CredentialExpiredException 인증 거부 - 비밀번호 유효기간 만료
*/

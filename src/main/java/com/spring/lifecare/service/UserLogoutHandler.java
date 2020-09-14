package com.spring.lifecare.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

public class UserLogoutHandler  implements LogoutSuccessHandler{

	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		
		System.out.println("logoutHandler 타기");
		 if (authentication != null && authentication.getDetails() != null) {
	            try {
	                 request.getSession().invalidate();
	                 SecurityContextHolder.clearContext();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        } 
	        response.setStatus(HttpServletResponse.SC_OK);
	        response.sendRedirect("/lifecare/");
	}

}

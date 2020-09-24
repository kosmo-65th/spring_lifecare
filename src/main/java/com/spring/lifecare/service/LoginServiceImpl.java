package com.spring.lifecare.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.lifecare.persistence.UserDAO;

@Service
public class LoginServiceImpl implements LoginService{
	@Autowired
	UserDAO userDAO;

	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Override
	public Map<String, String> androidLogin(HttpServletRequest req) {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		Boolean loginCheck = false;
		
		Map<String, Object> userInfo = userDAO.selectUser(id);
		
		System.out.println(userInfo);
		if(userInfo != null) {
			if(passwordEncoder.matches(pwd, (String)userInfo.get("PASSWORD"))) {
				loginCheck = true;
			}
		}
		
		Map<String, String> out = new HashMap<String, String>();
		if(loginCheck == true) {
			out.put("id", id);
			out.put("enabled", String.valueOf(userInfo.get("ENABLED")));
			out.put("customer_echeck", String.valueOf(userInfo.get("CUSTOMER_ECHECK")));
		}else {
			out.put("id", null);
			out.put("enabled", null);
			out.put("customer_echeck", null);
		}
		
		System.out.println(out);
		return out;
	}

	
	@Override
	public Map<String, String> kakaoSignIn(HttpServletRequest req) {
		Map<String, String> userInfo = userDAO.kakaoFindId(req.getParameter("kakaoId"));
		
		Map<String, String> out = new HashMap<String, String>();
		if(userInfo != null) {
			out.put("id", String.valueOf(userInfo.get("USERNAME")));
			out.put("enabled", String.valueOf(userInfo.get("ENABLED")));
			out.put("customer_echeck", String.valueOf(userInfo.get("CUSTOMER_ECHECK")));
		}else {
			out.put("id", null);
			out.put("enabled", null);
			out.put("customer_echeck", null);
		}
		
		return out;
	}
}

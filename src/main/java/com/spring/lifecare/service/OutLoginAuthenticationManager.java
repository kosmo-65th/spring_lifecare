package com.spring.lifecare.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

public class OutLoginAuthenticationManager implements AuthenticationManager {
	static final List AUTHORITIES = new ArrayList();
	
	static {
	  AUTHORITIES.add(new SimpleGrantedAuthority("ROLE_CUSTOMER"));
	}
	
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		  System.out.println("usernamepasswordAuthenticationToken 주기");
	    return new UsernamePasswordAuthenticationToken(auth.getName(), null, AUTHORITIES);
	}
}  

package com.spring.lifecare.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface FooterService {
	
	//treatment 게시글 뿌리기
	public void treatment(HttpServletRequest req, Model model, String code);
	
	//medicine 게시글 뿌리기
	public void medecine();
	
	//drugs 게시글 뿌리기
	public void drugs();
	
	//proof_cost 게시글 뿌리기
	public void proof_cost();
	
	
	
}

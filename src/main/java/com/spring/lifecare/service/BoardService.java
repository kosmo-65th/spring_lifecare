package com.spring.lifecare.service;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

public interface BoardService {
	//회원-글 목록
	public void boardList(HttpServletRequest req, Model model);
	
	//회원-게시글 상세 페이지
	public void contentForm(HttpServletRequest req, Model model);
	
	//회원-게시글 수정 상세 페이지
	public void modifyView(HttpServletRequest req, Model model);
	
	//회원-게시글 수정 처리
	public void modifyPro(HttpServletRequest req, Model model);
	
	//회원-글쓰기 페이지
	public void writeForm(HttpServletRequest req, Model model);
	
	//회원-글쓰기 처리
	public void writePro(HttpServletRequest req, Model model);
	
	//회원-게시글 삭제 처리
	public void deletePro(HttpServletRequest req, Model model);
	
	//회원-답변글 상세 페이지
	//public void replyserch(HttpServletRequest req, Model model);
	
	//admin-총 게시글 페이지
	//public void adminboardList(HttpServletRequest req, Model model);
	
	//admin-총 게시글 상세 페이지
	public void adminboardcontent(HttpServletRequest req, Model model);
	
	//admin-게시글 답변 페이지
	public void adminboardreply(HttpServletRequest req, Model model);
	
	//admin-게시글 답변 삭제
	public void adminboardreplydelete(HttpServletRequest req, Model model);
	
}

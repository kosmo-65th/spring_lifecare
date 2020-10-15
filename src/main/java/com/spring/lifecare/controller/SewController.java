package com.spring.lifecare.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.lifecare.service.BoardService;
import com.spring.lifecare.service.medicalService;

@Controller

public class SewController {
		
	@Autowired
	BoardService board;
	
	@Autowired
	medicalService medical;
	
	//회원-게시글 리스트
	@RequestMapping("/board/customerboardList")
	public String boardList(HttpServletRequest req, Model model) {
		board.boardList(req, model);
		return "board/customerboardList";
	}
	
	//회원-게시글 상세 페이지1
	@RequestMapping("/board/customercontentForm")
	public String contentForm(HttpServletRequest req, Model model) {
		board.contentForm(req, model);
		return "board/customercontentForm";
	}
	
	//회원-게시글 수정 : 비밀번호 인증 페이지
	@RequestMapping("/board/customermodifyForm")
	public String modifyForm(HttpServletRequest req, Model model) {
		int board_sortnum = Integer.parseInt(req.getParameter("board_sortnum"));
		//6.request | session에 처리 결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("board_sortnum", board_sortnum);
		return "board/customermodifyForm";
	}
	
	//회원-게시글 수정 페이지
	@RequestMapping("/board/customermodifyView")
	public String modifyView(HttpServletRequest req, Model model) {
		board.modifyView(req, model);
		return "board/customermodifyView";
	}
	
	//회원-게시글 수정 처리 페이지
	@RequestMapping("/board/customermodifyPro")
	public String modifyPro(HttpServletRequest req, Model model) {
		board.modifyPro(req, model);
		return "board/customermodifyPro";
	}
	
	//회원-글쓰기 페이지
	@RequestMapping("/board/customerwriteForm")
	public String writeForm(HttpServletRequest req, Model model) 	 {
		board.writeForm(req, model);
		return "board/customerwriteForm";
	}
	
	//회원-글쓰기 처리 페이지
	@RequestMapping("/board/customerwritePro")
	public String writePro(HttpServletRequest req, Model model) {
		board.writePro(req, model);
		return "board/customerwritePro";
	}
	
	//회원-글 삭제 : 비밀번호 인증 페이지
	@RequestMapping("/board/customerdeleteForm")
	public String deleteForm(HttpServletRequest req, Model model) {
		int board_sortnum = Integer.parseInt(req.getParameter("board_sortnum"));
		model.addAttribute("board_sortnum", board_sortnum);
		return "board/customerdeleteForm";
	}
	
	//회원-게시글 삭제 처리 페이지
	@RequestMapping("/board/customerdeletePro")
	public String deletePro(HttpServletRequest req, Model model) {
		board.deletePro(req, model);
		return "board/customerdeletePro";
	}
	
	//admin-총게시글 목록
	//@RequestMapping("/board/adminboardList")
	//public String adminboardForm(HttpServletRequest req, Model model) {
		//board.adminboardList(req, model);
		//return "/board/adminboardList";
	//}
	
	//admin-총게시글 조회
	@RequestMapping("/board/adminboardcontent")
	public String adminboardcontent(HttpServletRequest req, Model model) {
		board.adminboardcontent(req, model);
		return "/board/adminboardcontent";
	}	
	
	//admin-게시글 답변
	@RequestMapping("/board/adminboardreply")
	public String adminboardreply(HttpServletRequest req, Model model) {
		board.adminboardreply(req, model);
		return "/board/adminboardUpdate";
	}
	
	//admin-게시글 답변 삭제
	@RequestMapping("/board/adminboardreplydelete")
	public String adminboardreplydelete(HttpServletRequest req, Model model) {
		board.adminboardreplydelete(req, model);
		return "/board/adminboardUpdate";
	}
	
	//mypage-진료기록 리스트 조회
	@RequestMapping("/Medicalrecords/medicalList")
	public String MypageMedicalList(HttpServletRequest req, Model model) {
		medical.medicalList(req, model);
		return "Medicalrecords/medicalList";
	}	
	
	//mypage-진료기록부 상세 페이지
	@RequestMapping("/Medicalrecords/medicalNote")
	public String MypageMedicalcontent(HttpServletRequest req, Model model) {
		medical.medicalcontentForm(req, model);
		return "Medicalrecords/medicalNote";
	}
	
	//mypage-처방전 리스트 조회
	@RequestMapping("/Medicalrecords/prescriptionList")
	public String Mypageprescription(HttpServletRequest req, Model model) {
		medical.medicalList(req, model);
		return "Medicalrecords/prescriptionList";
	}
	
	//mypage-처방전 상세 페이지
	@RequestMapping("/Medicalrecords/prescriptionNote")
	public String Mypageprescriptioncontent(HttpServletRequest req, Model model) {
		medical.prescriptioncontentForm(req, model);
		return "Medicalrecords/prescriptionNote";
	}	
	
	//mypage-진료기록부 print
	@RequestMapping("/Medicalrecords/medicalPrint")
	public String Mypagemedicalprint(HttpServletRequest req, Model model) {
		medical.medicalprint(req, model);
		return "Medicalrecords/medicalPrint";
	}
	
	//mypage-처방전 print
	@RequestMapping("/Medicalrecords/prescriptionprint")
	public String Mypageprescriptionprint(HttpServletRequest req, Model model) {
		medical.prescriptionprint(req, model);
		return "Medicalrecords/prescriptionprint";
	}
	
	//mypage-진단서 print
	@RequestMapping("/Medicalrecords/diagnosisprint")
	public String Mypagediagnosisprint(HttpServletRequest req, Model model) {
		medical.diagnosisprint(req, model);
		return "Medicalrecords/diagnosisprint";
	}
}

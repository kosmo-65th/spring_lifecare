package com.spring.lifecare.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.lifecare.persistence.UserDAO;
import com.spring.lifecare.vo.CustomerVO;
import com.spring.lifecare.vo.DoctorVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	UserDAO userDAO;
	
	

    //관리자 회원목록
	@Override
	public void memberList(HttpServletRequest req, Model model) {
		
		List<CustomerVO> list = userDAO.listMembers();
		model.addAttribute("list", list);
		
	}

	@Override
	public void doctorList(HttpServletRequest req, Model model) {

		List<DoctorVO> doctor = userDAO.listDoctors();
		model.addAttribute("doctor", doctor);
		
		
	}
    //관리자 회원정보 상세보기
	@Override
	public CustomerVO memberInfo(String customer_id) {
		return userDAO.memberInformation(customer_id);
	}

	//의사 정보 상세보기
	@Override
	public DoctorVO doctorInform(String doctor_id) {	
		return userDAO.docInformation(doctor_id);
	}

	@Override
	public int removeMem(HttpServletRequest req, Model model) {
		int updateCnt = userDAO.deleteList(req.getParameter("customer_id"));
		System.out.println(req.getParameter("customer_id"));
		
		model.addAttribute("updateCnt", updateCnt);
		return 0;
	}

	@Override
	public int doctorQuit(HttpServletRequest req, Model model) {
		int updateCnt = userDAO.deleteDoctor(req.getParameter("doctor_id"));
		System.out.println(req.getParameter("doctor_id"));
		
		model.addAttribute("updateCnt", updateCnt);
		return 0;
	}

	

}

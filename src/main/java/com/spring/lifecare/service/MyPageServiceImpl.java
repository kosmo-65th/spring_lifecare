package com.spring.lifecare.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.lifecare.persistence.UserDAO;
import com.spring.lifecare.vo.CustomerVO;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	UserDAO userDAO;
	
	@Autowired
	PasswordEncoder passwordCheck;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	

	@Override
	public int putPassword(HttpServletRequest req, Model model) {
		
		int selectCnt = 0;
		String customer_id = (String)req.getSession().getAttribute("userSession");
		String customer_pw = req.getParameter("customer_pw");		
		
       // 5-1단계. id, 패스워드가 일치하는지 확인 
		String old_customer_pw = userDAO.idPwdCheck(customer_id);
		
		Boolean pwdCheck = passwordCheck.matches(customer_pw, old_customer_pw);
		
		System.out.println("원래 비밀번호 : "+old_customer_pw);
		System.out.println("입력 비밀번호 : "+customer_pw);
		System.out.println("비밀번호 확인 : "+pwdCheck);

		if(pwdCheck == true) selectCnt =1;
		return selectCnt;
	}	
	
	@Override
	public int modifyPassword(HttpServletRequest req, Model model) {

		CustomerVO vo = new CustomerVO();

		vo.setCustomer_id((String) req.getSession().getAttribute("userSession"));
		vo.setCustomer_pw(passwordEncoder.encode(req.getParameter("customer_pw")));

		// 5단계. 비밀번호 변경 처리
		int updateCnt = userDAO.changePassword(vo);

		model.addAttribute("updateCnt", updateCnt);
		return 0;
	}



	@Override
	public CustomerVO myInfo(String customer_id) {
		CustomerVO customer = userDAO.myInformation(customer_id);
		return customer;
	}



	@Override
	public int removeMember(HttpServletRequest req, Model model) {
		CustomerVO vo = new CustomerVO();

		vo.setCustomer_id((String) req.getSession().getAttribute("userSession"));
		vo.setCustomer_pw(passwordEncoder.encode(req.getParameter("customer_pw")));
		
		//회원 변경 처리
		int updateCnt = userDAO.memberHuman(vo);
		model.addAttribute("updateCnt", updateCnt);
		return 0;
	}


	@Override
	public int updateMember(HttpServletRequest req, Model model) {
		
		CustomerVO vo = new CustomerVO();

		vo.setCustomer_id((String) req.getSession().getAttribute("userSession"));
		vo.setCustomer_phone((String) req.getParameter("customer_phone"));
		vo.setCustomer_email((String) req.getParameter("customer_email"));
		
		int updateCnt = userDAO.updateMyInformation(vo);

		model.addAttribute("updateCnt", updateCnt);
		return 0;
	
		
	}


}

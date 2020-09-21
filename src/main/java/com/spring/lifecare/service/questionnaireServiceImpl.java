package com.spring.lifecare.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.lifecare.persistence.questionnaireDAO;
import com.spring.lifecare.vo.questionnaireVO;

@Service
public class questionnaireServiceImpl implements questionnaireService{

	questionnaireDAO questionnairedao;
	//문진표 저장	
	@Override
	public void munjinsave(HttpServletRequest req, Model model) {
		
		questionnaireVO vo = new questionnaireVO();
		vo.setCheck_fbp_diagnosis(Integer.parseInt(req.getParameter("check_pstroke_diagnosis")));
		
		
		questionnairedao.munjinsave(vo);
	}
}

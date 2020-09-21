package com.spring.lifecare.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.lifecare.vo.DrugVO;



public interface DrugService {

	public void searchDrug(HttpServletRequest req, Model model);
	
	public void searchEnptNext(HttpServletRequest req, Model model);

	public void drugDetail(HttpServletRequest req, Model model);
}
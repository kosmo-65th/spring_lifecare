package com.spring.lifecare.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.lifecare.service.DoctorService;
import com.spring.lifecare.service.DrugService;

@Controller
public class MarController {

	
	@Autowired DrugService service;
	@Autowired DoctorService Dservice;
	
	
	@RequestMapping("/drugSearch")
	public String drugSearch(HttpServletRequest req, Model model){
		return "drug/drugSearch";
	}
	
	@RequestMapping("/drugSearchPro")
	public String drugSearchPro(HttpServletRequest req, Model model){
		service.searchDrug(req, model);
		return "drug/drugSearch";
	}
	
	//약 이름 keyup
	@RequestMapping("/drug_name_next")
	public String drug_name_next(HttpServletRequest req, Model model){
		Dservice.drugList(req, model);
		return "drug/drug_name_next";
	}
	//약 회사 keyup
	@RequestMapping("/drug_enptname_next")
	public String drug_enptname_next(HttpServletRequest req, Model model){
		service.searchEnptNext(req, model);
		return "drug/drug_enptname_next";
	}
	
	@RequestMapping("/drugDetail")
	public String drugDetail(HttpServletRequest req, Model model) {
		service.drugDetail(req, model);
		return "drug/drugDetail";
	}
	

	
}
	
	

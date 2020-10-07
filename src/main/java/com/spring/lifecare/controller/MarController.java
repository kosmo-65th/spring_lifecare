package com.spring.lifecare.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.lifecare.service.AdminService;
import com.spring.lifecare.service.DoctorService;
import com.spring.lifecare.service.DrugService;

@Controller
public class MarController {
	
	@Autowired 
	DrugService service;
	@Autowired 
	DoctorService Dservice;
	@Autowired 
	AdminService aservice;
	
	//약 검색
	@RequestMapping("/drugSearch")
	public String drugSearch(HttpServletRequest req, Model model){
		return "drug/drugSearch";
	}
	//약 검색 결과출력
	@RequestMapping("/drugSearchPro")
	public String drugSearchPro(HttpServletRequest req, Model model){
		service.searchDrug(req, model);
		return "drug/drugSearch";
	}

	//약 검색 세부
	@RequestMapping("/drugDetail")
	public String drugDetail(HttpServletRequest req, Model model) {
		service.drugDetail(req, model);
		return "drug/drugDetail";
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
	
	// 관리자 결산페이지
 	@RequestMapping("/admin/summary")
 	public String summary(HttpServletRequest req, Model model) {
 		aservice.summary(req, model);
 		return "host/Summary";
 	}
	// -------------------------- 안드로이드  --------------------------
	
	//WebView 용 페이지 
	//안드로이드 약 검색
	@RequestMapping("/android_drugSearch")
	public String android_drugSearch(HttpServletRequest req, Model model){
		return "drug/android_drugSearch";
		
	}
	//안드로이드 약 검색 결과출력
	@RequestMapping("/android_drugSearchPro")
	public String android_drugSearchPro(HttpServletRequest req, Model model){
		service.searchDrug(req, model);
		return "drug/android_drugSearchPro";
	}

	//사진으로 약 조회
	@ResponseBody
	@RequestMapping("/android/drugPhotoSeaerch")
	public ArrayList<Map<String, Object>> drugPhotoSeaerch(HttpServletRequest req){
		
		ArrayList<Map<String,Object>> result = service.drugPhotoSeaerch(req);
		return result;
	}
	
	//사진으로 약 조회 상세
	@ResponseBody
	@RequestMapping("/android/drugPhotoDetail")
	public ArrayList<Map<String, Object>> drugPhotoDetail(HttpServletRequest req){
		
		ArrayList<Map<String,Object>> result = service.drugPhotoDetail(req);
		return result;
	}
		

	
}
	
	

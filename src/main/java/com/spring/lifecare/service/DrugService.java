package com.spring.lifecare.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;




public interface DrugService {

	public void searchDrug(HttpServletRequest req, Model model);
	
	public void searchEnptNext(HttpServletRequest req, Model model);
	
	public void drugDetail(HttpServletRequest req, Model model);
	
	
	// -------------------------- 안드로이드  --------------------------
	public ArrayList<Map<String, Object>> drugPhotoSeaerch(HttpServletRequest req);
	
	public ArrayList<Map<String, Object>> drugPhotoDetail(HttpServletRequest req);
	
	
}
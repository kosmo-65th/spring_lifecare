package com.spring.lifecare.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.lifecare.service.DrugServiceImpl;
import com.spring.lifecare.vo.DrugVO;

@Controller
public class MarController {

	/*
	 * @Autowired DrugService service;
	 * 
	 * @RequestMapping(value="/drugSearch", method=RequestMethod.POST)
	 * 
	 * @ResponseBody public String simpleWithObject(DrugVO vo) { return
	 * vo.getItem_name(); }
	 */
	
	@RequestMapping("/drugSearch")
	public String drugSearch(Model model) {
		
		return "drug/drugSearch";
	}
	
	@RequestMapping("/drugResult")
	public String drugResult(Model model) {
		
		return "drug/drugResult";
	}
	
	@RequestMapping("/drugPrint")
	public String drugPrint(Model model) {
		
		return "drug/drugPrint";
	}
	
	@RequestMapping("/NewFile")
	public String NewFile(Model model) {
		
		return "drug/NewFile";
	}
	
	   
//    @RequestMapping(value="/apiTest", method=RequestMethod.GET)
//    @ResponseBody
//    public Object getData(@RequestBody DrugVO vo) throws IOException {
//        String item_name = vo.getItem_name();
//        String entp_name = vo.getEntp_name();
//        Object response =  service.searchDrug();
//        return response;
//    }
   
	/*
	 * @RequestMapping("/apiTest") public String NewFile(Model model) {
	 * 
	 * return "drug/drugSearch"; }
	 */
	
}
	
	

package com.spring.lifecare.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.lifecare.service.DrugService;
import com.spring.lifecare.vo.DrugVO;

@Controller
public class MarController {

	
	@Autowired DrugService service;
	 
//	 @RequestMapping(value="/drugSearch", method=RequestMethod.POST)
//	 @ResponseBody 
//	 public DrugVO drugSearch(@RequestParam("entp_name") String entp_name, Model model) {
//		 return service.searchDrug(entp_name);
//	 }
	
	
	@RequestMapping("/drugSearch")
	public String drugSearch(HttpServletRequest req, Model model){
		return "drug/drugSearch";
	}
	
	@RequestMapping("/drugSearchPro")
	public String drugSearchPro(HttpServletRequest req, Model model){
		service.searchDrug(req, model);
		return "drug/drugSearch";
	}
	
	@RequestMapping("/drugDetail")
	public String drugDetail(HttpServletRequest req, Model model) {
		service.drugDetail(req, model);
		return "drug/drugDetail";
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
	
	

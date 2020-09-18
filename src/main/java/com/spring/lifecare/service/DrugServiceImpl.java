package com.spring.lifecare.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.lifecare.persistence.UserDAO;
import com.spring.lifecare.vo.DrugVO;

@Service
public class DrugServiceImpl implements DrugService {

	@Autowired
	UserDAO userDAO;
	
	@Override
	public void searchDrug(HttpServletRequest req, Model model) {
		//페이징
		int pageSize = 20; 	  //maxList 
		int pageBlock = 5; 	 //totalblock 
		
		int cnt = 0; 		  //total
		int start = 0;	 	  
		int end = 0; 		  
		int number = 0;		   
		String pageNum = ""; 
		int currentPage = 0;  
	
		int pageCount = 0;	 
		int startPage = 0;	 
		int endPage = 0;	
		///검색어
		
		
		String drug_name =  req.getParameter("drug_name");	//제품명
		model.addAttribute("drug_name", drug_name);
		//System.out.println("drug_name : " + drug_name);
		
		String drug_enptname =  req.getParameter("drug_enptname");	//회사명
		model.addAttribute("drug_enptname", drug_enptname);
		//System.out.println("drug_enptname : " + drug_enptname);
		
		String shapList =  req.getParameter("drug_shape");	//모양
		model.addAttribute("shapList", shapList);
		String [] shapArr = shapList.split(",");
		if(shapArr[0] == "") {
			shapArr = new String[0];
		}
		//System.out.println("shapArr : " + shapArr);
		
		String colorList =  req.getParameter("drug_color");	//색상
		model.addAttribute("colorList", colorList);
		String [] colorArr = colorList.split(",");
		if(colorArr[0] == "") {
			colorArr = new String[0];
		}
		//System.out.println("colorArr : " + colorArr);
		
			
		String formList =  req.getParameter("drug_formulation");	//제형
		model.addAttribute("formList", formList);
		StringBuffer formArr = new StringBuffer("");
		for(String form : formList.split(",")) {
			if(formArr.length()>1) {
				formArr.append("|");
			}
			formArr.append(form);
		}
		String form = formArr.toString();
		//System.out.println("form : " + form);
		Map<String,Object>  map = new HashMap<String, Object>();
		map.put("drug_enptname", drug_enptname);
		map.put("drug_name", drug_name);
		map.put("drug_shape", shapArr);
		map.put("drug_color", colorArr);
		map.put("drug_form", form);
	
		//검색 수 
		cnt = userDAO.searchDrugCount(map);
		
		System.out.println("cnt : " + cnt);
		
		pageNum = req.getParameter("currentPage");
		if(pageNum==null) {
			pageNum="1";	
		}
		currentPage = Integer.parseInt(pageNum); 
		
		pageCount =(cnt/pageSize) + (cnt%pageSize>0 ? 1 : 0 );
		//totalBlock
		start = (currentPage-1)* pageSize + 1;
		
		end = start + pageSize -1;
		
		number = cnt -(currentPage -1 ) * pageSize;
		
		
//		if(cnt>0) {
			Map<String,Object>  map1 = new HashMap<String, Object>();
			map1.put("drug_enptname", drug_enptname);
			map1.put("drug_name", drug_name);
			map1.put("drug_shape", shapArr);
			map1.put("drug_color", colorArr);
			map1.put("drug_form", form);
			map1.put("start", start);
			System.out.println("start : " + start );
			map1.put("end", end);
			System.out.println("end : " + end );
		
			//검색
			List<DrugVO> dtos = userDAO.searchDrug(map1);
			
//			for(DrugVO dto : dtos) {
//				System.out.println("DrugShape : " + dto.getDrug_shape());
//			}
			model.addAttribute("dtos",dtos);
//		}
			
		startPage = (currentPage/pageBlock) * pageBlock + 1; 
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		endPage = startPage + pageBlock -1;
		if(endPage> pageCount) endPage = pageCount;
			
		model.addAttribute("cnt", cnt); 
		model.addAttribute("number", number);		 		
		System.out.println(" number : " + number);
		model.addAttribute("pageNum", pageNum); 
		System.out.println(" pageNum : " + pageNum);
		if(cnt >0) {
			model.addAttribute("startPage", startPage);  
			model.addAttribute("endPage", endPage); 		 
			model.addAttribute("pageBlock", pageBlock); 	 
			model.addAttribute("pageCount", pageCount);  
			model.addAttribute("currentPage", currentPage); 
			System.out.println(" currentPage : " + currentPage);
		}
		
	}
 //상세
	@Override
	public void drugDetail(HttpServletRequest req, Model mod) {
		int drug_number =Integer.parseInt( req.getParameter("drug_number"));
		int pageNum =Integer.parseInt(req.getParameter("pageNum"));
		int number =Integer.parseInt(req.getParameter("number"));
		
		Map<String,Object>  map = new HashMap<String, Object>();
		map.put("drug_number", drug_number);
		
		
		List<DrugVO> dtos = userDAO.drugDetail(map);
		
	}
}
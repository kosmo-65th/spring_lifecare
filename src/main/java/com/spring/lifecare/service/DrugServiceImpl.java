package com.spring.lifecare.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
			
			model.addAttribute("dtos",dtos);
			
		startPage = (currentPage/pageBlock) * pageBlock + 1; 
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		endPage = startPage + pageBlock -1;
		if(endPage> pageCount) endPage = pageCount;
			
		model.addAttribute("cnt", cnt); 
		model.addAttribute("number", number);		 		
		model.addAttribute("pageNum", pageNum); 
		if(cnt >0) {
			model.addAttribute("startPage", startPage);  
			model.addAttribute("endPage", endPage); 		 
			model.addAttribute("pageBlock", pageBlock); 	 
			model.addAttribute("pageCount", pageCount);  
			model.addAttribute("currentPage", currentPage); 
		}
		
	}
	
	//약 회사 keyup
	@Override
	public void searchEnptNext(HttpServletRequest req, Model model) {
		String entp = req.getParameter("entp");
		List<DrugVO> list = new ArrayList<DrugVO>();
		list = userDAO.searchEnptNext(entp);
		
		model.addAttribute("list",list);
		
	}
	
	//상세
	@Override
	public void drugDetail(HttpServletRequest req, Model model) {
		int drug_number =Integer.parseInt( req.getParameter("drug_number"));
		DrugVO vo = userDAO.drugDetail(drug_number);
		model.addAttribute("detail", vo); 
	}

	
	// -------------------------- 안드로이드  --------------------------
	//사진으로 약 조회
	@Override
	public ArrayList<Map<String, Object>> drugPhotoSeaerch(HttpServletRequest req) {
		String message =  req.getParameter("result");	
		System.out.println(message);
		
		String [] mArr = message.split("\n");
		if(mArr[0] == "") {
			mArr = new String[0];
		}
		
		System.out.println("mArr : " + mArr[0] +" , " + mArr[1]);
		
		Map<String,Object> shaps = new HashMap<String, Object>();
		shaps.put("mArr", mArr);
		
		ArrayList<Map<String, Object>> out = new ArrayList<Map<String, Object>>();
		
		ArrayList<DrugVO> result =  userDAO.drugPhotoSeaerch(shaps);
	
		for(DrugVO vo : result) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("d_num", Integer.toString(vo.getDrug_number()));
			map.put("d_name", vo.getDrug_name());
			map.put("d_emtp", vo.getDrug_enptname());
			map.put("d_img", vo.getDrug_productimage());
			map.put("d_f_shape", vo.getDrug_frontShape());
			
			out.add(map);
		}
		
		System.out.println("out : " + out);
		
		return out;
		
	}
	//사진으로 약 조회 상세
	@Override
	public ArrayList<Map<String, Object>> drugPhotoDetail(HttpServletRequest req) {
		String drug_num =  req.getParameter("drug_num");	
		System.out.println(drug_num);
		
		
		ArrayList<Map<String, Object>> out = new ArrayList<Map<String, Object>>();
		
		ArrayList<DrugVO> result =  userDAO.drugPhotoDetail(drug_num);
		
		for(DrugVO vo : result) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("drug_image", vo.getDrug_productimage());
			map.put("drug_name", vo.getDrug_name());
			map.put("drug_emtp", vo.getDrug_enptname());
			map.put("drug_division", vo.getDrug_division());
			map.put("drug_lisenceDate", vo.getDrug_license_date());
			map.put("drug_category", vo.getDrug_category());
			map.put("drug_formulation", vo.getDrug_formulation());
			map.put("drug_color", vo.getDrug_color());
			map.put("drug_num", drug_num);
			map.put("drug_storage", vo.getDrug_storage());
			map.put("drug_additives", vo.getDrug_additives());
			map.put("drug_effect", vo.getDrug_effect());
			map.put("drug_precautions", vo.getDrug_precautions());
			
			out.add(map);
		}
		
		System.out.println("out : " + out);
		
		return out;
		
	}
		
}
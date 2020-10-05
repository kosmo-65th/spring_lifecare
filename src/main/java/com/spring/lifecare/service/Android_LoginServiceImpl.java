package com.spring.lifecare.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.lifecare.persistence.Android_loginDao;
import com.spring.lifecare.vo.CustomerVO;

@Service
public class Android_LoginServiceImpl implements Android_LoginService{

	@Autowired
	Android_loginDao android_LoginDao;

	//지문로그인
	@Override
	public Map<String,Object> jimunLogin(HttpServletRequest req) {
		String Customer_fingerprint = req.getParameter("Customer_fingerprint");
		System.out.println("Customer_fingerprint" + Customer_fingerprint);
		Map<String,Object> map = android_LoginDao.jimunLogin(Customer_fingerprint);
		System.out.println("map : " + map);
		return map;
	} 
	
	//지문 저장	
	@Override
	public int jimunSave(HttpServletRequest req, Model model) {
		
		//고유번호		
		String Customer_fingerprint = req.getParameter("Customer_fingerprint");
		System.out.println("Customer_fingerprint" + Customer_fingerprint);
		
		//로그인 유저 아이디
		String customer_id = req.getParameter("Customer_id");
		System.out.println("customer_id" + customer_id);
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("Customer_fingerprint" , Customer_fingerprint);
		map.put("customer_id", customer_id);
		
		int UpdateCnt = android_LoginDao.jimunSave(map);
		
		return UpdateCnt;
	}
}

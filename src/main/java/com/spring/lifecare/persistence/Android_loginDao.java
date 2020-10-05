package com.spring.lifecare.persistence;

import java.util.Map;

import com.spring.lifecare.vo.CustomerVO;

public interface Android_loginDao {
	
	//지문로그인
	public Map<String,Object> jimunLogin(String Customer_fingerprint);
	
	//지문저장	
	public int jimunSave(Map<String,Object> map);
	
}

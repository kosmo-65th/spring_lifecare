package com.spring.lifecare.persistence;

import java.util.Map;

import com.spring.lifecare.vo.CustomerVO;

public interface UserDAO {	
	
	public CustomerVO logincheck(String id);
	
//	public Map<String,Object> selectUser(String userid);
}

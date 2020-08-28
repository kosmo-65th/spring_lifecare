package com.spring.lifecare.persistence;

import com.spring.lifecare.vo.UserVO;

public interface UserDAO {	
	
	//아이디 중복확인
	public String idChk(String customer_id);
	
	// 회원가입 처리
	public int insertMember(UserVO vo);

	
	
	

	
}

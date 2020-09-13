package com.spring.lifecare.persistence;

import com.spring.lifecare.vo.CustomerVO;

public interface UserDAO {	
	 //아이디 중복확인
    public int idCheck(String customer_id);
		
	 //휴대폰 번호 중복 확인
	 public int phoneCheck(String customer_phone);
		
	 //이메일 주소 중복확인
	 public int emailCheck(String customer_email);
	 
	 //회원가입 이메일 인증
	 public void sendmail(String customer_email, String key);
	 
	 //이메일 인증 후 로그인 처리
	 public int approvalMember(String customer_email);
		
	 // 회원가입 처리
	 public int insertMember(CustomerVO vo);
	 
	 // 아이디 찾기
	 public String findId(String customer_phone); 
	 
	 //회원이 직접 정보 수정
	 public int modify(CustomerVO vo);
}

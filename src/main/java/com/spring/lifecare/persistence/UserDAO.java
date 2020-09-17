package com.spring.lifecare.persistence;

import java.util.Map;

import com.spring.lifecare.vo.CustomerVO;
import com.spring.lifecare.vo.DoctorVO;

public interface UserDAO {	
	//카카오 회원찾기
	public Map<String, String> kakaoFindId(String kakaoId);
	
	//네이버 회원찾기
	public Map<String, String> naverFindId(String naverId);
	
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
	 
	 //의사 아이디 중복확인
     public int CheckId(String doctor_id);
		
	 //의사 휴대폰 번호 중복 확인
	 public int CheckPhone(String doctor_phone);
		
	 //의사 이메일 주소 중복확인
	 public int CheckEmail(String doctor_email);
	 
	 //의사 면허 번호 중복확인
	 public int CheckNum(String doctor_num);
	 
	 //의사 회원가입 처리
	 public int insertDoctor(DoctorVO vo);
	 
	 //정보수정을 위한 패스워드 체크
	 public String idPwdCheck(String customer_id);
	 
	 //내 정보 가져오기
     public CustomerVO myInformation(String customer_id);
		 	
	 //내 정보 수정하기
	 public int updateMyInformation(CustomerVO vo);
	 
	 //비밀번호 변경
	 public int changePassword(CustomerVO vo);
	 
	 
	 
	
}

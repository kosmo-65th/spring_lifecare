package com.spring.lifecare.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.lifecare.vo.AppointmentVO;
import com.spring.lifecare.vo.BasicExVO;
import com.spring.lifecare.vo.CancerVO;
import com.spring.lifecare.vo.CustomerVO;
import com.spring.lifecare.vo.DiagnosisVO;
import com.spring.lifecare.vo.DiseaseVO;
import com.spring.lifecare.vo.DoctorVO;
import com.spring.lifecare.vo.DrugVO;
import com.spring.lifecare.vo.ReservationVO;
import com.spring.lifecare.vo.XrayExVO;

public interface UserDAO {
	//로그인
	public Map<String, Object> selectUser(String userId);
	
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
	 
	 //회원 휴먼처리
	 public int memberHuman(CustomerVO vo);
	 
	 //회원 이름 불러오기
	 public String loadCustomerName(String customer_id);
	 
	 //의사리스트 불러오기
	 public ArrayList<DoctorVO> getDoctorList();
	 
	 //시간리스트 불러오기
	 public ArrayList<AppointmentVO> getTimeList();
	 
	 //appoint테이블 예약불가로 update
	 public int updateAppoint(int appoint_num);
	 
	 //reservation테이블에 데이터 추가
	 public int addReservation(Map<String, Object> map);
	 
	 //환자검색리스트
	 public List<CustomerVO> searchList(String keyword);
	 
	 //회원정보 불러오기
	 public CustomerVO getCustomerInfo(String customer_id);
	 
	 //비밀번호 찾기
	 public int idEmailChk(Map<String, String> map);
	 
	 //임시 비밀번호 이메일 부여하기
	 public void sendMail(String movieId, String cusEmail, String key);

	 //약찾기
	 public List<DrugVO>searchDrug(Map<String, Object> map);

	 //회사 keyup
	 public List<DrugVO>searchEnptNext(String entp);

	 //약찾기 수량
	 public int searchDrugCount(Map<String, Object> map);
	 
	 //약상세
	 public DrugVO drugDetail(int drug_number);
	 
	 //안드로이드 약 사진 조회 
	 public ArrayList<DrugVO> drugPhotoSeaerch(Map<String, Object> map);
	 
	 //안드로이드 약 사진 조회 상세
	 public ArrayList<DrugVO> drugPhotoDetail(String drug_num);
	 
	 //회원정보 불러오기2
	 public CustomerVO getCustomerInfo2(String customer_id);
	 
	 //의사정보 불러오기
	 public DoctorVO getDoctorInfo(String doctor_id);
	 
	 //예약시간(의사) 불러오기
	 public ArrayList<AppointmentVO> getAppointList();
	 
	 //예약시간 설정 insert
	 public int addAppointment(Map<String, Object> map);
	 
	 //reservation리스트 불러오기
	 public ArrayList<ReservationVO> getReservation(String doctor_id);
	 
	 //질병리스트 불러오기
	 public List<DiseaseVO> getDiseaseList(String disease);
	 
	 //약 리스트 불러오기
	 public List<DrugVO> getDrugList(String drug);
	 
	 //진료기록 작성
	 public int insertDiagnosis(DiagnosisVO vo);
	 
	 //최근진료기록 리스트
	 public List<DiagnosisVO> getDiagnosisList(String doctor_id);
	 
	 
	 //예약확정된 리스트 불러오기
	 public ArrayList<ReservationVO> getReservationList(String customer_id);
	 
	 //예약정보 뿌려주기
	 public List<ReservationVO> getReservationInfo(int appoint_num);
	 
	 //예약취소하기 (reservation 테이블에서 데이터 삭제)
	 public int delectReservation(int appoint_num);
	 
	 //예약취소하기 (appoint 테이블 데이터 업데이트)
	 public int updateAppointment(int appoint_num);
	 
	 //결제내역 갯수 구하기
	 public int getDiagnosisCnt(String customer_id);
	 
	 //결제내역 리스트 
	 public List<DiagnosisVO> DiagnosisList(Map<String, Object> map);
	 
	 //예약정보 뿌려주기
	 public List<DiagnosisVO> getDiagnosisInfo(int diagnosis_num);
	 
	 //결제성공 update
	 public int successPay(int diagnosis_num);
	 
	 //관리자 페이지 회원목록 
	 public List<CustomerVO> listMembers(); 
	 
	 //관리자 페이지 의사목록
	 public List<DoctorVO> listDoctors();
	 
	 //관리자 페이지 회원 상세보기
     public CustomerVO memberInformation(String customer_id);
     
     //관리자 페이지 의사 상세보기
     public DoctorVO docInformation(String doctor_id);
     
     //회원 강퇴 처리
	 public int deleteList(String customer_id);
	 
	 //의사 퇴사 처리
	 public int deleteDoctor(String doctor_id);
	 
	 //진료리스트
	 public ArrayList<DiagnosisVO> pickDiagnosisList(String customer_id);
	 
	 // 미결제리스트
	 public ArrayList<DiagnosisVO> nonpayList(String customer_id);
	 
	 // 기초검사결과 작성
	 public int insertBasicEx(BasicExVO vo);	 
	 
	 // 암검사결과 작성
	 public int insertCancerEx(CancerVO vo);
	 
	 // xray검사결과 작성
	 public int insertXrayEx(XrayExVO vo);
	 
	 // 기초검사결과리스트 
	 public List<BasicExVO> basicExList();
	 
	 // 기초검사결과 정보 불러오기
	 public BasicExVO getBasicExInfo(int ex_num);
	 
	 // 암검사결과리스트 
	 public List<CancerVO> cancerList();
	 
	 // 암검사결과 정보 불러오기
	 public CancerVO getCancerExInfo(int cancer_num);
	 
	 // xray검사결과리스트 
	 public List<XrayExVO> xrayList();
	 
	 // xray검사결과 정보 불러오기
	 public XrayExVO getXrayExInfo(int xray_num);
	 
	 // 기초검사 결과 수정
	 public int updateBasicEx(Map<String, Object> map);
	 
	 // xray검사 결과 수정
	 public int updateXrayEx(Map<String, Object> map);
	 
	 // 암검사 결과 수정
	 public int updateCancerEx(Map<String, Object> map);
}

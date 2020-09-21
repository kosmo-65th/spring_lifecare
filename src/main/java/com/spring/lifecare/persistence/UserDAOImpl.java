package com.spring.lifecare.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import com.spring.lifecare.vo.AppointmentVO;
import com.spring.lifecare.vo.CustomerVO;
import com.spring.lifecare.vo.DoctorVO;
import com.spring.lifecare.vo.DrugVO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private SqlSession sqlSession;
	
	//로그인
	public Map<String, Object> selectUser(String userId){
		return sqlSession.selectOne("com.spring.lifecare.persistence.UserDAO.selectUser", userId);
	}
	
	//카카오 아이디 있는지 체크
	@Override
	public Map<String, String> kakaoFindId(String kakaoId) {
		return sqlSession.selectOne("com.spring.lifecare.persistence.UserDAO.kakaoFindId", kakaoId);
	}
	
	//네이버 아이디 있는지 체크
	@Override
	public Map<String, String> naverFindId(String naverId) {
		return sqlSession.selectOne("com.spring.lifecare.persistence.UserDAO.naverFindId", naverId);
	}
	
    //아이디 중복확인
	@Override
	public int idCheck(String customer_id) {
		return sqlSession.selectOne("com.spring.lifecare.persistence.UserDAO.idCheck", customer_id);
	}
    //전화번호 중복확인
	@Override
	public int phoneCheck(String customer_phone) {
		return sqlSession.selectOne("com.spring.lifecare.persistence.UserDAO.phoneCheck", customer_phone);
	}
    //이메일 중복확인
	@Override
	public int emailCheck(String customer_email) {
		return sqlSession.selectOne("com.spring.lifecare.persistence.UserDAO.emailCheck", customer_email);
	}
	
	//회원가입 이메일 발송확인
	public void sendmail(String customer_email, String key) {
	   try {		
			  MimeMessage message = mailSender.createMimeMessage();
			  String txt = "환영합니다!! LifeCare 회원가입 인증 메일입니다. 링크를 눌러 회원가입을 완료하세요" 
			+ "<a href=http://localhost/lifecare/emailcheck?customer_email=" +customer_email+ ">Please click to the member verification</a>";
			  message.setSubject("LifeCare 회원가입 인증 메일입니다");
			  message.setText(txt, "UTF-8", "html");
			  message.setFrom(new InternetAddress("admin@mss.com"));
			  message.addRecipient(RecipientType. TO, new InternetAddress(customer_email));
			  mailSender.send(message);					
			}catch(Exception e) {
				e.printStackTrace();
			}		
		}
	
    //회원가입 처리 확인
	@Override
	public int insertMember(CustomerVO vo) {
		return sqlSession.insert("com.spring.lifecare.persistence.UserDAO.insertMember", vo);
	}
	
	//아이디 찾기
	@Override
	public String findId(String customer_phone) {
		return sqlSession.selectOne("com.spring.lifecare.persistence.UserDAO.findId", customer_phone);	
	}
	
	@Override
	public int approvalMember(String customer_email) {
		return sqlSession.update("com.spring.lifecare.persistence.UserDAO.approvalMember", customer_email);  
		
	}
	
	@Override
	public int CheckId(String doctor_id) {
		return sqlSession.selectOne("com.spring.lifecare.persistence.UserDAO.CheckId", doctor_id);
	}
	@Override
	public int CheckPhone(String doctor_phone) {
		return sqlSession.selectOne("com.spring.lifecare.persistence.UserDAO.CheckPhone", doctor_phone);
	}
	@Override
	public int CheckEmail(String doctor_email) {
		return sqlSession.selectOne("com.spring.lifecare.persistence.UserDAO.CheckEmail", doctor_email);
	}
	
	@Override
	public int CheckNum(String doctor_num) {
		return sqlSession.selectOne("com.spring.lifecare.persistence.UserDAO.CheckNum", doctor_num);
		
	}
	//의사 회원가입 처리
	@Override
	public int insertDoctor(DoctorVO vo) {		
		UserDAO dao = sqlSession.getMapper(UserDAO.class);	    	    
	    return dao.insertDoctor(vo);
	}

	
	@Override
	public String idPwdCheck(String customer_id) {
		String checkIdPwd = sqlSession.selectOne("com.spring.lifecare.persistence.UserDAO.idPwdCheck", customer_id);
		return checkIdPwd;	
	}
	
	
	//내 정보 가져오기
	@Override
	public CustomerVO myInformation(String customer_id) {
		CustomerVO vo = new CustomerVO();
		vo = sqlSession.selectOne("com.spring.lifecare.persistence.UserDAO.myInformation", customer_id);
		return vo;
		
	}

	//내 정보 수정하기
	@Override
	public int updateMyInformation(CustomerVO vo) {
		 int updateCnt = sqlSession.update("spring.mvc.member_mybatis.persistence.MemberDAO.updateMyInformation", vo);
		 
		 return updateCnt;
		
	}

	//마이페이지 비밀번호 변경
	@Override
	public int changePassword(CustomerVO vo) {
		int updateCnt = sqlSession.update("com.spring.lifecare.persistence.UserDAO.changePassword", vo);

		return updateCnt;
		
	}
	@Override
	public String loadCustomerName(String customer_id) {
		return sqlSession.selectOne("com.spring.lifecare.persistence.UserDAO.loadCustomerName", customer_id);
	}

	@Override
	public ArrayList<DoctorVO> getDoctorList() {
		UserDAO dao = sqlSession.getMapper(UserDAO.class);
		return dao.getDoctorList();
	}

	@Override
	public ArrayList<AppointmentVO> getTimeList() {
		UserDAO dao = sqlSession.getMapper(UserDAO.class);
		return dao.getTimeList();
	}

	@Override
	public int updateAppoint(int appoint_num) {
		UserDAO dao = sqlSession.getMapper(UserDAO.class);
		return dao.updateAppoint(appoint_num);
	}

	@Override
	public int addReservation(Map<String, Object> map) {
		UserDAO dao = sqlSession.getMapper(UserDAO.class);
		return dao.addReservation(map);
	}

	@Override
	public List<CustomerVO> searchList(String keyword) {
		UserDAO dao = sqlSession.getMapper(UserDAO.class);
		return dao.searchList(keyword);
	}

	
	@Override
	public CustomerVO getCustomerInfo(String customer_id) {
		UserDAO dao = sqlSession.getMapper(UserDAO.class);
		return dao.getCustomerInfo(customer_id);
	}


	//약찾기(회사)
	@Override
	public List<DrugVO> searchDrug(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.lifecare.persistence.UserDAO.searchDrug", map);
	}

	//약찾기 수량
	@Override
	public int searchDrugCount(Map<String,Object> map) {
		return sqlSession.selectOne("com.spring.lifecare.persistence.UserDAO.searchDrugCount",map);
	}
	
	//약상세
	public DrugVO drugDetail(int drug_number) {
		return sqlSession.selectOne("com.spring.lifecare.persistence.UserDAO.drugDetail",drug_number);
	}
	
	//약 이름 keyup
	@Override
	public List<DrugVO> searchNameNext(String name) {
		UserDAO dao = sqlSession.getMapper(UserDAO.class);
		return dao.searchNameNext(name);
	}
	
	 //약 회사 keyup
	@Override
	public List<DrugVO> searchEnptNext(String entp) {
		UserDAO dao = sqlSession.getMapper(UserDAO.class);
		return dao.searchEnptNext(entp);
	}
	
}


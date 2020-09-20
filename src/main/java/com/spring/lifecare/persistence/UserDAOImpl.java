package com.spring.lifecare.persistence;

import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import com.spring.lifecare.vo.CustomerVO;
import com.spring.lifecare.vo.questionnaireVO;


@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public Map<String, String> kakaoFindId(String kakaoId) {
		return sqlSession.selectOne("com.spring.lifecare.persistence.UserDAO.kakaoFindId", kakaoId);
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
			+ "<a href=http://localhost/lifecare/guest/login?key=" +key+ "'>Please click to the member verification</a>";
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
	//회원이 직접 수정
	@Override
	public int modify(CustomerVO vo) {
		
		int updateCnt = 0;
		UserDAO dao = sqlSession.getMapper(UserDAO.class);
	    updateCnt = dao.modify(vo);
		
		return updateCnt;
	}

}


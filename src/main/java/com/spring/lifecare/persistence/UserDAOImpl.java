package com.spring.lifecare.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.spring.lifecare.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSession sqlSession;

	//아이디 중복확인
	@Override
	public String idChk(String customer_id) {
		return sqlSession.selectOne("spring_lifecare.persistence.UserDAO.idCheck", customer_id);
		
	}

	//회원가입 하기
	@Override
	public int insertMember(UserVO vo) {
		return sqlSession.insert("spring_lifecare.persistence.UserDAO.insertMember", vo);
	
	}
	
}	



package com.spring.lifecare.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.lifecare.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSession sqlSession;

	//아이디 중복확인 체크
	@Override
	public int idChk(String customer_id) {
	    int selectCnt = 0;
	    selectCnt = sqlSession.selectOne("");
		return selectCnt;
	}
    //회원가입 처리
	@Override
	public int join(UserVO vo) {
		int insertCnt = 0;
		insertCnt = sqlSession.insert("");
		return insertCnt;
	}	

}

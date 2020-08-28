package com.spring.lifecare.persistence;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.spring.lifecare.vo.CustomerVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public CustomerVO logincheck(String id) {
		return sqlSession.selectOne("com.spring.lifecare.persistence.UserDAO.logincheck",id);
	}	
	
//	@Override
//	public Map<String,Object> selectUser(String userid) {
//		return sqlSession.selectOne("com.spring.lifecare.persistence.UserDAO.selectUser",userid);
//	}	
}
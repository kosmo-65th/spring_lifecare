package com.spring.lifecare.persistence;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.lifecare.vo.CustomerVO;

@Repository
public class Android_loginDaoImpl implements Android_loginDao{

	@Autowired
	SqlSession sqlsession;

	//지문로그인
	@Override
	public Map<String,Object> jimunLogin(String Customer_fingerprint) {
		return sqlsession.selectOne("com.spring.lifecare.persistence.Android_loginDao.jimunLogin",Customer_fingerprint);
	}
	
	//지문저장	
	@Override
	public int jimunSave(Map<String,Object> map) {
		//지문 고유번호 저장 		
		return sqlsession.update("com.spring.lifecare.persistence.Android_loginDao.jimunSave",map);	
	}
}

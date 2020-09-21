package com.spring.lifecare.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.lifecare.vo.questionnaireVO;

@Repository
public class questionnaireDAOImpl implements questionnaireDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//문진표 저장
	@Override
	public int munjinsave(questionnaireVO vo) {
		return sqlSession.insert("com.spring.lifecare.persistence.questionnaireDAO.munjinsave", vo);
	}
}

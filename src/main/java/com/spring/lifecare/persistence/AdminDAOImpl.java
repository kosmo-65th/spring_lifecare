package com.spring.lifecare.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Autowired
	private SqlSession sqlSession;
	
	//월별 수익
	public int monthlyProfit() {
		return sqlSession.selectOne("com.spring.lifecare.persistence.AdminDAO.monthlyProfit");
	}
	
	//연별 수익
	public int yearlyProfit() {
		return sqlSession.selectOne("com.spring.lifecare.persistence.AdminDAO.yearlyProfit");
	}

	//월별 진료수
	public int monthlyTreatment(){
		return sqlSession.selectOne("com.spring.lifecare.persistence.AdminDAO.monthlyTreatment");
	}
	//년별 진료수 
	public int yearlyTreatment(){
		return sqlSession.selectOne("com.spring.lifecare.persistence.AdminDAO.yearlyTreatment");
	}
	
	//월별 수익 차트 
	public int monthlyProfitChart(String month){
		return sqlSession.selectOne("com.spring.lifecare.persistence.AdminDAO.monthlyProfitChart",month);
	}
	
	//월별 진료수 차트 
	public int monthlyTreatmentChart(String month){
		return sqlSession.selectOne("com.spring.lifecare.persistence.AdminDAO.monthlyTreatmentChart",month);
	}
	
	//과별 진료수 (월별)
	
	public ArrayList<String> doctorMajor(){
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.doctorMajor();
	}

	public int monthlyMajorCntChart(Map<String,String> map){	
		System.out.println("map 테스트 : " + map);
		return sqlSession.selectOne("com.spring.lifecare.persistence.AdminDAO.monthlyMajorCntChart", map);
	}
}

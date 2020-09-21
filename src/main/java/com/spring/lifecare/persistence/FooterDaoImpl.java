package com.spring.lifecare.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.lifecare.vo.FooterBoard_drug;
import com.spring.lifecare.vo.FooterBoard_medecine;
import com.spring.lifecare.vo.FooterBoard_proofCost;
import com.spring.lifecare.vo.FooterBoard_treatment;

@Repository
public class FooterDaoImpl implements FooterDao {

	@Autowired
	SqlSession sqlsession;
	
	//treatment게시글 매소드//////////////////////////////////////////////////
	//treatment글수
	@Override
	public String totalTreatMent(String word) {
		
		FooterDao dao = sqlsession.getMapper(FooterDao.class);
		
		return dao.totalTreatMent(word);
	}
	//treatment 게시물
	@Override
	public ArrayList<FooterBoard_treatment> treatMent(Map<String, Object>map) {
		
		FooterDao dao = sqlsession.getMapper(FooterDao.class);
		
		return dao.treatMent(map);
	}
	////////////////////////////////////////////////////////////////////////
	
	
	
	
	//medecine개시글 매소드///////////////////////////////
	////medecine 총갯수/////////////
	@Override
	public String totalMedecine(String word) {
		
		FooterDao dao =sqlsession.getMapper(FooterDao.class);
		
		return dao.totalMedecine(word);
	}
	///medecine 게시글////////////////////////
	@Override
	public ArrayList<FooterBoard_medecine> medecine(Map<String, Object> map) {
		
		FooterDao dao =sqlsession.getMapper(FooterDao.class);
		
		return dao.medecine(map);
	}
	//////////////////////////////////////////////////////

	
	//drugs 게시글 메소드들//////////////////////////////////////
	//drugs 게시글 총갯수///////////////////////
	@Override
	public String totaldrugs(String word) {
		
		FooterDao dao=sqlsession.getMapper(FooterDao.class);
		
		return dao.totaldrugs(word);
	}
	//drug 게시물
	@Override
	public ArrayList<FooterBoard_drug> drug(Map<String, Object> map) {
		
		FooterDao dao=sqlsession.getMapper(FooterDao.class);
		
		return dao.drug(map);
	}
	
	
	//////////////////////////////////////////////////////
	
	//proof_cost총갯수
	@Override
	public String totalproof_cost(String word) {
		
		FooterDao dao=sqlsession.getMapper(FooterDao.class);
		
		return dao.totalproof_cost(word);
	}
	
	//proof_cost게시물
	@Override
	public ArrayList<FooterBoard_proofCost> proof_cost(Map<String, Object> map) {
		
		FooterDao dao=sqlsession.getMapper(FooterDao.class);
		return dao.proof_cost(map);
	}
	
	
	
	
	

}

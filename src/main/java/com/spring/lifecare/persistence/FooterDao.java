package com.spring.lifecare.persistence;

import java.util.ArrayList;
import java.util.Map;

import com.spring.lifecare.vo.FooterBoard_drug;
import com.spring.lifecare.vo.FooterBoard_medecine;
import com.spring.lifecare.vo.FooterBoard_proofCost;
import com.spring.lifecare.vo.FooterBoard_treatment;

public interface FooterDao {
	
	//토탈 treatment 갯수
	public String totalTreatMent(String word);
	//treatment 개시물
	public ArrayList<FooterBoard_treatment> treatMent(Map< String, Object> map);
	
	
	
	//토탈 medecine 갯수
	public String totalMedecine(String word);
	//medecine 개시글
	public ArrayList<FooterBoard_medecine> medecine(Map< String, Object> map);
	
	
	
	//토탈 drugs 갯수
	public String totaldrugs(String word);
	//drugs 개시글
	public ArrayList<FooterBoard_drug> drug(Map< String, Object> map);
	
	
	//토탈 proof_cost
	public String totalproof_cost(String word);
	//proof_cost
	public ArrayList<FooterBoard_proofCost> proof_cost(Map< String, Object> map);
	

}

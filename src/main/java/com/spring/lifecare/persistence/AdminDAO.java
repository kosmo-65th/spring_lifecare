package com.spring.lifecare.persistence;

import java.util.ArrayList;
import java.util.Map;


public interface AdminDAO {

	//월별 수익
	public int monthlyProfit();
	
	//연별 수익
	public int yearlyProfit();
	
	//월별 진료수
	public int monthlyTreatment();
	
	//년별 진료수 
	public int yearlyTreatment();
	
	//월별 수익 차트 
	public int monthlyProfitChart(String month);
	
	//월별 진료수 차트
	public int monthlyTreatmentChart(String month);
	
	//과별 진료수 (월별)
	public ArrayList<String> doctorMajor();
	
	public int monthlyMajorCntChart(Map<String,String> map);
	
}

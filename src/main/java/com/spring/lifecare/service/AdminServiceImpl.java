package com.spring.lifecare.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.lifecare.persistence.AdminDAO;
import com.spring.lifecare.persistence.UserDAO;
import com.spring.lifecare.vo.CustomerVO;
import com.spring.lifecare.vo.DoctorVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	UserDAO userDAO;
	@Autowired
	AdminDAO adminDAO;
	
    //관리자 회원목록
	@Override
	public void memberList(HttpServletRequest req, Model model) {
		
		List<CustomerVO> list = userDAO.listMembers();
		model.addAttribute("list", list);
		
	}

	@Override
	public void doctorList(HttpServletRequest req, Model model) {

		List<DoctorVO> doctor = userDAO.listDoctors();
		model.addAttribute("doctor", doctor);
		
		
	}
    //관리자 회원정보 상세보기
	@Override
	public CustomerVO memberInfo(String customer_id) {
		return userDAO.memberInformation(customer_id);
	}

	//의사 정보 상세보기
	@Override
	public DoctorVO doctorInform(String doctor_id) {	
		return userDAO.docInformation(doctor_id);
	}

	@Override
	public int removeMem(HttpServletRequest req, Model model) {
		int updateCnt = userDAO.deleteList(req.getParameter("customer_id"));
		System.out.println(req.getParameter("customer_id"));
		
		model.addAttribute("updateCnt", updateCnt);
		return 0;
	}

	@Override
	public int doctorQuit(HttpServletRequest req, Model model) {
		int updateCnt = userDAO.deleteDoctor(req.getParameter("doctor_id"));
		System.out.println(req.getParameter("doctor_id"));
		
		model.addAttribute("updateCnt", updateCnt);
		return 0;
	}
	
	//결산 
	public void summary(HttpServletRequest request, Model model) {
		
		//월별 수익
		int monthlyProfit = adminDAO.monthlyProfit();
		//연별 수익
		int yearlyProfit = adminDAO.yearlyProfit();
		//월별 진료수
		int monthlyTreatment = adminDAO.monthlyTreatment();
		//년별 진료수 
		int yearlyTreatment = adminDAO.yearlyTreatment();
	
		model.addAttribute("monthlyProfit",monthlyProfit);
		model.addAttribute("yearlyProfit",yearlyProfit);
		model.addAttribute("monthlyTreatment",monthlyTreatment);
		model.addAttribute("yearlyTreatment",yearlyTreatment);
	
		
		SimpleDateFormat ym = new SimpleDateFormat("YY/MM");
		
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, -12);//12개월
		
		ArrayList<String> monthly = new ArrayList<String>();
		for(int i=0; i<12; i++) {
			cal.add(Calendar.MONTH, 1);
			monthly.add(ym.format(cal.getTime()));
		}
		
		//월별 수익 차트 
		ArrayList<Integer> monthlyProfitChart = new ArrayList<Integer>();
		//월별 진료 차트 
		ArrayList<Integer> monthlyTreatmentChart = new ArrayList<Integer>();
		
		for(String month : monthly) {
			//월별 수익 차트 
			monthlyProfitChart.add(adminDAO.monthlyProfitChart(month)) ;
			//월별 진료 차트 
			monthlyTreatmentChart.add(adminDAO.monthlyTreatmentChart(month)) ;
		}
		//월별 수익 차트 
		JSONArray jsonArray = new JSONArray();
		JSONArray colNameArray = new JSONArray(); // 컬 타이틀 설정
		colNameArray.add("month");
		colNameArray.add("매출액");
		jsonArray.add(colNameArray);
		
		//월별 진료 차트
		JSONArray jsonArray1 = new JSONArray();
		JSONArray colNameArray1 = new JSONArray(); // 컬 타이틀 설정
		colNameArray1.add("month");
		colNameArray1.add("진료수");
		jsonArray1.add(colNameArray1);
		
		
		for(int i=0; i<monthly.size(); i++) {
			//월별 수익 차트 
			JSONArray rowArray = new JSONArray();
			rowArray.add(monthly.get(i));
			rowArray.add(monthlyProfitChart.get(i));	
			jsonArray.add(rowArray);
			
			//월별 진료 차트
			JSONArray rowArray1 = new JSONArray();
			rowArray1.add(monthly.get(i));
			rowArray1.add(monthlyTreatmentChart.get(i));	
			jsonArray1.add(rowArray1);
			System.out.println("jsonArray1 : " + jsonArray1);
		
		}
		
		//과별 진료수 (월별)
		
		ArrayList<String> doctor_major = adminDAO.doctorMajor();

		ArrayList<Integer> monthlyMajorCntChart = new ArrayList<Integer>();
		SimpleDateFormat yy = new SimpleDateFormat("YYYY/MM");
		  
		String yyy = yy.format(cal.getTime());
		
		Map<String, String> map = new HashMap<String, String>();
		
		System.out.println("yyy : " + yyy);
		
		for(String major : doctor_major) {
			System.out.print("체크");
			map.put("major", major);
			map.put("yyy", yyy);
			System.out.println("map :" + map);
			monthlyMajorCntChart.add(adminDAO.monthlyMajorCntChart(map));
		}
		
		JSONArray jsonArray2 = new JSONArray();
		for(int i=0; i<doctor_major.size(); i++) {
			JSONArray rowArray2 = new JSONArray();
			rowArray2.add(doctor_major.get(i));
			rowArray2.add(monthlyMajorCntChart.get(i));	
			jsonArray2.add(rowArray2);
			System.out.println("jsonArray2 : " + jsonArray2);
		}
						
		model.addAttribute("monthly",monthly);
		model.addAttribute("monthlyProfitChart", monthlyProfitChart);
		model.addAttribute("jsonArray",jsonArray);
		
		model.addAttribute("monthlyTreatmentChart", monthlyTreatmentChart);
		model.addAttribute("jsonArray1",jsonArray1);
		
		model.addAttribute("monthlyMajorCntChart", monthlyMajorCntChart);
		model.addAttribute("jsonArray2",jsonArray2);
	}
}

package com.spring.lifecare.controller;

import java.awt.List;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.lifecare.persistence.UserDAO;
import com.spring.lifecare.service.CustomerService;
import com.spring.lifecare.service.DoctorService;
import com.spring.lifecare.service.KakaoPayService;
import com.spring.lifecare.vo.AppointmentVO;
import com.spring.lifecare.vo.DoctorVO;

import lombok.extern.java.Log;

@Log
@Controller
public class JinController {
	//카카오페이 관련 Autowired
    @Autowired
    KakaoPayService kakaopay;
    
    @Autowired
    CustomerService customer;
    
    @Autowired
    DoctorService doctor;
    
    @Autowired
    UserDAO dao;
    
    JSONArray jsonArray = new JSONArray();
    
    //메인페이지 팝업
    @RequestMapping("/popup")
	public String popup(Model model) {
		
		return "common/popup";
	}
    
 	//카카오 결제 - popup
 	@RequestMapping("/customer/kakaopay")
 	public String kakaopay(HttpServletRequest req, Model model) {
 		int diagnosis_num = Integer.parseInt(req.getParameter("diagnosis_num"));
 		req.setAttribute("diagnosis_num", diagnosis_num);
 		
 		return "customer/kakaopay";
 	}
 	
    //카카오페이- QR코드 페이지 이동
    @RequestMapping("/customer/kakaoPayGo")
    public String kakaoPay(HttpServletRequest req, Model model) {
        return "redirect:" + kakaopay.kakaoPayReady(req,model);
    }
    
    //카카오페이 - 결제완료 페이지
    @GetMapping("/customer/kakaopaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, HttpServletRequest req, Model model) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        customer.successPay(req, model);
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
        return "customer/kakaopaySuccess";
    }
    
    //카카오 페이 결제 취소
 	@RequestMapping("/customer/kakaopayCancel")
 	public String kakaopayCancel(Model model) { 		
 		return "customer/kakaopayCancel";
 	}
 	
    //카카오 페이 결제 실패
 	@RequestMapping("/customer/kakaopayFail")
 	public String kakaopayFail(Model model) {		
 		return "customer/kakaopayFail";
 	}
 	
    //결제할 내용 리스트 출력
 	@RequestMapping("/customer/payment")
 	public String payment(HttpServletRequest req, Model model) {
 		customer.paymentList(req, model);
 		return "customer/payment";
 	}
 	
 	//결제정보 출력
 	@RequestMapping("/customer/paymentInfo")
 	public @ResponseBody JSONArray paymentInfo(HttpServletRequest req, Model model) { 		
 		customer.paymentInfo(req, model);
 		jsonArray = (JSONArray)req.getAttribute("jsonArray");
 		return jsonArray;
 	}
 	
 	//진단서 폼 - 프린트
 	@RequestMapping("/customer/diagnosis")
	public String diagnosis(Model model) {
		
		return "customer/diagnosis";
	}
	
 	//진료기록부 폼 - 프린트
	@RequestMapping("/customer/medicalNote")
	public String medicalNote(Model model) {
		
		return "customer/medicalNote";
	}
	
	//처방전 폼 - 프린트
	@RequestMapping("/customer/prescription")
	public String prescription(Model model) {
		
		return "customer/prescription";
	}
	
    // 의사 로그인후 메인페이지
    @RequestMapping("/doctor/doctor_main")
    public String doctor_main(HttpServletRequest req, Model model) {
    	doctor.loadDoctorInfo(req, model);
    	doctor.diagnosisList(req, model);
    	return "doctor/doctor_main";
    }
    
    // 의사 로그인후 스케쥴러
    @RequestMapping("/doctor/doctor_schedule")
    public String doctor_schedule(HttpServletRequest req, Model model) {
    	doctor.loadDoctorInfo(req, model);
    	return "doctor/doctor_schedule";
    }
    
 	// 예약가능 시간 뿌려주는 url
 	@RequestMapping("/getAppointList")
 	public @ResponseBody JSONArray getAppointList(HttpServletRequest req, Model model) { 		
 		doctor.appointList(req, model);		
 		jsonArray = (JSONArray)req.getAttribute("jsonArray");
 		return jsonArray;
 	}
 	
    // 예약설정 성공 페이지
    @RequestMapping("/doctor/appointSetPro")
    public String appointSetPro(HttpServletRequest req, Model model) {
    	doctor.appointSet(req, model);
    	return "doctor/appointSetPro";
    }
    
 	// 스케쥴러 뿌려주는 json
 	@RequestMapping("/reservationList")
 	public @ResponseBody JSONArray reservationList(HttpServletRequest req, Model model) { 		
 		doctor.reservationList(req, model);
 		jsonArray = (JSONArray)req.getAttribute("jsonArray");
 		return jsonArray;
 	}
 	
    // 의사 로그인후 진료기록부
    @RequestMapping("/doctor/doctor_medicalNote")
    public String doctor_medicalNote(HttpServletRequest req, Model model) {
    	doctor.loadDoctorInfo(req, model);
    	doctor.loadCustomerInfo(req, model);
    	return "doctor/doctor_medicalNote";
    }
    
    // 의사페이지에서 환자 검색리스트 뿌리기
    @RequestMapping("/search_next")
    public String search_next(HttpServletRequest req, Model model) {
    	doctor.customerList(req, model);
    	return "doctor/search_next";
    }
    
    // 진료기록에서 질병리스트 뿌리기
 	@RequestMapping("/diseaseList")
 	public String diseaseList(HttpServletRequest req, Model model) { 		
 		doctor.diseaseList(req, model);	
 		return "doctor/diseaseList";
 	}
 	
    // 진료기록에서 약 리스트 뿌리기1
 	@RequestMapping("/drugList1")
 	public String drugList1(HttpServletRequest req, Model model) { 		
 		doctor.drugList(req, model);
 		return "doctor/drugList1";
 	}
 	
    // 진료기록에서 약 리스트 뿌리기2
 	@RequestMapping("/drugList2")
 	public String drugList2(HttpServletRequest req, Model model) { 		
 		doctor.drugList(req, model);
 		return "doctor/drugList2";
 	}
 	
    // 진료기록에서 약 리스트 뿌리기3
 	@RequestMapping("/drugList3")
 	public String drugList3(HttpServletRequest req, Model model) { 		
 		doctor.drugList(req, model);
 		return "doctor/drugList3";
 	}
 	
    // 진료기록에서 약 리스트 뿌리기4
 	@RequestMapping("/drugList4")
 	public String drugList4(HttpServletRequest req, Model model) { 		
 		doctor.drugList(req, model);
 		return "doctor/drugList4";
 	}
 	
    // 진료기록에서 약 리스트 뿌리기5
 	@RequestMapping("/drugList5")
 	public String drugList5(HttpServletRequest req, Model model) { 		
 		doctor.drugList(req, model);
 		return "doctor/drugList5";
 	}
 	
    // 진료기록 저장
 	@RequestMapping("/doctor/diagnosisPro")
 	public String diagnosisPro(HttpServletRequest req, Model model) { 		
 		doctor.saveDiagonosis(req, model);
 		return "doctor/diagnosisPro";
 	}
 	
    // 마이페이지
 	@RequestMapping("/customer/mypage")
 	public String mypage(HttpServletRequest req, Model model) {
 		
 		return "customer/Mypage";
 	}
 	
    // 예약페이지
 	@RequestMapping("/customer/appointment")
 	public String appointment(HttpServletRequest req, Model model) {
 		customer.loadInfo(req, model); // 고객이름 불러오기
 		return "customer/appointment";
 	}
 	
 	// 의료진 리스트 뿌려주는 url
 	@RequestMapping("/customer/getDeptDoctorList")
 	public @ResponseBody JSONArray getDeptDoctorList(HttpServletRequest req, Model model) { 		
 		doctor.doctorList(req, model); // 의사 리스트 불러오기		
 		jsonArray = (JSONArray)req.getAttribute("jsonArray");
 		return jsonArray;
 	}
 	
 	// 예약가능 시간 뿌려주는 url
 	@RequestMapping("/customer/getTimeList")
 	public @ResponseBody JSONArray getTimeList(HttpServletRequest req, Model model) { 		
 		customer.timeList(req, model); // 예약가능시간 리스트 불러오기		
 		jsonArray = (JSONArray)req.getAttribute("jsonArray");
 		return jsonArray;
 	}
 	
 	// 예약 성공
 	@RequestMapping("/customer/appointPro")
 	public String appointPro(HttpServletRequest req, Model model) { 		
 		// 예약가능 테이블(appointment) update + 병원 예약 테이블(reservation) insert
 		customer.successReservation(req, model);
 		return "customer/appointPro";
 	}
 	
 	// 예약 확인
 	@RequestMapping("/customer/confirmAppointment")
 	public String confirmAppointment(HttpServletRequest req, Model model) { 		 		
 		customer.loadInfo(req, model); // 고객이름 불러오기
 		customer.reservationList(req, model);
 		return "customer/confirmAppointment";
 	}
 	
 	// 예약 정보 뿌리기
 	@RequestMapping("/customer/getReservationInfo")
 	public @ResponseBody JSONArray getReservationInfo(HttpServletRequest req, Model model) { 		
 		customer.getReservationInfo(req, model);		
 		jsonArray = (JSONArray)req.getAttribute("jsonArray");
 		return jsonArray;
 	}
 	
 	// 예약 취소
 	@RequestMapping("/customer/cancelAppointment")
 	public String cancelAppointment(HttpServletRequest req, Model model) { 		 		
 		customer.cancelAppointment(req, model);
 		return "customer/cancelAppointment";
 	}
 	
 	// 관리자 결산페이지
 	@RequestMapping("/admin/summary")
 	public String summary(Model model) {
 		
 		return "host/Summary";
 	}
 	
	//////////////////////////////안드로이드 관련
 	// 의사 리스트 뿌려주기
	@ResponseBody
	@RequestMapping("/android/doctorList")
	public ArrayList<Map<String, String>> doctorList(HttpServletRequest req){
		String major = req.getParameter("major");					
		
		ArrayList<Map<String, String>> out = new ArrayList<Map<String, String>>();
		
		ArrayList<DoctorVO> list = dao.getDoctorList();
		for(DoctorVO vo : list) {
			if(vo.getDoctor_major().equals(major)) {
				Map<String, String> map = new HashMap<String, String>();
				
				map.put("doctor_id", vo.getDoctor_id());
				map.put("doctor_major", vo.getDoctor_major());
				map.put("doctor_name", vo.getDoctor_name());
				map.put("doctor_position", vo.getDoctor_position());
				
				out.add(map);
			}
		}				
		System.out.println(out);
		return out;
	}
	
	// 가능한 날짜와 시간 뿌려주기
	@ResponseBody
	@RequestMapping("/android/dateList")
	public ArrayList<Map<String, Object>> dateList(HttpServletRequest req){
		String doctor_id = req.getParameter("doctor_id");							
		
		ArrayList<Map<String, Object>> out = new ArrayList<Map<String, Object>>();
		
		Calendar cal = Calendar.getInstance();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
		int datestr = Integer.parseInt(sdf.format(cal.getTime())); // 200924 형식
		
		ArrayList<AppointmentVO> list = dao.getTimeList();
		for(AppointmentVO vo : list) {
			if(vo.getDoctor_id().equals(doctor_id)) {
				if(Integer.parseInt(vo.getAppoint_date()) > datestr) {
					Map<String, Object> map = new HashMap<String, Object>();
					String appoint_num = Integer.toString(vo.getAppoint_num());
					String date = "20" + vo.getAppoint_date() + " " + vo.getAppoint_time();
					map.put("doctor_id", vo.getDoctor_id());
					map.put("appoint_num", appoint_num);
					map.put("appoint_date", date);				
					out.add(map);
				}
			}
		}				
		System.out.println(out);
		return out;
	}
}

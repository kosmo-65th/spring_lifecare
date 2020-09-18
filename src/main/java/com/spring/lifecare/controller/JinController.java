package com.spring.lifecare.controller;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.lifecare.service.CustomerService;
import com.spring.lifecare.service.DoctorService;
import com.spring.lifecare.service.KakaoPayService;

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
    
    JSONArray jsonArray = new JSONArray();
    
    //메인페이지 팝업
    @RequestMapping("/popup")
	public String popup(Model model) {
		
		return "common/popup";
	}
    
    //카카오페이- QR코드 페이지 이동
    @RequestMapping("/customer/kakaoPayGo")
    public String kakaoPay() {
        return "redirect:" + kakaopay.kakaoPayReady();
    }
    
    //카카오페이 - 결제완료 페이지
    @GetMapping("/customer/kakaopaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        // 결제테이블에 insert 해야함
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
 	public String payment(Model model) {
 		
 		return "customer/payment";
 	}
 	
 	//카카오 결제 - popup
 	@RequestMapping("/customer/kakaopay")
 	public String kakaopay(Model model) {
 		
 		return "customer/kakaopay";
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
 	
 	// 관리자 결산페이지
 	@RequestMapping("/admin/summary")
 	public String summary(Model model) {
 		
 		return "host/Summary";
 	}
 	
}

package com.spring.lifecare.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.lifecare.service.KakaoPayService;

import lombok.extern.java.Log;

@Log
@Controller
public class JinController {
	//카카오페이 관련 Autowired
    @Autowired
    KakaoPayService kakaopay;
    
    //메인페이지 팝업
    @RequestMapping("/popup")
	public String popup(Model model) {
		
		return "common/popup";
	}
    
    //카카오페이- QR코드 페이지 이동
    @RequestMapping("/kakaoPayGo")
    public String kakaoPay() {
        return "redirect:" + kakaopay.kakaoPayReady();
    }
    
    //카카오페이 - 결제완료 페이지
    @GetMapping("/kakaopaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        // 결제테이블에 insert 해야함
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
        return "customer/kakaopaySuccess";
    }
    
    //카카오 페이 결제 취소
 	@RequestMapping("/kakaopayCancel")
 	public String kakaopayCancel(Model model) {
 		
 		return "customer/kakaopayCancel";
 	}
 	
    //카카오 페이 결제 실패
 	@RequestMapping("/kakaopayFail")
 	public String kakaopayFail(Model model) {
 		
 		return "customer/kakaopayFail";
 	}
 	
    //결제할 내용 리스트 출력
 	@RequestMapping("/payment")
 	public String payment(Model model) {
 		
 		return "customer/payment";
 	}
 	
 	//카카오 결제 - popup
 	@RequestMapping("/kakaopay")
 	public String kakaopay(Model model) {
 		
 		return "customer/kakaopay";
 	}
 	
 	//진단서 폼 - 프린트
 	@RequestMapping("/diagnosis")
	public String diagnosis(Model model) {
		
		return "customer/diagnosis";
	}
	
 	//진료기록부 폼 - 프린트
	@RequestMapping("/medicalNote")
	public String medicalNote(Model model) {
		
		return "customer/medicalNote";
	}
	
	//처방전 폼 - 프린트
	@RequestMapping("/prescription")
	public String prescription(Model model) {
		
		return "customer/prescription";
	}
	
    // 의사 로그인후 메인페이지
    @RequestMapping("/doctor_main")
    public String doctor_main() {
    	
    	return "doctor/doctor_main";
    }
    
    // 의사 로그인후 스케쥴러
    @RequestMapping("/doctor_schedule")
    public String doctor_schedule() {
    	
    	return "doctor/doctor_schedule";
    }
    
    // 의사 로그인후 진료기록부
    @RequestMapping("/doctor_medicalNote")
    public String doctor_medicalNote() {
    	
    	return "doctor/doctor_medicalNote";
    }
    
    // 마이페이지
 	@RequestMapping("/mypage")
 	public String mypage(Model model) {
 		
 		return "customer/Mypage";
 	}
 	
 	// 관리자 결산페이지
 	@RequestMapping("/summary")
 	public String summary(Model model) {
 		
 		return "host/Summary";
 	}
}

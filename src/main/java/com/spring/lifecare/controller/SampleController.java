package com.spring.lifecare.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.lifecare.service.KakaoPay;

import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Controller
public class SampleController {

    @Setter(onMethod_ = @Autowired)
    private KakaoPay kakaopay;
    
    
    @RequestMapping("/kakaoPayGo")
    public String kakaoPay() {
        log.info("kakaoPay post............................................");
        
        System.out.println(kakaopay.kakaoPayReady());
        
        return "redirect:" + kakaopay.kakaoPayReady();
 
    }
    
    @GetMapping("/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
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
}

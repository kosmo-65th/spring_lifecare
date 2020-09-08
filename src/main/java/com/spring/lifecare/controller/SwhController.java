package com.spring.lifecare.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.lifecare.service.KakaoLoginServiceImpl;

@Controller
public class SwhController {
	
	@Autowired
	private KakaoLoginServiceImpl kakao;
//
	//메인페이지
	@RequestMapping(value= {"/","/guest/main","/main"})
	public String main(Model model) {
		
		return "main";
	}
	
	//404 에러 페이지
	@RequestMapping("/error_404")
	public String error_404(HttpServletRequest request, Model model) {
		return "error/error_404";
	}
	
	//카카오 로그인
	@RequestMapping("/kakaoLogin")
    public String kakaoLogin(@RequestParam("code") String code, HttpSession session, Model model) {
        String access_Token = kakao.getAccessToken(code);
        System.out.println("controller access_token : " + access_Token);
        
        HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
        System.out.println("userInfo : " + userInfo);
        
        //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("email") != null) {
            //session.setAttribute("userId", userInfo.get("email"));
            //session.setAttribute("access_Token", access_Token);
        	model.addAttribute("email", userInfo.get("email"));
        }
        
        return "guest/test";
    }

}



package com.spring.lifecare.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.lifecare.service.KakaoLoginService;
import com.spring.lifecare.service.NaverLoginService;
import com.spring.lifecare.vo.UserVO;

@Controller
public class SwhController {
	
	@Autowired
	KakaoLoginService kakao;
	
	@Autowired
	NaverLoginService naver;

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
	
	//500 에러 페이지
	@RequestMapping("/error_500")
	public String error_500(HttpServletRequest request, Model model) {
		return "error/error_500";
	}
	
	//카카오 로그인
	@RequestMapping("/kakaoLogin")
    public String kakaoLogin(@RequestParam("code") String code, HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response) 
    		throws IOException {
        String access_Token = kakao.getAccessToken(code);
        System.out.println("controller access_token : " + access_Token);
        
        HashMap<String, Object> userKakaoInfo = kakao.getUserInfo(access_Token);
        System.out.println("userKakaoInfo : " + userKakaoInfo);
        
        Map<String, String> userInfo = kakao.checkKakaoId(userKakaoInfo);
        
        if(userInfo == null  ||userInfo.get("USERNAME").equals("") || userInfo.get("USERNAME")==null ) {//데이터베이스에 카카오 로그인 정보가 없을경우
        	PrintWriter out = response.getWriter();
        	
        	out.println("<script>");
			out.println("alert('카카오톡에 연동된 아이디가 없습니다.');");
			out.println("</script>");
			out.close();
        	
        	return "guest/login";//로그인 페이지로 이동
        }else {//데이터베이스에 카카오 로그인 정보가 있을경우
        		//클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
            if (userInfo.get("email") != null) {
                //session.setAttribute("userId", userInfo.get("email"));
                //session.setAttribute("access_Token", access_Token);
            	model.addAttribute("email", userInfo.get("email"));
            }
          //권한 부여
            kakao.kakaoAutehntication(request, response, userInfo);
            
        }
        model.addAttribute("trash", "trash");
        System.out.println("model : " +model.toString());
        return "main";
    }

	//네이버 로그인
	@RequestMapping("/naverLogin")
	public String naverLogin(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		
		return "main";
	}
	
	@RequestMapping("/main_reset")
	public String main_reset(HttpServletRequest request, Model model) {
		return "/";
	}
	
	@RequestMapping("/customer/test")
	public String test(HttpServletRequest request, Model model, HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String sName = "";
		Enumeration attEnum = session.getAttributeNames();
		while(attEnum.hasMoreElements()) {
		     sName=(String)attEnum.nextElement();
		     //if (sName.indexOf("star.") >=0) { session.removeAttribute(sName); }
		     String sValue = "";
		     try {
		    	 sValue = (String)session.getAttribute(sName);
		    	 
		    	 if (sName.equals("SPRING_SECURITY_CONTEXT")) {

					SecurityContext value = (SecurityContext) session.getAttribute(sName);

					Authentication authentication = value.getAuthentication();

					UserVO principal = (UserVO) authentication.getPrincipal();

					WebAuthenticationDetails details = (WebAuthenticationDetails) authentication.getDetails();

					String username = authentication.getName();

					String password = (String) authentication.getCredentials();
					
					System.out.println("Security Context principal : "+ principal);
					System.out.println("Security Context userName : " + username);
					System.out.println("Security Context password : "+ password);
					System.out.println("Security Context detail : " + details);
			     }
		     }catch(Exception e) {
		    	 System.out.println(e.getMessage());
		     }
		      
		     System.out.println("session : "+sName +"/ value : "+sValue);
		}
		
		Object principal = auth.getPrincipal();	
		String name = "";
		if(principal != null && principal instanceof UserVO){
			name = ((UserVO)principal).getUserid();
		}
		
		System.out.println("principal : "+principal);
		System.out.println("detail : "+auth.getDetails());
		System.out.println("Name :"+auth.getName());
		System.out.println("check :"+auth.isAuthenticated());

		Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		String test = authorities.toString();
		System.out.print("권한 : "+test);
		
		return "customer/test";
	}
	
	@RequestMapping("/doctor/test")
	public String test2(HttpServletRequest request, Model model, HttpSession session) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		String username ="";
		if (principal instanceof UserDetails) {
		  username = ((UserDetails)principal).getUsername();
		} else {
		  username = principal.toString();
		}
		System.out.println(username);
		
		return "customer/test";
	}
	
}



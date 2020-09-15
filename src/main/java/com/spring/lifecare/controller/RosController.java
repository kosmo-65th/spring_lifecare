package com.spring.lifecare.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.lifecare.service.CustomerService;
import com.spring.lifecare.service.CustomerServiceImpl;
import com.spring.lifecare.service.DoctorService;

@Controller
public class RosController {
	@Autowired
	CustomerService service;
	
	@Autowired
	DoctorService doctor;
	
	//일반회원, 의사 회원가입 방법 폼
	@RequestMapping("/preJoinIn")
	public String preJoinIn (Model model) {
		return "guest/preJoinIn";		
	}
	
	//회원가입 폼
	@RequestMapping("/JoinInForm")
	public String joinInForm(Model model) {
		return "guest/JoinInForm";		
	}
	
	// id 중복 체크 컨트롤러
	@RequestMapping(value = "/user/JoinInForm", method = RequestMethod.GET)
	@ResponseBody
	public String idChk(@RequestParam("userId") String customer_id, Model model) {
		return Integer.toString(service.confirmId(customer_id));
	}
	// 휴대폰 번호 중복 체크 컨트롤러
	@RequestMapping(value = "/user/JoinIn", method = RequestMethod.GET)
	@ResponseBody
	public String phoneChk(@RequestParam("userPhone") String customer_phone, Model model) {
		return Integer.toString(service.confirmPhone(customer_phone));
	}
	//이메일 주소 체크 컨트롤러
	@RequestMapping(value = "/user/email", method = RequestMethod.GET)
	@ResponseBody
	public String emailChk(@RequestParam("userEmail") String customer_email, Model model) {
			return Integer.toString(service.confirmEmail(customer_email));
	}
			
	//회원가입 처리
	@RequestMapping(value = "/JoinInPro", method = RequestMethod.POST)
	public String joinInPro(HttpServletRequest req, Model model) {
	System.out.println("url ==> JoinInPro");
	    
	    service.joinInPro(req, model);
	    service.emailCheck(req, model);
		
		return "guest/JoinInPro";
	}
	
	
	//회원가입 성공
	@RequestMapping("/joinSuccess")
     public String joinSuccess(HttpServletRequest req, Model model) {
			
	  int cnt = Integer.parseInt(req.getParameter("insertCnt"));
	  model.addAttribute("insertCnt", cnt); 
		      
	  return "guest/login";
	}
	
	//이메일 인증후 사용 가능 아이디 변경
	@RequestMapping("/emailcheck")
	public String emailcheck(HttpServletRequest req, Model model) {			
			
		service.approvalLogin(req, model);
			
	    return "guest/login";
	}
	
	//아이디 찾기 페이지
	@RequestMapping("/findId")
	public String findId(Model model) {
		return "guest/findId";		
	}
	
    //아이디 찾기
	@RequestMapping(value = "/findIdResult", method = RequestMethod.POST)
	public String findIdResult(HttpServletResponse response, @RequestParam("customer_phone") String customer_phone, Model model) throws Exception{
		model.addAttribute("id", service.searchId(response, customer_phone ));
		
		return "guest/findIdResult";
	
	}
	
	//의사 회원가입 폼
	@RequestMapping("/doctorJoin")
	public String doctorJoin(Model model) {
		return "guest/doctorJoin";		

	}
	// 의사 id 중복 체크 컨트롤러
	@RequestMapping(value = "/user/dJoinInForm", method = RequestMethod.GET)
	@ResponseBody
	public String doctorIdChk(@RequestParam("doctorId") String doctor_id, Model model) {
		return Integer.toString(doctor.doctorId(doctor_id));
	}
	// 의사 휴대폰 번호 중복 체크 컨트롤러
	@RequestMapping(value = "/user/dJoinIn", method = RequestMethod.GET)
	@ResponseBody
	public String doctorPhoneChk(@RequestParam("doctorPhone") String doctor_phone, Model model) {
			return Integer.toString(doctor.doctorPhone(doctor_phone));
	}
	//의사 이메일 주소 체크 컨트롤러
	@RequestMapping(value = "/user/dEmail", method = RequestMethod.GET)
	@ResponseBody
	public String doctorEmailChk(@RequestParam("doctorEmail") String doctor_email, Model model) {
			return Integer.toString(doctor.doctorEmail(doctor_email));
	}
	//의사 면허 체크 컨트롤러
	@RequestMapping(value = "/user/dNum", method = RequestMethod.GET)
	@ResponseBody
	public String doctorNumChk(@RequestParam("doctorNum") String doctor_num, Model model) {
			return Integer.toString(doctor.doctorNum(doctor_num));
	}
	
				
	
	
	//비밀번호 찾기
	@RequestMapping("/findPassword")
	public String findPassword(Model model) {
		return "guest/findPassword";		
	}
	//회원탈퇴
	@RequestMapping("/customer/remove")
	public String remove(Model model) {
		return "customer/remove";		
	}
	//회원수정전 비밀번호 입력
	@RequestMapping("/customer/preModify")
	public String preModify(Model model) {
		
		return "customer/preModify";		
	}
	//회원수정 폼
	@RequestMapping("/customer/modify")
	public String modify(Model model) {
		return "customer/modify";		
	}
	
	
	
}

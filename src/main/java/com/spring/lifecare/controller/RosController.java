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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.lifecare.service.AdminService;
import com.spring.lifecare.service.CustomerService;
import com.spring.lifecare.service.DoctorService;
import com.spring.lifecare.service.MyPageService;
import com.spring.lifecare.vo.CustomerVO;

@Controller
public class RosController {
	@Autowired
	CustomerService service;
	
	@Autowired
	DoctorService doctor;
	
	@Autowired
	MyPageService myPage;
	
	
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
	
	//의사 회원가입 처리
	@RequestMapping(value="/insertDoctor", method=RequestMethod.POST)
	public String insertDoctor(MultipartHttpServletRequest req, Model model) {
		
		 doctor.doctorJoin(req, model);
		
	     return "guest/insertDoctor";
	}
	
	//의사 회원가입 성공
	@RequestMapping("/doctorJoinSuccess")
	public String doctorJoinSuccess(HttpServletRequest req, Model model) {
		  try {
			  int cnt = Integer.parseInt(req.getParameter("insertCnt"));
			  model.addAttribute("insertCnt", cnt); 
			      
		  }catch(NumberFormatException e){
            	  
		 }	  
		  return "guest/login";
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
	//내 정보  폼
	@RequestMapping("/customer/myInformation")
	public String myInformation(HttpServletRequest req, Model model) {
		
	   String customer_id = (String)req.getSession().getAttribute("userSession");
	   CustomerVO customer = myPage.myInfo(customer_id);
	   model.addAttribute("customer", customer);
		
	 return "customer/myInformation";		
	}
	
	//내 정보 수정 폼
	@RequestMapping("/customer/modify")
	public String modify(HttpServletRequest req, Model model) {
		
		String customer_id = (String)req.getSession().getAttribute("userSession");
		CustomerVO customer = myPage.myInfo(customer_id);
		model.addAttribute("customer", customer);
		
		return "customer/modify";		
	}
	//내 정보 수정 처리
	@RequestMapping("/customer/modifyViewPro")
	public String modifyPro(HttpServletRequest req, Model model) {
		try {
		myPage.updateMember(req, model);
		}catch(NumberFormatException e){
            	  
		 }	 
		return "customer/modifyViewPro";
	}
	
	
	
	//마이페이지 비밀번호 변경전 현재 비밀번호 입력하기 폼
	@RequestMapping("/customer/preChangePassword")
	public String preChangePassword(HttpServletRequest req, Model model) {
		
		return "customer/preChangePassword";		
	}
	
	 //마이페이지 비밀번호 변경전 현재 비밀번호 입력하기 과정
	  @RequestMapping("/customer/preChangePasswordPro") 
	  public String preChangePasswordPro(HttpServletRequest req, Model model) {
		  //비밀번호 확인
		  int selectCnt = myPage.putPassword(req, model);
		  System.out.println("selectCnt : " +selectCnt);
		  
		  model.addAttribute("selectCnt", selectCnt);
		  
		  return "customer/preChangePasswordPro"; 
	  }
	  
	
	//마이 페이지 비밀번호 변경폼
	@RequestMapping("/customer/changePassword")
	public String changePassword(HttpServletRequest req, Model model) {
	
		return "customer/changePassword";		
	}
	
	//비밀번호 변경처리화면
	@RequestMapping("/customer/changePasswordPro")
	public String changePasswordPro(HttpServletRequest req, Model model) {
		myPage.modifyPassword(req, model);
		
		return "customer/changePasswordPro";		
	}
	//비밀번호 찾기 폼
	@RequestMapping("/findPassword")
	public String findPassword(Model model) {
		return "guest/findPassword";		
	}
	
	//임시 비밀번호 발송하는 이메일
	@RequestMapping(value="findPwdSendEmail", method=RequestMethod.POST)

	 public String customersendEmail(HttpServletRequest req, Model model) {
	
		service.findPwd(req, model);

		return "guest/findPasswordPro";

	}
	 //회원 휴먼처리 폼
	 @RequestMapping("/customer/remove")
	 public String remove(Model model) {
			
			return "customer/remove";		
	}
		
	 //회원 휴먼처리 과정
	 @RequestMapping("/customer/removePro")
	 public String removePro(HttpServletRequest req, Model model) {
				
		myPage.removeMember(req, model);
			
		return "customer/removePro";		
	}
	
	//찾아 오시는 길
	@RequestMapping("/findWay")
	public String findWay(Model model) {
		
		return "guest/findWay";		
	}
	
	//주변 약국
	@RequestMapping("/findPharmacy")
	public String findPharmacy(Model model) {
			
		return "guest/findPharmacy";		
	}
		
	
}

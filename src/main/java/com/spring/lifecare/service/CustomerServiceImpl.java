package com.spring.lifecare.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.lifecare.persistence.UserDAO;
import com.spring.lifecare.vo.AppointmentVO;
import com.spring.lifecare.vo.CustomerVO;
import com.spring.lifecare.vo.DoctorVO;


@Service
public class CustomerServiceImpl implements CustomerService{
	
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public int confirmId(String customer_id) {
		return userDAO.idCheck(customer_id);
	}

	@Override
	public int confirmPhone(String customer_phone) {
		return userDAO.phoneCheck(customer_phone);
	}

	@Override
	public int confirmEmail(String customer_email) {
		return userDAO.emailCheck(customer_email);
		
	}
	
	//회원가입 이메일 인증
	@Override
	public void emailCheck(HttpServletRequest req, Model model) {
		String customer_email = req.getParameter("customer_email");
		req.getSession().setAttribute("customer_email", customer_email);
		
		System.out.println("customer_email :" + customer_email);
		
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		
		for(int i=0; i<6; i++) {
			int rIndex = rnd.nextInt(2);
			switch(rIndex) {
			case 0:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 1:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;				
			}
		}
		String key = temp.toString(); //StringBuffer 형식인 key를 String으로 변환
		System.out.println("key :" + key);
		req.getSession().setAttribute("key", key);
		model.addAttribute("cnt", 1);
		
		userDAO.sendmail(customer_email, key);
	}

	@Override
	public void joinInPro(HttpServletRequest req, Model model) {
		
		CustomerVO vo = new CustomerVO();
			
		vo.setCustomer_id(req.getParameter("customer_id"));
		vo.setCustomer_pw(passwordEncoder.encode(req.getParameter("customer_pw")));
		vo.setCustomer_name(req.getParameter("customer_name"));
		vo.setCustomer_email(req.getParameter("customer_email"));
		vo.setCustomer_phone(req.getParameter("customer_phone"));
			
		int cnt = userDAO.insertMember(vo);
			
		model.addAttribute("insertCnt", cnt);
		System.out.println("cnt : " + cnt);
		
		
							
	}
	//이메일 인증 후 로그인
	@Override
	public void approvalLogin(HttpServletRequest req, Model model) {
		
        String customer_email = req.getParameter("customer_email");		
		userDAO.approvalMember(customer_email);	
		System.out.println(customer_email);		
	}
	

   //아이디 찾기
	@Override
	public String searchId(HttpServletResponse response, String customer_phone) throws IOException {
			 
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = userDAO.findId(customer_phone);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}

	
  }
    //회원이 직접 정보 수정
	@Override
	public void modiPro(MultipartHttpServletRequest req, Model model) {
		
		
	}

	@Override
	public void loadInfo(HttpServletRequest req, Model model) {
		// 세션 아이디 불러오기
		String customer_id = (String) req.getSession().getAttribute("userSession");
		
		String customer_name = userDAO.loadCustomerName(customer_id);				
		
		model.addAttribute("customer_name", customer_name);
	}

	@Override
	public void timeList(HttpServletRequest req, Model model) {		
		JSONArray jsonArray = new JSONArray();		
		ArrayList<AppointmentVO> list = userDAO.getTimeList();
		for(AppointmentVO vo : list) {
			JSONObject rowArray = new JSONObject();
			rowArray.put("appoint_num", vo.getAppoint_num());
			rowArray.put("doctor_id", vo.getDoctor_id());
			rowArray.put("appoint_date", "20" + vo.getAppoint_date());
			rowArray.put("appoint_time", vo.getAppoint_time());
			jsonArray.add(rowArray);
		}
		System.out.println(jsonArray);
		
		req.setAttribute("jsonArray", jsonArray);	
	}

	@Override
	public void successReservation(HttpServletRequest req, Model model) {
		// appoint update 위한 데이터 가져오기
		int appoint_num = Integer.parseInt(req.getParameter("appoint_num"));
		
		int updateCnt = userDAO.updateAppoint(appoint_num);
		model.addAttribute("updateCnt", updateCnt);
		
		Map<String, Object> map = new HashMap<String, Object>();		
		String customer_id = (String) req.getSession().getAttribute("userSession");
		String doctor_id = req.getParameter("doctor_num");
		String date = req.getParameter("sday"); // 20200922
		String time = req.getParameter("medTm"); // 14:00
		
		String t = date.substring(0,4) + "-" + date.substring(4,6) + "-" + date.substring(6,8) + 
								  " " + time + ":00.0";
		System.out.println(t);
		java.sql.Timestamp reservation_date = java.sql.Timestamp.valueOf(t);
		
		map.put("appoint_num", appoint_num);
		map.put("reservation_date", reservation_date);
		map.put("customer_id", customer_id);
		map.put("doctor_id", doctor_id);		
		int insertCnt = userDAO.addReservation(map);		
		model.addAttribute("insertCnt", insertCnt);
	}
		
}

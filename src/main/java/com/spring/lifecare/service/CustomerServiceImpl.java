package com.spring.lifecare.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import com.spring.lifecare.vo.DiagnosisVO;
import com.spring.lifecare.vo.ReservationVO;

import util.FcmUtil;


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
		vo.setCustomer_gender(req.getParameter("customer_gender"));
		vo.setCustomer_year(Integer.parseInt(req.getParameter("customer_year")));
		
			
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
		
		//알림
		String d = "고객님의 진료가 " + date.substring(0,4) + "년 " + date.substring(4,6) + "월 " + date.substring(6,8) + 
				  "일 " + time + "에 예약 되었습니다.";
		//한림 10.15
		String tokenId= "dTs9jL7SRx2_FZOyRH_oRK:APA91bEAI_Vmn_up-YchylE4F1nGNe8RCWs71Wv7RjuqEjtZbz35eb9iUbJfAtSii9gHKVhQ4mNoFsAj-wlHb7rStvriDMQlalWQdG_wv46_TE43qNJGtDSrak5wQJvxIpNDLKnct9bA";
		//승운 10.15
		//String tokenId= "d38Tvs1YQo-K2HxxSW8bJV:APA91bHgHsVEU2X2dSW_BB8tU7xNZHkpB-guUC9H_w6qYflbrDulbTGOsSIk4jJvIDLvTF92Vu22cFinUUSyucTqVLQ-Mi9UJqMvOE-CUrJWF8XrTVovIyDq3dlShShkx9l1W1XBueGV";
	    
		String title="Life Care 예약 알림 입니다.";
	    String content=  d;
	  
	    FcmUtil FcmUtil = new FcmUtil();
	    FcmUtil.send_FCM(tokenId, title, content);
	    
		model.addAttribute("insertCnt", insertCnt);
	}

	//비밀번호 찾기
	@Override
	public void findPwd(HttpServletRequest req, Model model) {
		
		int updateCnt = 0;
		String customer_id = req.getParameter("customer_id");
		String customer_email = req.getParameter("customer_email");			

		Map<String, String> map = new HashMap<String, String>();

		map.put("customer_id", customer_id);
		map.put("customer_email", customer_email);

		int cnt = userDAO.idEmailChk(map);
		
		if(cnt == 1) {
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			for(int i = 0; i < 6; i++) {
				int rIndex = rnd.nextInt(2);
				switch(rIndex) {
				case 0:
					temp.append((char) ((int) (rnd.nextInt(26)) + 65));
					break;
				case 1:
					temp.append((rnd.nextInt(10)));
					break;
				}
			}			

			String key = temp.toString();
			
			CustomerVO vo = new CustomerVO();
			vo.setCustomer_id(customer_id);
			vo.setCustomer_email(customer_email);
			vo.setCustomer_pw(passwordEncoder.encode(key));
			
			updateCnt = userDAO.changePassword(vo);
			
			if(updateCnt == 1) {
				userDAO.sendMail(customer_id, customer_email, key);

			} 
		}	
			model.addAttribute("updateCnt", updateCnt);
			model.addAttribute("cnt", cnt);
			model.addAttribute("cusId", customer_id);		
			
	}
				
	@Override
	public void reservationList(HttpServletRequest req, Model model) {
		String customer_id = (String) req.getSession().getAttribute("userSession");
		List<ReservationVO> list = userDAO.getReservationList(customer_id);
		model.addAttribute("list", list);
	}

	@Override
	public void getReservationInfo(HttpServletRequest req, Model model) {
		int appoint_num = Integer.parseInt(req.getParameter("appoint_num"));
		JSONArray jsonArray = new JSONArray();		
		List<ReservationVO> list = userDAO.getReservationInfo(appoint_num);
		for(ReservationVO vo : list) {
			JSONObject rowArray = new JSONObject();
			rowArray.put("doctor_major", vo.getDoctor_major());
			rowArray.put("doctor_name", vo.getDoctor_name());
			rowArray.put("reservation_date", vo.getReservation_date());
			jsonArray.add(rowArray);
		}
		System.out.println(jsonArray);
		
		req.setAttribute("jsonArray", jsonArray);
	}

	@Override
	public void cancelAppointment(HttpServletRequest req, Model model) {
		int appoint_num = Integer.parseInt(req.getParameter("appoint_num"));
		int deleteCnt = 0;
		int updateCnt = 0;
		
		deleteCnt = userDAO.delectReservation(appoint_num);
		updateCnt = userDAO.updateAppointment(appoint_num);
		
		model.addAttribute("deleteCnt", deleteCnt);
		model.addAttribute("updateCnt", updateCnt);
	}

	@Override
	public void paymentList(HttpServletRequest req, Model model) {
		String customer_id = (String) req.getSession().getAttribute("userSession");
		
		// 페이징
		int pageSize = 5;    // 한페이지당 출력한 글 갯수
		int pageBlock = 5;   // 한 블럭당 페이지 갯수
				
		int cnt = 0;         // 글갯수
		int start = 0;       // 현재 페이지 시작 글번호
		int end = 0;         // 현재 페이지 마지막 글번호
		int number = 0;      // 출력용 글번호 (db에서 중간에 글하나가 삭제되어도 보여주는 번호는 순차적으로 보여짐)
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재페이지
				
		int pageCount = 0;   // 페이지 갯수
		int startPage = 0;   // 시작 페이지
		int endPage = 0;     // 마지막 페이지
		
		// 게시글 갯수
		cnt = userDAO.getDiagnosisCnt(customer_id);
		
		pageNum = req.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";  // 첫페이지를 1페이지로 지정
		}
		
		currentPage  = Integer.parseInt(pageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		number = cnt - (currentPage - 1) * pageSize;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customer_id", customer_id);
		map.put("start", start);
		map.put("end", end);
		
		if(cnt > 0) {
			// 게시글 목록 조회
			List<DiagnosisVO> list = userDAO.DiagnosisList(map);
			model.addAttribute("list", list);
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1;  
		if(currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}
		endPage = startPage + pageBlock - 1;  
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("cnt", cnt);         // 글갯수
		model.addAttribute("number", number);   // 보여지는 번호
		model.addAttribute("pageNum", pageNum); // 화면상 표시되는 페이지 숫자
		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);
		}		
	}

	@Override
	public void paymentInfo(HttpServletRequest req, Model model) {
		int diagnosis_num = Integer.parseInt(req.getParameter("diagnosis_num"));
		JSONArray jsonArray = new JSONArray();		
		List<DiagnosisVO> list = userDAO.getDiagnosisInfo(diagnosis_num);
		for(DiagnosisVO vo : list) {
			JSONObject rowArray = new JSONObject();
			rowArray.put("customer_amount", vo.getCustomer_amount());
			rowArray.put("customer_payment", vo.getCustomer_payment());
			rowArray.put("diagnosis_time", vo.getDiagnosis_time());
			jsonArray.add(rowArray);
		}
		System.out.println(jsonArray);		
		req.setAttribute("jsonArray", jsonArray);
	}

	@Override
	public void successPay(HttpServletRequest req, Model model) {
		int diagnosis_num = Integer.parseInt(req.getParameter("diagnosis_num"));
		int updateCnt = userDAO.successPay(diagnosis_num);
		model.addAttribute("updateCnt", updateCnt);
	}
			
}

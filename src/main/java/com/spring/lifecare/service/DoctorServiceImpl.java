package com.spring.lifecare.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.lifecare.persistence.UserDAO;
import com.spring.lifecare.vo.AppointmentVO;
import com.spring.lifecare.vo.CustomerVO;
import com.spring.lifecare.vo.DiagnosisVO;
import com.spring.lifecare.vo.DiseaseVO;
import com.spring.lifecare.vo.DoctorVO;
import com.spring.lifecare.vo.DrugVO;
import com.spring.lifecare.vo.ReservationVO;

@Service
public class DoctorServiceImpl implements DoctorService{
	
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;


	@Override
	public int doctorId(String doctor_id) {
		return userDAO.CheckId(doctor_id);
		
	}

	@Override
	public int doctorPhone(String doctor_phone) {
		return userDAO.CheckPhone(doctor_phone);
	}

	@Override
	public int doctorEmail(String doctor_email) {
		return userDAO.CheckEmail(doctor_email);
	}

	@Override
	public int doctorNum(String doctor_num) {
		return userDAO.CheckNum(doctor_num);
	}

	@Override
	public void doctorJoin(MultipartHttpServletRequest req, Model model) {
        MultipartFile file = req.getFile("doctor_faceimg");
		
		// 업로드할 파일의 최대 사이즈(10 * 1024 * 1024 = 10MB)
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/img/");	
		String realDir = "D:\\DEV65\\project\\spring_lifecare\\src\\main\\webapp\\resources\\img\\";
		
		try {
			file.transferTo(new File(saveDir+file.getOriginalFilename()));
			System.out.println("file :" + file);
			FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
			int data = 0;
		
			while((data = fis.read()) != -1) {
				fos.write(data);
			}
		}catch(Exception e) {
			
		}
		
		//화면으로부터 입력받은 값들을 받아온다. 
		int doctor_num = Integer.parseInt(req.getParameter("doctor_num"));
		String doctor_id = req.getParameter("doctor_id");
		String doctor_pw = (passwordEncoder.encode(req.getParameter("doctor_pw")));
        String doctor_name = req.getParameter("doctor_name");
        String doctor_email = req.getParameter("doctor_email");
        String doctor_phone = req.getParameter("doctor_phone");
        String doctor_major = req.getParameter("doctor_major");
        String doctor_position = req.getParameter("doctor_position");
        String img = file.getOriginalFilename();
		
	
	    DoctorVO vo = new DoctorVO();
	    vo.setDoctor_num(doctor_num);
	    vo.setDoctor_pw(passwordEncoder.encode(doctor_pw));
		vo.setDoctor_id(doctor_id);
		vo.setDoctor_name(doctor_name);
	    vo.setDoctor_email(doctor_email);
	    vo.setDoctor_phone(doctor_phone);
	    vo.setDoctor_major(doctor_major);
	    vo.setDoctor_position(doctor_position);
		vo.setDoctor_faceimg(img);
				
	    int insertCnt = userDAO.insertDoctor(vo);
	    System.out.println("insertCnt :" + insertCnt );
	    
	    
	    CustomerVO cusotomerVO = new CustomerVO();
	    
	    cusotomerVO.setCustomer_id(req.getParameter("doctor_id"));
	    cusotomerVO.setCustomer_pw(passwordEncoder.encode(doctor_pw));
	    cusotomerVO.setCustomer_name(req.getParameter("doctor_name"));
	    cusotomerVO.setCustomer_email(req.getParameter("doctor_email"));
	    cusotomerVO.setCustomer_phone(req.getParameter("doctor_phone"));
	    cusotomerVO.setCustomer_gender(req.getParameter("customer_gender"));
	    cusotomerVO.setCustomer_year(Integer.parseInt(req.getParameter("customer_year")));
	    
	    System.out.println(cusotomerVO);
	    
	    
	    int insertCnt2 = userDAO.insertMember(cusotomerVO);
	    System.out.println("insertCnt2 : "+ insertCnt);
	    
	    
	    model.addAttribute("dtos", vo);
	    model.addAttribute("insetCnt", insertCnt);
	}

	@Override
	public void doctorList(HttpServletRequest req, Model model) {
		JSONArray jsonArray = new JSONArray();
		
		ArrayList<DoctorVO> list = userDAO.getDoctorList();
		for(DoctorVO vo : list) {
			JSONObject rowArray = new JSONObject();
			rowArray.put("doctor_num", vo.getDoctor_id());
			rowArray.put("doctor_faceimg", vo.getDoctor_faceimg());
			rowArray.put("doctor_id", vo.getDoctor_id());
			rowArray.put("doctor_name", vo.getDoctor_name());
			rowArray.put("doctor_major", vo.getDoctor_major());
			rowArray.put("doctor_position", vo.getDoctor_position());
			jsonArray.add(rowArray);
		}
			    
	    req.setAttribute("jsonArray", jsonArray);		
	}

	@Override
	public void customerList(HttpServletRequest req, Model model) {		
		String keyword = req.getParameter("keyword");
		
		List<CustomerVO> list = new ArrayList<CustomerVO>();
		list = userDAO.searchList(keyword);
		model.addAttribute("list", list);
	}

	@Override
	public void loadCustomerInfo(HttpServletRequest req, Model model) {
		String customer_id = (String) req.getParameter("customer_id");
		CustomerVO vo = null;
		CustomerVO vo2 = null;
		vo = userDAO.getCustomerInfo(customer_id);
		vo2 = userDAO.getCustomerInfo2(customer_id);
		
		model.addAttribute("vo", vo);
		model.addAttribute("vo2", vo2);
	}

	@Override
	public void loadDoctorInfo(HttpServletRequest req, Model model) {
		String doctor_id = (String) req.getSession().getAttribute("userSession");
		
		int selectCnt = 0;
		DoctorVO vo = null;
		vo = userDAO.getDoctorInfo(doctor_id);
		
		model.addAttribute("doctor", vo);
		model.addAttribute("selectCnt", selectCnt);
	}

	@Override
	public void appointList(HttpServletRequest req, Model model) {
		JSONArray jsonArray = new JSONArray();		
		ArrayList<AppointmentVO> list = userDAO.getAppointList();
		for(AppointmentVO vo : list) {
			JSONObject rowArray = new JSONObject();
			rowArray.put("appoint_num", vo.getAppoint_num());
			rowArray.put("doctor_id", vo.getDoctor_id());
			rowArray.put("appoint_date", "20" + vo.getAppoint_date());
			rowArray.put("appoint_time", vo.getAppoint_time());
			jsonArray.add(rowArray);
		}		
		req.setAttribute("jsonArray", jsonArray);		
	}

	@Override
	public void appointSet(HttpServletRequest req, Model model) {		
		Map<String, Object> map = new HashMap<String, Object>();
		String doctor_id = req.getParameter("doctor_id");
		String[] appoint_time = req.getParameterValues("appoint_time");		

		int insertCnt = 0;
		
		for(int i=0; i<appoint_time.length; i++) {
			map.put("doctor_id", doctor_id);
			String t = appoint_time[i].substring(0,4) + "-" + appoint_time[i].substring(4,6) + "-" + appoint_time[i].substring(6,8)
					   + " " + "00:00:00.0";
			java.sql.Timestamp reservation_date = java.sql.Timestamp.valueOf(t);
			map.put("appoint_date", reservation_date);				
			if(appoint_time[i] != null) {
				String setTime = appoint_time[i].substring(8,13);
				map.put("appoint_time", setTime);			
				insertCnt = userDAO.addAppointment(map);
			}
		}
		model.addAttribute("insertCnt", insertCnt);
	}

	@Override
	public void reservationList(HttpServletRequest req, Model model) {
		String doctor_id = (String) req.getSession().getAttribute("userSession");
		
		JSONArray jsonArray = new JSONArray();		
		ArrayList<ReservationVO> list = userDAO.getReservation(doctor_id);
				
		for(ReservationVO vo : list) {
			JSONObject rowArray = new JSONObject();
			String customer_id = vo.getCustomer_id();
			CustomerVO cus = null;
			cus = userDAO.getCustomerInfo(customer_id);
			
			// json에 값넣기
			rowArray.put("title", cus.getCustomer_name() + " (" + (2020 - cus.getCustomer_year()) + "세 " + cus.getCustomer_gender() + ")");
			rowArray.put("start", vo.getReservation_date());
			rowArray.put("url", "http://localhost/lifecare/doctor/doctor_medicalNote?customer_id=" + vo.getCustomer_id());
			jsonArray.add(rowArray);
		}	
		req.setAttribute("jsonArray", jsonArray);		
	}

	@Override
	public void diseaseList(HttpServletRequest req, Model model) {		
		String disease = req.getParameter("disease_code");
		
		List<DiseaseVO> list = new ArrayList<DiseaseVO>();
		list = userDAO.getDiseaseList(disease);

		model.addAttribute("list", list);
	}

	@Override
	public void drugList(HttpServletRequest req, Model model) {
		String drug = req.getParameter("drug");
		
		List<DrugVO> list = new ArrayList<DrugVO>();
		list = userDAO.getDrugList(drug);

		model.addAttribute("list", list);
	}

	@Override
	public void saveDiagonosis(HttpServletRequest req, Model model) {
		DiagnosisVO vo = new DiagnosisVO();
		vo.setDoctor_id((String) req.getSession().getAttribute("userSession"));
		vo.setCustomer_id(req.getParameter("customer_id"));
		vo.setDisease_code(req.getParameter("disease_code"));
		vo.setDiagnosis_bp(req.getParameter("bp"));
		vo.setDiagnosis_pr(req.getParameter("pr"));
		vo.setDiagnosis_rr(req.getParameter("rr"));
		vo.setDiagnosis_bt(req.getParameter("bt"));
		vo.setDiagnosis_cc(req.getParameter("cc"));
		vo.setDiagnosis_phx(req.getParameter("phx"));
		vo.setDiagnosis_fhx(req.getParameter("fhx"));
		vo.setDiagnosis_pi(req.getParameter("pi"));
		vo.setDiagnosis_ros(req.getParameter("ros"));
		vo.setDiagnosis_pex(req.getParameter("pex"));
		
		if(req.getParameter("drug1").length() != 0) {
			vo.setDrug1(Integer.parseInt(req.getParameter("drug1")));
		}
		if(req.getParameter("drug2").length() != 0) {
			vo.setDrug2(Integer.parseInt(req.getParameter("drug2")));
		}
		if(req.getParameter("drug3").length() != 0) {
			vo.setDrug3(Integer.parseInt(req.getParameter("drug3")));
		}
		if(req.getParameter("drug4").length() != 0) {
			vo.setDrug4(Integer.parseInt(req.getParameter("drug4")));
		}
		if(req.getParameter("drug5").length() != 0) {
			vo.setDrug5(Integer.parseInt(req.getParameter("drug5")));
		}
		if(req.getParameter("customer_amount").length() != 0) {
			vo.setCustomer_amount(Integer.parseInt(req.getParameter("customer_amount")));
		}
		
		System.out.println("drug 1 출력 : "+vo.getDrug1());
		int insertCnt = userDAO.insertDiagnosis(vo);
		model.addAttribute("insertCnt", insertCnt);
	}

	@Override
	public void diagnosisList(HttpServletRequest req, Model model) {
		String doctor_id = (String) req.getSession().getAttribute("userSession");
		List<DiagnosisVO> list = userDAO.getDiagnosisList(doctor_id);
		model.addAttribute("list", list);
	}
	
}

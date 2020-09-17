package com.spring.lifecare.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.lifecare.persistence.UserDAO;
import com.spring.lifecare.vo.CustomerVO;
import com.spring.lifecare.vo.DoctorVO;

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
//
//	@Override
//	public int doctorJoin(MultipartHttpServletRequest req, Model model) {
//        MultipartFile file = req.getFile("img");
//		
//		// 업로드할 파일의 최대 사이즈(10 * 1024 * 1024 = 10MB)
//		String saveDir = req.getSession().getServletContext().getRealPath("/resources/images/product/");	
//		String realDir = "D:\\DEV65\\workspace\\spring_mvcProject_ksj\\src\\main\\webapp\\resources\\images\\";
//		
//		try {
//			file.transferTo(new File(saveDir+file.getOriginalFilename()));
//			FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
//			FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
//			int data = 0;
//		
//		while((data = fis.read()) != -1) {
//		fos.write(data);
//		}
//		
//		fis.close();
//		fos.close();
//		
//		//화면으로부터 입력받은 값들을 받아온다. 
//		int doctor_num = Integer.parseInt(req.getParameter("doctor_num"));
//		String doctor_id = req.getParameter("doctor_id");
//		String doctor_pw =  req.getParameter("doctor_pw");
//        String doctor_name = req.getParameter("doctor_name");
//        String doctor_email = req.getParameter("doctor_email");
//        String doctor_phone = req.getParameter("doctor_phone");
//        String doctor_major = req.getParameter("doctor_major");
//        String doctor_position = req.getParameter("doctor_position");
//        String img = file.getOriginalFilename();
//		
//	
//	    DoctorVO vo = new DoctorVO();
//	    vo.setDoctor_num(doctor_num);
//		vo.setDoctor_id(doctor_id);
//		vo.setDoctor_name(doctor_name);
//	    vo.setDoctor_email(doctor_email);
//	    vo.setDoctor_phone(doctor_phone);
//	    vo.setDoctor_major(doctor_major);
//	    vo.setDoctor_position(doctor_position);
//		vo.setDoctor_faceimg(img);
//			
//		
//	    int insertCnt = UserDAO
//	    System.out.println("insertCnt :" + insertCnt );
//	    
//	    model.addAttribute("dtos", vo);
//	    model.addAttribute("insetCnt", insertCnt);
//	} catch(Exception e) {
//		e.printStackTrace();
//   }
//		
//	}

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
		
		fis.close();
		fos.close();
		
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
	    
	    cusotomerVO.setCustomer_id(req.getParameter(doctor_id));
	    cusotomerVO.setCustomer_pw(passwordEncoder.encode(doctor_pw));
	    cusotomerVO.setCustomer_name(req.getParameter(doctor_name));
	    cusotomerVO.setCustomer_email(req.getParameter(doctor_email));
	    cusotomerVO.setCustomer_phone(req.getParameter(doctor_phone));
	    cusotomerVO.setCustomer_gender(req.getParameter("customer_gender"));
	    cusotomerVO.setCustomer_year(Integer.parseInt(req.getParameter("customer_year")));
	    
	    int insertCnt2 = userDAO.insertMember(cusotomerVO);
	    
	    model.addAttribute("dtos", vo);
	    model.addAttribute("insetCnt", insertCnt);
	} catch(Exception e) {
		e.printStackTrace();
	}
	}

}

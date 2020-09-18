package com.spring.lifecare.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.lifecare.persistence.UserDAO;
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

	@Override
	public int doctorJoin(MultipartHttpServletRequest req, Model model) {
		return 0;
	
	}
}

package com.spring.lifecare.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class DiagnosisVO {
	
	private int diagnosis_num;
	private Timestamp diagnosis_time;
	private String customer_id;
	private String doctor_id;
	private String disease_code;
	private String diagnosis_bp;
	private String diagnosis_rr;
	private String diagnosis_pr;
	private String diagnosis_bt;
	private String diagnosis_cc;
	private String diagnosis_phx;
	private String diagnosis_fhx;
	private String diagnosis_pi;
	private String diagnosis_ros;
	private String diagnosis_pex;
	private int drug1;
	private int drug2;
	private int drug3;
	private int drug4;
	private int drug5;
	private int customer_amount;
	private int customer_payment;
	
	// 고객 
	private String insurance;
	private String customer_name;
	private int customer_year;
	private String customer_gender;
}

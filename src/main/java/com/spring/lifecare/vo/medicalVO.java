package com.spring.lifecare.vo;

import java.sql.Timestamp;

public class medicalVO {
	private int diagnosis_num;
	private String customer_id;
	private String customer_name;
	private String customer_gender;
	private String customer_year;
	private String customer_email;
	private String customer_phone;
	private String customer_age;
	private int doctor_num;
	private String doctor_id;
	private String doctor_name;
	private String doctor_major;
	private Timestamp diagnosis_time;
	private String diagnosis_phx;
	private String diagnosis_fhx;
	private String diagnosis_pi;
	private String diagnosis_ros;
	private String diagnosis_pex;
	private String customer_amount;
	private String disease_code;
	private String disease_name;
	private int rNum;
	
	public int getDiagnosis_num() {
		return diagnosis_num;
	}
	public void setDiagnosis_num(int diagnosis_num) {
		this.diagnosis_num = diagnosis_num;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	
	public String getCustomer_gender() {
		return customer_gender;
	}
	public void setCustomer_gender(String customer_gender) {
		this.customer_gender = customer_gender;
	}
	public String getCustomer_year() {
		return customer_year;
	}
	public void setCustomer_year(String customer_year) {
		this.customer_year = customer_year;
	}
	public String getCustomer_email() {
		return customer_email;
	}
	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}
	public String getCustomer_phone() {
		return customer_phone;
	}
	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}
	
	public String getCustomer_age() {
		return customer_age;
	}
	public void setCustomer_age(String customer_age) {
		this.customer_age = customer_age;
	}
	
	public int getDoctor_num() {
		return doctor_num;
	}
	public void setDoctor_num(int doctor_num) {
		this.doctor_num = doctor_num;
	}
	public String getDoctor_id() {
		return doctor_id;
	}
	public void setDoctor_id(String doctor_id) {
		this.doctor_id = doctor_id;
	}
	public String getDoctor_name() {
		return doctor_name;
	}
	public void setDoctor_name(String doctor_name) {
		this.doctor_name = doctor_name;
	}
	public String getDoctor_major() {
		return doctor_major;
	}
	public void setDoctor_major(String doctor_major) {
		this.doctor_major = doctor_major;
	}
	public Timestamp getDiagnosis_time() {
		return diagnosis_time;
	}
	public void setDiagnosis_time(Timestamp diagnosis_time) {
		this.diagnosis_time = diagnosis_time;
	}
	public String getDiagnosis_phx() {
		return diagnosis_phx;
	}
	public void setDiagnosis_phx(String diagnosis_phx) {
		this.diagnosis_phx = diagnosis_phx;
	}
	public String getDiagnosis_fhx() {
		return diagnosis_fhx;
	}
	public void setDiagnosis_fhx(String diagnosis_fhx) {
		this.diagnosis_fhx = diagnosis_fhx;
	}
	public String getDiagnosis_pi() {
		return diagnosis_pi;
	}
	public void setDiagnosis_pi(String diagnosis_pi) {
		this.diagnosis_pi = diagnosis_pi;
	}
	public String getDiagnosis_ros() {
		return diagnosis_ros;
	}
	public void setDiagnosis_ros(String diagnosis_ros) {
		this.diagnosis_ros = diagnosis_ros;
	}
	public String getDiagnosis_pex() {
		return diagnosis_pex;
	}
	public void setDiagnosis_pex(String diagnosis_pex) {
		this.diagnosis_pex = diagnosis_pex;
	}
	public String getCustomer_amount() {
		return customer_amount;
	}
	public void setCustomer_amount(String customer_amount) {
		this.customer_amount = customer_amount;
	}
	
	public String getDisease_code() {
		return disease_code;
	}
	public void setDisease_code(String disease_code) {
		this.disease_code = disease_code;
	}
	public String getDisease_name() {
		return disease_name;
	}
	public void setDisease_name(String disease_name) {
		this.disease_name = disease_name;
	}
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

}

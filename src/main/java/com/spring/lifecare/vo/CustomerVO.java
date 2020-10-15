package com.spring.lifecare.vo;

import java.sql.Timestamp;

public class CustomerVO {
	
	private String customer_id;
	private String customer_pw;
	private String customer_repw;
	private String customer_email;
	private String customer_name;
	private String customer_phone;
	private Timestamp customer_joindate;
	private String customer_fingerprint;
	private Timestamp customer_logindate;
	private String authority;
	private int enabled;
	private String customer_gender;
	private int customer_year;
	private String insurance;
	private String customer_echeck;
	
	// 진단
	private String disease_code;
	private Timestamp diagnosis_time;
	private String diagnosis_pi;
	private int diagnosis_num;
	
	public int getDiagnosis_num() {
		return diagnosis_num;
	}
	public void setDiagnosis_num(int diagnosis_num) {
		this.diagnosis_num = diagnosis_num;
	}
	public String getCustomer_echeck() {
		return customer_echeck;
	}
	public void setCustomer_echeck(String customer_echeck) {
		this.customer_echeck = customer_echeck;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_pw() {
		return customer_pw;
	}
	public void setCustomer_pw(String customer_pw) {
		this.customer_pw = customer_pw;
	}
	public String getCustomer_repw() {
		return customer_repw;
	}
	public void setCustomer_repw(String customer_repw) {
		this.customer_repw = customer_repw;
	}
	public String getCustomer_email() {
		return customer_email;
	}
	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_phone() {
		return customer_phone;
	}
	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}
	public Timestamp getCustomer_joindate() {
		return customer_joindate;
	}
	public void setCustomer_joindate(Timestamp customer_joindate) {
		this.customer_joindate = customer_joindate;
	}
	public String getCustomer_fingerprint() {
		return customer_fingerprint;
	}
	public void setCustomer_fingerprint(String customer_fingerprint) {
		this.customer_fingerprint = customer_fingerprint;
	}
	public Timestamp getCustomer_logindate() {
		return customer_logindate;
	}
	public void setCustomer_logindate(Timestamp customer_logindate) {
		this.customer_logindate = customer_logindate;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;	
	}
	public String getCustomer_gender() {
		return customer_gender;
	}
	public void setCustomer_gender(String customer_gender) {
		this.customer_gender = customer_gender;
	}
	public int getCustomer_year() {
		return customer_year;
	}
	public void setCustomer_year(int customer_year) {
		this.customer_year = customer_year;
	}
	public String getInsurance() {
		return insurance;
	}
	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}
	public String getDisease_code() {
		return disease_code;
	}
	public void setDisease_code(String disease_code) {
		this.disease_code = disease_code;
	}
	public Timestamp getDiagnosis_time() {
		return diagnosis_time;
	}
	public void setDiagnosis_time(Timestamp diagnosis_time) {
		this.diagnosis_time = diagnosis_time;
	}
	public String getDiagnosis_pi() {
		return diagnosis_pi;
	}
	public void setDiagnosis_pi(String diagnosis_pi) {
		this.diagnosis_pi = diagnosis_pi;
	}
	@Override
	public String toString() {
		return "CustomerVO [customer_id=" + customer_id + ", customer_pw=" + customer_pw + ", customer_repw="
				+ customer_repw + ", customer_email=" + customer_email + ", customer_name=" + customer_name
				+ ", customer_phone=" + customer_phone + ", customer_joindate=" + customer_joindate
				+ ", customer_fingerprint=" + customer_fingerprint + ", customer_logindate=" + customer_logindate
				+ ", authority=" + authority + ", enabled=" + enabled + ", customer_gender=" + customer_gender
				+ ", customer_year=" + customer_year + ", insurance=" + insurance + ", customer_echeck="
				+ customer_echeck + ", disease_code=" + disease_code + ", diagnosis_time=" + diagnosis_time
				+ ", diagnosis_pi=" + diagnosis_pi + "]";
	}		
}


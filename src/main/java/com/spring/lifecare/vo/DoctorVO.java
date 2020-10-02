package com.spring.lifecare.vo;

import java.sql.Timestamp;

public class DoctorVO {
	
    private int doctor_num;      
    private String doctor_faceimg;     
    private String doctor_id;
    private String doctor_pw;  
    private String doctor_name;  
    private String doctor_email; 
    private String doctor_phone; 
    private String doctor_major;
    private String doctor_position; 
    private Timestamp doctor_joindate;
    private String authority;
    private String customer_gender;
	private int customer_year;
    private int enabled;
    
	public String getCustomer_gender() {
		return customer_gender;
	}
	public int getCustomer_year() {
		return customer_year;
	}
	public void setCustomer_gender(String customer_gender) {
		this.customer_gender = customer_gender;
	}
	public void setCustomer_year(int customer_year) {
		this.customer_year = customer_year;
	}
	public int getDoctor_num() {
		return doctor_num;
	}
	public void setDoctor_num(int doctor_num) {
		this.doctor_num = doctor_num;
	}
	public String getDoctor_faceimg() {
		return doctor_faceimg;
	}
	public void setDoctor_faceimg(String doctor_faceimg) {
		this.doctor_faceimg = doctor_faceimg;
	}
	public String getDoctor_id() {
		return doctor_id;
	}
	public void setDoctor_id(String doctor_id) {
		this.doctor_id = doctor_id;
	}
	public String getDoctor_pw() {
		return doctor_pw;
	}
	public void setDoctor_pw(String doctor_pw) {
		this.doctor_pw = doctor_pw;
	}
	public String getDoctor_name() {
		return doctor_name;
	}
	public void setDoctor_name(String doctor_name) {
		this.doctor_name = doctor_name;
	}
	public String getDoctor_email() {
		return doctor_email;
	}
	public void setDoctor_email(String doctor_email) {
		this.doctor_email = doctor_email;
	}
	public String getDoctor_phone() {
		return doctor_phone;
	}
	public void setDoctor_phone(String doctor_phone) {
		this.doctor_phone = doctor_phone;
	}
	public String getDoctor_major() {
		return doctor_major;
	}
	public void setDoctor_major(String doctor_major) {
		this.doctor_major = doctor_major;
	}
	public String getDoctor_position() {
		return doctor_position;
	}
	public void setDoctor_position(String doctor_position) {
		this.doctor_position = doctor_position;
	}
	public Timestamp getDoctor_joindate() {
		return doctor_joindate;
	}
	public void setDoctor_joindate(Timestamp doctor_joindate) {
		this.doctor_joindate = doctor_joindate;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
  
    
	

}

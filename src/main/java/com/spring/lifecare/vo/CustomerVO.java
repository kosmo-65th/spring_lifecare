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
	
}

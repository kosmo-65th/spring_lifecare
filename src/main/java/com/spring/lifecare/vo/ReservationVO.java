package com.spring.lifecare.vo;

import java.sql.Timestamp;

public class ReservationVO {
	
	private int appoint_num;
	private Timestamp reservation_date;
	private String doctor_id;
	private String customer_id;
	
	// 고객정보
	private String insurance;
	
	// 닥터정보
	private String doctor_name;
	private String doctor_major;
	
	public int getReservation_num() {
		return appoint_num;
	}
	public void setReservation_num(int appoint_num) {
		this.appoint_num = appoint_num;
	}
	public Timestamp getReservation_date() {
		return reservation_date;
	}
	public void setReservation_date(Timestamp reservation_date) {
		this.reservation_date = reservation_date;
	}
	public String getDoctor_id() {
		return doctor_id;
	}
	public void setDoctor_id(String doctor_id) {
		this.doctor_id = doctor_id;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public int getAppoint_num() {
		return appoint_num;
	}
	public void setAppoint_num(int appoint_num) {
		this.appoint_num = appoint_num;
	}
	public String getInsurance() {
		return insurance;
	}
	public void setInsurance(String insurance) {
		this.insurance = insurance;
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
		
}

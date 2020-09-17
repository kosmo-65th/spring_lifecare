package com.spring.lifecare.vo;

import java.sql.Timestamp;

public class ReservationVO {
	
	private int appoint_num;
	private Timestamp reservation_date;
	private String doctor_id;
	private String customer_id;

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
		
}

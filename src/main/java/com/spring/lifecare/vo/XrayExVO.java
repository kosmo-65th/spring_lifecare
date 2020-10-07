package com.spring.lifecare.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class XrayExVO {
	int xray_num;
	String customer_id;
	String xray_img;
	String normal_percentage;
	String corona_percentage;
	String pneumonia_percentage;
	String xray_result;
	Timestamp xray_date;
	
	// 고객
	String customer_name;
	String customer_gender;
}

package com.spring.lifecare.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BasicExVO {
	int ex_num;
	String customer_id;
	String height;
	String weight;
	String tc;
	String tg;
	String ldl;
	String hdl;
	String blood1;
	String blood2;
	String blood3;
	String bloodSugar;
	String white;
	String hb;
	String ast;
	String alt;
	String gtp;
	String kidney1;
	String kidney2;
	String kidney3;
	String kidney4;
	String ex_result;
	Timestamp basic_date;
	
	// 고객
	String customer_name;
	String customer_gender;
}

package com.spring.lifecare.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CancerVO {
	int cancer_num;
	String customer_id;
	String radius;
	String texture;
	String perimeter;
	String area;
	String smoothness;
	String compactness;
	String concavity;
	String symmetry;
	String fractal_dimension;
	String percentage;
	String age;
	String cancer_result;
	Timestamp cancer_date;
	
	// 고객정보
	String customer_name;
	String customer_gender;
}

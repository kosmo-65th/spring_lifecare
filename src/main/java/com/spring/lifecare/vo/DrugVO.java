package com.spring.lifecare.vo;

import lombok.Data;

@Data
public class DrugVO  {

	private int drug_number;  				// 품목일련번호
	private String drug_name;				// 약품명
	private String drug_enptname; 			// 업체명
	private String drug_shape;				// 약품 모양 컬럼
	private String drug_productimage;		// 약품 이미지
	private String drug_frontShape;			// 약품 표시앞
	private String drug_formulation;		// 제형
	private String drug_color;				// 약품 색깔
	private float drug_size_l;				// 약품 장축 
	private float drug_size_s;				// 약품 단축 
	private float drug_size_w;				// 약품  컬럼 컬럼
	private String drug_category;			// 약품 분류명
	private String drug_division;			// 약품의 전문 or 비전문 기입 컬럼
	private String drug_license_date;		// 약품 허가일
	private String drug_effect;				// 약품 효능 및 효과
	private String drug_storage;			// 약품 저장방법
	private String drug_expiration_date;	// 약품  유효기간
	private String drug_dosage;				// 약품 복용량
	private String drug_additives;			// 약품 첨가제명
	private String drug_precautions;		// 약품 주의사항			
}

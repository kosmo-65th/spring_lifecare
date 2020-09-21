package com.spring.lifecare.vo;

import java.sql.Timestamp;

public class questionnaireVO {
	
	//서치 테이블
	private int health_sortnum;
	private String customer_id;
	private Timestamp health_write;
	
	//문진표 테이블(질환력) healthcheck
	private int check_pstroke_diagnosis;
	private int check_pstroke_medication;
	private int check_pmyocardial_diagnosis;
	private int check_pmyocardial_medication;
	private int check_pbp_diagnosis;
	private int check_pbp_medication;
	private int check_pdiabetes_diagnosis;
	private int check_pdiabetes_medication;
	private int check_pdyslipidemia_diagnosis;
	private int check_pdyslipidemia_medication;
	private int check_ptuberculosis_diagnosis;
	private int check_ptuberculosis_medication;
	private int check_petc_diagnosis;
	private int check_petc_medication;
	private int check_fstroke_diagnosis;
	private int check_fmyocardial_diagnosis;
	private int check_fbp_diagnosis;
	private int check_fdiabetes_diagnosis;
	private int check_fetc_diagnosis;
	private int check_hepatitis_diagnosis;
	
	//문진표 테이블(흡연) healthcheck1
	private int healthcheck_smoke_diagnosis;
	private String healthcheck_smoke_ayear;
	private String healthcheck_smoke_acount;
	private String healthcheck_smoke_nyear;
	private String healthcheck_smoke_ncount;
	private int healthcheck_esmoke_use;
	private int healthcheck_esmoke_year;
	
	//문진표 테이블(음주) healthcheck2
	private int healthcheck_drink_check;
	private String healthcheck_drink_sdcount;
	private String healthcheck_drink_mdcount;
	private String healthcheck_drink_bdcount;
	private String healthcheck_drink_brdcount;
	private String healthcheck_drink_wdcount;
	private String healthcheck_drink_smcount;
	private String healthcheck_drink_mmcount;
	private String healthcheck_drink_bmcount;
	private String healthcheck_drink_brmcount;
	private String healthcheck_drink_wmcount;
	
	//문진표 테이블(음주) healthcheck3
	private String healthcheck_hexercise_day;
	private String healthcheck_hexercise_hour;
	private String healthcheck_hexercise_min;
	private String healthcheck_mexercise_day;
	private String healthcheck_mexercise_hour;
	private String healthcheck_mexercise_min;
	private String healthcheck_strengthtraining;
	
	//문진표 테이블(질환력) healthcheck
	public int getCheck_pstroke_diagnosis() {
		return check_pstroke_diagnosis;
	}
	public void setCheck_pstroke_diagnosis(int check_pstroke_diagnosis) {
		this.check_pstroke_diagnosis = check_pstroke_diagnosis;
	}
	public int getCheck_pstroke_medication() {
		return check_pstroke_medication;
	}
	public void setCheck_pstroke_medication(int check_pstroke_medication) {
		this.check_pstroke_medication = check_pstroke_medication;
	}
	public int getCheck_pmyocardial_diagnosis() {
		return check_pmyocardial_diagnosis;
	}
	public void setCheck_pmyocardial_diagnosis(int check_pmyocardial_diagnosis) {
		this.check_pmyocardial_diagnosis = check_pmyocardial_diagnosis;
	}
	public int getCheck_pmyocardial_medication() {
		return check_pmyocardial_medication;
	}
	public void setCheck_pmyocardial_medication(int check_pmyocardial_medication) {
		this.check_pmyocardial_medication = check_pmyocardial_medication;
	}
	public int getCheck_pbp_diagnosis() {
		return check_pbp_diagnosis;
	}
	public void setCheck_pbp_diagnosis(int check_pbp_diagnosis) {
		this.check_pbp_diagnosis = check_pbp_diagnosis;
	}
	public int getCheck_pbp_medication() {
		return check_pbp_medication;
	}
	public void setCheck_pbp_medication(int check_pbp_medication) {
		this.check_pbp_medication = check_pbp_medication;
	}
	public int getCheck_pdiabetes_diagnosis() {
		return check_pdiabetes_diagnosis;
	}
	public void setCheck_pdiabetes_diagnosis(int check_pdiabetes_diagnosis) {
		this.check_pdiabetes_diagnosis = check_pdiabetes_diagnosis;
	}
	public int getCheck_pdiabetes_medication() {
		return check_pdiabetes_medication;
	}
	public void setCheck_pdiabetes_medication(int check_pdiabetes_medication) {
		this.check_pdiabetes_medication = check_pdiabetes_medication;
	}
	public int getCheck_pdyslipidemia_diagnosis() {
		return check_pdyslipidemia_diagnosis;
	}
	public void setCheck_pdyslipidemia_diagnosis(int check_pdyslipidemia_diagnosis) {
		this.check_pdyslipidemia_diagnosis = check_pdyslipidemia_diagnosis;
	}
	public int getCheck_pdyslipidemia_medication() {
		return check_pdyslipidemia_medication;
	}
	public void setCheck_pdyslipidemia_medication(int check_pdyslipidemia_medication) {
		this.check_pdyslipidemia_medication = check_pdyslipidemia_medication;
	}
	public int getCheck_ptuberculosis_diagnosis() {
		return check_ptuberculosis_diagnosis;
	}
	public void setCheck_ptuberculosis_diagnosis(int check_ptuberculosis_diagnosis) {
		this.check_ptuberculosis_diagnosis = check_ptuberculosis_diagnosis;
	}
	public int getCheck_ptuberculosis_medication() {
		return check_ptuberculosis_medication;
	}
	public void setCheck_ptuberculosis_medication(int check_ptuberculosis_medication) {
		this.check_ptuberculosis_medication = check_ptuberculosis_medication;
	}
	public int getCheck_petc_diagnosis() {
		return check_petc_diagnosis;
	}
	public void setCheck_petc_diagnosis(int check_petc_diagnosis) {
		this.check_petc_diagnosis = check_petc_diagnosis;
	}
	public int getCheck_petc_medication() {
		return check_petc_medication;
	}
	public void setCheck_petc_medication(int check_petc_medication) {
		this.check_petc_medication = check_petc_medication;
	}
	public int getCheck_fstroke_diagnosis() {
		return check_fstroke_diagnosis;
	}
	public void setCheck_fstroke_diagnosis(int check_fstroke_diagnosis) {
		this.check_fstroke_diagnosis = check_fstroke_diagnosis;
	}
	public int getCheck_fmyocardial_diagnosis() {
		return check_fmyocardial_diagnosis;
	}
	public void setCheck_fmyocardial_diagnosis(int check_fmyocardial_diagnosis) {
		this.check_fmyocardial_diagnosis = check_fmyocardial_diagnosis;
	}
	public int getCheck_fbp_diagnosis() {
		return check_fbp_diagnosis;
	}
	public void setCheck_fbp_diagnosis(int check_fbp_diagnosis) {
		this.check_fbp_diagnosis = check_fbp_diagnosis;
	}
	public int getCheck_fdiabetes_diagnosis() {
		return check_fdiabetes_diagnosis;
	}
	public void setCheck_fdiabetes_diagnosis(int check_fdiabetes_diagnosis) {
		this.check_fdiabetes_diagnosis = check_fdiabetes_diagnosis;
	}
	public int getCheck_fetc_diagnosis() {
		return check_fetc_diagnosis;
	}
	public void setCheck_fetc_diagnosis(int check_fetc_diagnosis) {
		this.check_fetc_diagnosis = check_fetc_diagnosis;
	}
	public int getCheck_hepatitis_diagnosis() {
		return check_hepatitis_diagnosis;
	}
	public void setCheck_hepatitis_diagnosis(int check_hepatitis_diagnosis) {
		this.check_hepatitis_diagnosis = check_hepatitis_diagnosis;
	}
	//문진표 테이블(질환력) healthcheck
	
	//서치 테이블
	public int getHealth_sortnum() {
		return health_sortnum;
	}
	public void setHealth_sortnum(int health_sortnum) {
		this.health_sortnum = health_sortnum;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public Timestamp getHealth_write() {
		return health_write;
	}
	public void setHealth_write(Timestamp health_write) {
		this.health_write = health_write;
	}
	//서치 테이블
	
	//문진표 테이블(흡연) healthcheck1
	public int getHealthcheck_smoke_diagnosis() {
		return healthcheck_smoke_diagnosis;
	}
	public void setHealthcheck_smoke_diagnosis(int healthcheck_smoke_diagnosis) {
		this.healthcheck_smoke_diagnosis = healthcheck_smoke_diagnosis;
	}
	public String getHealthcheck_smoke_ayear() {
		return healthcheck_smoke_ayear;
	}
	public void setHealthcheck_smoke_ayear(String healthcheck_smoke_ayear) {
		this.healthcheck_smoke_ayear = healthcheck_smoke_ayear;
	}
	public String getHealthcheck_smoke_acount() {
		return healthcheck_smoke_acount;
	}
	public void setHealthcheck_smoke_acount(String healthcheck_smoke_acount) {
		this.healthcheck_smoke_acount = healthcheck_smoke_acount;
	}
	public String getHealthcheck_smoke_nyear() {
		return healthcheck_smoke_nyear;
	}
	public void setHealthcheck_smoke_nyear(String healthcheck_smoke_nyear) {
		this.healthcheck_smoke_nyear = healthcheck_smoke_nyear;
	}
	public String getHealthcheck_smoke_ncount() {
		return healthcheck_smoke_ncount;
	}
	public void setHealthcheck_smoke_ncount(String healthcheck_smoke_ncount) {
		this.healthcheck_smoke_ncount = healthcheck_smoke_ncount;
	}
	public int getHealthcheck_esmoke_use() {
		return healthcheck_esmoke_use;
	}
	public void setHealthcheck_esmoke_use(int healthcheck_esmoke_use) {
		this.healthcheck_esmoke_use = healthcheck_esmoke_use;
	}
	public int getHealthcheck_esmoke_year() {
		return healthcheck_esmoke_year;
	}
	public void setHealthcheck_esmoke_year(int healthcheck_esmoke_year) {
		this.healthcheck_esmoke_year = healthcheck_esmoke_year;
	}
	//문진표 테이블(흡연) healthcheck1
	
	//문진표 테이블(음주) healthcheck2
	public int getHealthcheck_drink_check() {
		return healthcheck_drink_check;
	}
	public void setHealthcheck_drink_check(int healthcheck_drink_check) {
		this.healthcheck_drink_check = healthcheck_drink_check;
	}
	public String getHealthcheck_drink_sdcount() {
		return healthcheck_drink_sdcount;
	}
	public void setHealthcheck_drink_sdcount(String healthcheck_drink_sdcount) {
		this.healthcheck_drink_sdcount = healthcheck_drink_sdcount;
	}
	public String getHealthcheck_drink_mdcount() {
		return healthcheck_drink_mdcount;
	}
	public void setHealthcheck_drink_mdcount(String healthcheck_drink_mdcount) {
		this.healthcheck_drink_mdcount = healthcheck_drink_mdcount;
	}
	public String getHealthcheck_drink_bdcount() {
		return healthcheck_drink_bdcount;
	}
	public void setHealthcheck_drink_bdcount(String healthcheck_drink_bdcount) {
		this.healthcheck_drink_bdcount = healthcheck_drink_bdcount;
	}
	public String getHealthcheck_drink_brdcount() {
		return healthcheck_drink_brdcount;
	}
	public void setHealthcheck_drink_brdcount(String healthcheck_drink_brdcount) {
		this.healthcheck_drink_brdcount = healthcheck_drink_brdcount;
	}
	public String getHealthcheck_drink_wdcount() {
		return healthcheck_drink_wdcount;
	}
	public void setHealthcheck_drink_wdcount(String healthcheck_drink_wdcount) {
		this.healthcheck_drink_wdcount = healthcheck_drink_wdcount;
	}
	public String getHealthcheck_drink_smcount() {
		return healthcheck_drink_smcount;
	}
	public void setHealthcheck_drink_smcount(String healthcheck_drink_smcount) {
		this.healthcheck_drink_smcount = healthcheck_drink_smcount;
	}
	public String getHealthcheck_drink_mmcount() {
		return healthcheck_drink_mmcount;
	}
	public void setHealthcheck_drink_mmcount(String healthcheck_drink_mmcount) {
		this.healthcheck_drink_mmcount = healthcheck_drink_mmcount;
	}
	public String getHealthcheck_drink_bmcount() {
		return healthcheck_drink_bmcount;
	}
	public void setHealthcheck_drink_bmcount(String healthcheck_drink_bmcount) {
		this.healthcheck_drink_bmcount = healthcheck_drink_bmcount;
	}
	public String getHealthcheck_drink_brmcount() {
		return healthcheck_drink_brmcount;
	}
	public void setHealthcheck_drink_brmcount(String healthcheck_drink_brmcount) {
		this.healthcheck_drink_brmcount = healthcheck_drink_brmcount;
	}
	public String getHealthcheck_drink_wmcount() {
		return healthcheck_drink_wmcount;
	}
	public void setHealthcheck_drink_wmcount(String healthcheck_drink_wmcount) {
		this.healthcheck_drink_wmcount = healthcheck_drink_wmcount;
	}
	//문진표 테이블(음주) healthcheck2
	
	//문진표 테이블(음주) healthcheck3
	public String getHealthcheck_hexercise_day() {
		return healthcheck_hexercise_day;
	}
	public void setHealthcheck_hexercise_day(String healthcheck_hexercise_day) {
		this.healthcheck_hexercise_day = healthcheck_hexercise_day;
	}
	public String getHealthcheck_hexercise_hour() {
		return healthcheck_hexercise_hour;
	}
	public void setHealthcheck_hexercise_hour(String healthcheck_hexercise_hour) {
		this.healthcheck_hexercise_hour = healthcheck_hexercise_hour;
	}
	public String getHealthcheck_hexercise_min() {
		return healthcheck_hexercise_min;
	}
	public void setHealthcheck_hexercise_min(String healthcheck_hexercise_min) {
		this.healthcheck_hexercise_min = healthcheck_hexercise_min;
	}
	public String getHealthcheck_mexercise_day() {
		return healthcheck_mexercise_day;
	}
	public void setHealthcheck_mexercise_day(String healthcheck_mexercise_day) {
		this.healthcheck_mexercise_day = healthcheck_mexercise_day;
	}
	public String getHealthcheck_mexercise_hour() {
		return healthcheck_mexercise_hour;
	}
	public void setHealthcheck_mexercise_hour(String healthcheck_mexercise_hour) {
		this.healthcheck_mexercise_hour = healthcheck_mexercise_hour;
	}
	public String getHealthcheck_mexercise_min() {
		return healthcheck_mexercise_min;
	}
	public void setHealthcheck_mexercise_min(String healthcheck_mexercise_min) {
		this.healthcheck_mexercise_min = healthcheck_mexercise_min;
	}
	public String getHealthcheck_strengthtraining() {
		return healthcheck_strengthtraining;
	}
	public void setHealthcheck_strengthtraining(String healthcheck_strengthtraining) {
		this.healthcheck_strengthtraining = healthcheck_strengthtraining;
	}
	//문진표 테이블(음주) healthcheck3
	
}

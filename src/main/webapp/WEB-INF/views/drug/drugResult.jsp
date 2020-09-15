<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/resources/setting/setting.jsp" %> 

<!DOCTYPE html>
<html>
  <!-- Basic -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="initial-scale=1, maximum-scale=1">
  <!-- Site Metas -->
  <title>Life Care</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta name="author" content="">
  <!-- CSS -->
<link rel="stylesheet" href="${path_resources_lifecare}css/bootstrap2.min.css">
<link rel="stylesheet" href="${path_resources_lifecare}style2.css">
<link rel="stylesheet" href="${path_resources_lifecare}css/colors.css">
<link rel="stylesheet" href="${path_resources_lifecare}css/versions.css">
<link rel="stylesheet" href="${path_resources_lifecare}css/responsive.css">
<link rel="stylesheet" href="${path_resources_lifecare}css/custom.css">

<link rel="stylesheet" href="${drug_Cpath}base.css"type="text/css">
<link rel="stylesheet" href="${drug_Cpath}common.css" type="text/css">
<link rel="stylesheet" href="${drug_Cpath}sub.css" type="text/css">

<script src="${path_resources_js}placeholders.min.js"></script>
<script src="${path_resources_js}jquery.min.js"></script>
<script src="${path_resources_js}sub.dev.js"></script>
<script src="${path_resources_js}drug_main.js"></script>
<script src="${path_resources_js}jquery.isinview.js"></script>
<script src="${path_resources_js}drug_sub.js"></script>
<script src="${path_resources_js}jquery.bxslider.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.loadingoverlay/latest/loadingoverlay.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.loadingoverlay/latest/loadingoverlay_progress.min.js"></script>


<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script>


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script type="text/javascript">

function on_key_down() {
	var keycode = event.keyCode;
	if ( keycode == 27){
		$("#idfy_img_li>div>div>a:eq(0)").click()
	} 
	
	//event.returnValue = false; // 브라우저 기능 키 무효화
}	


$( document ).ready(function() {
	
	//의약품 상세정보 drug_cd와 호출
	result_drug();

	//맞춤형 복약안내 링크 호출
//	result_take_pro();

	//$("#td_bbs_info").find("br:eq(0)").remove();

	//$("#druginfo02>ul>li:eq(0)").click();
	
	//$("#pop_more").draggable();
	
	$(".pop_more").drags();
	//화면이 ... 이동시 subtab 고정	
	var offset=1200;
	$(window).scroll(function(){
		if($(this).scrollTop()>1200  ){
			if (!$('#druginfo02 h3.subtitle').isInView() && !$("#subtab").hasClass('fixed')) {
			$("#subtab").addClass("fixed");
			}
		}else {
			$("#subtab").removeClass("fixed");
		};
	});	
/* 
	//첨가제 팝업 보이기/숨기기
	$("#additives_td").children("#more_additives").mouseenter(function(){
		$("#more_additives_popup").css("display","");
	}).mouseleave(function(){
		$("#more_additives_popup").css("display","none");
    });
 */
});
/* 
$(window).load(function(){
	$(".popupbx").draggable(); 
});
*/

function result_drug(){
	
	//loading overlay on
	$("#druginfo01").LoadingOverlay("show"); 
	//데이터 호출
	$.ajax({
		type:"GET",
		url:'/searchDrug/ajax/ajax_result_drug2.asp?drug_cd=2019121000003',
//		url:'http://localapi.health.kr:8090/result_drug.localapi?drug_cd=2019121000003',
		async:false,
		cache: false,
		dataType:"JSON",
//		dataType:"jsonp",
		success:function(data){			
//			console.log(data);			

			if(data[0].upso_name.substring(0,4) == "한미약품"){
				$("#search_pharm").css('display','');
			}else{
				$("#search_pharm").css('display','none');
			}

			//최근 본 제품 및 성분.
//			recentview_word(data[0].drug_name);
			recentview_word(data[0].drug_name,'/searchDrug/result_drug.asp?drug_cd=2019121000003');

			// 1. 제품명
			if (data[0].drug_enm != null && data[0].drug_enm.length > 0) {
				$("#result_drug_name").html(data[0].drug_name+"  <span id='result_drug_ename'>"+data[0].drug_enm+"</span>");
				//타이틀 변경
				document.title = data[0].drug_name + ' ' + data[0].drug_enm + ' 의약품 정보';
			} else {
				$("#result_drug_name").text(data[0].drug_name);
				//타이틀 변경
				document.title = data[0].drug_name + ' 의약품 정보';
			}


			//$("#result_drug_name").text(data[0].drug_name+"  ("+data[0].drug_enm+")");
			$("#idfy_nm").text(data[0].drug_name + " 식별표시");
			$("#search_pharm").attr("href","http://searchpharm.co.kr/?q="+encodeURIComponent(data[0].drug_name));

			//dur더보기 hidden form 값 셋팅
			$("#drug_name_hidden").val(data[0].drug_name);
			$("#searchWord").val(data[0].drug_name);
			$("#list_sunb_name_hidden").val(data[0].list_sunb_name);
			

			// 2. 성분 및 함량
//			var sunbReplace = "";
//			sunbReplace = data[0].sunb;			
//			sunbReplace = sunbReplace.replace(/@/g,'<br/>');
			
//			$("#ingr_mg").html("<li>"+sunbReplace+"</li>");


			var temp = data[0].sunb;
			var varRegexp = new RegExp("|","ig");
			var chkTrue = temp.match(varRegexp);
			
			var htmlData = "";

			var tmplist, tmpsplit;
			if(chkTrue == null){
				//null일경우 야간용 나누는게 없음
				tmplist = data[0].sunb.split("|");
				for(var t=0; t < tmplist.length; t++){	
					htmlData += "<li>"+tmplist[t].replace("@","")+"</li>"
				}
				$("#ingr_mg").html(htmlData);
				$("#ingr_mg").css("display","");
			}else{
				
				var tmppre;
				tmplist = data[0].sunb.split("|");
				
				for(var t=0; t < tmplist.length; t++){	
					
					tmpsplit = (tmplist[t]+"@").split("@");
					tmpsplit[1] = tmpsplit[1].replace(/(^\s*)|(\s*$)/gi, "");

//						alert(tmpsplit[1])

					if(tmppre != tmpsplit[1]) {
						tmppre = tmpsplit[1]
						htmlData += "<h3>"+tmpsplit[1]+"</h3>"
					}
					htmlData += "<li>"+tmpsplit[0]+"</li>"
				}

				$("#ingr_mg").html(htmlData);
				$("#ingr_mg").css("display","");
			}

			//2018-01-29 공캡슐 처리
			if($("#ingr_mg>li:eq(0)").text() == "") {
				$("#sunb_Btn").hide();
			}


			// 3. 전문-일반
			if(data[0].drug_cls != ""){
				if(data[0].drug_cls == "1"){
					$("#drug_cls").text('전문');
				}else if(data[0].drug_cls == "2"){
					$("#drug_cls").text('일반');
				}else if(data[0].drug_cls == "3"){
					$("#drug_cls").text('전문(희귀)');
				}		
			}

			// 첨가제
			if(data[0].additives != ""){
				var dataList;
				var moreList;
				var maxLength; //더보기 팝업 width 설정을 위한 변수
				
				htmlData = "";
				moreList = "";
				maxLength = 0;

				dataList = data[0].additives.split("</br>");
				
				for(var z=0; z<dataList.length; z++){
					
					if(z < 3){
						htmlData += dataList[z] + "</br>";
					}
					//첨가제 항목이 3가지 이상일 때 div 팝업으로 보여주기 위해 세팅
					else{
						moreList += dataList[z] + "</br>";

						//팝업 width 길이 계산
						if (maxLength < dataList[z].length){
							maxLength = dataList[z].length;
						}

					}
					//console.log(moreList);
					
				}

				//팝업 width 길이 계산
				maxLength = maxLength * 10;

				$("#additives").html(htmlData);
				
				//첨가제 항목이 3가지 이상일 때 div 팝업 노출
				if (moreList != ""){
					$("#more_additives_list").html(moreList);
					$("#more_additives").css("display","");
					$("#more_additives_popup").css("width",maxLength + "px");
					$("#more_additives_list").css("width",maxLength + "px");
				}
				else{
					$("#more_additives").css("display","none");
				}

			}

			// 마약류
			if(data[0].narcotic_kind_code != ""){
				if(data[0].narcotic_kind_code == "A"){
					$("#narcotic_kind").text('(마약)');
				}else if(data[0].narcotic_kind_code == "B"){
					$("#narcotic_kind").text('(향정)');
				}else if(data[0].narcotic_kind_code == "C"){
					$("#narcotic_kind").text('(한외마약)');
				}else if(data[0].narcotic_kind_code == "D"){
					$("#narcotic_kind").text('(오남용의약품)');
				}
			}

			
			// 4. 단일-복합
			if(data[0].item_ingr_type != ""){
				if(data[0].item_ingr_type == "1"){
					$("#sunb_count").text('단일');
				}else{
					$("#sunb_count").text('복합');
				}			
			}

			
			// 5. 제조-수입사
			if(data[0].upso_name != ""){
			var upsoNmSplit = "";
				upsoNmSplit = data[0].upso_name.split("|");
				
				if(upsoNmSplit[5] != "") {
					$("#a_upso_view_sply").click(function(){window.open("http://"+upsoNmSplit[5]);});
					$("#a_upso_view_sply").css("display","");
				}else{
					$("#a_upso_view_sply").css("display","none");
				}
				$("#upso_title").text(upsoNmSplit[0]);
				$("#upso_nm").text(upsoNmSplit[0]);
				$("#upso_enm").text(upsoNmSplit[1]);
				$("#upso_addr").text(upsoNmSplit[2]);
				$("#upso_callnum").text(upsoNmSplit[3]);
				$("#upso_faxnum").text(upsoNmSplit[4]);
				$("#upso_url").html("<a href='http://"+upsoNmSplit[5]+"' target='_blank' >"+upsoNmSplit[5]+"</a>");	
				
					
				//하단 전체탭에서 나타나는 제조-수입사 정보 표시
				$("#all_upso_title").text(upsoNmSplit[0]);
				$("#all_upso_nm").text(upsoNmSplit[0]);
				$("#all_upso_enm").text(upsoNmSplit[1]);
				$("#all_upso_addr").text(upsoNmSplit[2]);
				$("#all_upso_callnum").text(upsoNmSplit[3]);
				$("#all_upso_faxnum").text(upsoNmSplit[4]);
				$("#all_upso_url").html("<a target='_blank' href='http://"+upsoNmSplit[5]+"'>"+upsoNmSplit[5] + "</a>");		


				$("#tab_upso").html($("#all_upso_tab").html());
				$('#tab_upso h4').text('')
			}


//			// 6. 판매사
			if(data[0].upso1!= ""){
				var upso1NmSplit = "";
				upso1NmSplit = data[0].upso1.split("|");

				if(upso1NmSplit[5] != "") {
					$("#a_upso_view").click(function(){window.open("http://"+upso1NmSplit[5]);});
					$("#a_upso_view").css("display","");
				}else{
					$("#a_upso_view").css("display","none");
				}


				$("#upso1_title").text(upso1NmSplit[0]);
				$("#upso1_nm").text(upso1NmSplit[0]);
				$("#upso1_enm").text(upso1NmSplit[1]);
				$("#upso1_addr").text(upso1NmSplit[2]);
				$("#upso1_callnum").text(upso1NmSplit[3]);
				$("#upso1_faxnum").text(upso1NmSplit[4]);
				$("#upso1_url").html("<a target='_blank' href='http://"+upso1NmSplit[5]+"'>"+upso1NmSplit[5] + "</a>");						
			}else{
				$("#a_upso_view").css('display','none');
			}
			
			// 7. 제형
			if(data[0].drug_form != ""){
				$("#drug_form").text(data[0].drug_form);
			}

			// 8. 투여경로
			if(data[0].dosage_route != ""){
				$("#dosage_route").text(data[0].dosage_route);
			}
			
			// 9. 성상
			if(data[0].charact != ""){
				$("#charact").text(data[0].charact);
			}
			
			if(data[0].cancel_date != ""){
				//취하일자
				if(data[0].cancel_date.length < 8){
					$("#cancel_date").text('');
					$("#cancel_br").remove();
				}else{					
					$("#cancel_date").text("취하일 : "+data[0].cancel_date.substring(0,4)+"년 "+data[0].cancel_date.substring(4,6) + "월 " + data[0].cancel_date.substring(6,10)+"일");
					$("#cancel_date").css('color','black')
				}			
			}

			
			// 10. 허가일자
			if(data[0].item_permit_Date != ""){
				//취하일자
				if(data[0].item_permit_Date == "0"){
					$("#item_permit_date").text('');
				}else{
					if (data[0].cancel_date.length > 1) {
						$("#item_permit_date").text("허가일 : "+data[0].item_permit_date.substring(0,4)+"년 "+data[0].item_permit_date.substring(4,6) + "월 " + data[0].item_permit_date.substring(6,10)+"일"   );
						$("#item_permit_date").css('color','grey');
					} else {
						$("#item_permit_date").text(data[0].item_permit_date.substring(0,4)+"년 "+data[0].item_permit_date.substring(4,6) + "월 " + data[0].item_permit_date.substring(6,10)+"일"   );						
					}
				}			
			}		

			//허가일 취하일 글자색 변경
			//허가일만 있을경우 허가일자를 검은색으로 변경
			if((data[0].cancel_date == "0") && (data[0].item_permit_Date != "")){
				$("#item_permit_date").css('color','black');
			}

			//reexam
			if(data[0].reexam != null ){
				$("#reexam").text(data[0].reexam + " (" + data[0].reexam_start_date.substring(0,4) + "년" + data[0].reexam_start_date.substring(4,6) + "월" + data[0].reexam_start_date.substring(6,8) + "일" + " ~ " + data[0].reexam_end_date.substring(0,4) + "년" + data[0].reexam_end_date.substring(4,6) + "월" + data[0].reexam_end_date.substring(6,8) + "일" + ")" );

			}else{
				$("#reexam").parent().hide();
				$(".img").prop("rowspan",$(".img").prop("rowspan")-1);
			}



			//newdrug_class_code
			if(data[0].newdrug_class_code == "Y"){
				$("#newdrug_class_code").css("display","");
			}else{
				$("#newdrug_class_code").css("display","none");
			}

			if (data[0].comp_drug_yn_biology == 'Y') {
				//$("#bio_eq").text("대조약(생동)");
			} else if (data[0].comp_drug_yn_effect == 'Y') {
				//$("#bio_eq").text("대조약(의동)");
			}
			if (data[0].bioeq_prodt_yn == 'Y') {
				if (data[0].comp_drug_yn_biology == 'Y' || data[0].comp_drug_yn_effect == 'Y') {
					$("#bio_eq").text("대조약/생동인정품목");
				} else {
					$("#bio_eq").text("생동인정품목");
				}				
			} else {
				if (data[0].comp_drug_yn_biology == 'Y' || data[0].comp_drug_yn_effect == 'Y' || data[0].comp_drug_yn == 'Y' || data[0].comp_drug_yn_physicochemical == 'Y') {
					$("#bio_eq").text("대조약");
				} else {
					$("#bio_eq").text("해당 없음");
				}		
			}

			//최신급여정보 리스트
			var boh_status = "";
			var ins_status = "";
			var ins_text = "";
			
			if(data[0].boh_history != "" && data[0].boh_history != null && data[0].noins != "" && data[0].noins != null){
				boh_status = data[0].boh_history.split("^");

				var boh_text = "";
				for(var i = 0 ; i < boh_status.length; i++){
					boh_text += boh_status[i].replace("|","	 -  ");

					if(i != boh_status.length -1 ){
						boh_text += "<br/>"
					}
					
				}
				

				boh_history2_cnt();			

				ins_status = data[0].noins.split("|");

				for(var i = 0 ; i < ins_status.length; i++){
					ins_text += ins_status[i].replace("|","<br/>");
					if(i < ins_status.length -1 ){
						ins_text+="<br/>";
					}					
				}
			
			}else if(data[0].boh_history != "" && data[0].boh_history != null){

				boh_status = data[0].boh_history.split("^");

				var boh_text = "";
				for(var i = 0 ; i < boh_status.length; i++){
					boh_text += boh_status[i].replace("|","	 -  ");
					if(i != boh_status.length -1 ){
						boh_text += "<br/>"
					}
					
				}

				boh_history2_cnt();

			}else if(data[0].noins != "" && data[0].noins != null){
				$("#boh_view_btn").css('display','none');
				
				

				ins_status = data[0].noins.split("|");

				for(var i = 0 ; i < ins_status.length; i++){
					ins_text += ins_status[i].replace("|","<br/>");
					if(i < ins_status.length -1 ){
						ins_text+="<br/>";
					}	
				}

			}


			


			// 15. ATC코드
			if(data[0].atc_cd != ""){
				var atc_split = "";
				atc_split = data[0].atc_cd.split("|");
				var htmlData = "";

				htmlData += "<a onclick=\"alert('회원전용 공간입니다.\\n로그인 후 사용해 주십시오.');location.href='/member/login.asp'\"><strong>" + atc_split[0] + "</strong></a> : " + atc_split[1]

				//+ " : " + atc_split[2] + "</td>"
				$("#atc_cd").html(htmlData);
				
			}
			

			// 16. 식약처 분류
			if(data[0].cls_code != ""){
				$("#cls_code").text(data[0].cls_code+" ("+data[0].cls_code_num+")");
			}


			// 17. kpic약효분류
			if(data[0].kpic_atc != ""){
				//파이프로 먼저 분할
				var atc_pipe = "";
				atc_pipe = data[0].kpic_atc.split("|");
				
				var atc_colon = "";
				var sunb_split="";
				var htmlData = "";

				for(var i=0 ; i < atc_pipe.length; i++){
					atc_colon = atc_pipe[i].split(":");	
					htmlData += "<li><h6>"+atc_pipe[i]+"</h6>";
					htmlData += "<ul>";

//					sunb_split = atc_colon[1].split(">");
					sunb_split = atc_colon[1];

//					for(var j= 0; j < sunb_split.length; j++){
//						htmlData += "<li><a href=''>"+sunb_split[j]+"</a></li> ";
//						if( j != sunb_split.length - 1){
//							htmlData += ">";
//						}						
//					}	

					htmlData += "</ul>";
					htmlData += "</li>";				
				}

				//$("#kpic_atc").html(htmlData);						
			}else{
//				$("#tr_kpic_category").css('display','none');
			}

			//식별정보 팝업에서 식별정보 버튼에 링크삽입
			$(".idfy_pop_idfyinfo").prop('href','/searchIdentity/result.asp?didx='+data[0].idfyidx+'&dcode='+data[0].drug_code);
			if (data[0].idfyidx == null) {
				$(".idfy_pop_idfyinfo").hide();
			}
			$(".ifdy_btn_history").prop('href','/searchIdentity/result.asp?didx='+data[0].idfyidx+'&dcode='+data[0].drug_code);

			// 18. 제품설명서
			if(data[0].insertpaper != ""){
				var htmlData = "";
				htmlData += "<a target='_blank' href='" + data[0].insertpaper + "' class='btn_manual btn04'>보 기</a> <span class='fontgrey'>( " + data[0].paper_dt + " 게시 )</span></td>";
				$("#in_paper").html(htmlData);
				$('.idfy_pop_pdf').prop('href',data[0].insertpaper);
			}else{
				$("#in_paper").html('제품설명서 이미지가 없습니다.');
				$('.idfy_pop_pdf').hide();
				$('.idfy_pop_pdf').prop('href','return false');
			}

			
			// 19. 의약품 안전성 dur정보
			cdate = new Date(data[0].cancel_date.substring(0,4), data[0].cancel_date.substring(4,6), data[0].cancel_date.substring(6,8));
			cdate.setMonth(cdate.getMonth() +36);

			if (data[0].drug_name.indexOf("수출용") < 0 && (data[0].cancel_date.length < 8 || cdate > new Date())) {			// 수출용 의약품, 허가취하 3년 내 의약품은 DUR 제외

				var dur_txt = "";
				var durcontent_cnt  = 0;

				if(data[0].dur_contra != ""){
					/*
					var dur_contra_split = data[0].dur_contra.split("|");
					
					dur_txt += "<b>[병용금기]</b> ";

					for(var i = 0; i < dur_contra_split.length ; i ++ ){
						dur_txt += "<span style='margin-right:10px;' alt='"+dur_contra_split[i].split(":")[1]+"'>" + dur_contra_split[i].split(":")[0] + "</span>"
					}
					*/
					
					dur_txt += "<b>[병용금기]</b> ";
//					dur_txt += "<span style='margin-right:10px;' alt=''>" + data[0].dur_contra + "</span>"
					dur_txt += data[0].dur_contra;
					durcontent_cnt = durcontent_cnt + 1 

				} else {
					dur_txt += "<b>[병용금기]</b> -";
				}
				dur_txt += "<br/>";
				if(data[0].dur_age != ""){
					var dur_age_split = data[0].dur_age.split("|");
					
					dur_txt += "<b>[연령금기]</b> ";

					for(var i = 0; i < dur_age_split.length ; i ++ ){
						dur_txt += dur_age_split[i] + " "
					}
					durcontent_cnt = durcontent_cnt + 1 
				} else {
					dur_txt += "<b>[연령금기]</b> -";
				}
				dur_txt += "<br/>";

				if(data[0].dur_preg != ""){
					var dur_preg_split = data[0].dur_preg.split("|");
					
					dur_txt += "<b>[임부금기]</b> ";

					for(var i = 0; i < dur_preg_split.length ; i ++ ){
						dur_txt += dur_preg_split[i] + " "
					}
					durcontent_cnt = durcontent_cnt + 1 
				} else {
					dur_txt += "<b>[임부금기]</b> - ";
				}
				dur_txt += "<br/>";

				if(data[0].dur_senior != ""){
					var dur_senior_split = data[0].dur_senior.split("|");
					
					dur_txt += "<b>[노인주의]</b> ";

					for(var i = 0; i < dur_senior_split.length ; i ++ ){
						dur_txt += dur_senior_split[i] + " "
					}
					durcontent_cnt = durcontent_cnt + 1 
				} else {
					dur_txt += "<b>[노인주의]</b> - ";
				}
				dur_txt += "<br/>";


				if(data[0].dur_dose != ""){
					var dur_dose_split = data[0].dur_dose.split("|");
					
					dur_txt += "<b>[용량주의]</b> ";

					for(var i = 0; i < dur_dose_split.length ; i ++ ){
						dur_txt += dur_dose_split[i]
						//복수개 일경우 구분자 삽입
						if(i < dur_dose_split.length - 1) {
							dur_txt += " | "
						}
					}
					durcontent_cnt = durcontent_cnt + 1 
				} else {
					dur_txt += "<b>[용량주의]</b> - ";
				}
				dur_txt += "<br/>";

				if(data[0].dur_period != ""){
					var dur_period_split = data[0].dur_period.split("|");
					
					dur_txt += "<b>[투여기간주의]</b> ";

					for(var i = 0; i < dur_period_split.length ; i ++ ){
						dur_txt += dur_period_split[i] + " "
					}
					durcontent_cnt = durcontent_cnt + 1 
				} else {
					dur_txt += "<b>[투여기간주의]</b> - ";
				}
				dur_txt += "<br/>";

				if(data[0].dur_form!= ""){
					
					dur_txt += "<b>[분할주의]</b> ";

					dur_txt += data[0].dur_form + " "
					
					durcontent_cnt = durcontent_cnt + 1 
				} else {
					dur_txt += "<b>[분할주의]</b> - ";
				}
				dur_txt += "<br/>";

				if(data[0].dur_donate!= ""){
					var dur_donate_split = data[0].dur_donate.split("|");
					
					dur_txt += "<b>[헌혈금지]</b> ";

					for(var i = 0; i < dur_donate_split.length ; i ++ ){
						dur_txt += dur_donate_split[i] + " "
					}
					durcontent_cnt = durcontent_cnt + 1 
				} else {
					dur_txt += "<b>[헌혈금지]</b> - ";
				}

				if(dur_txt == ""){
					$("#dur_detail_view_btn").css("display","none");
					$("#dur_category").text('없음');
				}else{
					//$("#dur_detail_view_btn").attr('href','/searchDrug/search_DUR.asp?param_durcode=2019121000003')
					$("#dur_category").html(dur_txt);
					//$("#tr_cnt").val(durcontent_cnt);
					//$("#cart_cnt").val(durcontent_cnt);

				}
				
			} else {
				$("#tr_DUR").hide();
			}
			

			//console.log(data[0].fdacode.substring(0,1));
			// 20. 제품 임부투여 안전성 등급 - 코드 , 내용
			if(data[0].fdacode != "" && data[0].sunb_count == "1"){
				$("#fda_cd li").removeClass('selected');

				switch(data[0].fdacode.substring(0,1)){
					case "A" :					    
						$("#fda_cd .fdaA").addClass('selected');
						$("#fda_popupA").addClass('selected');
						$("#fda_cd_cont").text($("#fda_contA").text());
						break;
					case "B" : 
						$("#fda_cd .fdaB").addClass('selected');
						$("#fda_popupB").addClass('selected');
						$("#fda_cd_cont").text($("#fda_contB").text());
						break;
					case "C" : 
						$("#fda_cd .fdaC").addClass('selected');
						$("#fda_popupC").addClass('selected');
						$("#fda_cd_cont").text($("#fda_contC").text());
						break;
					case "D" : 
						$("#fda_cd .fdaD").addClass('selected');
						$("#fda_popupD").addClass('selected');
						$("#fda_cd_cont").text($("#fda_contD").text());
						break;
					case "X" :	
						$("#fda_cd .fdaX").addClass('selected');		
						$("#fda_popupX").addClass('selected');
						$("#fda_cd_cont").text($("#fda_contX").text());						
						break;
				}
				var fda_split = data[0].fdacode.split("/");
				$("#fda_safety_view").css("display","none");
				$("#fda_cd_text").text(fda_split[0]+"등급");
				if(fda_split[1] != undefined){
					$("#fda_cd_cont").html($("#fda_cd_cont").text()+"<br/>("+fda_split[1]+")");
				}else{
					$("#fda_cd_cont").html($("#fda_cd_cont").text());
				}
				
				
			}else if(data[0].fdacode != "" && data[0].sunb_count != "1"){
				$("#fda_cd li").removeClass('selected');

				switch(data[0].fdacode.substring(0,1)){
					case "A" :					    
						$("#fda_cd .fdaA").addClass('selected');
						$("#fda_popupA").addClass('selected');
						$("#fda_cd_cont").text($("#fda_contA").text());
						break;
					case "B" : 
						$("#fda_cd .fdaB").addClass('selected');
						$("#fda_popupB").addClass('selected');
						$("#fda_cd_cont").text($("#fda_contB").text());
						break;
					case "C" : 
						$("#fda_cd .fdaC").addClass('selected');
						$("#fda_popupC").addClass('selected');
						$("#fda_cd_cont").text($("#fda_contC").text());
						break;
					case "D" : 
						$("#fda_cd .fdaD").addClass('selected');
						$("#fda_popupD").addClass('selected');
						$("#fda_cd_cont").text($("#fda_contD").text());
						break;
					case "X" :	
						$("#fda_cd .fdaX").addClass('selected');		
						$("#fda_popupX").addClass('selected');
						$("#fda_cd_cont").text($("#fda_contX").text());						
						break;
				}
				var fda_split = data[0].fdacode.split("/");
				$("#fda_safety_view").css("display","none");
				$("#fda_cd_text").text(fda_split[0]+"등급");
				if(fda_split[1] != undefined){
					$("#fda_cd_cont").html($("#fda_cd_cont").text()+"<br/>("+fda_split[1]+")");
				}else{
					$("#fda_cd_cont").html($("#fda_cd_cont").text());
				}
				
				//복합제이므로 성분별 안전성 등급을 나타낸다.
				$("#fda_safety_view").css("display","");




				var sunbSplit_line;
				var sunbSplit_word;
				var htmlData = "";
				sunbSplit_line = data[0].sunbcontent.split("#");

				
				
				for(var i = 0 ; i < sunbSplit_line[i].length; i++){
					sunbSplit_word = sunbSplit_line[i].split("|");
					
					htmlData += "<tr>"

					if(sunbSplit_word[0] != ""){
						htmlData += "<th>" + sunbSplit_word[0] + "</th>"
					}else{
						htmlData += "<th>자료없음</th>"
					}

					if(sunbSplit_word[1] == "자료없음"){
						htmlData += "<td>자료없음</td>"
					}else{
						htmlData += "<td><span class='fda"+sunbSplit_word[1]+"'>"+ sunbSplit_word[1]+"</span>"+ sunbSplit_word[2]+"</td>"
					}
					
					htmlData += "</tr>"

				}
				//$("#sunbcontent_table").html(htmlData);
			}else if(data[0].sunb_count != "2"){
				//복합제의 경우 임부투여 안전성 등급이 없으므로 안보이게 처리한다.
				$("#fda_cd_cont").text("※해당제품의 안전성 등급이 없습니다.");
				$("#fda_grade_btn").css("display","none");
				$("#fda_cd").css("display","none");
				//복합제이므로 성분별 안전성 등급을 나타낸다.
				$("#fda_safety_view").css("display","");
				
				var sunbSplit_line;
				var sunbSplit_word;
				var htmlData = "";
				sunbSplit_line = data[0].sunbcontent.split("#");

				

				for(var i = 0 ; i < sunbSplit_line[i].length; i++){
					sunbSplit_word = sunbSplit_line[i].split("|");
					
					htmlData += "<tr>"

					if(sunbSplit_word[0] != ""){
						htmlData += "<th>" + sunbSplit_word[0] + "</th>"
					}else{
						htmlData += "<th>자료없음</th>"
					}

					if(sunbSplit_word[1] == "자료없음"){
						htmlData += "<td>자료없음</td>"
					}else{
						htmlData += "<td><span class='fda"+sunbSplit_word[1]+"'>"+ sunbSplit_word[1]+"</span>"+ sunbSplit_word[2]+"</td>"
					}
					
					htmlData += "</tr>"

				}
				//$("#sunbcontent_table").html(htmlData);
				

			}else if(data[0].sunb_count == "2"){
				//복합제의 경우 임부투여 안전성 등급이 없으므로 안보이게 처리한다.
				$("#fda_cd_cont").text("※해당제품의 안전성 등급이 없습니다.");
				$("#fda_grade_btn").css("display","none");
				$("#fda_cd").css("display","none");
				//복합제이므로 성분별 안전성 등급을 나타낸다.
				$("#fda_safety_view").css("display","");
				
				var sunbSplit_line;
				var sunbSplit_word;
				var htmlData = "";
				sunbSplit_line = data[0].sunbcontent.split("#");

				

				for(var i = 0 ; i < sunbSplit_line[i].length; i++){
					sunbSplit_word = sunbSplit_line[i].split("|");
					
					htmlData += "<tr>"

					if(sunbSplit_word[0] != ""){
						htmlData += "<th>" + sunbSplit_word[0] + "</th>"
					}else{
						htmlData += "<th>자료없음</th>"
					}

					if(sunbSplit_word[1] == "자료없음"){
						htmlData += "<td>자료없음</td>"
					}else{
						htmlData += "<td><span class='fda"+sunbSplit_word[1]+"'>"+ sunbSplit_word[1]+"</span>"+ sunbSplit_word[2]+"</td>"
					}
					
					htmlData += "</tr>"

				}
				//$("#sunbcontent_table").html(htmlData);
			}else{
				$("#fda_cd_cont").text("※해당제품의 안전성 등급이 없습니다.");
				$("#fda_grade_btn").css("display","none");
				$("#fda_cd").css("display","none");
				
			}


			//성분별 안전성 등급 버튼 뷰 재작업
			if(data[0].sunb_count == "1"){
				$("#fda_safety_view").css("display","none");
			
			}else{
				$("#fda_safety_view").css("display","");
			}

			// 21. 포장단위
			if(data[0].drug_box != ""){
				$("#drug_box").text(data[0].drug_box);
			}
			
			// 22. 저장방법
			if(data[0].stmt != ""){
				$("#stmt").text(data[0].stmt);
			}


			// 23. 효능효과
			if(data[0].effect != ""){
				//$("#effect").html(data[0].effect.replace(/br/g,'<br/>'));
				//$("#tab_effect").html(data[0].effect.replace(/br/g,'<br/>'));
			}

			// 24. 용법-용량
			if(data[0].dosage != ""){
				//$("#dosage").html(data[0].dosage.replace(/br/g,'<br/>'));
				//$("#tab_dosage").html(data[0].dosage.replace(/br/g,'<br/>'));
			}

			// 25. 주의사항
			if(data[0].caution != ""){
				//$("#caution").html(data[0].caution.replace(/br/g,'<br/>'));
				//$("#tab_caution").html(data[0].caution.replace(/br/g,'<br/>'));
				//$("#caution").html(data[0].caution);
				//$("#tab_caution").html(data[0].caution);
			}

			// 26. 복약정보
			if(data[0].mediguide != ""){
				var rep_br = data[0].mediguide.replace(/br/g,'');
				//var remove_br = rep_br.replace("<br/>","");
				var rep_hip = rep_br.replace(/-/g,"<br/>-");


				//$("#mediguide").html(data[0].mediguide.replace(/br/g,'<br/>'));
				$("#mediguide").html(rep_hip);



				$("#drug_take_detail").html($("#drug_take").html());
				//$("#mediguide>br").remove();

			}
			
			// 27. 픽토그램 이미지 리스트
			if(data[0].picto_img != ""){
				var picto_split = data[0].picto_img.split("|");

				var htmlData = "";

				for(var i = 0 ; i < picto_split.length; i++){
					htmlData += "<li><img src='"+picto_split[i]+"' alt='픽토그램' /></li>";
					//console.log(picto_split[i]);
				}
				//$("#picto_imglist").html(htmlData);
				$(".pictogram").html(htmlData);
				//console.log(htmlData);
			} else {
				$(".pictogram").html("");
			}

			

			// 28. 식별이미지 및 포장이미지
			if(data[0].drug_pic != ""){
				var img_split,packimg_split;
				img_split = data[0].drug_pic.split("|");
				packimg_split = data[0].pack_img.split("@");

				if(img_split[0] != "" && img_split[1] != undefined){
					// 식별, 포장 모두 존재
					$("#idfy_img_li").css("display","");
					$("#pack_img_li").css("display","");

					$("#idfy_img_small").attr("src",img_split[1]);
					$("#idfy_img_small").css("width","225.77");
					$("#idfy_img_small").css("height","123");

					$("#idfy_img_big").attr("src",img_split[1]);
					//$("#idfy_img_big").css("width","225.77");
					//$("#idfy_img_big").css("height","123");		

					var loop_len;loop_len = packimg_split.length;
					for (var i=0; i<loop_len; i++) {
						$("#pack_img_li.template").clone().removeClass('template').addClass('no'+i).insertAfter('#pack_img_li');
						$("#pack_img_li.no"+i).css("display","inline-block");
						$("#pack_img_li.no"+i).css("width",96.0/loop_len+"%");

						$("#pack_img_li.no"+i+" #pack_img_small").attr("src",packimg_split[i]);
						//$("#pack_img_li.no"+i+" #pack_img_small").css("width",210.0/packimg_split.length);
						//$("#pack_img_li.no"+i+" #pack_img_small").css("height","126.02");
						
						$("#pack_img_li.no"+i+" #pack_img_big").attr("src",packimg_split[i]);
						//$("#pack_img_li.no"+i+" #pack_img_big").css("width","225.77");
						//$("#pack_img_li.no"+i+" #pack_img_big").css("height","126.02");	
					}
					$("#pack_img_li.template").hide();


					//$("#pack_img_small").attr("src",img_split[0]);
					//$("#pack_img_small").css("width","225.77");
					//$("#pack_img_small").css("height","126.02");
					
					//$("#pack_img_big").attr("src",img_split[0]);
					//$("#pack_img_big").css("width","225.77");
					//$("#pack_img_big").css("height","126.02");	

				}else if(img_split[0] == ""){
					// 식별만 존재
					$("#idfy_img_li").css("display","");

					//식별이미지
					$("#idfy_img_small").attr("src",img_split[1]);
					$("#idfy_img_small").css("width","225.77");
					$("#idfy_img_small").css("height","123");

					$("#idfy_img_big").attr("src",img_split[1]);
					//$("#idfy_img_big").css("width","225.77");
					//$("#idfy_img_big").css("height","123");		

					//식별이미지만 있다면 포장이미지 쪽은 숨김
					$("#pack_img_li").css("display","none");
				}else if(img_split[1] == undefined){
					//포장이미지만 존재
					$("#pack_img_li").css("display","");
					$("#pack_img_li").parent().prepend("<li><img src='/images/img_empty4.jpg'></li>");

//					$("#pack_img_small").attr("src",img_split[0]);
//					$("#pack_img_small").css("width","225.77");
//					$("#pack_img_small").css("height","126.02");
//					
//					$("#pack_img_big").attr("src",img_split[0]);
//					$("#pack_img_big").css("width","225.77");
//					$("#pack_img_big").css("height","126.02");	


					for (var i=0; i<packimg_split.length; i++) {
						$("#pack_img_li.template").clone().removeClass('template').addClass('no'+i).insertAfter('#pack_img_li');
						$("#pack_img_li.no"+i).css("display","inline-block");
						$("#pack_img_li.no"+i).css("width",96.0/packimg_split.length+"%");

						$("#pack_img_li.no"+i+" #pack_img_small").attr("src",packimg_split[i]);
						$("#pack_img_li.no"+i+" #pack_img_small").css("width",210.0/packimg_split.length);
						//$("#pack_img_li.no"+i+" #pack_img_small").css("height","126.02");
						
						$("#pack_img_li.no"+i+" #pack_img_big").attr("src",packimg_split[i]);
						//$("#pack_img_li.no"+i+" #pack_img_big").css("width","225.77");
						//$("#pack_img_li.no"+i+" #pack_img_big").css("height","126.02");	
					}
					$("#pack_img_li.template").hide();

					//포장이미지만 있다면 식별이미지 라인은 숨김
					$("#idfy_img_li").css("display","none");	
					//pack_img();
				}

			}else{
				//두개 다 이미지가 없을경우 나타내지 않는다.
				//$("#idfy_img_li").css("display","none");
				//$("#pack_img_li").css("display","none");

				//두개 다 없는 경우 비어있는 이미지 표시
				$("#pack_img_li").parent().append("<li><img src='/images/img_empty4.jpg'></li>");
								
			}

			//pack_img();

			// 29. 식별 길이정보
			if(data[0].idfylength != ""){
				
				var idfySplit = "";
				var idfy_br = "";

				idfySplit = data[0].idfylength.split("|");
				
//				$("#idfy_front").text(idfySplit[4]);

				idfy_br = idfySplit[4].replace(/\n/g, "<br>");
				idfy_br = idfy_br.replace(/십자분할선/g,"<span class='line_cross'>+</span>");
				idfy_br = idfy_br.replace("<br>분할선<br>","<img class='lineh' name=img1 src='http://www.pharm.or.kr/images/line_h.gif' align=absmiddle>");
				idfy_br = idfy_br.replace("<br>분할선","<img class='lineh' name=img1 src='http://www.pharm.or.kr/images/line_h.gif' align=absmiddle>");
				idfy_br = idfy_br.replace("분할선<br>","<img class='lineh' name=img1 src='http://www.pharm.or.kr/images/line_h.gif'  align=absmiddle>");
				idfy_br = idfy_br.replace(/분할선/g,"<img class='linev'name=img1 src='http://www.pharm.or.kr/images/line_v.gif' align=absmiddle>");
				idfy_br = idfy_br.replace(/마크/g,"<img name='img1' src='http://www.pharm.or.kr/images/sb_photo/mark/"+idfySplit[9]+".gif' width='20' height='20' align='absmiddle'>");
				
				$("#idfy_front").html(idfy_br);


				//$("#idfy_back").text(idfySplit[5].replace("분할선","|"));
				
				idfy_br = idfySplit[5].replace(/\n/g, "<br>");
				idfy_br = idfy_br.replace(/십자분할선/g,"<span class='line_cross'>+</span>");
				idfy_br = idfy_br.replace("<br>분할선<br>","<img class='lineh' name=img1 src='http://www.pharm.or.kr/images/line_h.gif' align=absmiddle>");
				idfy_br = idfy_br.replace("<br>분할선","<img class='lineh' name=img1 src='http://www.pharm.or.kr/images/line_h.gif' align=absmiddle>");
				idfy_br = idfy_br.replace("분할선<br>","<img class='lineh' name=img1 src='http://www.pharm.or.kr/images/line_h.gif'  align=absmiddle>");
				idfy_br = idfy_br.replace(/분할선/g,"<img class='linev'name=img1 src='http://www.pharm.or.kr/images/line_v.gif' align=absmiddle>");
				idfy_br = idfy_br.replace(/마크/g,"<img name='img1' src='http://www.pharm.or.kr/images/sb_photo/mark/"+idfySplit[10]+".gif' width='20' height='20' align='absmiddle'>");
				
				$("#idfy_back").html(idfy_br);


//				$("#idfy_back").css("text-align","center");
/*
	print = Replace(print, "<br>분할선<br>","<HR width='50%'>")
	print = Replace(print, "<br>분할선","<HR width='50%'>")
	print = Replace(print, "분할선<br>","<HR width='50%'>")
	print = Replace(print, "분할선","<SPAN style='width:2px;height:30px;background-color:gray;vertical-align:middle;margin:5px;'></SPAN>")

*/

				//$("#idfy_charact").text(idfySplit[3]);
				$("#idfy_charact").text(idfySplit[3]);

				$("#len_long").text(idfySplit[0]);
				$("#len_short").text(idfySplit[1]);
				$("#len_thick").text(idfySplit[2]);

			}
			//pack_img();

		//loading overlay off
		$("#druginfo01").LoadingOverlay("hide"); 
		//우측 사이드 배너 재 계산 및 배치
		sideCalc();
		},
		//complete:function(data){
			//console.log(data.responseText)
		//},
		error:function(xhr, status, error){
			alert('서버와의 통신 중 오류가 발생하였습니다.');
		}
	});

}//result_drug end


function pack_img(){
	var rtn;rtn = 0;
	//데이터 호출
	$.ajax({
		type:"GET",
		url:'/images/ext_images/daily_img/2019121000003.jpg',
		async:false,
		cache: false,	
		dataType:"text",		
		success:function(data){
			
			$("#pack_img_small").attr("src",'/images/ext_images/daily_img/2019121000003.jpg');
			$("#pack_img_small").css("width","225.77");
			$("#pack_img_small").css("height","126.02");
					
			$("#pack_img_big").attr("src",'/images/ext_images/daily_img/2019121000003.jpg');
			$("#pack_img_big").css("width","225.77");
			$("#pack_img_big").css("height","126.02");	
			
			$("#pack_img_li").css('display','');

			rtn =  1;
			
			
			
		},
		//complete:function(data){
			//console.log(data.responseText)
		//},
		error:function(xhr, status, error){
			//alert('서버와의 통신 중 오류가 발생하였습니다.');
			//console.log("포장이미지 없다 ");
		}
	});

	return rtn;
}


function boh_history2_cnt(){


	//데이터 호출
	$.ajax({
		type:"GET",
		url:'/searchDrug/ajax/ajax_boh_history2.asp?drug_cd=2019121000003',
		async:true,
		cache: false,	
		dataType:"text",		
		success:function(data){
			var boh_html = "";

			boh_html = data;
			
			boh_html = boh_html.replace(/!/gi,'</dd>');
			boh_html = boh_html.replace(/#/gi,'</dd><dd>');
			boh_html = boh_html.replace(/odt/gi,'<dt>');
			boh_html = boh_html.replace(/@/gi,'</dt><dd>');
			
			
			$("#boh_history").html(boh_html);
		},
		//complete:function(data){
			//console.log(data.responseText)
		//},
		error:function(xhr, status, error){
			alert('서버와의 통신 중 오류가 발생하였습니다.');
		}
	});
}//searchDetailY_cnt end

function result_take_pro(){
	
	//loading overlay on
	$("#druginfo01").LoadingOverlay("show"); 

	//데이터 호출
	$.ajax({
		type:"GET",
		url:'http://localapi.health.kr:8090/result_take_pro.localapi?drug_cd=2019121000003',
		async:false,
		cache: false,
		dataType:"jsonp",
		success:function(data){				
//			console.log(data);
			if(data.length != 0){
				$("#take_tab").css("display","");
				
				if(data[0].fname_chinese != "" ){
					$("#li_chi").css("display","");
					$("#take_chi").attr("onclick","window.open('"+data[0].fname_chinese+"','','')")
				}else{
					$("#li_chi").css("display","none");
				}

				if(data[0].fname_chronic != ""){
					$("#li_chronic").css("display","");
					$("#take_chronic").attr("onclick","window.open('"+data[0].fname_chronic+"','','')")				
				}else{
					$("#li_chronic").css("display","none");
				}

				if(data[0].fname_customer != ""){
					$("#li_customer").css("display","");
					$("#take_customer").attr("onclick","window.open('"+data[0].fname_customer+"','','')")						
				}else{
					$("#li_customer").css("display","none");
				}	

				if(data[0].fname_drugform != ""){
					$("#li_form").css("display","");
					$("#take_form").attr("onclick","window.open('"+data[0].fname_drugform+"','','')")						
				}else{
					$("#li_form").css("display","none");
				}

				if(data[0].fname_english != ""){
					$("#li_eng").css("display","");
					$("#take_eng").attr("onclick","window.open('"+data[0].fname_english+"','','')")						
				}else{
					$("#li_eng").css("display","none");
				}

				if(data[0].fname_pregnant != ""){
					$("#li_preg").css("display","");
					$("#take_preg").attr("onclick","window.open('"+data[0].fname_pregnant+"','','')")						
				}else{
					$("#li_preg").css("display","none");
				}

				if(data[0].fname_profesional != ""){
					$("#li_pro").css("display","");
					$("#take_pro").attr("onclick","window.open('"+data[0].fname_profesional+"','','')")						
				}else{
					$("#li_pro").css("display","none");
				}

				if(data[0].fname_patient != "" && data[0].fname_patient != null){
					$("#li_patient").css("display","");
					$("#take_patient").attr("onclick","window.open('/images/drug_info/basedrug/mdguide_kfda/"+data[0].fname_patient+"','','')")						
				}else{
					$("#li_patient").css("display","none");
				}

				if(data[0].fname_senior != ""){
					$("#li_senior").css("display","");
					$("#take_senior").attr("onclick","window.open('"+data[0].fname_senior+"','','')")						
				}else{
					$("#li_senior").css("display","none");
				}
			}
	
		//loading overlay off
		$("#druginfo01").LoadingOverlay("hide"); 
		//우측 사이드 배너 재 계산 및 배치
		sideCalc();
		},
		//complete:function(data){
			//console.log(data.responseText)
		//},
		error:function(xhr, status, error){
			alert('서버와의 통신 중 오류가 발생하였습니다.');
		}
	});

}//result_take_pro end

</script>


<body onkeydown='on_key_down()'>

<%@include file="../common/header.jsp" %> 


<div id="wrap">



<script type="text/javascript">

$( document ).ready(function() {
	nowZoom = 100;
	//검색 selectbox 셋팅 - li태그로 되어있으므로 별도 클릭이 필요함.
	//switch($('#search_flag').val()){
	switch(''){
		case "drug_name" : 
			selectBoxToggle('drug_name','제품명');
			break;
		case "ingr_name" : 
			selectBoxToggle('ingr_name','성분명');
			break;
		case "upso_name" : 
			selectBoxToggle('upso_name','회사명');
			break;
		case "boh_code" : 
			selectBoxToggle('boh_code','보험코드');
			break;
		case "dosage" : 
			selectBoxToggle('dosage','효능효과');
			break;
		case "all" : 
			selectBoxToggle('all','의약품검색');
			break;
	}


});


//2017-03-15 dwkang 검색필드 옆 항목별 선택, selectbox 처럼 처리하기 위한 함수.
function selectBoxToggle(val,text){
	//파라미터 셋팅
	$('#search_flag').val(val);
	//글자변경
	$('#selectBoxTitle').text(text);
	
	switch(val){
		case "drug_name" : 
			$("#category_list li").css("display","");
			$("#li_drug_name").css("display","none");
			$("#hiddenLi").css("display","");
			break;
		case "ingr_name" : 
			$("#category_list li").css("display","");
			$("#li_ingr_mg").css("display","none");
			$("#hiddenLi").css("display","");
			break;
		case "upso_name" : 
			$("#category_list li").css("display","");
			$("#li_upso_name").css("display","none");
			$("#hiddenLi").css("display","");
			break;
		case "boh_code" : 
			$("#category_list li").css("display","");
			$("#li_boh_code").css("display","none");
			$("#hiddenLi").css("display","");
			break;
		case "dosage" : 
			$("#category_list li").css("display","");
			$("#li_dosage").css("display","none");
			$("#hiddenLi").css("display","");
			break;
		case "all" : 
			$("#category_list li").css("display","");
			$("#hiddenLi").css("display","none");			
			break;
	}

	
	$('#searchBar #category_list').hide();

}


function header_enterkey(){
	if (window.event.keyCode == 13) {

		if($("#view_loading").attr('src') != undefined){
			alert("결과 조회가 완료되지 않았습니다\n조회가 완료된 후 검색해주십시오");
			return false;
		}

		// 엔터키가 눌렸을 때 실행할 내용
		if($("#search_word").val() != ""){
			$("#header_frm").submit();
		}else{
			alert("검색어를 입력하세요.");
		}
		
	}
}

function header_validate(){
	if($("#view_loading").attr('src') != undefined){
		alert("결과 조회가 완료되지 않았습니다\n조회가 완료된 후 검색해주십시오");
		return false;
	}

	if($("#search_word").val() != ""){


		$("#header_frm").submit();
	}else{
		alert("검색어를 입력하세요.");
	}
	

}

function beforeLoadChk(obj){
	console.log('asdsd');
	if($("#view_loading").attr('src') != undefined){
		alert("결과 조회가 완료되지 않았습니다\n조회가 완료된 후 검색해주십시오");
		return false;
	}
	console.log("↓");
	console.log($(obj));
	this.location.href=$(obj)[0].pathname;


}
// 화면크기축소
function minus() {
   nowZoom = nowZoom - 10;
   if(nowZoom <= 70) nowZoom = 70;   // 화면크기 최대 축소율 70%
   zooms();
}
// 화면크기확대
function plus() {
   nowZoom = nowZoom + 10;
   if(nowZoom >= 200) nowZoom = 200;   // 화면크기 최대 확대율 200%
   zooms();
}
//화면크기 리셋
function zoomReset() {
   nowZoom = 100;   // 원래 화면크기로 되돌아가기
   zooms();
}
//화면비율 조절
function zooms() {
	if(is_ie()){
		$("#aside_sub").css('position','');
		doZoom();
		
	}else{
		document.body.style.zoom = nowZoom + "%";
		
	}
    
    if(nowZoom < 70) {
	   return false;
    }
    if(nowZoom > 200) {
 	   return false;
    }
    
}


//onKeyUp시에 제품명 불러오는 ajax호출
function drugNmAjax_main(){

	if ($('#search_word').val().length < 2) {
		return false;
	}

	if (window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용

		if($("#view_loading").attr('src') != undefined){
			alert("결과 조회가 완료되지 않았습니다\n조회가 완료된 후 진행해주십시오");
			return false;
		}


		if($("#search_word").val() != ""){
			$("#main_drugList").css('display','none');
			$("#header_frm").submit();
		}else{
			alert("검색어를 입력하세요.");
		}
		
	}

	//var e = jQuery.Event( "keydown", { keyCode: 35 } );	$("#input_upsoNm").trigger( e );
	if($('#search_word').val().length > 2){		
		$("#main_drugList").css('display','');
		getDrugName_main();
	}else{
		$("#main_drugList").css('display','none');
	}
}

//제품명 가져오기
function getDrugName_main(val){

	//데이터 호출
	$.ajax({
		type:"GET",
		url:'/include/drug.asp?drugnm='+encodeURIComponent($('#search_word').val()),
		async:true,
		cache: false,
		dataType:"html",
		success:function(data){
//			console.log(data);
			$('#main_drugList').html(data);
//			var htmlData = "";
//			for(var i = 0; i<data.length; i++){
//				htmlData += "<li title='"+data[i].drug_name+"'>"
//				htmlData += "<a class='overtxt' style='cursor:pointer' onclick=\"javascript:$('#input_drug_nm').val('"+data[i].drug_name+"');$('#ul_drugList').css('display','none')\">"
//				htmlData += data[i].drug_name
//				htmlData += "</a>"
//				htmlData += "</li>"
//			}
//			$('#ul_drugList').html(htmlData);
		},
		//complete:function(data){
			//console.log(data.responseText)
		//},
		error:function(xhr, status, error){
			//alert('서버와의 통신 중 오류가 발생하였습니다.');
			console.log("raise exception!");
		}
	});
}//getDrugName end

function mouseEnter(val){
	$(val).css("background","#ddd");
}
function mouseLeave(val){
	$(val).css("background","#fff");
}




function is_ie() {
  if(navigator.userAgent.toLowerCase().indexOf("chrome") != -1) return false;
  if(navigator.userAgent.toLowerCase().indexOf("msie") != -1) return true;
  if(navigator.userAgent.toLowerCase().indexOf("windows nt") != -1) return true;
  return false;
}

function doZoom(){
    $('body').css('-webkit-transform', 'scale('+nowZoom/100+')');
    $('body').css('-webkit-transform-origin', '0 0');
    $('body').css('-moz-transform', 'scale('+nowZoom/100+')');
    $('body').css('-moz-transform-origin', '0 0');
    $('body').css('-o-transform', 'scale('+nowZoom/100+')');
    $('body').css('-o-transform-origin', '0 0');
    $('body').css('-ms-transform', 'scale('+nowZoom/100+')');
    $('body').css('-ms-transform-origin', '0 0');
    document.body.style.zoom = nowZoom + "%";
//var body = document.body;
//var scale = 1.5
//body.style.zoom = scale;  // IE
//body.style.webkitTransform = 'scale('+scale+')';  // Webkit(chrome)
//body.style.webkitTransformOrigin = '0 0';
//body.style.mozTransform = 'scale('+scale+')';  // Mozilla(firefox)
//body.style.mozTransformOrigin = '0 0';
//body.style.oTransform = 'scale('+scale+')';  // Opera
//body.style.oTransformOrigin = '0 0';
//$('html, body').stop().animate( { scrollTop : '850' } );
//$('body').attr('style','position: relative; -ms-zoom: 150%;')
//ie최종형

$('html, body').stop().animate( { scrollTop : '1' } );$('body').attr('style','position: relative; -ms-zoom:' +nowZoom+'%;')
}

</script>


<!-- 컨텐츠 영역 -->
<section id="contens">
<a class="go_top ico"></a>

<h2 class="blind">컨텐츠</h2>
	<section id="articles_sub">
	
		<!-- 의약품상세정보 -->
		<section id="search_detail_result">
			<h2 class="maintitle">의약품 상세정보</h2>
			<div id="">
				<ul>
				</ul>
			</div>
			<!-- <ul class="tab1">
			
				<li class="selected"><a href="result_drug.asp?drug_cd=2019121000003">의약품 상세정보</a></li>
			
			</ul> -->
			<div style="height:50px;"></div>
			<!-- 기본정보 -->
			<article id="druginfo01">
				<div class="hgroup">
					<p style="text-align:right"><span> </span></p>
					<h3 class="subtitle">제품 기본정보</h3>
					<a> </a>
					<a> </a>
				</div>
				<table class="infotable">
					<tr>
						<th>제품명</th>
						<td colspan="3" id="result_drug_name"></td>
						<td rowspan="12" class="img bl0 br0">
							<ul>
								<li id="idfy_img_li" style="display:none">
									<img id="idfy_img_small" src="" alt="식별 이미지" onclick='$("#idfy_img_li>div.infoOver.view_drugimg>a").click()'/>
									<div class="infoOver view_drugimg">
										<a href="#" class="ico"></a>
										<div class="popupbx pop_more" id="pop_more">
											<h6 id="idfy_nm"></h6>
											<a href="#" class="close ico" title="닫기"></a>
											<img id="idfy_img_big" src="" alt="식별이미지 확대" />
											<table class="identity">
												<tr>
													<td id="idfy_front"></td>
													<td id="idfy_back"></td>
												</tr>
											</table>
											<table>
												<tr>
													<th>장축(mm)</th>
													<td id="len_long"></td>
													<th>단축(mm)</th>
													<td id="len_short"></td>
													<th>두께(mm)</th>
													<td id="len_thick"></td>
												</tr>
												<tr>
													<th>성상</th>
													<td id="idfy_charact" colspan="5" class="txtL"></td>
												</tr>
											</table>
											<a href="#" class="btn05 idfy_pop_idfyinfo" id="idfy_pop_idfyinfo">식별정보</a>
											<a href="#" class="btn05 idfy_pop_druginfo" id="idfy_pop_druginfo">제품정보</a>
											<a href="#" target="_blank" class="btn05 idfy_pop_pdf" id="idfy_pop_pdf">제품설명서</a>
										</div>
									</div>
									<a href="#" class="btn04 idfy_pop_idfyinfo" id="ifdy_btn_history">식별 상세정보 및 성상 변경내역</a>
								</li>
								<li id="pack_img_li" class="pack_img_li template" style="display:none">
									<img id="pack_img_small" src="" alt="포장 이미지" onclick='$(this).parent().find("div.infoOver.view_drugimg>a").click()' />
									<div class="infoOver view_drugimg">
										<a href="#" class="ico"></a>
										<div class="popupbx pop_more">
											<h6>의약품이미지 확대보기</h6>
											<a href="#" class="close ico" title="닫기"></a>
											<img id="pack_img_big" src="${drug_Ipath }sample3.jpg" alt="포장 이미지 확대" />
											<a href="#" class="btn05 idfy_pop_idfyinfo" id="idfy_pop_idfyinfo">식별정보</a>
											<a href="#" class="btn05 idfy_pop_druginfo" id="idfy_pop_druginfo">제품정보</a>
											<a href="#" target="_blank" class="btn05 idfy_pop_pdf" id="idfy_pop_pdf">제품설명서</a>
										</div>
									</div>
								</li>
<!-- 								<li> -->
<!-- 									<img src="/images/sample3.jpg" alt="의약품 이미지" /> -->
<!-- 									<a href="#" class="view ico"></a> -->
<!-- 								</li> -->
							</ul>
						</td>
					</tr>
					<tr>
						<th>성분 / 함량</th>
						<td colspan="3"><a></a>
							<ul id="ingr_mg">
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
							</ul>
						</td>
					</tr>

					<tr>
						<th>첨가제</th>
						<td colspan="3" class="additives" id="additives_td">
							<a id="more_additives" class="btn05 fR" style="display:none">첨가제 더보기</a>
							

							<ul id="additives">
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
							</ul>

							<div class="popupbx ico" style="display:none" id="more_additives_popup">
								<dl>
									<dt id="more_additives_list"></dt>
								</dl>
							</div> 
 								
						</td>

					</tr>

					<tr>
						<th>전문 / 일반</th>
						<td><span id="drug_cls"></span> <span id="narcotic_kind" style="color:red"></span></td>
						<th>단일 / 복합</th>
						<td id="sunb_count"></td>
					</tr>
					<tr>
						<th>제조 / 수입사</th>
						<td style="width:130px;">
							<div class="infoOver comp"  style="width:135px;">
								<span id="upso_title" style="word-break: break-all;"></span>
								<a href="#" class="ico" target="_blank" id="a_upso_view_sply"></a>
								<div class="popupbx ico" style="display:none">
<!-- 									<h6>제조 / 수입사</h6> -->
									<dl>
										<dt>회사명</dt>
										<dd id="upso_nm"></dd>
									</dl>
									<dl>
										<dt class="invis">회사 영문명</dt>
										<dd id="upso_enm"></dd>
									</dl>
									<dl style="display:none">
										<dt>주소</dt>
										<dd id="upso_addr"></dd>
									</dl>
									<dl>
										<dt>전화번호</dt>
										<dd id="upso_callnum"></dd>
									</dl>
									<dl style="display:none">
										<dt>FAX</dt>
										<dd id="upso_faxnum"></dd>
									</dl>
									<dl>
										<dt>홈페이지</dt>
										<dd id="upso_url"></dd>
									</dl>
								</div>
							</div>
						</td>
						<th>판매사</th>
						<td>
							<div class="infoOver comp" >
								<span id="upso1_title"></span>
								<a href="#" class="ico" id="a_upso_view"></a>
								<div class="popupbx ico" style="display:none">
<!-- 									<h6>판매사</h6> -->
									<dl>
										<dt>회사명</dt>
										<dd id="upso1_nm"></dd>
									</dl>
									<dl>
										<dt class="invis">회사 영문명</dt>
										<dd id="upso1_enm"> </dd>
									</dl>
									<dl style="display:none">
										<dt>주소</dt>
										<dd id="upso1_addr"></dd>
									</dl>
									<dl>
										<dt>전화번호</dt>
										<dd id="upso1_callnum"></dd>
									</dl>
									<dl style="display:none">
										<dt>FAX</dt>
										<dd id="upso1_faxnum"></dd>
									</dl>
									<dl>
										<dt>홈페이지</dt>
										<dd id="upso1_url"></dd>
									</dl>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>제형</th>
						<td id="drug_form"></td>
						<th>투여경로</th>
						<td id="dosage_route"></td>
					</tr>
					<tr>
						<th>성상</th>
						<td colspan="3" id="charact"></td>
					</tr>
					<tr>
						<th>허가일</th>
						<td colspan="3">
							<span class="fontred" id="cancel_date"></span><br id="cancel_br"/>
							<span id="item_permit_date"></span>
							<span id="newdrug_class_code" style="display:none">[신약]</span>
						</td>
					</tr>
					<tr>
						<th>재심사</th>
						<td colspan="3" id="reexam"></td>
					</tr>
					<tr>
						<th>대조 / 생동</th>
						<td colspan="3" id="bio_eq"></td>
					</tr>
					<tr>
						<th>급여정보</th>
						<td colspan="3" >
							<span id="boh_title"> 
							비급여
							</span>

							<div class="infoOver drugPrice fR" id="boh_view_btn" style="display:none">
								<a href="#" class="btn05">약가이력정보</a>
								<div class="popupbx ico" style="display:none">
									<h6>약가이력정보</h6>
									<a href="#" class="close ico" title="닫기"></a>
									<dl id="boh_history">
							
									</dl>
									<span id="span_boh_cancel"></span>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>ATC 코드</th>
						<td colspan="3" id="atc_cd"></td>
					</tr>
					<tr>
						<th>식약처 분류</th>
						<td colspan="3" id="cls_code"></td>
					</tr>
					<tr id="tr_kpic_category">
						<th>KPIC 약효분류</th>
						<td colspan="4" class="br0">
							<ul class="kpic" id= "kpic_atc">
							<li>Ibuprofen : 
							
						
						
							<A HREF="/searchIngredient/KPICeffect_result.asp?kpic_atc=D">근골격계/결합조직질환</A> >  
							<A HREF="/searchIngredient/KPICeffect_result.asp?kpic_atc=D01">비스테로이드성 소염진통제(NSAIDs)</A> >  
							<A HREF="/searchIngredient/KPICeffect_result.asp?kpic_atc=D01B">Carboxylic acid 유도체</A>
							 > <A HREF="/searchIngredient/KPICeffect_result.asp?kpic_atc=D01BE">Propionic acids</A>
							</ul>
						</td>
					</tr>
					<tr>
						<th>제품설명서</th>
						<td colspan="4" id="in_paper" class="br0"><a href="#" class="btn_manual btn04">보 기</a> <span class="fontgrey">( 2017-10-10 게시 )</span></td>
					</tr>
					<tr id="tr_DUR">
						<th>의약품안전성<br />정보(DUR)</th>
						<td colspan="4" class="br0">
							<div class="dur" style="text-align:right"><a style="cursor:pointer" onclick="javascript:$('#frm_durmore').submit();return false;" class="btn04" id="dur_detail_view_btn">상세보기</a></div>								
							<div id="dur_category"></div>	
						</td>
					</tr>

					
					<tr>
						<th>포장단위<br />(식약처 기준)</th>
						<td colspan="3" class="br0" id="drug_box"></td>
						<td class="bl0 br0">
						
						</td>
					</tr>
					<tr>
						<th class="bb0">저장방법 </th>
						<td colspan="4" class="bb0 br0" id="stmt"></td>
					</tr>
					
				</table>
			</article><!-- //기본정보 -->
			
			<!-- 허가정보∙복약정보 -->
			<article id="druginfo02">
				<h3 class="subtitle">허가정보 ∙ 복약정보</h3>
				<ul class="tab2 mb0"  id="subtab">
					<li onclick="$(window).scrollTop($('#effect').offset();" class="selected"><a href="#">전 체</a></li>
					<li onclick="$(window).scrollTop($('#effect').offset();"><a href="#">효능 · 효과</a></li>
					<li onclick="$(window).scrollTop($('#dosage').offset().top-200);"><a href="#">용법 · 용량</a></li>
					<li onclick="$(window).scrollTop($('#caution').offset().top-200);"><a href="#">주의사항</a></li>
					<li onclick="$(window).scrollTop($('#drug_take').offset().top-200);"><a href="#">복약정보</a></li>
					<li onclick="$(window).scrollTop($('#all_upso_tab').offset().top-200);"><a href="#">제조/수입사</a></li>
				</ul>
				<div class="tab2_cont">
					<div class="druginfo">
						<h4 class="title_dept3 ico">효능 · 효과</h4>
						<p id="effect">1.&nbsp;두통,&nbsp;치통,&nbsp;발치후&nbsp;동통(통증),&nbsp;인후(목구멍)통,&nbsp;귀의&nbsp;통증,&nbsp;관절통,&nbsp;신경통,&nbsp;요통,&nbsp;근육통,&nbsp;견통(어깨결림),&nbsp;타박통,&nbsp;골절통,&nbsp;염좌통(삠통증),&nbsp;월경통(생리통),&nbsp;외상통의&nbsp;진통,<br><P></P>2.&nbsp;오한(춥고&nbsp;떨리는&nbsp;증상),&nbsp;발열시의&nbsp;해열</p>
					</div>
					<div class="druginfo">
						<h4 class="title_dept3 ico">용법 · 용량</h4>
						<p id="dosage">만&nbsp;11세이상&nbsp;및&nbsp;성인&nbsp;:&nbsp;1일&nbsp;1~3회,&nbsp;1회&nbsp;1캡슐<br><P></P>공복(빈&nbsp;속)시를&nbsp;피하여&nbsp;복용한다.<br><P></P>복용간격은&nbsp;4시간&nbsp;이상으로&nbsp;한다.</p>
					</div>
					<div class="druginfo">
						<h4 class="title_dept3 ico">사용상의 주의사항</h4>
						<p id="caution">1.&nbsp;경고<br><P></P>1)&nbsp;매일&nbsp;세잔&nbsp;이상&nbsp;정기적으로&nbsp;술을&nbsp;마시는&nbsp;사람이&nbsp;이&nbsp;약이나&nbsp;다른&nbsp;해열진통제를&nbsp;복용해야&nbsp;할&nbsp;경우&nbsp;반드시&nbsp;의사&nbsp;또는&nbsp;약사와&nbsp;상의해야&nbsp;한다.&nbsp;이러한&nbsp;사람이&nbsp;이&nbsp;약을&nbsp;복용하면&nbsp;위장출혈이&nbsp;유발될&nbsp;수&nbsp;있다.<br><P></P>2)&nbsp;심혈관계&nbsp;위험:&nbsp;조절되지&nbsp;않는&nbsp;고혈압,&nbsp;울혈심부전증(NYHA&nbsp;II-III),&nbsp;확립된&nbsp;허혈성&nbsp;심장질환,&nbsp;말초동맥질환,&nbsp;뇌혈관질환을&nbsp;가진&nbsp;환자들은&nbsp;신중히&nbsp;고려하여&nbsp;이부프로펜을&nbsp;사용하여야하며&nbsp;고용량&nbsp;이부프로펜(1일&nbsp;2400mg)&nbsp;사용을&nbsp;피해야&nbsp;한다.&nbsp;또한&nbsp;심혈관계&nbsp;위험&nbsp;요소(예.&nbsp;고혈압,&nbsp;고지혈증,&nbsp;당뇨병,&nbsp;흡연)를&nbsp;가지고&nbsp;있는&nbsp;환자가&nbsp;고용량&nbsp;이부프로펜(1일&nbsp;2400mg)이&nbsp;필요한&nbsp;경우&nbsp;장기간&nbsp;치료를&nbsp;시작하기&nbsp;전에&nbsp;신중히&nbsp;고려해야한다.임상연구&nbsp;결과&nbsp;고용량(1일&nbsp;2400mg)&nbsp;이부프로펜&nbsp;사용이&nbsp;동맥&nbsp;혈전&nbsp;증상(심근경색증&nbsp;또는&nbsp;뇌졸중)에&nbsp;대한&nbsp;위험성을&nbsp;다소&nbsp;증가시킬&nbsp;수&nbsp;있다고&nbsp;나타났다.&nbsp;종합적으로&nbsp;역학연구&nbsp;결과&nbsp;저용량&nbsp;이부프로펜(예.&nbsp;1일&nbsp;1200&nbsp;mg&nbsp;이하)과&nbsp;동맥&nbsp;혈전&nbsp;증상의&nbsp;위험성&nbsp;증가간의&nbsp;연관성은&nbsp;증명되지&nbsp;않았다.<br><P></P>2.&nbsp;다음과&nbsp;같은&nbsp;사람은&nbsp;이&nbsp;약을&nbsp;복용하지&nbsp;말&nbsp;것.<br><P></P>1)&nbsp;이&nbsp;약&nbsp;및&nbsp;이&nbsp;약의&nbsp;구성성분에&nbsp;대한&nbsp;과민반응&nbsp;및&nbsp;그&nbsp;병력이&nbsp;있는&nbsp;사람<br><P></P>2)&nbsp;이&nbsp;약&nbsp;및&nbsp;이&nbsp;약의&nbsp;구성성분,&nbsp;다른&nbsp;해열진통제,&nbsp;감기약&nbsp;복용&nbsp;시&nbsp;천식을&nbsp;일으킨&nbsp;적이&nbsp;있는&nbsp;사람<br><P></P>3)&nbsp;만3개월&nbsp;미만의&nbsp;영아(갓난아기)<br><P></P>3.&nbsp;이&nbsp;약을&nbsp;복용하는&nbsp;동안&nbsp;다음의&nbsp;약을&nbsp;복용하지&nbsp;말&nbsp;것.<br><P></P>다른&nbsp;해열진통제,&nbsp;감기약,&nbsp;진정제<br><P></P>4.&nbsp;다음과&nbsp;같은&nbsp;사람은&nbsp;이&nbsp;약을&nbsp;복용하기&nbsp;전에&nbsp;의사,&nbsp;치과의사,&nbsp;약사와&nbsp;상의&nbsp;할&nbsp;것.<br><P></P>1)&nbsp;수두&nbsp;또는&nbsp;인플루엔자에&nbsp;감염되어&nbsp;있거나&nbsp;또는&nbsp;의심되는&nbsp;영아(갓난아기)&nbsp;및&nbsp;만&nbsp;15세&nbsp;미만의&nbsp;어린이(구역이나&nbsp;구토를&nbsp;수반하는&nbsp;행동의&nbsp;변화가&nbsp;있다면,&nbsp;드물지만&nbsp;심각한&nbsp;질병인&nbsp;레이증후군의&nbsp;초기&nbsp;증상일&nbsp;수&nbsp;있으므로&nbsp;의사와&nbsp;상의할&nbsp;것.)<br><P></P>2)&nbsp;만&nbsp;3&nbsp;개월&nbsp;이상&nbsp;만&nbsp;1세&nbsp;미만의&nbsp;영아(갓난아기)는&nbsp;의사의&nbsp;진료를&nbsp;받는&nbsp;것을&nbsp;우선으로&nbsp;하며,&nbsp;부득이한&nbsp;경우를&nbsp;제외하고는&nbsp;복용시키지&nbsp;않는&nbsp;것이&nbsp;바람직하다.<br><P></P>3)&nbsp;본인,&nbsp;양친&nbsp;또는&nbsp;형제&nbsp;등이&nbsp;두드러기,&nbsp;접촉성피부염,&nbsp;기관지천식,&nbsp;알레르기성비염(코염),&nbsp;편두통,&nbsp;음식물알레르기&nbsp;등을&nbsp;일으키기&nbsp;쉬운&nbsp;체질을&nbsp;갖고&nbsp;있는&nbsp;사람<br><P></P>4)&nbsp;지금까지&nbsp;약에&nbsp;의해&nbsp;알레르기&nbsp;증상(예:&nbsp;발열,&nbsp;발진,&nbsp;관절통,&nbsp;천식,&nbsp;가려움증&nbsp;등)을&nbsp;일으킨&nbsp;적이&nbsp;있는&nbsp;사람<br><P></P>5)&nbsp;간장질환,&nbsp;신장(콩팥)질환,&nbsp;갑상선질환,&nbsp;당뇨병,&nbsp;고혈압&nbsp;등이&nbsp;있는&nbsp;사람,&nbsp;몸이&nbsp;약한&nbsp;사람&nbsp;또는&nbsp;고열이&nbsp;있는&nbsp;사람<br><P></P>6)&nbsp;고령자(노인)<br><P></P>7)&nbsp;임부&nbsp;또는&nbsp;임신하고&nbsp;있을&nbsp;가능성이&nbsp;있는&nbsp;여성,&nbsp;수유부<br><P></P>8)&nbsp;의사&nbsp;또는&nbsp;치과의사의&nbsp;치료를&nbsp;받고&nbsp;있는&nbsp;사람(당뇨약,&nbsp;통풍약,&nbsp;관절염약,&nbsp;항응고제,&nbsp;스테로이드제&nbsp;등&nbsp;다른&nbsp;약물을&nbsp;투여&nbsp;받고&nbsp;있는&nbsp;사람)<br><P></P>9)&nbsp;속쓰림,&nbsp;위부불쾌감,&nbsp;위통과&nbsp;같은&nbsp;위장문제가&nbsp;지속&nbsp;혹은&nbsp;재발되거나&nbsp;궤양,&nbsp;출혈문제를&nbsp;가지고&nbsp;있는&nbsp;사람<br><P></P>10)&nbsp;구토와&nbsp;설사로&nbsp;많은&nbsp;수분을&nbsp;손실하거나&nbsp;수분을&nbsp;흡수하지&nbsp;않는&nbsp;사람&nbsp;또는&nbsp;이뇨제를&nbsp;복용하는&nbsp;사람<br><P></P>11)&nbsp;심근경색이나&nbsp;뇌졸중&nbsp;예방목적으로&nbsp;저용량&nbsp;아스피린을&nbsp;복용하는&nbsp;사람&nbsp;(이&nbsp;약은&nbsp;아스피린의&nbsp;효과를&nbsp;감소시키고,&nbsp;중증의&nbsp;위장관계&nbsp;이상반응의&nbsp;발생&nbsp;위험을&nbsp;증가시킬&nbsp;수&nbsp;있다.)&nbsp;실험실적&nbsp;자료에서&nbsp;이부프로펜과&nbsp;아스피린(아세틸살리실산)&nbsp;병용투여시&nbsp;이부프로펜이&nbsp;저용량&nbsp;아스피린의&nbsp;혈소판&nbsp;응집&nbsp;효과를&nbsp;억제할&nbsp;수&nbsp;있다고&nbsp;나타났다.&nbsp;이&nbsp;데이터&nbsp;외삽법에&nbsp;대해&nbsp;임상적으로&nbsp;불확실성이&nbsp;존재하지만&nbsp;일반적&nbsp;또는&nbsp;장기간&nbsp;이부프로펜&nbsp;사용시,&nbsp;저용량&nbsp;아스피린의&nbsp;심장&nbsp;보호&nbsp;효과가&nbsp;감소될&nbsp;수&nbsp;있다.<br><P></P>5.&nbsp;다음과&nbsp;같은&nbsp;경우&nbsp;이&nbsp;약의&nbsp;복용을&nbsp;즉각&nbsp;중지하고&nbsp;의사,&nbsp;치과의사,&nbsp;약사와&nbsp;상의할&nbsp;것.&nbsp;상담&nbsp;시&nbsp;가능한&nbsp;한&nbsp;이&nbsp;첨부문서를&nbsp;소지할&nbsp;것.<br><P></P>1)&nbsp;이&nbsp;약의&nbsp;복용에&nbsp;의해&nbsp;다음의&nbsp;증상이&nbsp;나타난&nbsp;경우<br><P></P>발진·발적(충혈되어&nbsp;붉어짐),&nbsp;가려움,&nbsp;구역·구토,&nbsp;식욕부진,&nbsp;변비,&nbsp;위통,&nbsp;소화관출혈,&nbsp;위부불쾌감,&nbsp;어지러움,&nbsp;부종(부기)<br><P></P>2）이&nbsp;약의&nbsp;복용에&nbsp;의해&nbsp;드물게&nbsp;아래의&nbsp;중증(심한&nbsp;증상)&nbsp;증상이&nbsp;나타난&nbsp;경우<br><P></P>①&nbsp;아나필락시쇽(과민성쇼크)&nbsp;:&nbsp;복용후&nbsp;바로&nbsp;두드러기,&nbsp;부종(부기),&nbsp;가슴답답함&nbsp;등과&nbsp;함께&nbsp;안색이&nbsp;창백하고,&nbsp;손발이&nbsp;차고,&nbsp;식은땀,&nbsp;숨쉬기&nbsp;곤란함&nbsp;등이&nbsp;나타날&nbsp;수&nbsp;있다.<br><P></P>②&nbsp;피부점막안증후군(스티븐스-존슨증후군),&nbsp;중독성표피괴사용해(리엘증후군)&nbsp;:&nbsp;고열을&nbsp;동반하고,&nbsp;발진·발적(충혈되어&nbsp;붉어짐),&nbsp;화상과&nbsp;같이&nbsp;물집이&nbsp;생기는&nbsp;등의&nbsp;심한&nbsp;증상이&nbsp;전신피부,&nbsp;입이나&nbsp;눈&nbsp;점막에&nbsp;나타날&nbsp;수&nbsp;있다.<br><P></P>③&nbsp;천식<br><P></P>3)&nbsp;5~6회&nbsp;복용하여도&nbsp;증상이&nbsp;좋아지지&nbsp;않을&nbsp;경우<br><P></P>4)&nbsp;광민감&nbsp;반응(빈도불명),&nbsp;빈도불명의&nbsp;호산구&nbsp;증가&nbsp;및&nbsp;전신&nbsp;증후군을&nbsp;동반한&nbsp;약물&nbsp;발진(DRESS&nbsp;증후군)이&nbsp;나타날&nbsp;수&nbsp;있다.<br><P></P>5)&nbsp;이&nbsp;약의&nbsp;과량&nbsp;복용&nbsp;시&nbsp;대사산증이&nbsp;나타날&nbsp;수&nbsp;있다.<br><P></P>6.&nbsp;기타&nbsp;이&nbsp;약의&nbsp;복용시&nbsp;주의할&nbsp;사항<br><P></P>1)&nbsp;정해진&nbsp;용법·용량을&nbsp;잘&nbsp;지킬&nbsp;것.<br><P></P>2)&nbsp;장기간&nbsp;계속&nbsp;복용하지&nbsp;말&nbsp;것.<br><P></P>3)&nbsp;복용시에는&nbsp;음주하지&nbsp;말&nbsp;것.<br><P></P>7.&nbsp;저장상의&nbsp;주의사항<br><P></P>1)&nbsp;어린이의&nbsp;손에&nbsp;닿지&nbsp;않는&nbsp;장소에&nbsp;보관할&nbsp;것.<br><P></P>2)&nbsp;직사광선을&nbsp;피하고&nbsp;될&nbsp;수&nbsp;있는&nbsp;한&nbsp;습기가&nbsp;적은&nbsp;서늘한&nbsp;곳에(밀폐하여)&nbsp;보관할&nbsp;것.<br><P></P>3)&nbsp;오용(잘못&nbsp;사용)을&nbsp;막고&nbsp;품질의&nbsp;보존을&nbsp;위하여&nbsp;다른&nbsp;용기에&nbsp;바꾸어&nbsp;넣지&nbsp;말&nbsp;것.</p>
					</div>
					<div class="druginfo">
						<div id="drug_take">
							<h4 class="title_dept3 ico">복약정보</h4>
							<ul class="pictogram" id="picto_imglist">
								<!-- <li><img src="/images/sample_picto.jpg" alt="픽토그램" /></li>
								<li><img src="/images/sample_picto.jpg" alt="픽토그램" /></li>
								<li><img src="/images/sample_picto.jpg" alt="픽토그램" /></li>
								<li><img src="/images/sample_picto.jpg" alt="픽토그램" /></li>
								<li><img src="/images/sample_picto.jpg" alt="픽토그램" /></li>
								<li><img src="/images/sample_picto.jpg" alt="픽토그램" /></li> -->
							</ul>
							<p id="mediguide" style="margin-top:-15px;"></p>
						</div>

						

						<div id="take_tab"  style="display:none">
							<h4 class="title_dept3 ico">맞춤형 복약안내문</h4>
							<p>아래 버튼을 클릭하시면 식품의약품안전처에서 제공하는 대상별 상세 복약안내문을 보실 수 있습니다.</p>
							<ul class="infoBtns">
								<li style="display:none" id="li_patient">
									<input type="button" id="take_patient" value="환자용 복약안내서" >
								</li>
								<li style="display:none" id="li_pro">
									<input type="button" id="take_pro" value="전문가를 위한 상세 복약안내" >
								</li>
								<li style="display:none" id="li_customer">
									<input type="button" id="take_customer" value="일반소비자를 위한 요약 복약안내" >
								</li>
								<li style="display:none" id="li_preg">
									<input type="button" id="take_preg" value="임부 / 수유부를 위한 복약안내" >
								</li>
								<li style="display:none" id="li_chronic">
									<input type="button" id="take_chronic" value="만성질환자를 위한 복약안내" >
								</li>
								<li style="display:none" id="li_senior">
									<input type="button" id="take_senior" value="고령자를 위한 복약안내" >
								</li>
								<li style="display:none" id="li_form">
									<input type="button" id="take_form" value="제형별 그림 복약안내" >
								</li>
								<li style="display:none" id="li_eng">
									<input type="button" id="take_eng" value="영어 복약안내" >
								</li>
								<li style="display:none" id="li_chi">
									<input type="button" id="take_chi" value="중국어 복약안내" >
								</li>
							</ul>
						</div>
						<div>
							
							
						</div>
						<div class="mb0">
							
						</div>
					</div>
					<div class="druginfo comp" id="all_upso_tab">
						<h4 class="title_dept3 ico">제조 · 수입사</h4>
						<dl>
							<dt>회사명</dt>
							<dd id="all_upso_nm"></dd>
						</dl>
						<dl>
							<dt class="invis">회사 영문명</dt>
							<dd id="all_upso_enm">english name</dd>
						</dl>
						<dl style="display:none">
							<dt>주소</dt>
							<dd id="all_upso_addr"></dd>
						</dl>
						<dl>
							<dt>전화번호</dt>
							<dd id="all_upso_callnum"></dd>
						</dl>
						<dl style="display:none">
							<dt>FAX</dt>
							<dd id="all_upso_faxnum"></dd>
						</dl>
						<dl>
							<dt>홈페이지</dt>
							<dd id="all_upso_url"><a href="http://www.naver.com">http://www.naver.com</a></dd>
						</dl>
					</div>
				</div>
				<div class="tab2_cont">
					<div class="druginfo" id="tab_effect">
<!-- 					효능 · 효과<br/> -->
					1.&nbsp;두통,&nbsp;치통,&nbsp;발치후&nbsp;동통(통증),&nbsp;인후(목구멍)통,&nbsp;귀의&nbsp;통증,&nbsp;관절통,&nbsp;신경통,&nbsp;요통,&nbsp;근육통,&nbsp;견통(어깨결림),&nbsp;타박통,&nbsp;골절통,&nbsp;염좌통(삠통증),&nbsp;월경통(생리통),&nbsp;외상통의&nbsp;진통,<br><P></P>2.&nbsp;오한(춥고&nbsp;떨리는&nbsp;증상),&nbsp;발열시의&nbsp;해열</div>
				</div>
				<div class="tab2_cont">
					<div class="druginfo" id="tab_dosage">
<!-- 					용법용량<br/> -->
					만&nbsp;11세이상&nbsp;및&nbsp;성인&nbsp;:&nbsp;1일&nbsp;1~3회,&nbsp;1회&nbsp;1캡슐<br><P></P>공복(빈&nbsp;속)시를&nbsp;피하여&nbsp;복용한다.<br><P></P>복용간격은&nbsp;4시간&nbsp;이상으로&nbsp;한다.</div>
				</div>
				<div class="tab2_cont">
					<div class="druginfo" id="tab_caution">
<!-- 					주의사항<br/> -->
					1.&nbsp;경고<br><P></P>1)&nbsp;매일&nbsp;세잔&nbsp;이상&nbsp;정기적으로&nbsp;술을&nbsp;마시는&nbsp;사람이&nbsp;이&nbsp;약이나&nbsp;다른&nbsp;해열진통제를&nbsp;복용해야&nbsp;할&nbsp;경우&nbsp;반드시&nbsp;의사&nbsp;또는&nbsp;약사와&nbsp;상의해야&nbsp;한다.&nbsp;이러한&nbsp;사람이&nbsp;이&nbsp;약을&nbsp;복용하면&nbsp;위장출혈이&nbsp;유발될&nbsp;수&nbsp;있다.<br><P></P>2)&nbsp;심혈관계&nbsp;위험:&nbsp;조절되지&nbsp;않는&nbsp;고혈압,&nbsp;울혈심부전증(NYHA&nbsp;II-III),&nbsp;확립된&nbsp;허혈성&nbsp;심장질환,&nbsp;말초동맥질환,&nbsp;뇌혈관질환을&nbsp;가진&nbsp;환자들은&nbsp;신중히&nbsp;고려하여&nbsp;이부프로펜을&nbsp;사용하여야하며&nbsp;고용량&nbsp;이부프로펜(1일&nbsp;2400mg)&nbsp;사용을&nbsp;피해야&nbsp;한다.&nbsp;또한&nbsp;심혈관계&nbsp;위험&nbsp;요소(예.&nbsp;고혈압,&nbsp;고지혈증,&nbsp;당뇨병,&nbsp;흡연)를&nbsp;가지고&nbsp;있는&nbsp;환자가&nbsp;고용량&nbsp;이부프로펜(1일&nbsp;2400mg)이&nbsp;필요한&nbsp;경우&nbsp;장기간&nbsp;치료를&nbsp;시작하기&nbsp;전에&nbsp;신중히&nbsp;고려해야한다.임상연구&nbsp;결과&nbsp;고용량(1일&nbsp;2400mg)&nbsp;이부프로펜&nbsp;사용이&nbsp;동맥&nbsp;혈전&nbsp;증상(심근경색증&nbsp;또는&nbsp;뇌졸중)에&nbsp;대한&nbsp;위험성을&nbsp;다소&nbsp;증가시킬&nbsp;수&nbsp;있다고&nbsp;나타났다.&nbsp;종합적으로&nbsp;역학연구&nbsp;결과&nbsp;저용량&nbsp;이부프로펜(예.&nbsp;1일&nbsp;1200&nbsp;mg&nbsp;이하)과&nbsp;동맥&nbsp;혈전&nbsp;증상의&nbsp;위험성&nbsp;증가간의&nbsp;연관성은&nbsp;증명되지&nbsp;않았다.<br><P></P>2.&nbsp;다음과&nbsp;같은&nbsp;사람은&nbsp;이&nbsp;약을&nbsp;복용하지&nbsp;말&nbsp;것.<br><P></P>1)&nbsp;이&nbsp;약&nbsp;및&nbsp;이&nbsp;약의&nbsp;구성성분에&nbsp;대한&nbsp;과민반응&nbsp;및&nbsp;그&nbsp;병력이&nbsp;있는&nbsp;사람<br><P></P>2)&nbsp;이&nbsp;약&nbsp;및&nbsp;이&nbsp;약의&nbsp;구성성분,&nbsp;다른&nbsp;해열진통제,&nbsp;감기약&nbsp;복용&nbsp;시&nbsp;천식을&nbsp;일으킨&nbsp;적이&nbsp;있는&nbsp;사람<br><P></P>3)&nbsp;만3개월&nbsp;미만의&nbsp;영아(갓난아기)<br><P></P>3.&nbsp;이&nbsp;약을&nbsp;복용하는&nbsp;동안&nbsp;다음의&nbsp;약을&nbsp;복용하지&nbsp;말&nbsp;것.<br><P></P>다른&nbsp;해열진통제,&nbsp;감기약,&nbsp;진정제<br><P></P>4.&nbsp;다음과&nbsp;같은&nbsp;사람은&nbsp;이&nbsp;약을&nbsp;복용하기&nbsp;전에&nbsp;의사,&nbsp;치과의사,&nbsp;약사와&nbsp;상의&nbsp;할&nbsp;것.<br><P></P>1)&nbsp;수두&nbsp;또는&nbsp;인플루엔자에&nbsp;감염되어&nbsp;있거나&nbsp;또는&nbsp;의심되는&nbsp;영아(갓난아기)&nbsp;및&nbsp;만&nbsp;15세&nbsp;미만의&nbsp;어린이(구역이나&nbsp;구토를&nbsp;수반하는&nbsp;행동의&nbsp;변화가&nbsp;있다면,&nbsp;드물지만&nbsp;심각한&nbsp;질병인&nbsp;레이증후군의&nbsp;초기&nbsp;증상일&nbsp;수&nbsp;있으므로&nbsp;의사와&nbsp;상의할&nbsp;것.)<br><P></P>2)&nbsp;만&nbsp;3&nbsp;개월&nbsp;이상&nbsp;만&nbsp;1세&nbsp;미만의&nbsp;영아(갓난아기)는&nbsp;의사의&nbsp;진료를&nbsp;받는&nbsp;것을&nbsp;우선으로&nbsp;하며,&nbsp;부득이한&nbsp;경우를&nbsp;제외하고는&nbsp;복용시키지&nbsp;않는&nbsp;것이&nbsp;바람직하다.<br><P></P>3)&nbsp;본인,&nbsp;양친&nbsp;또는&nbsp;형제&nbsp;등이&nbsp;두드러기,&nbsp;접촉성피부염,&nbsp;기관지천식,&nbsp;알레르기성비염(코염),&nbsp;편두통,&nbsp;음식물알레르기&nbsp;등을&nbsp;일으키기&nbsp;쉬운&nbsp;체질을&nbsp;갖고&nbsp;있는&nbsp;사람<br><P></P>4)&nbsp;지금까지&nbsp;약에&nbsp;의해&nbsp;알레르기&nbsp;증상(예:&nbsp;발열,&nbsp;발진,&nbsp;관절통,&nbsp;천식,&nbsp;가려움증&nbsp;등)을&nbsp;일으킨&nbsp;적이&nbsp;있는&nbsp;사람<br><P></P>5)&nbsp;간장질환,&nbsp;신장(콩팥)질환,&nbsp;갑상선질환,&nbsp;당뇨병,&nbsp;고혈압&nbsp;등이&nbsp;있는&nbsp;사람,&nbsp;몸이&nbsp;약한&nbsp;사람&nbsp;또는&nbsp;고열이&nbsp;있는&nbsp;사람<br><P></P>6)&nbsp;고령자(노인)<br><P></P>7)&nbsp;임부&nbsp;또는&nbsp;임신하고&nbsp;있을&nbsp;가능성이&nbsp;있는&nbsp;여성,&nbsp;수유부<br><P></P>8)&nbsp;의사&nbsp;또는&nbsp;치과의사의&nbsp;치료를&nbsp;받고&nbsp;있는&nbsp;사람(당뇨약,&nbsp;통풍약,&nbsp;관절염약,&nbsp;항응고제,&nbsp;스테로이드제&nbsp;등&nbsp;다른&nbsp;약물을&nbsp;투여&nbsp;받고&nbsp;있는&nbsp;사람)<br><P></P>9)&nbsp;속쓰림,&nbsp;위부불쾌감,&nbsp;위통과&nbsp;같은&nbsp;위장문제가&nbsp;지속&nbsp;혹은&nbsp;재발되거나&nbsp;궤양,&nbsp;출혈문제를&nbsp;가지고&nbsp;있는&nbsp;사람<br><P></P>10)&nbsp;구토와&nbsp;설사로&nbsp;많은&nbsp;수분을&nbsp;손실하거나&nbsp;수분을&nbsp;흡수하지&nbsp;않는&nbsp;사람&nbsp;또는&nbsp;이뇨제를&nbsp;복용하는&nbsp;사람<br><P></P>11)&nbsp;심근경색이나&nbsp;뇌졸중&nbsp;예방목적으로&nbsp;저용량&nbsp;아스피린을&nbsp;복용하는&nbsp;사람&nbsp;(이&nbsp;약은&nbsp;아스피린의&nbsp;효과를&nbsp;감소시키고,&nbsp;중증의&nbsp;위장관계&nbsp;이상반응의&nbsp;발생&nbsp;위험을&nbsp;증가시킬&nbsp;수&nbsp;있다.)&nbsp;실험실적&nbsp;자료에서&nbsp;이부프로펜과&nbsp;아스피린(아세틸살리실산)&nbsp;병용투여시&nbsp;이부프로펜이&nbsp;저용량&nbsp;아스피린의&nbsp;혈소판&nbsp;응집&nbsp;효과를&nbsp;억제할&nbsp;수&nbsp;있다고&nbsp;나타났다.&nbsp;이&nbsp;데이터&nbsp;외삽법에&nbsp;대해&nbsp;임상적으로&nbsp;불확실성이&nbsp;존재하지만&nbsp;일반적&nbsp;또는&nbsp;장기간&nbsp;이부프로펜&nbsp;사용시,&nbsp;저용량&nbsp;아스피린의&nbsp;심장&nbsp;보호&nbsp;효과가&nbsp;감소될&nbsp;수&nbsp;있다.<br><P></P>5.&nbsp;다음과&nbsp;같은&nbsp;경우&nbsp;이&nbsp;약의&nbsp;복용을&nbsp;즉각&nbsp;중지하고&nbsp;의사,&nbsp;치과의사,&nbsp;약사와&nbsp;상의할&nbsp;것.&nbsp;상담&nbsp;시&nbsp;가능한&nbsp;한&nbsp;이&nbsp;첨부문서를&nbsp;소지할&nbsp;것.<br><P></P>1)&nbsp;이&nbsp;약의&nbsp;복용에&nbsp;의해&nbsp;다음의&nbsp;증상이&nbsp;나타난&nbsp;경우<br><P></P>발진·발적(충혈되어&nbsp;붉어짐),&nbsp;가려움,&nbsp;구역·구토,&nbsp;식욕부진,&nbsp;변비,&nbsp;위통,&nbsp;소화관출혈,&nbsp;위부불쾌감,&nbsp;어지러움,&nbsp;부종(부기)<br><P></P>2）이&nbsp;약의&nbsp;복용에&nbsp;의해&nbsp;드물게&nbsp;아래의&nbsp;중증(심한&nbsp;증상)&nbsp;증상이&nbsp;나타난&nbsp;경우<br><P></P>①&nbsp;아나필락시쇽(과민성쇼크)&nbsp;:&nbsp;복용후&nbsp;바로&nbsp;두드러기,&nbsp;부종(부기),&nbsp;가슴답답함&nbsp;등과&nbsp;함께&nbsp;안색이&nbsp;창백하고,&nbsp;손발이&nbsp;차고,&nbsp;식은땀,&nbsp;숨쉬기&nbsp;곤란함&nbsp;등이&nbsp;나타날&nbsp;수&nbsp;있다.<br><P></P>②&nbsp;피부점막안증후군(스티븐스-존슨증후군),&nbsp;중독성표피괴사용해(리엘증후군)&nbsp;:&nbsp;고열을&nbsp;동반하고,&nbsp;발진·발적(충혈되어&nbsp;붉어짐),&nbsp;화상과&nbsp;같이&nbsp;물집이&nbsp;생기는&nbsp;등의&nbsp;심한&nbsp;증상이&nbsp;전신피부,&nbsp;입이나&nbsp;눈&nbsp;점막에&nbsp;나타날&nbsp;수&nbsp;있다.<br><P></P>③&nbsp;천식<br><P></P>3)&nbsp;5~6회&nbsp;복용하여도&nbsp;증상이&nbsp;좋아지지&nbsp;않을&nbsp;경우<br><P></P>4)&nbsp;광민감&nbsp;반응(빈도불명),&nbsp;빈도불명의&nbsp;호산구&nbsp;증가&nbsp;및&nbsp;전신&nbsp;증후군을&nbsp;동반한&nbsp;약물&nbsp;발진(DRESS&nbsp;증후군)이&nbsp;나타날&nbsp;수&nbsp;있다.<br><P></P>5)&nbsp;이&nbsp;약의&nbsp;과량&nbsp;복용&nbsp;시&nbsp;대사산증이&nbsp;나타날&nbsp;수&nbsp;있다.<br><P></P>6.&nbsp;기타&nbsp;이&nbsp;약의&nbsp;복용시&nbsp;주의할&nbsp;사항<br><P></P>1)&nbsp;정해진&nbsp;용법·용량을&nbsp;잘&nbsp;지킬&nbsp;것.<br><P></P>2)&nbsp;장기간&nbsp;계속&nbsp;복용하지&nbsp;말&nbsp;것.<br><P></P>3)&nbsp;복용시에는&nbsp;음주하지&nbsp;말&nbsp;것.<br><P></P>7.&nbsp;저장상의&nbsp;주의사항<br><P></P>1)&nbsp;어린이의&nbsp;손에&nbsp;닿지&nbsp;않는&nbsp;장소에&nbsp;보관할&nbsp;것.<br><P></P>2)&nbsp;직사광선을&nbsp;피하고&nbsp;될&nbsp;수&nbsp;있는&nbsp;한&nbsp;습기가&nbsp;적은&nbsp;서늘한&nbsp;곳에(밀폐하여)&nbsp;보관할&nbsp;것.<br><P></P>3)&nbsp;오용(잘못&nbsp;사용)을&nbsp;막고&nbsp;품질의&nbsp;보존을&nbsp;위하여&nbsp;다른&nbsp;용기에&nbsp;바꾸어&nbsp;넣지&nbsp;말&nbsp;것.</div>
				</div>
				<div class="tab2_cont">
					<div class="druginfo" id="drug_take_detail" ></div>
				</div>
				<div class="druginfo comp tab2_cont" id="tab_upso">
<!-- 					<div class="druginfo" >adsasd제조 수입사</div> -->
				</div>
			</article><!-- //허가정보∙복약정보 -->
			
		</section><!-- //의약품상세정보 -->
		
	</section><!-- //articles_sub -->
	<form id="frm_durmore" name="" method="" action="/searchDrug/search_DUR.asp">
		<input type="hidden" id="inits" name="inits" value="2" />
		<input type="hidden" id="tr_cnt" name="tr_cnt" value="1" />
		<input type="hidden" id="cart_cnt" name="cart_cnt" value="1" />
		<input type="hidden" id="searchWord" name="searchWord" value="" />
		<input type="hidden" id="codelist" name="codelist" value="2019121000003" />
		<input type="hidden" id="drug_code_hidden" name="drug_code_hidden" value="2019121000003" />
		<input type="hidden" id="drug_name_hidden" name="drug_name_hidden" value="" />
		<input type="hidden" id="list_sunb_name_hidden" name="list_sunb_name_hidden" value="" />
	</form>
	
	<!-- 위치계산용-삭제금지 -->
	<div id="catcher"></div>
	

 
</section><!-- //컨텐츠 -->
</div><!-- //wrap -->


<%@include file="../common/footer.jsp" %> 
      <!-- end copyrights -->
     <%--  <a href="#home" data-scroll class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>
      <!-- all js files -->
      <script src="${path_resources_lifecare}js/all.js"></script>
      <!-- all plugins -->
      <script src="${path_resources_lifecare}js/custom.js"></script> --%>
   </body>
</html>
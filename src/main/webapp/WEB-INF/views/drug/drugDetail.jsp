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
});


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

			<div style="height:30px;"></div>
			<!-- 기본정보 -->
			<article id="druginfo01">
				<div class="hgroup">
				</div>
				<a style="cursor:pointer" onclick="javascript:window.print();" style="float:right"><span class="">화면 인쇄</span></a>
				<table class="infotable">
					<tr>
						<th class="name" style="width:103px;" >제품명</th>
						<td style="width:330px;"> ${detail.drug_name}</td>
					
						<th colspan="2" style="width:377px;">식별이미지</th>
						
					<tr>
						<th >전문 / 일반</th>
						<td><span id="drug_cls"></span>${detail.drug_division} <span id="narcotic_kind" style="color:red"></span></td>
						
						<td class="img" rowspan="3" colspan="2" style="text-align: -webkit-center; width:377px;">
							<div class="infoOver view_drugimg" >
								<a><img  alt="의약품이미지" src="${detail.drug_productimage}" style="width: 200px; height: 150px; margin-bottom: 8px;"></a>
								
								<div class="popupbx pop_more" style="display: none;">
									<h6> ${detail.drug_name}</h6>
									<a title="닫기" class="close ico"></a>
									<img alt=" ${detail.drug_name}" src="${detail.drug_productimage}">
									<table class="identity">
										<tbody>
											<tr>
												<th ">식별표시</th>
												<td> ${detail.drug_frontShape} </td>
											</tr>
										</tbody>
									</table>
									<table>
										<tbody>
											<tr>
												<th>장축(mm)</th>
												<td>${detail.drug_size_l}</td>
												<th>단축(mm)</th>
												<td>${detail.drug_size_s}</td>
												<th>두께(mm)</th>
												<td>${detail.drug_size_w}</td>
											</tr>
											<tr>
												<th>성상</th>
												<td class="txtL" colspan="5">${detail.drug_formulation}</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>회사명</th>
						<td style="width:130px;">
							${detail.drug_enptname}
						</td>
					</tr>
					<tr>		
						<th >허가일</th>
						<td > <span id="item_permit_date">${detail.drug_license_date}</span>
						</td>
					</tr>
					<tr>
						<th>제형</th>
						<td id="drug_form">${detail.drug_formulation}</td>
						<th colspan="2">장축(mm)&nbsp;/&nbsp;단축(mm)&nbsp;/&nbsp;두께(mm)</th>
					</tr>
					<tr>
						<th>모양</th>
						<td id="charact">${detail.drug_shape}</td>
						<td  colspan="2"  style="text-align:center">${detail.drug_size_l}&nbsp;/&nbsp;${detail.drug_size_s}&nbsp;/&nbsp;${detail.drug_size_w}</td>
					</tr>
					
					<tr>
						<th>약품 일련번호</th>
						<td id="atc_cd">${detail.drug_number}</td>
						<th> 색상</th>
						<td class="categ" style="text-align:center">${detail.drug_color}</td>
					</tr>
					<tr>
						<th>약품 분류</th>
						<td  id="cls_code">${detail.drug_category}</td>
					
						<th class="bb0">저장 방법 </th>
						<td class="bb0 br0" id="stmt">${detail.drug_storage }</td>
					</tr>
					<tr>
						<th>첨가제</th>
						<td colspan="3" class="additives" id="additives_td">

							<ul id="additives">
								<li><a href="#"></a>${detail.drug_additives}</li>
								<li><a href="#"></a></li>
							</ul>
						</td>
					</tr>
				</table>
			</article><!-- //기본정보 -->
			
		 <!-- 허가정보∙복약정보 -->
			<article id="druginfo02">
				<h3 class="subtitle">복약정보 및 주의사항</h3>
				<div class="tab2_cont">
					<div class="druginfo">
						<h4 class="title_dept3 ico">효능 · 효과</h4>
						<p id="effect"><a href="${detail.drug_effect }">효능 · 효과 정보 확인하기</a></p>
						
						
					</div>
					<div class="druginfo">
						<h4 class="title_dept3 ico">용법 · 용량</h4>
						<p id="dosage"><a href="${detail.drug_dosage}">용법 · 용량 확인하기</a></p>
					</div>
					<div class="druginfo">
						<h4 class="title_dept3 ico">사용상의 주의사항</h4>
						<p id="caution"><a href="${detail.drug_precautions}">사용상의 주의사항 확인하기</a></p>
					</div>
			</div>
			</article><!-- //허가정보∙복약정보 -->
		</section><!-- //의약품상세정보 -->
		
	</section><!-- //articles_sub -->
	
 
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
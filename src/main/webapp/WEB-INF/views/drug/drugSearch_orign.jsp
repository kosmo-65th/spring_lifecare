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
<script src="${path_resources_js}jquery.lazyload.js"></script>
<script src="${path_resources_js}jquery.bxslider.min.js"></script>


<script type="text/javascript">

$(function(){
	$('#btn_idfysearch').click(function(){
		var drug_name = document.getElementById("drug_name").value;
		var drug_enptname = document.getElementById("entp_name").value;
		alert("drug_name : " + drug_name);
		alert("drug_enptname : " + drug_enptname);
		
	    var shapeList = new Array();
        $("input[name=shapes]:checked").each(function(){
        	shapeList.push($(this).val());
        });
		alert("shapeList : " + shapeList);

		var formList = new Array();
        $("input[name=forms]:checked").each(function(){
        	formList.push($(this).val());
        });
		alert("formList : " + formList);
		
		
		window.location="drugSearchPro?drug_shape=" + shapeList + "&drug_name=" +drug_name + "&drug_enptname="+drug_enptname+ "&drug_formulation="+formList; 
		alert("11111");
	});
})
function searchDrug() {
	
	return false;
}
</script>

<script type="text/javascript">

	var selectCnt = 0
	var mainResult
	var selectEtc = 0

$(document).ready(function() {

//	init();
	// 카트 초기화 (쿠키에 저장된 제품 불러오기)
	initCart();

	// 선택된 input(API로 전송할 값) checkbox 체크
	$(".idty li.selected input[type='checkbox']").attr('checked',true);

		// 선택된 input(API로 전송할 값) checkbox 체크
	$(".idty li").click(function(){
		$(".idty li.selected input[type='checkbox']").prop('checked',true);
	});


	if('' == "Y") {

		pageBar(1);

		$('#line_selectBoxTitle').text("50줄 보기");

		$('input[name=shapes_etc]:checked').click().click();

		moveform();
	}

	if('' == "") {
		sideCalc();
	}

	if('0' == 80) {
		$("#shape_etc_text ul").empty();
	}

	$(".pop_more").draggable();



});
$(document).keydown(function(event) {
	if(event.keyCode == 27) {
		$(".pop_more").css("display","none");
	}
});

function init() {
	$("#drug_name").val("");
	$("#firm_name").val("");
	$("#drug_print_front").val("");
	$("#drug_print_back").val("");
}
function searchEnter(){
	if(event.keyCode == 13){
		if($("#drug_name").val() == ""){
			alert("제품명을 입력해주세요.");
			return false;
		}else{
			$("#proYN").val("");
			$("#rowLength").val(50);
			$("#TabState").val("0");
			$("#pageNo").val(1);
			$("#frm").submit();
		}
	}
}
function searchEnter2(){
	if(event.keyCode == 13){
		if($("#firm_name").val() == ""){
			alert("회사명을 입력해주세요.");
			return false;
		}else{
			$("#proYN").val("");
			$("#rowLength").val(50);
			$("#TabState").val("0");
			$("#pageNo").val(1);
			$("#frm").submit();
		}
	}
}
function searchEnter3(){
	if(event.keyCode == 13){
		if($("#drug_print_front").val() == ""){
			alert("문자를 입력해주세요.");
			return false;
		}else{
			$("#proYN").val("");
			$("#rowLength").val(50);
			$("#TabState").val("0");
			$("#pageNo").val(1);
			$("#frm").submit();
		}
	}
}
function searchEnter4(){
	if(event.keyCode == 13){
		if($("#drug_print_back").val() == ""){
			alert("문자를 입력해주세요.");
			return false;
		}else{
			$("#proYN").val("");
			$("#rowLength").val(50);
			$("#TabState").val("0");
			$("#pageNo").val(1);
			$("#frm").submit();
		}
	}
}
function idfySend() {
	$("#proYN").val("");
	$("#rowLength").val(50);
	$("#TabState").val("0");
	$("#pageNo").val(1);
	$("#frm").submit();
}
function moveform() {
		
		//기준이 될 div  현재 top값
		var topset = $("#result").offset().top;
		alert(topset);

		//움직일 div top 값
		var offset = $("#result").offset().top;
		alert(offset);

		// 148 :  헤더 차지값, 826 : top버튼 눌렀을때 최상단부터 기준div top값
		var chaset = 148 - ( 1168 - parseInt(topset));
		alert(chaset);

		$("html,body").stop().animate({
			scrollTop : offset - chaset
		},0);

		sideCalc();
}
function pageBar(page_val) {
	
	alert(page_val)

	//페이징 처리를 위한 계산
	var startp = "";
	var endp = "";

	//현재 요청들어온 페이지
	var req_page = page_val;
	
	//현재 페이지값이 0이라면 1로 강제셋팅
	if(req_page == ""){
		req_page ='1';
	}else{
		req_page = page_val;
	}
	
	
	//전체 페이지를 나누기 위해 count 체크
	var totalCnt = 0;

	alert(totalCnt)


		//하단 페이징바 작업
		var pagingHtml = "";
		// <<버튼 작업 - 무조건 처음으로
		pagingHtml += "<a style='cursor:pointer' onclick='javascript:changePage(1)' class='first ico' alt='처음'></a>";

		var nexted = parseInt(page_val)-1; 
		// <버튼 작업 - 이전페이지로 이동		
		//if(parseInt(page_val) < 10){
			// 10페이지보다 작으면 1페이지로 보낸다.
			//pagingHtml += "<a style='cursor:pointer' onclick='javascript:changePage(1)' class='left ico' alt='이전'></a>"
		//}else if(parseInt(page_val) >= 10){
			// 10페이지보다 크면 9페이지 전으로 넘긴다
		if(nexted > 1){
			pagingHtml += "<a style='cursor:pointer' onclick='javascript:changePage("+nexted+")' class='left ico' alt='이전'></a>"
		}else{
			pagingHtml += "<a style='cursor:pointer' onclick='javascript:changePage(1)' class='left ico' alt='이전'></a>"
		}
			
		pagingHtml += "<span>"
		
		var postPbar;
		var prePbar;
		var maxPbar;
		var ceilvalue = Math.ceil(totalCnt/50);
		
		//현재페이지 값이 6페이지와 같거나 크면 첫번째 for문을 시작한다.
		if(parseInt(page_val) >= 6){
			if((parseInt(page_val)+5) > ceilvalue){
				postPbar = Math.ceil(parseInt(totalCnt)/parseInt('50'));
				prePbar = postPbar - 5;
			}else{
				postPbar = parseInt(page_val) + 5;
				prePbar = parseInt(page_val) - 4;
			}

			alert(postPbar)
			alert(prePbar)
			
			for(var i = prePbar  ; i <= postPbar ; i++){
				pagingHtml += "<a style='cursor:pointer' onclick='javascript:changePage("+i+ ")' target='_self'";
				if(page_val == i){
					pagingHtml += "class='current' >"+i+"</a>";
				}else{
					pagingHtml += ">"+i+"</a>";
				}

				if(i == ceilvalue){
					break;
				}
			}

		}else if(parseInt(page_val) < 6){
			//현재 페이지가 6페이지보다 작은 1,2페이지 일때
			//10보다 크면 10페이지까지 최초에 찍어준다. 그렇지 않고 10미만이라면 총 페이지바 값을 max로 잡는다.
			if(ceilvalue > 10){
				maxPbar = 10;
			}else if(ceilvalue <= 10){
				maxPbar = ceilvalue
			}

			for(var j = 1 ; j <= maxPbar; j++){
				pagingHtml += "<a style='cursor:pointer' onclick='javascript:changePage("+ j + ")' target='_self'"
				if(page_val == j){
					pagingHtml += "class='current' >"+j+"</a>"
				}else{
					pagingHtml += ">"+j+"</a>"
				}				
			}
			pagingHtml += "</span>";		
		}

		alert(ceilvalue)
		
		
		if((parseInt(page_val) <=5) && (ceilvalue >= parseInt(page_val)+9)){
			pagingHtml+= "<a style='cursor:pointer' class='right ico' alt='다음' target='_self' onclick='javascript:changePage("+(parseInt(page_val)+1) +")'></a>"
		}else if((parseInt(page_val) <=5) && (ceilvalue <= parseInt(page_val)+9)){
			pagingHtml+= "<a style='cursor:pointer' class='right ico' alt='다음' target='_self' onclick='javascript:changePage("+ (parseInt(page_val)+1) +")'></a>"
		}else if((parseInt(page_val) >5) && (ceilvalue >= parseInt(page_val)+9)){
			pagingHtml+= "<a style='cursor:pointer' class='right ico' alt='다음' target='_self' onclick='javascript:changePage("+(parseInt(page_val)+1) +")'></a>"
		}else if((parseInt(page_val) >5) && (ceilvalue <= parseInt(page_val)+9)){
			pagingHtml+= "<a style='cursor:pointer' class='right ico' alt='다음' target='_self' onclick='javascript:changePage("+ (parseInt(page_val)+1) +")'></a>"
		}
		
		pagingHtml += "<a style='cursor:pointer' onclick='javascript:changePage(" + ceilvalue + ")' class='last ico' alt='마지막'></a>"

		if($("#idfytotal0").length > 0) {
			$("#paging").html(pagingHtml);
		}
}

function changePage(val) {
	$("#pageNo").val(val);
	$("#frm").submit();
}


function changeTab(val1,val2) {
	$("#proYN").val(val1);
	$("#TabState").val(val2);
	$("#pageNo").val(1);

	
	$("#frm").submit();
}


function line_selectBoxToggle(val,text){
	//파라미터 셋팅
	//$('#search_flag').val(val);

	//글자변경
//	$('#line_selectBoxTitle').text(text);
	
	switch(val){
		case "10" : 
			$("#inner_line_list li").css("display","");
			$("#line_li_10").css("display","none");
			$("#line_hiddenLi").css("display","");
			$("#listup").val("10");
			$("#pageNo").val(1);
			break;
		case "20" : 
			$("#inner_line_list li").css("display","");
			$("#line_li_20").css("display","none");
			$("#line_hiddenLi").css("display","");
			$("#listup").val("20");
			$("#pageNo").val(1);
			break;
		case "30" : 
			$("#inner_line_list li").css("display","");
			$("#line_li_30").css("display","none");
			$("#line_hiddenLi").css("display","");
			$("#listup").val("30");
			$("#pageNo").val(1);
			//result_more($("#sunb_count").val(),'','1');
			break;
		case "40" : 
			$("#inner_line_list li").css("display","");
			$("#line_li_40").css("display","none");
			$("#line_hiddenLi").css("display","");
			$("#listup").val("40");
			$("#pageNo").val(1);
			//result_more($("#sunb_count").val(),'','1');
			break;
		case "50" : 
			$("#inner_line_list li").css("display","");
			$("#line_li_50").css("display","none");
			$("#line_hiddenLi").css("display","");
			$("#listup").val("50");
			$("#pageNo").val(1);
			//result_more($("#sunb_count").val(),'','1');
			break;
		case "100" : 
			$("#inner_line_list li").css("display","");
			$("#line_li_100").css("display","none");
			$("#line_hiddenLi").css("display","");
			$("#listup").val("100");
			$("#pageNo").val(1);
			//result_more($("#sunb_count").val(),'','1');
			break;
	}
	$("#rowLength").val(val);

	$("#frm").submit();
}

//onKeyUp시에 제품명 불러오는 ajax호출
function drugNmAjax(){

	if ($('#drug_name').val().length < 2) {
		return false;
	}

	if (window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		//getKpicAtc_btn('1','','','');
		$("#ul_drugList").css('display','none');
//		$("#btn_detail_search").click();
		return false;
	}

	//var e = jQuery.Event( "keydown", { keyCode: 35 } );	$("#input_upsoNm").trigger( e );
	if($('#drug_name').val().length > 2){		
		$("#ul_drugList").css('display','');
		getDrugName();
	}else{
		$("#ul_drugList").css('display','none');
	}
}

//제품명 가져오기
function getDrugName(val){

	//데이터 호출
	$.ajax({
		type:"GET",
		url:'/durg/drugSearch?item_name='+encodeURIComponent($('#drug_name').val()),
		async:true,
		cache: false,
		dataType:"jsonp",
		success:function(data){
			//console.log(data);
			if (data != "") {
				var htmlData = "";
				for(var i = 0; i<data.length; i++){
					htmlData += "<li title='"+data[i].drug_name+"'>"
					htmlData += "<a class='overtxt' style='cursor:pointer' onclick=\"javascript:$('#drug_name').val('"+data[i].drug_name+"');$('#ul_drugList').css('display','none')\">"
					htmlData += data[i].drug_name
					htmlData += "</a>"
					htmlData += "</li>"
				}
				$('#ul_drugList').html(htmlData);
			
			$('#ul_drugList').css("overflow-y","auto");
			$('#ul_drugList').css("width","194px");
			$('#ul_drugList').css("max-height","100px");
			}
		},
		error:function(xhr, status, error){
			alert('서버와의 통신 중 오류가 발생하였습니다.');
		}
	});
}//getDrugName end


//onKeyUp시에 회사명 불러오는 ajax호출
function upsoNmAjax(){	

	if (window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		$("#ul_upsoList").css('display','none');
		return false;
	}

	//var e = jQuery.Event( "keydown", { keyCode: 35 } );	$("#input_upsoNm").trigger( e );
	if($('#firm_name').val().length > 0){
		$("#ul_upsoList").css('display','');
		getUpsoName();
	}else{
		$("#ul_upsoList").css('display','none');
	}
}


//회사명 가져오기
function getUpsoName(val){	

	//데이터 호출
	$.ajax({
		type:"GET",
//		url:'http://localapi.health.kr:8090/getUpsoName.localapi?upsonm='+$('#firm_name').val(),
		url:'/searchDrug/ajax/ajax_getUpsoName.asp?upsonm='+encodeURIComponent($('#firm_name').val()),
		async:true,
		cache: false,
//		dataType:"jsonp",
		dataType:"json",
		success:function(data){
			//console.log(data);
			var htmlData = data.response.body.items.item;;
			for(var i = 0; i<htmlData.length; i++){
				htmlData += "<li title='"+htmlData[i].firm_name+"'>"
				htmlData += "<a class='overtxt' style='cursor:pointer' onclick=\"javascript:$('#firm_name').val('"+htmlData[i].firm_name+"');$('#ul_upsoList').css('display','none')\">"
				htmlData += htmlData[i].firm_name
				htmlData += "</a>"
				htmlData += "</li>"
			}
			$('#ul_upsoList').html(htmlData);

			$('#ul_upsoList').css("overflow-y","auto");
			$('#ul_upsoList').css("width","194px");
			$('#ul_upsoList').css("max-height","100px");
		},
		//complete:function(data){
			//console.log(data.responseText)
		//},
		error:function(xhr, status, error){
			alert('서버와의 통신 중 오류가 발생하였습니다.');
		}
	});
}//getUpsoName end





function list_setting() {
	if ($("#type_01_hidden").val() == "true") {
		$("#type_01").addClass("selected");
	}
	if ($("#type_02_hidden").val() == "true") {
		$("#type_02").addClass("selected");
	}
	if ($("#type_03_hidden").val() == "true") {
		$("#type_03").addClass("selected");
	}
	if ($("#type_etc_hidden").val() == "true") {
		$("#type_etc").addClass("selected");
	}
	if($("#typeids li input[type=checkbox]:checked").length > 0) {
		$("#type_all").removeClass("selected");
	}

	if ($("#shape_01_hidden").val() == "true") {
		$("#shape_01").addClass("selected");
	}
	if ($("#shape_02_hidden").val() == "true") {
		$("#shape_02").addClass("selected");
	}
	if ($("#shape_03_hidden").val() == "true") {
		$("#shape_03").addClass("selected");
	}
	if ($("#shape_04_hidden").val() == "true") {
		$("#shape_04").addClass("selected");
	}
	if ($("#shape_05_hidden").val() == "true") {
		$("#shape_05").addClass("selected");
	}
	if ($("#shape_06_hidden").val() == "true") {
		$("#shape_06").addClass("selected");
	}
	if ($("#shape_10_hidden").val() == "true") {
		$("#shape_10").addClass("selected");
	}
	if ($("#shape_09_hidden").val() == "true") {
		$("#shape_09").addClass("selected");
	}
	if ($("#shape_08_hidden").val() == "true") {
		$("#shape_08").addClass("selected");
	}
	if ($("#shape_etc_hidden").val() == "true") {
		$("#shape_etc").addClass("selected");
	}
	if($("#shapeids li input[type=checkbox]:checked").length > 0) {
		$("#shape_all").removeClass("selected");
	}
	if($(".shapeETC").find("[type=checkbox]:checked").length > 0) {
		$("#shape_all").removeClass("selected");
	}

	if ($("#color_white_hidden").val() == "true") {
		$("#color_white").addClass("selected");
	}
	if ($("#color_yellow_hidden").val() == "true") {
		$("#color_yellow").addClass("selected");
	}
	if ($("#color_orange_hidden").val() == "true") {
		$("#color_orange").addClass("selected");
	}
	if ($("#color_pink_hidden").val() == "true") {
		$("#color_pink").addClass("selected");
	}
	if ($("#color_red_hidden").val() == "true") {
		$("#color_red").addClass("selected");
	}
	if ($("#color_brown_hidden").val() == "true") {
		$("#color_brown").addClass("selected");
	}
	if ($("#color_ygreen_hidden").val() == "true") {
		$("#color_ygreen").addClass("selected");
	}
	if ($("#color_green_hidden").val() == "true") {
		$("#color_green").addClass("selected");
	}
	if ($("#color_bgreen_hidden").val() == "true") {
		$("#color_bgreen").addClass("selected");
	}
	if ($("#color_blue_hidden").val() == "true") {
		$("#color_blue").addClass("selected");
	}
	if ($("#color_navy_hidden").val() == "true") {
		$("#color_navy").addClass("selected");
	}
	if ($("#color_wine_hidden").val() == "true") {
		$("#color_wine").addClass("selected");
	}
	if ($("#color_purple_hidden").val() == "true") {
		$("#color_purple").addClass("selected");
	}
	if ($("#color_grey_hidden").val() == "true") {
		$("#color_grey").addClass("selected");
	}
	if ($("#color_black_hidden").val() == "true") {
		$("#color_black").addClass("selected");
	}
	if ($("#color_transp_hidden").val() == "true") {
		$("#color_transp").addClass("selected");
	}
	if ($("#colorids li input[type=checkbox]:checked").length > 0) {
		$("#color_all").removeClass("selected");
	}

	if ($("#line_no_hidden").val() == "true") {
		$("#line_no").addClass("selected");
	}
	if ($("#line_plus_hidden").val() == "true") {
		$("#line_plus").addClass("selected");
	}
	if ($("#line_minus_hidden").val() == "true") {
		$("#line_minus").addClass("selected");
	}
	if ($("#line_etc_hidden").val() == "true") {
		$("#line_etc").addClass("selected");
	}
	if ($("#lineids li input[type=checkbox]:checked").length > 0) {
		$("#line_all").removeClass("selected");
	}


}
function hidden_frm_setting() {
	$("#item_ingr_hidden").val(encodeURIComponent($("#item_ingr").val()));
	$("#pageSize_hidden").val(encodeURIComponent($("#pageSize").val()));
	$("#produceKind_hidden").val(encodeURIComponent($("#produceKind").val()));
	$("#pageNum_hidden").val(encodeURIComponent($("#pageNum").val()));
	
	$("#drug_print_front_hidden").val(encodeURIComponent($("#drug_print_front").val()));
	$("#match1_hidden").val(encodeURIComponent($("#match1").is(":checked")));
	$("#drug_print_back_hidden").val(encodeURIComponent($("#drug_print_back").val()));
	$("#match2_hidden").val(encodeURIComponent($("#match2").is(":checked")));
	
	$("#type_01_hidden").val(encodeURIComponent($("#type_01 [type=checkbox]").is(":checked")));
	$("#type_02_hidden").val(encodeURIComponent($("#type_02 [type=checkbox]").is(":checked")));
	$("#type_03_hidden").val(encodeURIComponent($("#type_03 [type=checkbox]").is(":checked")));
	$("#type_etc_hidden").val(encodeURIComponent($("#type_etc [type=checkbox]").is(":checked")));
	$("#type_all_hidden").val(encodeURIComponent($("#type_all [type=checkbox]").is(":checked")));

	$("#drug_name_hidden").val(encodeURIComponent($("#drug_name").val()));
	$("#firm_name_hidden").val(encodeURIComponent($("#firm_name").val()));

	$("#shape_01_hidden").val(encodeURIComponent($("#shape_01 [type=checkbox]").is(":checked")));
	$("#shape_02_hidden").val(encodeURIComponent($("#shape_02 [type=checkbox]").is(":checked")));
	$("#shape_03_hidden").val(encodeURIComponent($("#shape_03 [type=checkbox]").is(":checked")));
	$("#shape_04_hidden").val(encodeURIComponent($("#shape_04 [type=checkbox]").is(":checked")));
	$("#shape_05_hidden").val(encodeURIComponent($("#shape_05 [type=checkbox]").is(":checked")));
	$("#shape_06_hidden").val(encodeURIComponent($("#shape_06 [type=checkbox]").is(":checked")));
	$("#shape_10_hidden").val(encodeURIComponent($("#shape_10 [type=checkbox]").is(":checked")));
	$("#shape_09_hidden").val(encodeURIComponent($("#shape_09 [type=checkbox]").is(":checked")));
	$("#shape_08_hidden").val(encodeURIComponent($("#shape_08 [type=checkbox]").is(":checked")));
	$("#shape_etc_hidden").val(encodeURIComponent($("#shape_etc [type=checkbox]").is(":checked")));
	$("#shape_all_hidden").val(encodeURIComponent($("#shape_all [type=checkbox]").is(":checked")));

	$("#shape1_hidden").val(encodeURIComponent($("#shape1 [type=checkbox]").is(":checked")));
	$("#shape2_hidden").val(encodeURIComponent($("#shape2 [type=checkbox]").is(":checked")));
	$("#shape3_hidden").val(encodeURIComponent($("#shape3 [type=checkbox]").is(":checked")));
	$("#shape4_hidden").val(encodeURIComponent($("#shape4 [type=checkbox]").is(":checked")));
	$("#shape5_hidden").val(encodeURIComponent($("#shape5 [type=checkbox]").is(":checked")));
	$("#shape6_hidden").val(encodeURIComponent($("#shape6 [type=checkbox]").is(":checked")));
	$("#shape7_hidden").val(encodeURIComponent($("#shape7 [type=checkbox]").is(":checked")));
	$("#shape8_hidden").val(encodeURIComponent($("#shape8 [type=checkbox]").is(":checked")));
	$("#shape9_hidden").val(encodeURIComponent($("#shape9 [type=checkbox]").is(":checked")));
	$("#shape10_hidden").val(encodeURIComponent($("#shape10 [type=checkbox]").is(":checked")));
	$("#shape11_hidden").val(encodeURIComponent($("#shape11 [type=checkbox]").is(":checked")));
	$("#shape12_hidden").val(encodeURIComponent($("#shape12 [type=checkbox]").is(":checked")));
	$("#shape13_hidden").val(encodeURIComponent($("#shape13 [type=checkbox]").is(":checked")));
	$("#shape14_hidden").val(encodeURIComponent($("#shape14 [type=checkbox]").is(":checked")));
	$("#shape15_hidden").val(encodeURIComponent($("#shape15 [type=checkbox]").is(":checked")));
	$("#shape16_hidden").val(encodeURIComponent($("#shape16 [type=checkbox]").is(":checked")));
	$("#shape17_hidden").val(encodeURIComponent($("#shape17 [type=checkbox]").is(":checked")));
	$("#shape18_hidden").val(encodeURIComponent($("#shape18 [type=checkbox]").is(":checked")));
	$("#shape19_hidden").val(encodeURIComponent($("#shape19 [type=checkbox]").is(":checked")));
	$("#shape20_hidden").val(encodeURIComponent($("#shape20 [type=checkbox]").is(":checked")));
	$("#shape21_hidden").val(encodeURIComponent($("#shape21 [type=checkbox]").is(":checked")));

	$("#color_white_hidden").val(encodeURIComponent($("#color_white [type=checkbox]").is(":checked")));
	$("#color_yellow_hidden").val(encodeURIComponent($("#color_yellow [type=checkbox]").is(":checked")));
	$("#color_orange_hidden").val(encodeURIComponent($("#color_orange [type=checkbox]").is(":checked")));
	$("#color_pink_hidden").val(encodeURIComponent($("#color_pink [type=checkbox]").is(":checked")));
	$("#color_red_hidden").val(encodeURIComponent($("#color_red [type=checkbox]").is(":checked")));
	$("#color_brown_hidden").val(encodeURIComponent($("#color_brown [type=checkbox]").is(":checked")));
	$("#color_ygreen_hidden").val(encodeURIComponent($("#color_ygreen [type=checkbox]").is(":checked")));
	$("#color_green_hidden").val(encodeURIComponent($("#color_green [type=checkbox]").is(":checked")));
	$("#color_bgreen_hidden").val(encodeURIComponent($("#color_bgreen [type=checkbox]").is(":checked")));
	$("#color_blue_hidden").val(encodeURIComponent($("#color_blue [type=checkbox]").is(":checked")));
	$("#color_navy_hidden").val(encodeURIComponent($("#color_navy [type=checkbox]").is(":checked")));
	$("#color_wine_hidden").val(encodeURIComponent($("#color_wine [type=checkbox]").is(":checked")));
	$("#color_purple_hidden").val(encodeURIComponent($("#color_purple [type=checkbox]").is(":checked")));
	$("#color_grey_hidden").val(encodeURIComponent($("#color_grey [type=checkbox]").is(":checked")));
	$("#color_black_hidden").val(encodeURIComponent($("#color_black [type=checkbox]").is(":checked")));
	$("#color_transp_hidden").val(encodeURIComponent($("#color_transp [type=checkbox]").is(":checked")));
	$("#color_all_hidden").val(encodeURIComponent($("#color_all [type=checkbox]").is(":checked")));

	$("#line_no_hidden").val(encodeURIComponent($("#line_no [type=checkbox]").is(":checked")));
	$("#line_plus_hidden").val(encodeURIComponent($("#line_plus [type=checkbox]").is(":checked")));
	$("#line_minus_hidden").val(encodeURIComponent($("#line_minus [type=checkbox]").is(":checked")));
	$("#line_etc_hidden").val(encodeURIComponent($("#line_etc [type=checkbox]").is(":checked")));
	$("#line_all_hidden").val(encodeURIComponent($("#line_all [type=checkbox]").is(":checked")));

	$("#hidden_autosearch").val("start");
}
function refreshIdfy() {
	//문자
		$("#drug_print_front").val("");
		$("#drug_print_back").val("");
		$("#drug_name").val("");
		$("#firm_name").val("");
		
		$("ul.idty li").removeClass("selected");
		$("#shapeETC_selected").css("border","");

		$("ul.idty li").find("[type=checkbox]").prop("checked",false);

		$(".shapeETC [type=checkbox]").prop("checked",false);
		$("#shape_etc_text ul").empty();
		$("#selectMarkList").empty();

		$("#type_all").addClass("selected");
		$("#shape_all").addClass("selected");
		$("#color_all").addClass("selected");
		$("#line_all").addClass("selected");

		$("#ul_drugList").empty();
		$("#ul_upsoList").empty();

		$("#match1").prop("checked",false);
		$("#match2").prop("checked",false);

//		$("#ul_drugList").css("max-height","0px");
//		$("#ul_upsoList").css("max-height","0px");


}

function resultByMain() {
	//문자
	if("" != "") {
		$("#drug_print_front").val("");
	}
	
	//색깔
	if("" == "하양") {
		$("#color_white").addClass("selected");
		$("#color_white input:[type=checkbox]").prop("checked",true);
	}
	if("" == "노랑") {
		$("#color_yellow").addClass("selected");
		$("#color_yellow input:[type=checkbox]").prop("checked",true);
	}
	if("" == "주황") {
		$("#color_orange").addClass("selected");
		$("#color_orange input:[type=checkbox]").prop("checked",true);
	}
	if("" == "분홍") {
		$("#color_pink").addClass("selected");
		$("#color_pink input:[type=checkbox]").prop("checked",true);
	}
	if("" == "빨강") {
		$("#color_red").addClass("selected");
		$("#color_red input:[type=checkbox]").prop("checked",true);
	}
	if("" == "갈색") {
		$("#color_brown").addClass("selected");
		$("#color_brown input:[type=checkbox]").prop("checked",true);
	}
	if("" == "연두") {
		$("#color_ygreen").addClass("selected");
		$("#color_ygreen input:[type=checkbox]").prop("checked",true);
	}
	if("" == "초록") {
		$("#color_green").addClass("selected");
		$("#color_green input:[type=checkbox]").prop("checked",true);
	}
	if("" == "청록") {
		$("#color_bgreen").addClass("selected");
		$("#color_bgreen input:[type=checkbox]").prop("checked",true);
	}
	if("" == "파랑") {
		$("#color_blue").addClass("selected");
		$("#color_blue input:[type=checkbox]").prop("checked",true);
	}
	if("" == "남색") {
		$("#color_navy").addClass("selected");
		$("#color_navy input:[type=checkbox]").prop("checked",true);
	}
	if("" == "자주") {
		$("#color_wine").addClass("selected");
		$("#color_wine input:[type=checkbox]").prop("checked",true);
	}
	if("" == "보라") {
		$("#color_purple").addClass("selected");
		$("#color_purple input:[type=checkbox]").prop("checked",true);
	}
	if("" == "회색") {
		$("#color_grey").addClass("selected");
		$("#color_grey input:[type=checkbox]").prop("checked",true);
	}
	if("" == "검정") {
		$("#color_black").addClass("selected");
		$("#color_black input:[type=checkbox]").prop("checked",true);
	}
	if("" == "투명") {
		$("#color_transp").addClass("selected");
		$("#color_transp input:[type=checkbox]").prop("checked",true);
	}

	if ($("#colorids li input[type=checkbox]:checked").length > 0) {
		$("#color_all").removeClass("selected");
	}
	//모양
	if("" != "") {
		$("#shape_01").addClass("selected");
		$("#shape_01 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#shape_02").addClass("selected");
		$("#shape_02 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#shape_03").addClass("selected");
		$("#shape_03 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#shape_04").addClass("selected");
		$("#shape_04 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#shape_05").addClass("selected");
		$("#shape_05 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#shape_06").addClass("selected");
		$("#shape_06 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#shape_07").addClass("selected");
		$("#shape_07 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#shape_08").addClass("selected");
		$("#shape_08 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#shape_09").addClass("selected");
		$("#shape_09 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#shape_10").addClass("selected");
		$("#shape_10 input:[type=checkbox]").prop("checked",true);
	}

	if($("#shapeids li input[type=checkbox]:checked").length > 0) {
		$("#shape_all").removeClass("selected");
	}

	//제형
	if("" != "") {
		$("#type_01").addClass("selected");
		$("#type_01 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#type_02").addClass("selected");
		$("#type_02 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#type_03").addClass("selected");
		$("#type_03 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#type_etc").addClass("selected");
		$("#type_etc input:[type=checkbox]").prop("checked",true);
	}
	if($("#typeids li input[type=checkbox]:checked") > 0) {
		$("#type_all").removeClass("selected");
	}

	//분할선
	if("" != "") {
		$("#line_no").addClass("selected");
		$("#line_no input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#line_plus").addClass("selected");
		$("#line_plus input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#line_minus").addClass("selected");
		$("#line_minus input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#line_etc").addClass("selected");
		$("#line_etc input:[type=checkbox]").prop("checked",true);
	}
	if ($("#lineids li input[type=checkbox]:checked").length > 0) {
		$("#line_all").removeClass("selected");
	}

	idfytotal('');

}
//색깔
function search_group(id,type)
{
	if(!$(id).hasClass("selected")){
//		alert("여기옴")
//		alert(id)
//		alert(type)
		$(".type"+type).not(id).addClass("selected");
	}
}
//모양
function search_shapes(val) {
	if (val == "all") {
		$("#shape_select a").text("모양전체");
	} else {
		$("#shape_select a img").prop("src","images/pills/shape"+val+".jpg");
	}
}
//제형
function search_types(val) {
	if (val == "all") {
		$("#form_select a").text("제형전체");
	} else if (val == "other") {
		$("#form_select a").text("기타");
	} else {
		$("#form_select a img").prop("src","images/pills/type"+val+".jpg");
	}
}
//분할선
function search_lines(val) {
	if (val == "all") {
		$("#line_select a").text("분할선전체");
	} else {
		$("#line_select a img").prop("src","images/pills/line"+val+".jpg");
	}
}
function shape() {
	
	$.ajax({
		type:"POST",
		url:"temp.asp",
		data:$(".idty li.selected input:[name='shapes']").serialize(),
		//dataType:"JSONP",
		success:function(data){
			
		},
		error:function(request,status,error){
		}
	});
}
//selectMark start
function selectMark(val) {
	//먼저 선택한 마크 삭제
	$("#selectMarkList > div").remove();

	//새 마크 태그
	var htmlData = "";
	htmlData = htmlData + "<div id="+val+" ><img src='http://www.pharm.or.kr/images/sb_photo/mark/"+val+".gif' id="+val+" alt='mark' /><a onclick=deleteMark('"+val+"') class='delete ico'></a><input type='hidden' id='mark_code' name='mark_code' value="+val+" /></div>";
	
	//새 마크 추가
	$("#selectMarkList").append(htmlData).show();

	//마크 선택창 숨김
	$(".popupbx").hide();

}
//selectMark end

//deleteMark start
function deleteMark(val) {
	
	//마크 삭제(div 안에 img,a,hidden태그 있음)
	$("#selectMarkList>div[id='"+val+"']").remove();
}
//deleteMark end
//http://localapi.health.kr:8090
//http://110.9.251.216:8080
//localAPI Mark
function idfymark(val){
	//alert(val);
	//console.log("idfymark 진입 전");

	view_loadingimage("popup_mark",200);
	$("#markList > li").remove();
	$("#search_mark").val("");

	//검색시작
	$.ajax({
		type:"GET",
//		url:'http://localapi.health.kr:8090/idfymark.localapi?mark_search='+val,
		url:'/searchIdentity/ajax/ajax_idfymark.asp?mark_search='+encodeURIComponent(val),
//		async:false,
		cache: false,
//		dataType:"jsonp",
		dataType:"json",
		success:function(data){
			//console.log("idfymark success");
			//console.log(data);

			var i = 0;
			var res = data.length;
			var htmlData = "";
			htmlData = htmlData + "<ul id='markList' class='markList' style=''>";
			for (i = 0; i <= res-1; i++ )
			{
//				htmlData = htmlData + "<li><a onclick=selectMark('"+data[i].mark_code+"');><img data-original='http://www.pharm.or.kr/images/sb_photo/mark/"+data[i].mark_code+".gif' alt='mark' class='lazy' /></a></li>";
				htmlData = htmlData + "<li><a onclick=selectMark('"+data[i].mark_code+"');><img src='http://www.pharm.or.kr/images/sb_photo/mark/"+data[i].mark_code+".gif' alt='mark' cl ass='lazy' /></a></li>";
			}
			htmlData = htmlData + "</ul>";
			//마크 리스트 추가
			$("#popup_mark").append(htmlData);

			$(".searchopt .alignTable > li > a").removeClass();
			$(".searchopt .alignTable > li > #mark"+val).addClass('current');

			//이미지를 화면에 출력되는 것만 골라 출력할 수 있게함, 이때 img src말고 data-original을 사용하며, js파일 import하고 사용하면 됨
//			$("img.lazy").lazyload({
//				//효과
//				effect : "fadeIn",
//				//해당하는 범위
//				container: $("#popup_mark"),
//				//범위보다 몇 픽셀을 더 출력할지 선택
//				threshold : 50	
//			});

			$("#popup_mark").scrollTop(0);
			$("#view_loading").remove();

//			var topset = $("#markList").offset().top;
////			alert(topset)
//
//			$("#popup_mark").stop().animate({
//				scrollTop:$("#markList").offset().top - topset
//			},0);


		},
		//complete:function(data){
			//console.log(data.responseText)
		//},
		error:function(xhr, status, error){
			alert('서버와의 통신 중 오류가 발생하였습니다.');
		}
	});
	
}//localAPI Mark 종료

//localAPI searchMark
function idfysearchmark(){
	if ($("#search_mark").val() == "") {
		alert("검색어를 입력해주세요.");
		return false;
	}
	view_loadingimage("popup_mark",200);
	$("#markList > li").remove();

	//console.log("idfysearchmark 진입 전");
	//검색시작
	$.ajax({
		type:"GET",
//		url:'http://localapi.health.kr:8090/idfysearchmark.localapi?mark_anal='+$("#search_mark").val(),
		url:'/searchIdentity/ajax/ajax_idfysearchmark.asp?mark_anal='+encodeURIComponent($("#search_mark").val()),
//		async:false,
		cache: false,
//		dataType:"jsonp",
		dataType:"json",
		success:function(data){		
			//console.log("idfysearchmark success");
			//console.log(data);
			var htmlData = "";
			if(data.length > 0) {
			var i = 0;
			var res = data.length;
			htmlData = "";
			htmlData = htmlData + "<ul id='markList' class='markList' style=''>";
			for (i = 0; i <= res-1; i++ )
			{
//				htmlData = htmlData + "<li><a onclick=selectMark('"+data[i].mark_code+"');><img data-original='http://www.pharm.or.kr/images/sb_photo/mark/"+data[i].mark_code+".gif' alt='mark' class='lazy' /></a></li>";
				htmlData = htmlData + "<li><a onclick=selectMark('"+data[i].mark_code+"');><img src='http://www.pharm.or.kr/images/sb_photo/mark/"+data[i].mark_code+".gif' alt='mark' cl ass='lazy' /></a></li>";
			}
			htmlData = htmlData + "</ul>";
			//마크 리스트 추가
			$("#popup_mark").append(htmlData);

			//이미지를 화면에 출력되는 것만 골라 출력할 수 있게함, 이때 img src말고 data-original을 사용하며, js파일 import하고 사용하면 됨
//			$("img.lazy").lazyload({
//				//효과
//				effect : "fadeIn",
//				//해당하는 범위
//				container: $("#popup_mark"),
//				//범위보다 몇 픽셀을 더 출력할지 선택
//				threshold : 300	
//			});
			$("#popup_mark").scrollTop(0);
			$("#view_loading").remove();

			}else{
				$("#popup_mark").scrollTop(0);
				$("#view_loading").remove();

				htmlData = "";
				htmlData = htmlData + "<ul id='markList' class='markList' style=''>";
				htmlData = htmlData + "	<p>검색 결과가 없습니다.</p>";
				htmlData = htmlData + "</ul>";

				$("#popup_mark").append(htmlData);
			}

		},
		//complete:function(data){
			//console.log(data.responseText)
		//},
		error:function(xhr, status, error){
			alert('서버와의 통신 중 오류가 발생하였습니다.');
		}
	});
	
}//localAPI Mark 종료



// 프린트목록 구성
//          식별IDX, 제품명
function printList(val,val1) {
	var chkprint = 0;

	if($("input:checkbox[id='print"+val+"']").is(":checked") == true) {
//		alert(val + val1);
//		alert(produceKind);
		var htmlData = "";
		htmlData = htmlData + "<li id="+val+">"+val1+"<input type='hidden' name='drug_code' value='"+val+"'/><span onclick=\"removeList('"+val+"')\"class='delete ico'></span></li>";

//		if(produceKind == ""){
//			alert("들어옴");
			$("#printListAll li").each(function() {
				if($(this).prop("id") == val) {
					alert("이미 출력목록에 담긴 약품입니다.");
					$("#print"+val).prop("checked",false);
					chkprint = 1;
				}
			});
			if (chkprint != 1) {
				$("#printListAll").append(htmlData);
				$("#printList").val($("#printListAll").html());
				selectCnt = selectCnt + 1
				$(".printCnt").text(selectCnt);
			}
//		}else if(produceKind == "Y"){
//			$("#printListProY li").each(function() {
//				if($(this).prop("id") == val) {
//					alert("이미 출력목록에 담긴 약품입니다.");
//					$("#print"+val).prop("checked",false);
//					chkprint = 1;
//				}
//			});
//			if (chkprint != 1) {
//				$("#printListProY").append(htmlData);
//				selectCnt = selectCnt + 1
//				$(".printCnt").text(selectCnt);
//			}
//		}else if(produceKind == "N"){
//			$("#printListProN li").each(function() {
//				if($(this).prop("id") == val) {
//					alert("이미 출력목록에 담긴 약품입니다.");
//					$("#print"+val).prop("checked",false);
//					chkprint = 1;
//				}
//			});
//			if (chkprint != 1) {
//				$("#printListProN").append(htmlData);
//				selectCnt = selectCnt + 1
//				$(".printCnt").text(selectCnt);
//			}
//		}

	} else {
//		
//		if(produceKind == ""){
			$("#printListAll #"+val).remove();
				$("#printList").val($("#printListAll").html());
			selectCnt = selectCnt - 1
			$(".printCnt").text(selectCnt);
//		}else if(produceKind == "Y"){
//			$("#printListProY #"+val).remove();
//			selectCnt = selectCnt - 1
//			$(".printCnt").text(selectCnt);
//		}else if(produceKind == "N"){
//			$("#printListProN #"+val).remove();
//			selectCnt = selectCnt - 1
//			$(".printCnt").text(selectCnt);
//		}
	}
}
function selectPrint() {
	if(cartItems.length == 0) {
		alert("선택된 목록이 없습니다.");
		return false;
	}
	$('#printfrm').empty();
	//카트 내용을 폼에 추가
	for (var i=0; i<cartItems.length; i++) {
		$('#printfrm').append('<input type="hidden" name="drug_code" value="'+cartItems[i].code+'" style="display:none">');
	}

//	
//	if(produceKind == ""){
		$("#selectCntall").val(selectCnt);
		$("#printfrm").submit();
//	}else if(produceKind == "Y"){
//		$("#selectCntproy").val(selectCnt);
//		$("#printfrmProY").submit();
//	}else if(produceKind == "N"){
//		$("#selectCntpron").val(selectCnt);
//		$("#printfrmProN").submit();
//	}
}
//엔터키
function markEnter(){
	if(event.keyCode == 13){
		idfysearchmark();
	}
}
//식별제품상세정보 이동
function drugDetail(val,val1) {
	
//	$("#select_drug_idx").val(val);
//	$("#select_drug_code").val(val1);
//	$("#result_frm").submit();
	location.href="/searchIdentity/result.asp?didx="+val+"&dcode="+val1;
//	window.open("/searchIdentity/result.asp?didx="+val+"&dcode="+val1,"","");

}
//의약품상세정보 이동
function drug_detailHref(val){
//	location.href='/searchDrug/result_drug.asp?drug_cd='+val;
	window.open('/searchDrug/result_drug.asp?drug_cd='+val,'','');
}
//결과목록 이동
function moveresult() {		
		//기준이 될 div top값
		var topset = $("#result").offset().top;
		$("html,body").stop().animate({
			scrollTop : topset - 148
		},1500);
}
// 기타 선택하기 - 전체
function shapeETCAll() {
	if($("#shape0").is(":checked")== true) {
		var htmlData = "";
		$(".shapeETC").find("[type=checkbox]").prop("checked",true);
		$("#shape_etc_text ul").empty();
		$("#shapeETC_selected").css("border","2px solid #435cc8");
		$("#shape_all").removeClass("selected");
	} else {
		$(".shapeETC").find("[type=checkbox]").prop("checked",false);
		$("#shapeETC_selected").css("border","");
		$("#shape_etc_text ul").empty();
	}
}
// 기타 선택하기
//                 모양번호, 모양명
function shape_etcc(val) {
	if($("#shape"+val).is(":checked") == true) {
		var htmlData = "";
		htmlData += "<li id=s"+val+">"+$("#shape"+val).val()+"<span class='delete ico' onclick=\"shape_etc_delete('"+val+"')\"></span></li>";
		$("#shape_etc_text ul").append(htmlData);
		$("#shapeETC_selected").css("border","2px solid #435cc8");
		shape_clicks('');
		$("#shape0").prop("checked",false);
	} else {
		$("#shape_etc_text ul #s"+val).remove();
		if($("#etclist [type=checkbox]:checked").length == 0) {
			$("#shapeETC_selected").css("border","");
		}
		$("#shape0").prop("checked",false);

		$("#shape_etc_text ul").empty();

		var k = 0;
		var htmlData = "";
		$("#etclist li").each(function() {
			if(k != 0) {
				if($(this).find("[type=checkbox]").is(":checked") == true) {
					htmlData += "<li id=s"+k+">"+$(this).find("[type=checkbox]").val()+"<span class='delete ico' onclick=\"shape_etc_delete('"+k+"')\"></span></li>";
				}
			}
			k = k+1;
		});
//		console.log(htmlData);
		$("#shape_etc_text ul").append(htmlData);

	}
}
// 기타 선택중 X표시
function shape_etc_delete(val) {
	$("#shape_etc_text ul #s"+val).remove();
	$(".shapeETC #shape"+val).prop("checked",false);

	if($("#shape_etc_text ul li").length == 0){
		$("#shapeETC_selected").css("border","");
	}
}

// 제형 전체 <-> 그외 구분
function type_clicks(val) {
	if(val == "전체") {
		$("#typeids li").removeClass("selected");
		$("#typeids li input[type=checkbox]").prop("checked",false);
//	} else if(val == "정제"){
//		$("#type_etc").addClass("selected");
//		$("#type_etc input[type=checkbox]").prop("checked",true);
//		$("#type_all").removeClass("selected");
	} else {
		$("#type_all").removeClass("selected");
	}
}
// 모양 전체 <-> 그외 구분
function shape_clicks(val) {
	if(val == "전체") {
		$("#shapeids li").removeClass("selected");
		$("#shapeids li input[type=checkbox]").prop("checked",false);
		$("#shapeETC_selected").css("border","");
		$(".shapeETC").find("[type=checkbox]").prop("checked",false);
		$("#shape_etc_text ul").empty();
	} else {
		$("#shape_all").removeClass("selected");
	}
}
// 색상 전체 <-> 그외 구분
function color_clicks(val) {
	if(val == "전체") {
		$("#colorids li").removeClass("selected");
		$("#colorids li input[type=checkbox]").prop("checked",false);
	} else {
		$("#color_all").removeClass("selected");
	}
}
// 분할선 전체 <-> 그외 구분
function line_clicks(val) {
	if(val == "전체") {
		$("#lineids li").removeClass("selected");
		$("#lineids li input[type=checkbox]").prop("checked",false);
	} else {
		$("#line_all").removeClass("selected");
	}
}

// 출력목록 카트
var cartItems = new Array();

function initCart() {
	if (getCookie('cartItems') != "") {
		cartItems = JSON.parse(getCookie('cartItems'));
	}


	// 카트에 담긴 제품들에 체크박스
	for (var i = 0; i < cartItems.length; i++) {
		$('.chk_'+cartItems[i].code).prop('checked',true);
	}
	// 카트에 담긴 제품을 출력목록에 표시
	for (var i = 0; i < cartItems.length; i++) {
		$("#printListAll").append("<li id=li_"+cartItems[i].code+"><span class='overtxt'>"+cartItems[i].name+"</span><span onclick=\"cartDelItem('"+cartItems[i].code+"')\"class='delete ico'></span></li>");
	}


	// 목록 건수 표시
	$('.printCnt').text(cartItems.length);
}

function cartCheckbox(cboxID,drug_code,drug_name) {
	

	if ($('#'+cboxID).is(':checked') ) {		
		cartAddItem(drug_code,drug_name);
	} else {
		cartDelItem(drug_code);
	}

}
function cartAddItem(itemCode,itemName) {
	var item = new Object();
	item.code = itemCode;
	item.name =itemName;

	cartItems.push(item);
	$("#printListAll").append("<li id=li_"+itemCode+">"+itemName+"<span onclick=\"cartDelItem('"+itemCode+"')\"class='delete ico'></span></li>");

	// 목록 건수 표시
	$('.printCnt').text(cartItems.length);

	setCookie('cartItems',JSON.stringify(cartItems),1);
}

function cartDelItem(itemCode) {
	// 카트에서 삭제
	cartItems = cartItems.filter(function(returnableObjects){return returnableObjects.code !== itemCode;});
	// 체크박스 제거
	$('.chk_'+itemCode).prop('checked',false);
	// 출력목록에서 삭제
	$("#li_"+itemCode).remove();
	// 목록 건수 표시
	$('.printCnt').text(cartItems.length);

	setCookie('cartItems',JSON.stringify(cartItems),1);
}

// 쿠키 저장하기
function setCookie( name, value, expiredays )
{
	var todayDate = new Date();
	//todayDate.setDate( todayDate.getDate() + expiredays );
	todayDate.setTime(todayDate.getTime() + 60 * 60 * 1000); //1시간 후
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

// 쿠키 가져오기
function getCookie(name) {
;
        var nameOfCookie = name + "=";
        var x = 0
        while ( x <= document.cookie.length ) {
        var y = (x+nameOfCookie.length);
        if ( document.cookie.substring( x, y ) == nameOfCookie ) {
                if ( (endOfCookie=document.cookie.indexOf( ";",y )) == -1 )
                endOfCookie = document.cookie.length;
                return unescape( document.cookie.substring(y, endOfCookie ) );
        }
                x = document.cookie.indexOf( " ", x ) + 1;
                if ( x == 0 )
                        break;
        }

        return "";
}
</script>

<body>

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

	headerMenuSetting();

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


function headerMenuSetting(){
	var urlPath = $(location).attr('pathname');
	var urlSplit = urlPath.split("/");

	//메인페이지가 아닌경우 - 메뉴하위
	if(urlSplit.length > 2){
		switch(urlSplit[1]){
			//의약품검색 searchDrug 파트
			case "searchDrug":
				switch(urlSplit[2]){
					case "search_total_result.asp" :
						//의약품검색결과
						$("#li_searchdrug").addClass("current");
						$("#div_searchdrug").css("display","");
						$("#a_searchdrug").addClass("current");
					break;
					case "result_more.asp" :
						//검색결과 더보기
						$("#li_searchdrug").addClass("current");
						$("#div_searchdrug").css("display","");
						$("#a_searchdrug").addClass("current");
					break;
					case "search_detail.asp" :
						//의약품상세검색
						$("#li_searchdrug").addClass("current");
						$("#div_searchdrug").css("display","");
						$("#a_searchdrug").addClass("current");
					break;
					case "result_drug.asp" :
						//의약품상세정보 - 상세정보
						$("#li_searchdrug").addClass("current");
						$("#div_searchdrug").css("display","");
						$("#a_searchdrug").addClass("current");
					break;
					case "result_take.asp" :
						//의약품상세정보 - 복약안내문
						$("#li_searchdrug").addClass("current");
						$("#div_searchdrug").css("display","");
						$("#a_searchdrug").addClass("current");
					break;
					case "result_sunb.asp" :
						//의약품상세정보 - 동일성분 의약품
						$("#li_searchdrug").addClass("current");
						$("#div_searchdrug").css("display","");
						$("#a_searchdrug").addClass("current");
					break;
					case "result_interaction.asp" :
						//의약품상세정보 - 상호작용
						$("#li_searchdrug").addClass("current");
						$("#div_searchdrug").css("display","");
						$("#a_searchdrug").addClass("current");
					break;
					case "search_pregnants.asp":
						//임부약물사용
						$("#li_searchdrug").addClass("current");
						$("#div_searchdrug").css("display","");
						$("#a_search_pregnants").addClass("current");
					break;
					case "search_pregnants_result.asp":
						//임부약물 제품보기
						$("#li_searchdrug").addClass("current");
						$("#div_searchdrug").css("display","");
						$("#a_search_pregnants").addClass("current");
					break;
					case "search_DUR.asp":
						//의약품안전사용서비스DUR
						$("#li_searchdrug").addClass("current");
						$("#div_searchdrug").css("display","");
						$("#a_search_DUR").addClass("current");
					break;

				}
				break;
			case "searchIdentity":
				switch(urlSplit[2]){
					case "search.asp":
						//식별검색
						$("#li_searchIdentity").addClass("current");
						$("#div_searchIdentity").css("display","");
						$("#a_searchIdentity_search").addClass("current");
					break;
				}
				break;
			case "searchIngredient":
				switch(urlSplit[2]){
					case "search.asp":
						//성분정보 - 검색
						$("#li_searchIngredient").addClass("current");
						$("#div_searchIngredient").css("display","");
						$("#a_searchIngredient_search").addClass("current");
					break;		
					case "detail.asp":
						//성분정보 - 상세정보
						$("#li_searchIngredient").addClass("current");
						$("#div_searchIngredient").css("display","");
						$("#a_searchIngredient_search").addClass("current");
					break;
					case "ingredientList.asp":
						//성분정보 - 결과리스트
						$("#li_searchIngredient").addClass("current");
						$("#div_searchIngredient").css("display","");
						$("#a_searchIngredient_search").addClass("current");
					break;
					case "result_more.asp":
						//성분정보 - 검색결과 더보기
						$("#li_searchIngredient").addClass("current");
						$("#div_searchIngredient").css("display","");
						$("#a_searchIngredient_search").addClass("current");
					break;
					case "KPICeffect.asp":
						//성분정보 - kpic약효분류
						$("#li_searchIngredient").addClass("current");
						$("#div_searchIngredient").css("display","");
						$("#a_searchIngredient_kpicatc").addClass("current");
					break;
					case "effect_ingredientList.asp":
						//약효분류 상세
						$("#li_searchIngredient").addClass("current");
						$("#div_searchIngredient").css("display","");
						$("#a_searchIngredient_kpicatc").addClass("current");
					break;
					case "effect_result_more.asp":
						//약효분류 결과더보기 
						$("#li_searchIngredient").addClass("current");
						$("#div_searchIngredient").css("display","");
						$("#a_searchIngredient_kpicatc").addClass("current");
					break;
				}
				break;
			case "interaction":
				switch(urlSplit[2]){
					case "drug.asp":
						//약물-약물상호작용
						$("#li_interaction").addClass("current");
						$("#div_interaction").css("display","");
						$("#a_interaction_drug").addClass("current");
					break;
					case "food.asp":
					//약물-음식상호작용
						$("#li_interaction").addClass("current");
						$("#div_interaction").css("display","");
						$("#a_interaction_food").addClass("current");
					break;
				}
				break;
			case "mediCounsel":
				switch(urlSplit[2]){
					case "product.asp":
						//제품별 복약정보
						$("#li_mediCounsel").addClass("current");
						$("#div_mediCounsel").css("display","");
						$("#a_product").addClass("current");
					break;
					case "pictogram.asp":
						//픽토그램 복약정보
						$("#li_mediCounsel").addClass("current");
						$("#div_mediCounsel").css("display","");
						$("#a_pictogram").addClass("current");
					break;
					case "form.asp":
						//제형별 복약정보
						$("#li_mediCounsel").addClass("current");
						$("#div_mediCounsel").css("display","");
						$("#a_form").addClass("current");
					break;
					case "form_mv.asp":
						//제형별 복약정보2
						$("#li_mediCounsel").addClass("current");
						$("#div_mediCounsel").css("display","");
						$("#a_form").addClass("current");
					break;
				}
				break;
			case "company":
				switch(urlSplit[2]){
					case "greeting.asp":
						//인사말
						$("#li_company").addClass("current");
						$("#div_company").css("display","");
						$("#a_greeting").addClass("current");
					break;
					case "history.asp":
						//회사개요 - 설립배경 및 연혁
						$("#li_company").addClass("current");
						$("#div_company").css("display","");
						$("#a_history").addClass("current");
					break;
					case "organization.asp":
						//회사개요 - 조직도
						$("#li_company").addClass("current");
						$("#div_company").css("display","");
						$("#a_history").addClass("current");
					break;
					case "policy.asp":
						//회사개요 - 정관
						$("#li_company").addClass("current");
						$("#div_company").css("display","");
						$("#a_history").addClass("current");
					break;
					case "business.asp":
						//주요사업
						$("#li_company").addClass("current");
						$("#div_company").css("display","");
						$("#a_business").addClass("current");
					break;
					case "partner.asp":
						//제휴 고객사
						$("#li_company").addClass("current");
						$("#div_company").css("display","");
						$("#a_partner").addClass("current");
					break;
					//인재채용
					case "recruit.asp":
						$("#li_company").addClass("current");
						$("#div_company").css("display","");
						$("#a_recruit").addClass("current");
					break;
					case "location.asp":
						//찾아오시는 길
						$("#li_company").addClass("current");
						$("#div_company").css("display","");
						$("#a_location").addClass("current");
					break;
				}
				break;

			case "researchInfo":
				switch(urlSplit[2]){

					//팜리뷰
					case "pharmreview.asp":
						$("#li_pharmreview").addClass("current");
						$("#div_pharmreview").css("display","");
						$("#a_pharmreview").addClass("current");
					break;

					//허가리뷰
					case "drugApprovalRv.asp":
						$("#li_pharmreview").addClass("current");
						$("#div_pharmreview").css("display","");
						$("#a_drugApprovalRv").addClass("current");
					break;

					//이슈 & 트렌드
					case "issue&trend.asp":
						$("#li_pharmreview").addClass("current");
						$("#div_pharmreview").css("display","");
						$("#a_issuentrend").addClass("current");
					break;

					//약물백과
					case "encyclopedia.asp":
						$("#li_pharmreview").addClass("current");
						$("#div_pharmreview").css("display","");
						$("#a_encyclopedia").addClass("current");
					break;

					//해외의약뉴스
					case "globalnews.asp":
						$("#li_pharmreview").addClass("current");
						$("#div_pharmreview").css("display","");
						$("#a_globalnews").addClass("current");
					break;
					
					//신약평론
					case "newdrug.asp":
						$("#li_pharmreview").addClass("current");
						$("#div_pharmreview").css("display","");
						$("#a_newdrug").addClass("current");
					break;
					
					//부작용 리포트
					case "adverse.asp":
						$("#li_pharmreview").addClass("current");
						$("#div_pharmreview").css("display","");
						$("#a_adverse").addClass("current");
					break;
					
					//질병정보
					case "disease.asp":
						$("#li_pharmreview").addClass("current");
						$("#div_pharmreview").css("display","");
						$("#a_disease").addClass("current");
					break;
					//질병정보 뷰
					case "disease_detail.asp":
						$("#li_pharmreview").addClass("current");
						$("#div_pharmreview").css("display","");
						$("#a_disease").addClass("current");
					break;

					//한약정보 - 본초
					case "herbalMedicine1.asp":
						$("#li_pharmreview").addClass("current");
						$("#div_pharmreview").css("display","");
						$("#a_herbalMedicine1").addClass("current");
					break;
					//한약정보 - 처방
					case "herbalMedicine2.asp":
						$("#li_pharmreview").addClass("current");
						$("#div_pharmreview").css("display","");
						$("#a_herbalMedicine1").addClass("current");
					break;

					//한약정보 - 방약합편
					case "herbalMedicine3.asp":
						$("#li_pharmreview").addClass("current");
						$("#div_pharmreview").css("display","");
						$("#a_herbalMedicine1").addClass("current");
					break;
					//한약정보 - 방제학
					case "herbalMedicine4.asp":
						$("#li_pharmreview").addClass("current");
						$("#div_pharmreview").css("display","");
						$("#a_herbalMedicine1").addClass("current");
					break;
					//한약정보 뷰
					case "herbalMedicine1_detail.asp":
						$("#li_pharmreview").addClass("current");
						$("#div_pharmreview").css("display","");
						$("#a_herbalMedicine1").addClass("current");
					break;
					//한약정보 뷰
					case "herbalMedicine2_detail.asp":
						$("#li_pharmreview").addClass("current");
						$("#div_pharmreview").css("display","");
						$("#a_herbalMedicine1").addClass("current");
					break;
					//한약정보 뷰
					case "herbalMedicine3_detail.asp":
						$("#li_pharmreview").addClass("current");
						$("#div_pharmreview").css("display","");
						$("#a_herbalMedicine1").addClass("current");
					break;
					//한약정보 뷰
					case "herbalMedicine4_detail.asp":
						$("#li_pharmreview").addClass("current");
						$("#div_pharmreview").css("display","");
						$("#a_herbalMedicine1").addClass("current");
					break;
				}
				break;

			case "notice":
			switch(urlSplit[2]){
					//안전성서한
					case "safety.asp":
						$("#li_notice").addClass("current");
						$("#div_notice").css("display","");
						$("#a_Safety").addClass("current");
					break;
					//안전성서한 글보기
					case "safety_view.asp":
						$("#li_notice").addClass("current");
						$("#div_notice").css("display","");
						$("#a_Safety").addClass("current");
					break;
					//안전성서한 글쓰기
					case "safety_write.asp":
						$("#li_notice").addClass("current");
						$("#div_notice").css("display","");
						$("#a_Safety").addClass("current");
					break;

					//공지사항
					case "notice.asp":
						$("#li_notice").addClass("current");
						$("#div_notice").css("display","");
						$("#a_Notice").addClass("current");
					break;
					//공지사항 작성
					case "notice_write.asp":
						$("#li_notice").addClass("current");
						$("#div_notice").css("display","");
						$("#a_Notice").addClass("current");
					break;
					//공지사항 보기
					case "notice_view.asp":
						$("#li_notice").addClass("current");
						$("#div_notice").css("display","");
						$("#a_Notice").addClass("current");
					break;

					//보도자료
					case "press.asp":
						$("#li_notice").addClass("current");
						$("#div_notice").css("display","");
						$("#a_Press").addClass("current");
					break;
					//보도자료 보기
					case "press_view.asp":
						$("#li_notice").addClass("current");
						$("#div_notice").css("display","");
						$("#a_Press").addClass("current");
					break;
					//보도자료 작성하기
					case "press_write.asp":
						$("#li_notice").addClass("current");
						$("#div_notice").css("display","");
						$("#a_Press").addClass("current");
					break;

					//통합QNA
					case "QnA.asp":
						$("#li_notice").addClass("current");
						$("#div_notice").css("display","");
						$("#a_QnA").addClass("current");
					break;

					//통합QNA 뷰
					case "QnA_view.asp":
						$("#li_notice").addClass("current");
						$("#div_notice").css("display","");
						$("#a_QnA").addClass("current");
					break;

					//통합QNA 작성
					case "QnA_write.asp":
						$("#li_notice").addClass("current");
						$("#div_notice").css("display","");
						$("#a_QnA").addClass("current");
					break;

					//이메일문의
					case "email.asp":
						$("#li_notice").addClass("current");
						$("#div_notice").css("display","");
						$("#a_Email").addClass("current");
					break;
					//광고제휴문의
					case "inquireAd.asp":
						$("#li_notice").addClass("current");
						$("#div_notice").css("display","");
						$("#a_Ad").addClass("current");
					break;
					//포장이미지 등록
					case "package.asp":
						$("#li_notice").addClass("current");
						$("#div_notice").css("display","");
						$("#a_Pack").addClass("current");
					break;
				}
				break;


			case "resource":
				switch(urlSplit[2]){

					//프로그램	
					case "PharmIT3000.asp":
						$("#li_doc").addClass("current");
						$("#div_doc").css("display","");
						$("#a_program").addClass("current");
					break;
					//DIK WEB
					case "DIKweb.asp":
						$("#li_doc").addClass("current");
						$("#div_doc").css("display","");
						$("#a_program").addClass("current");
					break;				

					//모바일앱	
					case "app.asp":
						$("#li_doc").addClass("current");
						$("#div_doc").css("display","");
						$("#a_app").addClass("current");
					break;
					
					//전자도서관	
					//case "app.asp":
					//	$("#li_doc").addClass("current");
					//	$("#div_doc").css("display","");
					//	$("#a_app").addClass("current");
					//break;

					//바로가기 서비스
					case "link.asp":
						$("#li_doc").addClass("current");
						$("#div_doc").css("display","");
						$("#a_link").addClass("current");
					break;


				}
				break;
		}	
	}



//	console.log(urlSplit[0]);
//	console.log(urlSplit[1]);
//	console.log();
//	console.log(urlSplit[3]);

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

$('html, body').stop().animate( { scrollTop : '1' } );$('body').attr('style','position: relative; -ms-zoom:' +nowZoom+'%;')
}

</script>


<!-- 컨텐츠 영역 -->
<section id="contens">
<a class="go_top ico"></a>
<h2 class="blind">컨텐츠</h2>
	<div id="loading-bar" align="center" style="margin-top:100px;margin-left:-150px;display:none">
		<img src = "${drug_Ipath }ajax-loader.gif" width="100px" height="100px" /> 
	</div>
	<section id="articles_sub">
	
		<!-- 의약품검색 -->
		<section id="search_identity">
			<h2 class="maintitle">의약품검색</h2>
			<div style="height: 20px;"></div>
			
			<!-- 검색테이블 -->
			<article class="search_table">
				<!-- 전체,생산Y,생산N 개수 -->
				<!-- 전체 개수 -->
				<input type="hidden" id="idfy_total_cnt" name="idfy_total_cnt">

				<form id="result_frm" name="result_frm" action="${path}/drugResult" method="post">
					<!-- 식별 IDFY IDX -->
					<input type="hidden" id="select_drug_idx" name="select_drug_idx"> 
					<!-- 정보원 코드 -->
					<input type="hidden" id="select_drug_code" name="select_drug_code"> 
				</form>


				<form id="frm" name="frm" action="${path}/drugSearchPro" method="post">
				<input type ="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="search_detail" value="Y">
				<input type="hidden" id="TabState" name="TabState" value="">				
				<input type="hidden" id="proYN" name="proYN" value=""/>
				<input type="hidden" id="pageNo" name="pageNo" value=""/>	
				<input type="hidden" id="rowLength" name="rowLength" value=""/>
				<input type="hidden" id="printList" name="printList" value=""/>

				<!-- 전체,y,n 카운트 고정값 -->
				
				<input type="hidden"  id="fixvalue_all" name="fixvalue_all" value=""/>
				<input type="hidden"  id="fixvalue_y" name="fixvalue_y" value=""/>
				<input type="hidden"  id="fixvalue_n" name="fixvalue_n" value=""/>

				<!-- 	단일,복합 -->
				<input type="hidden" id="item_ingr" name="item_ingr">
				<!-- 	 ~줄보기 -->
				<input type="hidden" id="pageSize" name="pageSize">
				<!-- 	현재 페이지 숫자-->
				<input type="hidden" id="pageNum" name="pageNum">
				<!-- 	생산실적구분(PRINT구분때문에 사용)	 -->
				<input type="hidden" id="produceKind" name="produceKind">
				<fieldset>
				<legend class="blind">식별 정보 입력</legend>
				<table style="min-width: max-content;">
					
					<tr>
						<th colspan="2">제품명</th>
						<td colspan="2" id="drug_namelist" class="idty_td5">
							<input type="text" id="drug_name" name="drug_name" value=""/>
							<ul class="category_list" id="ul_drugList">
							</ul>
						</td>
					<tr>
						<th colspan="2">회사명</th>
						<td colspan="2" class="idty_td6">
							<input type="text" id="entp_name" name="drug_enptname" value="" />
							<ul class="category_list" id="ul_upsoList">
							</ul>
						</td>
					</tr>
			
					<tr>
						<th colspan="2">모양</th>
						<td colspan="2" class="shape">
							<ul id="" class="idty">
								<li id="shape_01" class=""><a onclick="shape_clicks('');"><img src="${drug_Ipath}shape01.jpg"/></a> <input type="checkbox" name="shapes" id="forms" value="원형" ></li>
								<li id="shape_02" class=""><a onclick="shape_clicks('');"><img src="${drug_Ipath}shape02.jpg" alt="타원형"  /></a><input type="checkbox" name="shapes" id="forms" value="타원형"></li>
								<li id="shape_03" class=""><a onclick="shape_clicks('');"><img src="${drug_Ipath}shape03.jpg" alt="반원형" /></a><input type="checkbox" name="shapes" id="forms"value="반원형" ></li>
								<li id="shape_04" class=""><a onclick="shape_clicks('');"><img src="${drug_Ipath}shape04.jpg" alt="삼각형" /></a><input type="checkbox" name="shapes" id="forms"value="삼각형" ></li>
								<li id="shape_05" class=""><a onclick="shape_clicks('');"><img src="${drug_Ipath}shape05.jpg" alt="사각형" /></a><input type="checkbox" name="shapes" id="forms" value="사각형" ></li>
								<li id="shape_06" class=""><a onclick="shape_clicks('');"><img src="${drug_Ipath}shape06.jpg" alt="마름모형" /></a><input type="checkbox" name="shapes" id="forms" value="마름모형" ></li>
								<li id="shape_07" class=""><a onclick="shape_clicks('');"><img src="${drug_Ipath}shape07.jpg" alt="장방형" /></a><input type="checkbox" name="shapes" id="forms" value="장방형" ></li>
								<li id="shape_08" class=""><a onclick="shape_clicks('');"><img src="${drug_Ipath}shape08.jpg" alt="육각형" /></a><input type="checkbox" name="shapes" id="forms" value="육각형" ></li>
								<li id="shape_09" class=""><a onclick="shape_clicks('');"><img src="${drug_Ipath}shape09.jpg" alt="팔각형" /></a><input type="checkbox" name="shapes" id="forms" value="팔각형" ></li>
								<li id="shape_10" class=""><a onclick="shape_clicks('');"><img src="${drug_Ipath}shape10.jpg" alt="오각형" /></a><input type="checkbox" name="shapes" id="forms" value="오각형" ></li>
								<li id="type_etc" class=""><a onclick="shape_clicks('');" class="etc">기타</a><input type="checkbox" name="shapes" id="forms" value="기타"></li>
								<li id="shape_all"  class="selected"><a class="all" onclick="shape_clicks('전체');">전체</a></li>
							</ul>
						</td>
					</tr>
				
				
					<tr>
						<th colspan="2">제형</th>
						<td colspan="2">
							<ul id="typeids" class="idty">
								<li id="type_01" class=""><a onclick="type_clicks('정제');"><img src="${drug_Ipath}type01.jpg" alt="정제" /></a><input type="checkbox" name="forms" value="정제" ></li>
								<li id="type_02" class=""><a onclick="type_clicks('');"><img src="${drug_Ipath}type02.jpg" alt="경질캡슐" /></a><input type="checkbox" name="forms" value="경질" ></li>

								<li id="type_03" class=""><a onclick="type_clicks('');"><img src="${drug_Ipath}type03.jpg" alt="연질캡슐" /></a><input type="checkbox" name="forms" value="연질" ></li>
								
								<li id="type_all" class="selected"><a class="all" onclick="type_clicks('전체');">전체</a></li>
							</ul>
						</td>
					</tr> 
					
					<tr id="color">
						<th colspan="2">색상</th>
						<td colspan="2" class="idty_td8">
							<ul id="colorids" class="idty">
								<li id="color_white" class=""><a onclick="color_clicks('')" id="a"><span class="white"></span>하양</a><input type="checkbox" name="colors" value="하양"></li>
								<li id="color_yellow" class="type2 " onclick="search_group(this,2)"id="a"><a onclick="color_clicks('')"><span class="yellow"></span>노랑</a></li>
								<li id="color_orange" class="type2 " onclick="search_group(this,2)" id="a"><a onclick="color_clicks('')"><span class="orange"></span>주황</a><input type="checkbox" name="colors" value="주황"></li>
								<li id="color_pink" class="type2 " onclick="search_group(this,2)"id="a"><a onclick="color_clicks('')"><span class="pink"></span>분홍</a><input type="checkbox" name="colors" value="분홍"></li>
								<li id="color_red" class="type2 " onclick="search_group(this,2)"id="a"><a onclick="color_clicks('')"><span class="red"></span>빨강</a><input type="checkbox" name="colors" value="빨강"></li>
								<li id="color_brown" class="type2 " onclick="search_group(this,2)" id="a"><a onclick="color_clicks('')"><span class="brown"></span>갈색</a><input type="checkbox" name="colors" value="갈색"></li>
								<li id="color_ygreen" class="type3 " onclick="search_group(this,3)" id="a"><a onclick="color_clicks('')"><span class="ygreen"></span>연두</a><input type="checkbox" name="colors" value="연두"></li>
								<li id="color_green" class="type3 " onclick="search_group(this,3)" id="a"><a onclick="color_clicks('')"><span class="green"></span>초록</a><input type="checkbox" name="colors" value="초록"></li>
								<li id="color_bgreen" class="type3 " onclick="search_group(this,3)" id="a"><a onclick="color_clicks('')"><span class="bgreen"></span>청록</a><input type="checkbox" name="colors" value="청록"></li>
								<li id="color_blue" class="type4 " onclick="search_group(this,4)" id="a"><a onclick="color_clicks('')"><span class="blue"></span>파랑</a><input type="checkbox" name="colors" value="파랑"></li>
								<li id="color_navy" class="type4 " onclick="search_group(this,4)" id="a"><a onclick="color_clicks('')"><span class="navy"></span>남색</a><input type="checkbox" name="colors" value="남색"></li>
								<li id="color_wine" class="type5 " onclick="search_group(this,5)" id="a"><a onclick="color_clicks('')"><span class="wine"></span>자주</a><input type="checkbox" name="colors" value="자주"></li>
								<li id="color_purple" class="type5 " onclick="search_group(this,5)" id="a"><a onclick="color_clicks('')"><span class="purple"></span>보라</a><input type="checkbox" name="colors" value="보라"></li>
								<li id="color_grey" class=""><a onclick="color_clicks('')" id="a"><span class="grey"></span>회색</a><input type="checkbox" name="colors" value="회색"></li>
								<li id="color_black" class=""><a onclick="color_clicks('')" id="a"><span class="black"></span>검정</a><input type="checkbox" name="colors" value="검정"></li>
								<li id="color_transp" class=""><a onclick="color_clicks('')" id="a"><span class="transp"></span>투명</a><input type="checkbox" name="colors" value="투명"></li>
								<li id="color_all" class="selected"><a class="all" onclick="color_clicks('전체')" id="a">전체</a></li>
							</ul>
						</td>	
					</tr>
					<tr>
						<td>회사명</td>
						<td>제품번호</td>
						<td>제품명</td>
						<td>모양</td>
					</tr>
					
				<c:forEach var ="dtos" items="${dtos}">	
					<tr>
					<td>${dtos.drug_enptname}</td>

					<td> ${dtos.drug_number} </td>
				
					<td> ${dtos.drug_name} </td>

					<td> ${dtos.drug_shape} </td>
					</tr>
				</c:forEach>	
				</table>
				
				<div id="btns">
					<button type="button" title="다시입력" class="refresh ico" onclick="refreshIdfy();">다시 입력</button>
					<button type="button" title="검색" name="searchDrug" class="search ico" id="btn_idfysearch" onclick="searchDrug();" >검 색</button>
				</div>
				</fieldset>
				</form>
			</article><!-- //검색테이블 -->
			
			
		</section><!-- //식별검색 -->
		
	</section><!-- //articles_sub -->
	
			<form id="frm_hidden" name="frm_hidden">
				<!-- 	단일,복합 -->
				<input type="hidden" id="item_ingr_hidden" name="item_ingr" value="">
				<!-- 	 ~줄보기 -->
				<input type="hidden" id="pageSize_hidden" name="pageSize_hidden" value="">
				<!-- 	현재 페이지 숫자-->
				<input type="hidden" id="pageNum_hidden" name="pageNum_hidden" value="">
				<!-- 	생산실적구분(PRINT구분때문에 사용)	 -->
				<input type="hidden" id="produceKind_hidden" name="produceKind_hidden" value="">

				<input type="hidden" id="drug_print_front_hidden" name="drug_print_front_hidden" value="" />
				<input type="hidden" id="match1_hidden" name="match1_hidden" value="" />
				<input type="hidden" id="drug_print_back_hidden" name="drug_print_back_hidden" value="" />
				<input type="hidden" id="match2_hidden" name="match2_hidden" value="" />

				<input type="hidden" id="type_01_hidden" name="type_01_hidden" value="" />
				<input type="hidden" id="type_02_hidden" name="type_02_hidden" value="" />
				<input type="hidden" id="type_03_hidden" name="type_03_hidden" value="" />
				<input type="hidden" id="type_04_hidden" name="type_04_hidden" value="" />
				<input type="hidden" id="type_etc_hidden" name="type_etc_hidden" value="" />
				<input type="hidden" id="type_all_hidden" name="type_all_hidden" value="" />

				<input type="hidden" id="mark_hidden" name="mark_hidden" value="" />

				<input type="hidden" id="drug_name_hidden" name="drug_name_hidden" value="" />
				<input type="hidden" id="firm_name_hidden" name="firm_name_hidden" value="" />

				<input type="hidden" id="shape_01_hidden" name="shape_01_hidden" value="" />
				<input type="hidden" id="shape_02_hidden" name="shape_02_hidden" value="" />
				<input type="hidden" id="shape_03_hidden" name="shape_03_hidden" value="" />
				<input type="hidden" id="shape_04_hidden" name="shape_04_hidden" value="" />
				<input type="hidden" id="shape_05_hidden" name="shape_05_hidden" value="" />
				<input type="hidden" id="shape_06_hidden" name="shape_06_hidden" value="" />
				<input type="hidden" id="shape_10_hidden" name="shape_10_hidden" value="" />
				<input type="hidden" id="shape_09_hidden" name="shape_09_hidden" value="" />
				<input type="hidden" id="shape_08_hidden" name="shape_08_hidden" value="" />
				<input type="hidden" id="shape_etc_hidden" name="shape_etc_hidden" value="" />
				<input type="hidden" id="shape_all_hidden" name="shape_all_hidden" value="" />

				<input type="hidden" id="shape1_hidden" name="shape1_hidden" value="" />
				<input type="hidden" id="shape2_hidden" name="shape2_hidden" value="" />
				<input type="hidden" id="shape3_hidden" name="shape3_hidden" value="" />
				<input type="hidden" id="shape4_hidden" name="shape4_hidden" value="" />
				<input type="hidden" id="shape5_hidden" name="shape5_hidden" value="" />
				<input type="hidden" id="shape6_hidden" name="shape6_hidden" value="" />
				<input type="hidden" id="shape7_hidden" name="shape7_hidden" value="" />
				<input type="hidden" id="shape8_hidden" name="shape8_hidden" value="" />
				<input type="hidden" id="shape9_hidden" name="shape9_hidden" value="" />
				<input type="hidden" id="shape10_hidden" name="shape10_hidden" value="" />
				<input type="hidden" id="shape11_hidden" name="shape11_hidden" value="" />
				<input type="hidden" id="shape12_hidden" name="shape12_hidden" value="" />
				<input type="hidden" id="shape13_hidden" name="shape13_hidden" value="" />
				<input type="hidden" id="shape14_hidden" name="shape14_hidden" value="" />
				<input type="hidden" id="shape15_hidden" name="shape15_hidden" value="" />
				<input type="hidden" id="shape16_hidden" name="shape16_hidden" value="" />
				<input type="hidden" id="shape17_hidden" name="shape17_hidden" value="" />
				<input type="hidden" id="shape18_hidden" name="shape18_hidden" value="" />
				<input type="hidden" id="shape19_hidden" name="shape19_hidden" value="" />
				<input type="hidden" id="shape20_hidden" name="shape20_hidden" value="" />
				<input type="hidden" id="shape21_hidden" name="shape21_hidden" value="" />

				<input type="hidden" id="color_white_hidden" name="color_white_hidden" value="" />
				<input type="hidden" id="color_yellow_hidden" name="color_yellow_hidden" value="" />
				<input type="hidden" id="color_orange_hidden" name="color_orange_hidden" value="" />
				<input type="hidden" id="color_pink_hidden" name="color_pink_hidden" value="" />
				<input type="hidden" id="color_red_hidden" name="color_red_hidden" value="" />
				<input type="hidden" id="color_brown_hidden" name="color_brown_hidden" value="" />
				<input type="hidden" id="color_ygreen_hidden" name="color_ygreen_hidden" value="" />
				<input type="hidden" id="color_green_hidden" name="color_green_hidden" value="" />
				<input type="hidden" id="color_bgreen_hidden" name="color_bgreen_hidden" value="" />
				<input type="hidden" id="color_blue_hidden" name="color_blue_hidden" value="" />
				<input type="hidden" id="color_navy_hidden" name="color_navy_hidden" value="" />
				<input type="hidden" id="color_wine_hidden" name="color_wine_hidden" value="" />
				<input type="hidden" id="color_purple_hidden" name="color_purple_hidden" value="" />
				<input type="hidden" id="color_grey_hidden" name="color_grey_hidden" value="" />
				<input type="hidden" id="color_black_hidden" name="color_black_hidden" value="" />
				<input type="hidden" id="color_transp_hidden" name="color_transp_hidden" value="" />
				<input type="hidden" id="color_all_hidden" name="color_all_hidden" value="" />

				<input type="hidden" id="line_no_hidden" name="line_no_hidden" value="" />
				<input type="hidden" id="line_plus_hidden" name="line_plus_hidden" value="" />
				<input type="hidden" id="line_minus_hidden" name="line_minus_hidden" value="" />
				<input type="hidden" id="line_etc_hidden" name="line_etc_hidden" value="" />
				<input type="hidden" id="line_all_hidden" name="line_all_hidden" value="" />

				<input type="hidden" id="hidden_autosearch" name="autosearch" value=""/>


			</form>
	
		<!-- 위치계산용-삭제금지 -->
	<div id="catcher" ></div>

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
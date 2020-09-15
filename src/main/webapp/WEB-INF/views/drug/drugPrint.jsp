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
<script src="${path_resources_js}drug_main.js"></script>
<script src="${path_resources_js}drug_sub.js"></script>
<script src="${path_resources_js}jquery.bxslider.min.js"></script>


<!-- 프린트 스타일 강제설정  -->
<style type="text/css">
h1, h2, h3, h4, h5, dl, dt, dd, ul, li, ol, th, td, p, blockquote, form, fieldset, legend, div,body { -webkit-print-color-adjust:exact; }
</style>


<script>
$(document).ready(function() {
	//정보원코드 오는지 확인
//	alert('');
	selectPrintAll('');

	$("#nowdate").text("출력일 : " + '2020년 9월 14일 월요일');


});
//localAPI-식별상세정보
function selectPrintAll(val){

//	console.log("selectPrintAll 진입 전");
	//검색시작
	$.ajax({
		type:"GET",
//		url:'http://localapi.health.kr:8090/idfyPrintList.localapi?&drug_code='+encodeURIComponent(val),
		url:'/searchIdentity/ajax/ajax_idfy_print.asp?drug_code='+encodeURIComponent(val),
		async:false,
		cache: false,
//		dataType:"jsonp",
		dataType:"json",
//		data:$("#frm").serialize(),
		success:function(data){		
//			console.log("selectPrintAll success");
//			console.log(data);

			//검색결과가 존재할때
			if(data.length > 0){
				var tmplist, tmpsplit
				var htmlData = "";

				for(var i=0; i < data.length; i++ ){

					htmlData +="<article class='printarticle'>";
//					htmlData +="<input type='checkbox' onclick='chkcnt()' id=print"+data[i].idx+">";
					htmlData +="<table class='infotable'>";
					htmlData +="<tr>";
					htmlData +="<td rowspan='6' class='img bb0'>";
					htmlData +="<ul>";
					htmlData +="<li>";
					htmlData +="<img src="+data[i].imgidfy_code+" alt='의약품 이미지'/>";
					htmlData +="<table class='identity'>";
					htmlData +="<tr>";

					var idfy_front = "";
					var idfy_back = "";
					var tempfront = "";
					var tempback = "";
					
					idfy_front = data[i].print_front;

					tempfront = idfy_front.replace(String.fromCharCode(10), "<br>");

					tempfront = tempfront.replace("십자분할선","<span class='line_cross'>+</span>");
					tempfront = tempfront.replace("<br>분할선<br>","<br><img class='lineh' name=img1 src='http://www.pharm.or.kr/images/line_h.gif' align=absmiddle><br>");
					tempfront = tempfront.replace("<br>분할선","<img class='lineh' name=img1 src='http://www.pharm.or.kr/images/line_h.gif' align=absmiddle>");
					tempfront = tempfront.replace("분할선<br>","<img class='lineh' name=img1 src='http://www.pharm.or.kr/images/line_h.gif'  align=absmiddle>");
					tempfront = tempfront.replace(/분할선/g," <img class='linev'name=img1 src='http://www.pharm.or.kr/images/line_v.gif' align=absmiddle> ");
					tempfront = tempfront.replace(/마크/g,"<img name='img1' src='http://www.pharm.or.kr/images/sb_photo/mark/"+data[i].mark_code_front+".gif' width='20' height='20' align='absmiddle'>");

					idfy_back = data[i].print_back;

					tempback = idfy_back.replace(String.fromCharCode(10), "<br>");

					tempback = tempback.replace("십자분할선","<span class='line_cross'>+</span>");
					tempback = tempback.replace("<br>분할선<br>","<img class='lineh' name=img1 src='http://www.pharm.or.kr/images/line_h.gif' align=absmiddle>");
					tempback = tempback.replace("<br>분할선","<img class='lineh' name=img1 src='http://www.pharm.or.kr/images/line_h.gif' align=absmiddle>");
					tempback = tempback.replace("분할선<br>","<img class='lineh' name=img1 src='http://www.pharm.or.kr/images/line_h.gif'  align=absmiddle>");
					tempback = tempback.replace(/분할선/g," <img class='linev'name=img1 src='http://www.pharm.or.kr/images/line_v.gif' align=absmiddle> ");
					tempback = tempback.replace(/마크/g,"<img name='img1' src='http://www.pharm.or.kr/images/sb_photo/mark/"+data[i].mark_code_back+".gif' width='20' height='20' align='absmiddle'>");

//					//앞뒤식별표시
//					if(data[i].print_front != "") {
//						var tempfront = data[i].print_front;
//						if(tempfront.match("분할선")) {
//							tempfront = tempfront.replace(/분할선/g, '|');
//						}
//						if(tempfront.match("마크")) {
//							tempfront = tempfront.replace(/마크/g, "<img name='img1' src='http://www.pharm.or.kr/images/sb_photo/mark/"+data[i].mark_code_front+".gif' width='10' height='10' align='absmiddle'>");
//						}
//					} else {
//						var tempfront = "";
//					}
//					if(data[i].print_back != "") {
//						var tempback = data[i].print_back;
//						if(tempback.match("분할선")) {
//							tempback = tempback.replace(/분할선/g, '|');
//						}
//						if(tempback.match("마크")) {
//							tempback = tempback.replace(/마크/g, "<img name='img1' src='http://www.pharm.or.kr/images/sb_photo/mark/"+data[i].mark_code_back+".gif' width='10' height='10' align='absmiddle'>");
//						}
//					} else {
//						var tempback = "";
//					}

					if(tempfront != "" && tempback != "") {
						htmlData += "<td>"+tempfront+"</td>";
						htmlData += "<td>"+tempback+"</td>";
					} else if(tempfront != "" && tempback == "") {
						htmlData += "<td>"+tempfront+"</td>";
						htmlData += "<td></td>";

					} else if(tempfront == "" && tempback != "") {
						htmlData += "<td></td>";
						htmlData += "<td>"+tempback+"</td>";
					} else {
						htmlData += "<td></td>";
						htmlData += "<td></td>";
					}

					htmlData +="</tr>";
					htmlData +="</table>";
					htmlData +="</li>";
					htmlData +="</ul>";
					htmlData +="</td>";
					htmlData +="<th>제품명</th>";
					htmlData +="<td>"+data[i].drug_name+" "+data[i].drug_enam+"</td>";
					htmlData +="</tr>";
					htmlData +="<tr>";
					htmlData +="<th>성분/함량</th>";
					htmlData +="<td>";
					htmlData +="<ul>";

//					tmplist = data[i].sunb_list
//					tmpsplit = tmplist.replace("|","<br>")

					var temp = data[i].sunb_list;
					var varRegexp = new RegExp("|","ig");
					var chkTrue = temp.match(varRegexp);

					var tmplist, tmpsplit;
					if(chkTrue == null){
						//null일경우 야간용 나누는게 없음
						tmplist = data[i].sunb_list.split("|");
						for(var t=0; t < tmplist.length; t++){	
							htmlData += "<li>"+tmplist[t].replace("@","")+"</li>"
						}
//						$("#idfy_sunb_list").html(htmlData);
//						$("#idfy_sunb_list").css("display","");
					}else{
						
						var tmppre;
						tmplist = data[i].sunb_list.split("|");
						
						for(var t=0; t < tmplist.length; t++){	
							
							tmpsplit = tmplist[t].split("@");
							
							tmpsplit = (tmplist[t]+"@").split("@");
							tmpsplit[1] = tmpsplit[1].replace(/(^\s*)|(\s*$)/gi, "");

	//						alert(tmpsplit[1])

							if(tmppre != tmpsplit[1]) {
								tmppre = tmpsplit[1]
								htmlData += "<h3>"+tmpsplit[1]+"</h3>"
							}
							htmlData += "<li>"+tmpsplit[0]+"</li>"
						}

//						$("#idfy_sunb_list").html(htmlData);
//						$("#idfy_sunb_list").css("display","");
					}

//					htmlData +="<li>"+tmpsplit+"</li>";
					htmlData +="</ul>";
					htmlData +="</td>";
					htmlData +="</tr>";
					htmlData +="<tr>";
					htmlData +="<th>회사명</th>";
					htmlData +="<td>";
					htmlData +="<div class='infoOver comp'>";
					htmlData +="<span>"+data[i].firm_name+"</span>";
					htmlData +="</div>";
					htmlData +="</td>";
					htmlData +="</tr>";
					htmlData +="<tr>";
					htmlData +="<th>전문 / 일반</th>";
					htmlData +="<td>"+data[i].drug_class+"</td>";
					htmlData +="</tr>";
					htmlData +="<tr>";
					htmlData +="<th>식약처 분류</th>";
					htmlData +="<td>"+data[i].cls_name+"</td>";
					htmlData +="</tr>";
					htmlData +="<tr>";
					htmlData +="<th>성상</th>";
					htmlData +="<td class='txtL'>"+data[i].charact+"</td>";
					htmlData +="</tr>";
					htmlData +="</table>";
					htmlData +="</article>";
					htmlData +="<br style='page-break-before:always'>";
				}

			$("#print_section").append(htmlData);

//			$("#search_identity_result article").find("[type=checkbox]").attr("checked",true);
			chkcnt();

//			window.print();

			}else{

			}

//			우측 사이드 배너 재 계산 및 배치
//			sideCalc();
		},
		//complete:function(data){
			//console.log(data.responseText)
		//},
		error:function(xhr, status, error){
			alert('서버와의 통신 중 오류가 발생하였습니다.');
		}
	});
	
}//total end

function chkprint() {
//	$("#search_identity_result .printarticle").each(function() {
//		if($(this).find("[type=checkbox]").is(":checked") == false) {
//
//			$(this).addClass("printdisable");
//		} else {
//			if($(this).hasClass("printdisable")) { 
//				$(this).removeClass("printdisable");
//			}
//		}
//	});

	window.print();
}
function chkcnt() {
	$("#printCnt").text($("#print_section .printarticle").length);
}
</script>

<body>

<%@include file="../common/header.jsp" %> 
<div id="wrap">



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
				<!-- 전체 단일제 개수 -->
				<input type="hidden" id="idfy_total_cnt_item_ingr1" name="idfy_total_cnt_item_ingr1">
				<!-- 전체 복합제 개수 -->
				<input type="hidden" id="idfy_total_cnt_item_ingr2" name="idfy_total_cnt_item_ingr2">
				<!-- 생산Y 개수 -->
				<input type="hidden" id="idfy_produceY_cnt" name="idfy_produceY_cnt">
				<!-- 생산Y 단일제 개수 -->
				<input type="hidden" id="idfy_produceY_cnt_item_ingr1" name="idfy_produceY_cnt_item_ingr1">
				<!-- 생산Y 복합제 개수 -->
				<input type="hidden" id="idfy_produceY_cnt_item_ingr2" name="idfy_produceY_cnt_item_ingr2">
				<!-- 생산N 개수 -->
				<input type="hidden" id="idfy_produceN_cnt" name="idfy_produceN_cnt">
				<!-- 생산N 단일제 개수 -->
				<input type="hidden" id="idfy_produceN_cnt_item_ingr1" name="idfy_produceN_cnt_item_ingr1">
				<!-- 생산N 복합제 개수 -->
				<input type="hidden" id="idfy_produceN_cnt_item_ingr2" name="idfy_produceN_cnt_item_ingr2">

				<form id="result_frm" name="result_frm" action="result.asp" method="post">
					<!-- 식별 IDFY IDX -->
					<input type="hidden" id="select_drug_idx" name="select_drug_idx"> 
					<!-- 정보원 코드 -->
					<input type="hidden" id="select_drug_code" name="select_drug_code"> 
				</form>


				<form id="frm" name="frm" action="search.asp" method="post">
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
				<table>
					<tr>
						<th rowspan="2">제형</th>
						<td rowspan="2">
							<ul id="typeids" class="idty">
								<li id="type_01" class=""><a onclick="type_clicks('정제');"><img src="${drug_Ipath}type01.jpg" alt="정제" /></a><input type="checkbox" name="forms" value="정제" ></li>
								<li id="type_02" class=""><a onclick="type_clicks('');"><img src="${drug_Ipath}type02.jpg" alt="경질캡슐" /></a><input type="checkbox" name="forms" value="경질캡슐" ></li>

								<li id="type_03" class=""><a onclick="type_clicks('');"><img src="${drug_Ipath}type03.jpg" alt="연질캡슐" /></a><input type="checkbox" name="forms" value="연질캡슐" ></li>

								<li id="type_etc" class=""><a class="etc" onclick="type_clicks('');">기타</a><input type="checkbox" name="forms" value="기타"></li>
								
								<li id="type_all" class="selected"><a class="all" onclick="type_clicks('전체');">전체</a></li>
							</ul>
						</td>
						<th>제품명 / 성분명</th>
						<td id="drug_namelist" class="idty_td5">
							<input type="text" id="drug_name" name="drug_name" value="" onkeyup="javascript:drugNmAjax()" onkeydown="searchEnter()" on focus="this.value = this.value;"/>
							<ul class="category_list" id="ul_drugList">
							</ul>
						</td>
					</tr>
					<tr>
						<th>회사명</th>
						<td class="idty_td6">
							<input type="text" id="firm_name" name="firm_name" value="" onkeyup="javascript:upsoNmAjax()" onkeydown="searchEnter2()" on focus="this.value = this.value;"/>
							<ul class="category_list" id="ul_upsoList">
							</ul>
						</td>
					</tr>
					<tr>
						<th>모양</th>
						<td colspan="3" class="shape">
							<ul id="shapeids" class="idty">
								<li id="shape_01" class=""><a onclick="shape_clicks('');"><img src="${drug_Ipath}shape01.jpg"/></a><input type="checkbox" name="shapes" value="완전원형" ></li>
								
								<li id="shape_02" class="type1 " onclick="shape_clicks('');"><a onclick="shape_clicks('');"><img src="${drug_Ipath}shape02.jpg" alt="타원형"  /></a><input type="checkbox" name="shapes" value="타원형"></li>
								
								<li id="shape_07" class="type1 " onclick="shape_clicks('');"><a onclick="shape_clicks('');"><img src="${drug_Ipath}shape07.jpg" alt="장방형" /></a><input type="checkbox" name="shapes" value="장방형" ></li>
								<li id="shape_03" class=""><a onclick="shape_clicks('');"><img src="${drug_Ipath}shape03.jpg" alt="반원형" /></a><input type="checkbox" name="shapes" value="반원형" ></li>
								
								<li id="shape_04" class=""><a onclick="shape_clicks('');"><img src="${drug_Ipath}shape04.jpg" alt="삼각형" /></a><input type="checkbox" name="shapes" value="삼각형" ></li>
								<li id="shape_05" class=""><a onclick="shape_clicks('');"><img src="${drug_Ipath}shape05.jpg" alt="사각형" /></a><input type="checkbox" name="shapes" value="사각형" ></li>
								<li id="shape_06" class=""><a onclick="shape_clicks('');"><img src="${drug_Ipath}shape06.jpg" alt="마름모형" /></a><input type="checkbox" name="shapes" value="마름모형" ></li>
								<li id="shape_10" class=""><a onclick="shape_clicks('');"><img src="${drug_Ipath}shape10.jpg" alt="오각형" /></a><input type="checkbox" name="shapes" value="오각형" ></li>
								<li id="shape_09" class=""><a onclick="shape_clicks('');"><img src="${drug_Ipath}shape08.jpg" alt="육각형" /></a><input type="checkbox" name="shapes" value="육각형" ></li>
								<li id="shape_08" class=""><a onclick="shape_clicks('');"><img src="${drug_Ipath}shape09.jpg" alt="팔각형" /></a><input type="checkbox" name="shapes" value="팔각형" ></li>
								<li id="shape_all"  class="selected"><a class="all" onclick="shape_clicks('전체');">전체</a></li>
							</ul>
							<div class="infoOver shapeETC">
								<a id="shapeETC_selected">기타</a>
								<div class="popupbx ico">
									<h6>기타모양을 선택하세요</h6>
									<a class="close ico" title="닫기"></a>
									<ul id="etclist" style=" width: auto; ">
										<li class="all"><input type="checkbox" name="shapes_alt" id="shape0" onchange="shapeETCAll()" /><label for="shape0" class="ico" style="margin-top:11;">전체</label></li>
										<li><input type="checkbox"  name="shapes_etc" onchange="shape_etcc('1');" id="shape1" value="8자형" /><label for="shape1" class="ico" style="margin-top:11;">8자형</label></li>
										<li><input type="checkbox"  name="shapes_etc" onchange="shape_etcc('2');" id="shape2" value="강낭콩형" /><label for="shape2" class="ico">강낭콩형</label></li>
										<li><input type="checkbox"  name="shapes_etc" onchange="shape_etcc('3');" id="shape3" value="과일모양" /><label for="shape3" class="ico">과일모양</label></li>
										<li><input type="checkbox"  name="shapes_etc" onchange="shape_etcc('4');" id="shape4" value="구형" /><label for="shape4" class="ico">구형</label></li>
										<li><input type="checkbox"  name="shapes_etc" onchange="shape_etcc('5');" id="shape5" value="나비넥타이형" /><label for="shape5" class="ico">나비넥타이형</label></li>
										<li><input type="checkbox"  name="shapes_etc" onchange="shape_etcc('6');" id="shape6" value="나비모양" /><label for="shape6" class="ico">나비모양</label></li>
										<li><input type="checkbox"  name="shapes_etc" onchange="shape_etcc('7');" id="shape7" value="다이아몬드형" /><label for="shape7" class="ico">다이아몬드형</label></li>
										<li><input type="checkbox"  name="shapes_etc" onchange="shape_etcc('8');" id="shape8" value="도넛형" /><label for="shape8" class="ico">도넛형</label></li>
										<li><input type="checkbox"  name="shapes_etc" onchange="shape_etcc('9');" id="shape9" value="동물모양" /><label for="shape9" class="ico">동물모양</label></li>
										<li><input type="checkbox"  name="shapes_etc" onchange="shape_etcc('10');" id="shape10" value="땅콩형" /><label for="shape10" class="ico">땅콩형</label></li>
										<li><input type="checkbox"  name="shapes_etc" onchange="shape_etcc('11');" id="shape11" value="레몬형" /><label for="shape11" class="ico">레몬형</label></li>
										<li><input type="checkbox"  name="shapes_etc" onchange="shape_etcc('12');" id="shape12" value="물방울형" /><label for="shape12" class="ico">물방울형</label></li>
										<li><input type="checkbox"  name="shapes_etc" onchange="shape_etcc('13');" id="shape13" value="방패형" /><label for="shape13" class="ico">방패형</label></li>
										<li><input type="checkbox"  name="shapes_etc" onchange="shape_etcc('14');" id="shape14" value="사과형" /><label for="shape14" class="ico">사과형</label></li>
										<li><input type="checkbox"  name="shapes_etc" onchange="shape_etcc('15');" id="shape15" value="심장형" /><label for="shape15" class="ico">심장형</label></li>
										<li><input type="checkbox"  name="shapes_etc" onchange="shape_etcc('16');" id="shape16" value="십각형" /><label for="shape16" class="ico">십각형</label></li>
										<li><input type="checkbox"  name="shapes_etc" onchange="shape_etcc('17');" id="shape17" value="에벌레형" /><label for="shape17" class="ico">애벌레형</label></li>
										<li><input type="checkbox"  name="shapes_etc" onchange="shape_etcc('18');" id="shape18" value="얼굴모양" /><label for="shape18" class="ico">얼굴모양</label></li>
										<li><input type="checkbox"  name="shapes_etc" onchange="shape_etcc('19');" id="shape19" value="오목한 삼각형" /><label for="shape19" class="ico">오목한 삼각형</label></li>
										<li><input type="checkbox"  name="shapes_etc" onchange="shape_etcc('20');" id="shape20" value="클로버형" /><label for="shape20" class="ico">클로버형</label></li>
										<li><input type="checkbox"  name="shapes_etc" onchange="shape_etcc('21');" id="shape21" value="탄환형" /><label for="shape21" class="ico">탄환형</label></li>
									</ul>
									<a class="close btn04 fR">확 인</a>
								</div>
							</div>
							<div id="shape_etc_text">
								<ul>
								</ul>
							</div>
						</td>
					</tr>
					<tr id="color">
						<th>색상</th>
						<td colspan="3" class="idty_td8">
							<ul id="colorids" class="idty">
								<li id="color_white" class=""><a onclick="color_clicks('')"><span class="white"></span>하양</a><input type="checkbox" name="colors" value="하양"></li>
								<li id="color_yellow" class="type2 " onclick="search_group(this,2)"><a onclick="color_clicks('')"><span class="yellow"></span>노랑</a><input type="checkbox" name="colors" value="노랑"></li>
								<li id="color_orange" class="type2 " onclick="search_group(this,2)"><a onclick="color_clicks('')"><span class="orange"></span>주황</a><input type="checkbox" name="colors" value="주황"></li>
								<li id="color_pink" class="type2 " onclick="search_group(this,2)"><a onclick="color_clicks('')"><span class="pink"></span>분홍</a><input type="checkbox" name="colors" value="분홍"></li>
								<li id="color_red" class="type2 " onclick="search_group(this,2)"><a onclick="color_clicks('')"><span class="red"></span>빨강</a><input type="checkbox" name="colors" value="빨강"></li>
								<li id="color_brown" class="type2 " onclick="search_group(this,2)"><a onclick="color_clicks('')"><span class="brown"></span>갈색</a><input type="checkbox" name="colors" value="갈색"></li>
								<li id="color_ygreen" class="type3 " onclick="search_group(this,3)"><a onclick="color_clicks('')"><span class="ygreen"></span>연두</a><input type="checkbox" name="colors" value="연두"></li>
								<li id="color_green" class="type3 " onclick="search_group(this,3)"><a onclick="color_clicks('')"><span class="green"></span>초록</a><input type="checkbox" name="colors" value="초록"></li>
								<li id="color_bgreen" class="type3 " onclick="search_group(this,3)"><a onclick="color_clicks('')"><span class="bgreen"></span>청록</a><input type="checkbox" name="colors" value="청록"></li>
								<li id="color_blue" class="type4 " onclick="search_group(this,4)"><a onclick="color_clicks('')"><span class="blue"></span>파랑</a><input type="checkbox" name="colors" value="파랑"></li>
								<li id="color_navy" class="type4 " onclick="search_group(this,4)"><a onclick="color_clicks('')"><span class="navy"></span>남색</a><input type="checkbox" name="colors" value="남색"></li>
								<li id="color_wine" class="type5 " onclick="search_group(this,5)"><a onclick="color_clicks('')"><span class="wine"></span>자주</a><input type="checkbox" name="colors" value="자주"></li>
								<li id="color_purple" class="type5 " onclick="search_group(this,5)"><a onclick="color_clicks('')"><span class="purple"></span>보라</a><input type="checkbox" name="colors" value="보라"></li>
								<li id="color_grey" class=""><a onclick="color_clicks('')"><span class="grey"></span>회색</a><input type="checkbox" name="colors" value="회색"></li>
								<li id="color_black" class=""><a onclick="color_clicks('')"><span class="black"></span>검정</a><input type="checkbox" name="colors" value="검정"></li>
								<li id="color_transp" class=""><a onclick="color_clicks('')"><span class="transp"></span>투명</a><input type="checkbox" name="colors" value="투명"></li>
								<li id="color_all" class="selected"><a class="all" onclick="color_clicks('전체')">전체</a></li>
							</ul>
						</td>	
					</tr>
					<tr>
						<th>분할선</th>
						<td colspan="3">
							<ul id="lineids" class="idty">
								<li id="line_no" class=""><a onclick="line_clicks('')"><img src="${drug_Ipath}line01.jpg" alt="없음" /></a><input type="checkbox" name="lines" value="no"></li>
								<li id="line_plus" class=""><a onclick="line_clicks('')"><img src="${drug_Ipath}line02.jpg" alt="(+)형" /></a><input type="checkbox" name="lines" value="plus"></li>
								<li id="line_minus" class=""><a onclick="line_clicks('')"><img src="${drug_Ipath}line03.jpg" alt="(-)형" /></a><input type="checkbox" name="lines" value="minus"></li>
								<li id="line_etc" class=""><a class="etc" onclick="line_clicks('')">기타</a><input type="checkbox" name="lines" value="etc"></li>
								<li id="line_all" class="selected" onclick="line_clicks('전체')"><a class="all">전체</a></li>
							</ul>
						</td>
					</tr>
				</table>
				<div id="btns">
					<button type="button" title="다시입력" class="refresh ico" onclick="refreshIdfy();">다시 입력</button>
					<button type="button" title="검색" class="search ico" id="btn_idfysearch" onclick="idfySend();">검 색</button>
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
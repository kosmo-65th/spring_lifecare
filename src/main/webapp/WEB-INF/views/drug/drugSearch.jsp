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
  <title>의약품 검색</title>
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

<link rel="stylesheet" href="${drug_Cpath}base.css" type="text/css">
<link rel="stylesheet" href="${drug_Cpath}common.css" type="text/css">
<link rel="stylesheet" href="${drug_Cpath}sub.css" type="text/css">

<script src="${path_resources_js}placeholders.min.js"></script>
<script src="${path_resources_js}jquery.min.js"></script>
<script src="${path_resources_js}sub.dev.js"></script>
<script src="${path_resources_js}jquery.lazyload.js"></script>
<script src="${path_resources_js}jquery.bxslider.min.js"></script>


<script type="text/javascript">
//약 이름 keyup
$(function() {
	$('#drug_name').keyup(function() {
		var drug = $('#drug_name').val();  // input 태그에서 입력한 키워드
		
		if(drug.length == 0) {        // 검색글자수가 0인 경우
			$('#name_next').css("display", "none");       // 숨김
		} else {
			$('#name_next').css("visibility", "visible");      // 표시
			$('#name_next').css("display", "flex");
			$('#name_next').css("align-items", "center");
			$('#name_next').css("min-width", "0");
			$('#name_next').css("max-height", "none");
			$('#name_next').css("background", "#f9f9f9");
			$('#name_next').css("border-radius", "499rem");
		}
		$.ajax({
			url : '${pageContext.request.contextPath}/drug_name_next?${_csrf.parameterName}=${_csrf.token}',
			type : 'POST',
			data : 'drug=' + drug,
			success : function(result) { // 콜백함수 호출
				$('#name_next').html(result);   // 결과  출력
			},
			error : function() {
				alert("오류");
			}
		});
	});
});

function nameClick(drug_name){
	document.frm.drug_name.value = drug_name;
	$('#name_next').css("display", "none");
}

//약 회사 keyup
$(function() {
	$('#entp_name').keyup(function() {
		var entp = $('#entp_name').val();  // input 태그에서 입력한 키워드
		
		if(entp.length == 0) {        // 검색글자수가 0인 경우
			$('#entp_next').css("display", "none");       // 숨김
		} else {
			$('#entp_next').css("visibility", "visible");      // 표시
			$('#entp_next').css("display", "flex");
			$('#entp_next').css("align-items", "center");
			$('#entp_next').css("min-width", "0");
			$('#entp_next').css("max-height", "none");
			$('#entp_next').css("background", "#f9f9f9");
			$('#entp_next').css("border-radius", "499rem");
			
		}
		// keyword -> search_next.ja(search_next.jsp) -> result -> 콜백함수 -> display에 출력
		$.ajax({
			url : '${pageContext.request.contextPath}/drug_enptname_next?${_csrf.parameterName}=${_csrf.token}',
			type : 'POST',
			data : 'entp=' + entp,
			success : function(result) { // 콜백함수 호출
				$('#entp_next').html(result);   // 결과  출력
			},
			error : function() {
				alert("오류");
			}
		});
	});
});


function entpClick(entp_name){
	document.frm.entp_name.value = entp_name;
	$('#entp_next').css("display", "none");
}

$(function(){
	$('#btn_idfysearch').click(function(){
		var drug_name = document.getElementById("drug_name").value;
		var drug_enptname = document.getElementById("entp_name").value;
		
		var shapeList = new Array();
        $("input[name=shapes]:checked").each(function(){
        	shapeList.push($(this).val());
        }); 
        
		var formList = new Array();
        $("input[name=forms]:checked").each(function(){
        	formList.push($(this).val());
        });
		
		var colorList = new Array();
        $("input[name=colors]:checked").each(function(){
        	colorList.push($(this).val());
        });
        
		window.location="drugSearchPro?drug_name=" + drug_name + "&drug_enptname="+drug_enptname+ "&drug_formulation="+formList + "&drug_color="+colorList+"&drug_shape=" +shapeList ; 

	});
	
})

function searchDrug() {
	
	return false;
}
</script>

<script type="text/javascript">

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

//drugDetail 
function drugDetail(drug_number) {
	
	location.href="/lifecare/drugDetail?drug_number="+drug_number;

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
// 모양번호, 모양명
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

// 제형 전체 <-> 그외 구분
function type_clicks(val) {
	if(val == "전체") {
		$("#typeids li").addClass("selected");
		$("#typeids li input[type=checkbox]").prop("checked",true);
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
		$("#shapeids li").addClass("selected");
		$("#shapeids li input[type=checkbox]").prop("checked",true);
		$("#shapeETC_selected").css("border","");
		$(".shapeETC").find("[type=checkbox]").prop("checked",true);
		$("#shape_etc_text ul").empty();
	} else {
		$("#shape_all").removeClass("selected");
	}
}
// 색상 전체 <-> 그외 구분
function color_clicks(val) {
	if(val == "전체") {
		$("#colorids li").addClass("selected");
		$("#colorids li input[type=checkbox]").prop("checked",true);
	} else {
		$("#color_all").removeClass("selected");
	}
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
 	

<!-- 컨텐츠 영역 -->
<section id="contens">
<a class="go_top ico"></a>
<h2 class="blind">컨텐츠</h2>
	<div id="loading-bar" align="center" style="margin-top:100px;margin-left:-150px;display:none">
		<img src = "${drug_Ipath}ajax-loader.gif" width="100px" height="100px" /> 
	</div>
	<section id="articles_sub">
		
 		<div id="lnb">
				<ul style="width:100%; float:right;">
					<div style="float:right; margin-right: 30px">
					<li class="home"><a href="${path}/" class="ico"></a></li>
					<li class="nxt"><span class="ico"></span></li>
					<li>의약품 검색</li>
					</div>
				</ul>
		</div>	
		
		<!-- 의약품검색 -->
		<section id="search_identity">
			<h2 class="maintitle">의약품 검색</h2>
			<div style="height: 20px;"></div>
		
			<!-- 검색테이블 -->
			<article class="search_table">


				<form id="frm" name="frm" action="${path}/drugSearchPro" method="post">
				<input type ="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<fieldset>
				<legend class="blind">식별 정보 입력</legend>
				<table style="min-width: max-content;">
					
					<tr>
						<th colspan="2">제품명</th>
						<td colspan="2" id="drug_namelist" class="idty_td5">
							<input type="text" id="drug_name" name="drug_name" value=""/>
							<div id=name_next></div>
							<ul class="category_list" id="ul_drugList">
							</ul>
						</td>
					<tr>
						<th colspan="2">회사명</th>
						<td colspan="2" class="idty_td6">
							<input type="text" id="entp_name" name="drug_enptname" value="" />
							<div id=entp_next></div>
							<ul class="category_list" id="ul_upsoList">
							</ul>
						</td>
					</tr>
			
					<tr>
						<th colspan="2">모양</th>
						<td colspan="2" class="shape">
							<ul id="shapeids" class="idty">
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
								<li id="color_orange" class="type2 " onclick="search_group(this,2)" id="a"><a onclick="color_clicks('')"><span class="orange"></span>주황</a><input type="checkbox" name="colors" id="colors" value="주황"></li>
								<li id="color_pink" class="type2 " onclick="search_group(this,2)"id="a"><a onclick="color_clicks('')"><span class="pink"></span>분홍</a><input type="checkbox" name="colors" id="colors" value="분홍"></li>
								<li id="color_red" class="type2 " onclick="search_group(this,2)"id="a"><a onclick="color_clicks('')"><span class="red"></span>빨강</a><input type="checkbox" name="colors" id="colors" value="빨강"></li>
								<li id="color_brown" class="type2 " onclick="search_group(this,2)" id="a"><a onclick="color_clicks('')"><span class="brown"></span>갈색</a><input type="checkbox" name="colors" id="colors" value="갈색"></li>
								<li id="color_ygreen" class="type3 " onclick="search_group(this,3)" id="a"><a onclick="color_clicks('')"><span class="ygreen"></span>연두</a><input type="checkbox" name="colors" id="colors" value="연두"></li>
								<li id="color_green" class="type3 " onclick="search_group(this,3)" id="a"><a onclick="color_clicks('')"><span class="green"></span>초록</a><input type="checkbox" name="colors" id="colors" value="초록"></li>
								<li id="color_bgreen" class="type3 " onclick="search_group(this,3)" id="a"><a onclick="color_clicks('')"><span class="bgreen"></span>청록</a><input type="checkbox" name="colors" id="colors" value="청록"></li>
								<li id="color_blue" class="type4 " onclick="search_group(this,4)" id="a"><a onclick="color_clicks('')"><span class="blue"></span>파랑</a><input type="checkbox" name="colors" id="colors" value="파랑"></li>
								<li id="color_navy" class="type4 " onclick="search_group(this,4)" id="a"><a onclick="color_clicks('')"><span class="navy"></span>남색</a><input type="checkbox" name="colors" id="colors" value="남색"></li>
								<li id="color_wine" class="type5 " onclick="search_group(this,5)" id="a"><a onclick="color_clicks('')"><span class="wine"></span>자주</a><input type="checkbox" name="colors" id="colors" value="자주"></li>
								<li id="color_purple" class="type5 " onclick="search_group(this,5)" id="a"><a onclick="color_clicks('')"><span class="purple"></span>보라</a><input type="checkbox" name="colors" id="colors" value="보라"></li>
								<li id="color_grey" class=""><a onclick="color_clicks('')" id="a"><span class="grey"></span>회색</a><input type="checkbox" name="colors" id="colors" value="회색"></li>
								<li id="color_black" class=""><a onclick="color_clicks('')" id="a"><span class="black"></span>검정</a><input type="checkbox" name="colors" id="colors" value="검정"></li>
								<li id="color_transp" class=""><a onclick="color_clicks('')" id="a"><span class="transp"></span>투명</a><input type="checkbox" name="colors" id="colors" value="투명"></li>
								<li id="color_all" class="selected"><a class="all" onclick="color_clicks('전체')" id="a">전체</a></li>
							</ul>
						</td>	
					</tr>
					
				</table>
				
				<div id="btns">
					<button type="button" title="다시입력" class="refresh ico" onclick="refreshIdfy();">다시 입력</button>
					<button type="button" title="검색" name="searchDrug" class="search ico" id="btn_idfysearch" onclick="" >검 색</button>
				</div>
				</fieldset>
				</form>
			</article><!-- //검색테이블 -->
			
				<!-- 검색결과 탭 -->
			<article id="result">
				<h3 class="subtitle">검색결과</h3>
				<!-- 전체 -->
				<article class="tab2_cont" id="result_all">
					<div class="tab3Group">
						<ul class="tab3">
							<li class="selected"><a style="cursor:pointer" >전 체 (${cnt}) </a></li>
							<!-- <li class="selected"><a style="cursor:pointer" onclick="javascript:window.print();" class=""><span class="">인쇄</span></a></li> -->
						</ul>
					</div>

					<table class="tab3_cont list_basic bt0" id="idfytotal0" style="text-align: center;"	>
						<tr>
							<th rowspan="2">식별이미지</th>
							<th rowspan="2" class="mark">식별표시<br />(앞)</th>
							<th rowspan="2"class="color">색상</th>
							<th colspan="3" class="size">크기(mm)</th>
							<th rowspan="2" class="name">제품명</th>
							<th rowspan="2" class="comp">회사명</th>
						</tr>
						<tr>
							<th>장축</th>
							<th>단축</th>
							<th>두께</th>
						</tr>
					<c:forEach var ="dtos" items="${dtos}">	
						<tr>
							<td class="img">
								<div class="infoOver view_drugimg">
									<a>
										<img alt="의약품이미지" src="${dtos.drug_productimage}"></a>
									<div class="popupbx pop_more" style="display: none;">
										<h6> ${dtos.drug_name}</h6>
										<a title="닫기" class="close ico"></a>
										<img alt=" ${dtos.drug_name}" src="${dtos.drug_productimage}">
										<table class="identity">
											<tbody>
												<tr>
													<th>식별표시</th>
													<td> ${dtos.drug_frontShape} </td>
												</tr>
											</tbody>
										</table>
										<table>
											<tbody>
												<tr>
													<th>장축(mm)</th>
													<td>${dtos.drug_size_l}</td>
													<th>단축(mm)</th>
													<td>${dtos.drug_size_s}</td>
													<th>두께(mm)</th>
													<td>${dtos.drug_size_w}</td>
												</tr>
												<tr>
													<th>성상</th>
													<td class="txtL" colspan="5">${dtos.drug_formulation}</td>
												</tr>
											</tbody>
										</table>
										
									</div>
								</div>
							</td>
							<td class="mark">
								${dtos.drug_frontShape} 
							</td>
							<td class="categ">${dtos.drug_color}</td>
							<td>${dtos.drug_size_l}</td>
							<td>${dtos.drug_size_s}</td>
							<td>${dtos.drug_size_w}</td>
							<td class="txtL name" onclick="drugDetail('${dtos.drug_number}')">${dtos.drug_name}
							
							</td>
							<td class="comp">${dtos.drug_enptname}</td>
						</tr>
					</c:forEach>	
					
					
					 <c:if test="${cnt < 1}">
						<tr>
							<td colspan="8" align="center">
							
							검색 결과가 없습니다. 다시 검색해주세요.
							</td>
						</tr>
					</c:if> 
					</table>

					<table class="tab3_cont list_basic bt0" id="idfytotal1">

					</table>
					<table class="tab3_cont list_basic bt0" id="idfytotal2">

					</table>
					<div id="paging">

					</div>
				</article><!-- //전체 -->					
				
			</article><!-- //검색결과 탭 -->
	
	<!-- 페이지 컨트롤  -->
	<table style="width:1000px" align="center">
	
		<tr align="center" id="bot">
					<td colspan="11">
						<!--페이지 맨앞/1칸 앞으로이동  -->
						
						<a href="${path}/drugSearchPro?drug_name=${drug_name}&drug_enptname=${drug_enptname}&drug_formulation=${formList }&drug_color=${ colorList}&drug_shape=${ shapeList}">◀◀  </a>
							<c:choose>
								<c:when test="${currentPage==1}">
									<a href="${path}/drugSearchPro?drug_name=${drug_name}&drug_enptname=${drug_enptname}&drug_formulation=${formList }&drug_color=${ colorList}&drug_shape=${ shapeList}&currentPage=${currentPage}">◀  </a>
									<!--페이지가 1보다 더이상 안작아지도록  -->
								</c:when>
								<c:otherwise>
									<a href="${path}/drugSearchPro?drug_name=${drug_name}&drug_enptname=${drug_enptname}&drug_formulation=${formList }&drug_color=${ colorList}&drug_shape=${ shapeList}&currentPage=${currentPage-1}">◀  </a>
								</c:otherwise>
							</c:choose>
							
						<!-- max블록씩 페이지 앞으로 이동 -->							
						<c:if test="${startPage>pageBlock}" >
							<a href="${path}/drugSearchPro?drug_name=${drug_name}&drug_enptname=${drug_enptname}&drug_formulation=${formList }&drug_color=${ colorList}&drug_shape=${ shapeList}&currentPage=${startPage-pageBlock}">[이전 블록]</a>
						</c:if> 
						

					<!--페이지 블록 -->
					<c:if test="${cnt>0}" >
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i==currentPage}">
								<a href="${path}/drugSearchPro?drug_name=${drug_name}&drug_enptname=${drug_enptname}&drug_formulation=${formList }&drug_color=${ colorList}&drug_shape=${ shapeList}&currentPage=${i}">[${i}]</a>
							</c:if>
							<c:if test="${i!=currentPage}">
								<a href="${path}/drugSearchPro?drug_name=${drug_name}&drug_enptname=${drug_enptname}&drug_formulation=${formList }&drug_color=${ colorList}&drug_shape=${ shapeList}&currentPage=${i}">&nbsp;[${i}]&nbsp;</a>
							</c:if>
						</c:forEach>
					</c:if>
					
						<!-- max블록씩 페이지 뒤로 이동 -->
						<c:if test="${pageCount>endPage}" >
							<a href="${path}/drugSearchPro?drug_name=${drug_name}&drug_enptname=${drug_enptname}&drug_formulation=${formList }&drug_color=${ colorList}&drug_shape=${ shapeList}&currentPage=${startPage+pageBlock}"> [다음 블록] </a>
						</c:if> 
						
						
					<!--뒤로1칸이동 / 페이지 맨뒤-->
						 	<c:choose>
						 		<c:when test="${currentPage==pageCount}">
						 		<!--최종 페이지보다 더 뒤로 못가게  --> 
						 			<a href="${path}/drugSearchPro?drug_name=${drug_name}&drug_enptname=${drug_enptname}&drug_formulation=${formList }&drug_color=${ colorList}&drug_shape=${ shapeList}&currentPage=${currentPage}"> ▶</a>
						 		</c:when>
						 		<c:otherwise>
						 			<a href="${path}/drugSearchPro?drug_name=${drug_name}&drug_enptname=${drug_enptname}&drug_formulation=${formList }&drug_color=${ colorList}&drug_shape=${ shapeList}&currentPage=${currentPage+1}">  ▶</a>
						 		</c:otherwise>
						 	</c:choose>
						
						<a href="${path}/drugSearchPro?drug_name=${drug_name}&drug_enptname=${drug_enptname}&drug_formulation=${formList }&drug_color=${ colorList}&drug_shape=${ shapeList}&currentPage=${pageCount}"> ▶▶</a>
					</td>
				</tr>
		</table>
		
		</section><!-- //식별검색 -->
		
	</section><!-- //articles_sub -->
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
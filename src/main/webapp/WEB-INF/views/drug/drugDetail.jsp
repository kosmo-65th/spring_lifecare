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
			break;
		case "dosage" : 
			selectBoxToggle('dosage','효능효과');
			break;
		case "all" : 
			selectBoxToggle('all','의약품검색');
			break;
	}

});




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
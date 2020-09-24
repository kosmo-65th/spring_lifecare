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

<link rel="stylesheet" href="${drug_Cpath}base.css" type="text/css">
<link rel="stylesheet" href="${drug_Cpath}common.css" type="text/css">
<link rel="stylesheet" href="${drug_Cpath}sub.css" type="text/css">

<script src="${path_resources_js}placeholders.min.js"></script>
<script src="${path_resources_js}jquery.min.js"></script>
<script src="${path_resources_js}sub.dev.js"></script>
<script src="${path_resources_js}jquery.lazyload.js"></script>
<script src="${path_resources_js}jquery.bxslider.min.js"></script>

<script type="text/javascript">
//drugDetail 
function drugDetail(drug_number) {
	
	location.href="/lifecare/drugDetail?drug_number="+drug_number;

}
</script>

<body>

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
					
					<li class="nxt"><span > > </span></li>
					<li><a href="${path}/android_drugSearch" >의약품 검색</a></li>
					
					<li class="nxt"><span > > </span></li>
					<li>의약품 검색 결과</li>
					</div>
				</ul>
		</div>	
		
			
				<!-- 검색결과 탭 -->
			<article id="result">
				<h3 class="subtitle">검색결과</h3>
				<!-- 전체 -->
				<article class="tab2_cont" id="result_all">
					<div class="tab3Group">
						<ul class="tab3">
							<li class="selected"><a style="cursor:pointer" >전 체 (${cnt}) </a></li>
							<li class="selected"><a style="cursor:pointer" onclick="javascript:window.print();" class=""><span class="">인쇄</span></a></li>
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
						
						<a href="${path}/android_drugSearchPro?drug_name=${drug_name}&drug_enptname=${drug_enptname}&drug_formulation=${formList }&drug_color=${ colorList}&drug_shape=${ shapeList}">◀◀  </a>
							<c:choose>
								<c:when test="${currentPage==1}">
									<a href="${path}/android_drugSearchPro?drug_name=${drug_name}&drug_enptname=${drug_enptname}&drug_formulation=${formList }&drug_color=${ colorList}&drug_shape=${ shapeList}&currentPage=${currentPage}">◀  </a>
									<!--페이지가 1보다 더이상 안작아지도록  -->
								</c:when>
								<c:otherwise>
									<a href="${path}/android_drugSearchPro?drug_name=${drug_name}&drug_enptname=${drug_enptname}&drug_formulation=${formList }&drug_color=${ colorList}&drug_shape=${ shapeList}&currentPage=${currentPage-1}">◀  </a>
								</c:otherwise>
							</c:choose>
							
						<!-- max블록씩 페이지 앞으로 이동 -->							
						<c:if test="${startPage>pageBlock}" >
							<a href="${path}/android_drugSearchPro?drug_name=${drug_name}&drug_enptname=${drug_enptname}&drug_formulation=${formList }&drug_color=${ colorList}&drug_shape=${ shapeList}&currentPage=${startPage-pageBlock}">[이전 블록]</a>
						</c:if> 
						

					<!--페이지 블록 -->
					<c:if test="${cnt>0}" >
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i==currentPage}">
								<a href="${path}/android_drugSearchPro?drug_name=${drug_name}&drug_enptname=${drug_enptname}&drug_formulation=${formList }&drug_color=${ colorList}&drug_shape=${ shapeList}&currentPage=${i}">[${i}]</a>
							</c:if>
							<c:if test="${i!=currentPage}">
								<a href="${path}/android_drugSearchPro?drug_name=${drug_name}&drug_enptname=${drug_enptname}&drug_formulation=${formList }&drug_color=${ colorList}&drug_shape=${ shapeList}&currentPage=${i}">&nbsp;[${i}]&nbsp;</a>
							</c:if>
						</c:forEach>
					</c:if>
					
						<!-- max블록씩 페이지 뒤로 이동 -->
						<c:if test="${pageCount>endPage}" >
							<a href="${path}/android_drugSearchPro?drug_name=${drug_name}&drug_enptname=${drug_enptname}&drug_formulation=${formList }&drug_color=${ colorList}&drug_shape=${ shapeList}&currentPage=${startPage+pageBlock}"> [다음 블록] </a>
						</c:if> 
						
						
					<!--뒤로1칸이동 / 페이지 맨뒤-->
						 	<c:choose>
						 		<c:when test="${currentPage==pageCount}">
						 		<!--최종 페이지보다 더 뒤로 못가게  --> 
						 			<a href="${path}/android_drugSearchPro?drug_name=${drug_name}&drug_enptname=${drug_enptname}&drug_formulation=${formList }&drug_color=${ colorList}&drug_shape=${ shapeList}&currentPage=${currentPage}"> ▶</a>
						 		</c:when>
						 		<c:otherwise>
						 			<a href="${path}/android_drugSearchPro?drug_name=${drug_name}&drug_enptname=${drug_enptname}&drug_formulation=${formList }&drug_color=${ colorList}&drug_shape=${ shapeList}&currentPage=${currentPage+1}">  ▶</a>
						 		</c:otherwise>
						 	</c:choose>
						
						<a href="${path}/android_drugSearchPro?drug_name=${drug_name}&drug_enptname=${drug_enptname}&drug_formulation=${formList }&drug_color=${ colorList}&drug_shape=${ shapeList}&currentPage=${pageCount}"> ▶▶</a>
					</td>
				</tr>
		</table>
		
		</section><!-- //식별검색 -->
		
	</section><!-- //articles_sub -->

</div><!-- //wrap -->
	
      <!-- end copyrights -->
     <%--  <a href="#home" data-scroll class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>
      <!-- all js files -->
      <script src="${path_resources_lifecare}js/all.js"></script>
      <!-- all plugins -->
      <script src="${path_resources_lifecare}js/custom.js"></script> --%>
   </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %> 
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
   <link rel="stylesheet" href="${path_resources_lifecare}css/pbor.css">
  
   <!-- CSS -->
   <!-- jQuery 추가 -->
   <script src="${path_resources}setting/jquery-3.5.1.js"></script>
   <!--자바스크립트  -->
   <script type="text/javascript" src="${path_resources}js/nonpayment.js"></script>
   
   
   
   <!-- 팝업창 띄우는 자바스크립트 -->
    <script type="text/javascript">
		function getCookie(name) {
	    	var cookie = document.cookie;
	    	if (document.cookie != "") {
	         	var cookieArray = cookie.split("; ");
	         	for ( var index in cookieArray) {
	            	var cookieName = cookieArray[index].split("=");
	            	if (cookieName[0] == "popupYN") {
	                	return cookieName[1];
	             	}
	         	}
	    	} return ;    
		}
		$(document).ready(function(){
			popUp();
		});
		function popUp() {
	    	var cookieCheck = getCookie("popupYN");
	    	if (cookieCheck != "N"){
	         	window.open('${path}/popup', 'newpop', 'width=630,height=570,left=0,top=0');
	    	}
		}
		
	</script>
   <!-- [if lt IE 9] -->
   </head>
   <body class="clinic_version">
      <!-- LOADER -->
      <div id="preloader">
         <img class="preloader" src="${path_resources_lifecare}images/loaders/heart-loading2.gif" alt="">
      </div>
      <!-- END LOADER -->
      <%@include file="../common/header.jsp" %>
      <div class="ul" style="background-image:url('${path_resources_lifecare}images/slider-bg.png') !important; ">
      	<div class="container" style="background-color: white; padding: 20px">
			
			<h1 style="font-size: 33px">비급여 진료비용 항목</h1>
			<!--메뉴------------------>
			<div class="tabTypeCol4 a">
			
				<ul class="clearFix">
				<c:choose>
					<c:when test="${code==1}">
						<li class="current"><a href="${path}/nonpayment?code=1">행위료</a></li>
						<li class=""><a href="${path}/nonpayment?code=2">치료재료</a></li>
						<li class=""><a href="${path}/nonpayment?code=3">약제</a></li>
						<li class=""><a href="${path}/nonpayment?code=4">제증명수수료</a></li>
					</c:when>
					<c:when test="${code==2}">
						<li class=""><a href="${path}/nonpayment?code=1">행위료</a></li>
						<li class="current"><a href="${path}/nonpayment?code=2">치료재료</a></li>
						<li class=""><a href="${path}/nonpayment?code=3">약제</a></li>
						<li class=""><a href="${path}/nonpayment?code=4">제증명수수료</a></li>
					</c:when>
					<c:when test="${code==3}">
						<li class=""><a href="${path}/nonpayment?code=1">행위료</a></li>
						<li class=""><a href="${path}/nonpayment?code=2">치료재료</a></li>
						<li class="current"><a href="${path}/nonpayment?code=3">약제</a></li>
						<li class=""><a href="${path}/nonpayment?code=4">제증명수수료</a></li>
					</c:when>
					<c:when test="${code==4}">
						<li class=""><a href="${path}/nonpayment?code=1">행위료</a></li>
						<li class=""><a href="${path}/nonpayment?code=2">치료재료</a></li>
						<li class=""><a href="${path}/nonpayment?code=3">약제</a></li>
						<li class="current"><a href="${path}/nonpayment?code=4">제증명수수료</a></li>
					</c:when>
					
					<c:otherwise>
						<li class=""><a href="${path}/nonpayment?code=1">행위료</a></li>
						<li class=""><a href="${path}/nonpayment?code=2">치료재료</a></li>
						<li class=""><a href="${path}/nonpayment?code=3">약제</a></li>
						<li class=""><a href="${path}/nonpayment?code=4">제증명수수료</a></li>
					</c:otherwise>
				</c:choose>
				</ul>
			</div>
			<!------------------------------------------------------------------------------------------>
			
			
			<c:if test="${code==1}">
			<!--리스트(code1)------------------------------------------------------------------------------------>
			<style type="text/css">
				.tg  {border-collapse:collapse;border-color:#ccc;border-spacing:0;}
				.tg td{background-color:#fff;border-color:#ccc;border-style:solid;border-width:1px;color:#333;
				  font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;}
				.tg th{background-color:#f0f0f0;border-color:#ccc;border-style:solid;border-width:1px;color:#333;
				  font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
				
				.tg .tg-gg0b{
					background-color:#f9f9f9;
					font-family:"Arial Black", Gadget, sans-serif !important;
					font-size:18px;
					text-align:center;
					vertical-align:middle
				}
				
				.tg .tg-navq{
					
					font-size:18px;
					text-align:center;
					vertical-align:middle
					
				}
				
				.tg .tg-orf0{
				
					text-align:center;
					vertical-align:middle;
				}
				
				
			</style>
			
			<form action="${path}/nonpayment">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="code" value="${code}">
				<table>
					<tr>
						<td>
							<input type="text"  name="word" value="${word}" class="input" >
							<input type="submit" value="검색" class="button">
						</td>
					</tr>
				</table>
			</form>
			
			<table class="tg">
			<thead>
			  <tr>
			    <th class="tg-navq" rowspan="2" style="width: 100px;">중분류</th>
			    <th class="tg-navq" rowspan="2" style="width: 88px;">분류</th>
			    <th class="tg-navq" colspan="2" style="width: 386px;" >항목</th>
			    <th class="tg-navq" colspan="6" style="width: 415px;">진료비용 등(단위 : 원 )</th>
			    <th class="tg-navq" rowspan="2" style="width: 110px;">특이사항</th>
			  </tr>
			  <tr>
			    <td class="tg-gg0b" style="width: 286px;">명칭</td>
			    <td class="tg-gg0b" style="width: 100px;">코드</td>
			    <td class="tg-gg0b" style="width: 50px;">구분</td>
			    <td class="tg-gg0b" style="width: 55px">비용</td>
			    <td class="tg-gg0b" style="width: 55px; ">최저<br>비용</td>
			    <td class="tg-gg0b" style="width: 55px;">최대<br>비용</td>
			    <td class="tg-gg0b" style="width: 100px;">치료재료대<br>포함여부</td>
			    <td class="tg-gg0b" style="width: 100px;">약제비<br>포함여부</td>
			  </tr>
			</thead>
			<tbody>
			<c:forEach var="vo" items="${vo}">
			  <tr>
			    <td class="tg-orf0" style="width: 100px;">${vo.medium_div}</td>
			    <td class="tg-orf0" style="width: 53px;">${vo.divv} </td>
			    <td class="tg-orf0" style="width: 299px;">${vo.name }</td>
			    <td class="tg-orf0" style="width: 100px;">${vo.code }</td>
			    <td class="tg-orf0" style="width: 50px;">${vo.repet }</td>
			    <td class="tg-orf0" style="width: 55px;">${vo.cost }</td>
			    <td class="tg-orf0" style="width: 55px;">${vo.min_cost }</td>
			    <td class="tg-orf0" style="width: 55px">${vo.max_cost }</td>
			    <td class="tg-orf0" style="width: 100px;">${vo.add_medicine }</td>
			    <td class="tg-orf0" style="width: 100px;">${vo.add_drug_cost }</td>
			    <td class="tg-orf0" style="width: 132px;">${vo.issue }</td>
			  </tr>
			</c:forEach>
			<!--페이징--------------------------------------------------->
			<tr align="center" id="bot">
					<td colspan="11">
						<!--페이지 맨앞/1칸 앞으로이동  -->
						<a href="nonpayment?code=1&word=${word}">◀◀  </a>
							<c:choose>
								<c:when test="${nowPage==1}">
									<a href="nonpayment?code=1&nowPage=${nowPage}&word=${word}">◀  </a>
									<!--페이지가 1보다 더이상 안작아지도록  -->
								</c:when>
								<c:otherwise>
									<a href="nonpayment?code=1&nowPage=${nowPage-1}&word=${word}">◀  </a>
								</c:otherwise>
							</c:choose>
							
						<!-- max블록씩 페이지 앞으로 이동 -->							
						<c:if test="${startBlock>maxBlock}" >
							<a href="nonpayment?code=1&nowPage=${startBlock-maxBlock}">[이전 블록]</a>
						</c:if> 
						
					<!--페이지 블록 -->
					<c:if test="${total>0}" >
						<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
							<c:if test="${i==nowPage}">
								<a href="nonpayment?code=1&nowPage=${i}&word=${word}" style="font-size:20px;">[${i}]</a>
							</c:if>
							<c:if test="${i!=nowPage}">
								<a href="nonpayment?code=1&nowPage=${i}&word=${word}">&nbsp;[${i}]&nbsp;</a>
							</c:if>
						</c:forEach>
					</c:if>
					
						<!-- max블록씩 페이지 뒤로 이동 -->
						<c:if test="${totalBlock>endBlock}" >
							<a href="nonpayment?code=1&nowPage=${startBlock+maxBlock}"> [다음 블록] </a>
						</c:if> 
						
					<!--뒤로1칸이동 / 페이지 맨뒤-->
						 	<c:choose>
						 		<c:when test="${nowPage==totalBlock}">
						 		<!--최종 페이지보다 더 뒤로 못가게  --> 
						 			<a href="nonpayment?code=1&nowPage=${nowPage}&word=${word}"> ▶</a>
						 		</c:when>
						 		<c:otherwise>
						 			<a href="nonpayment?code=1&nowPage=${nowPage+1}&word=${word}">  ▶</a>
						 		</c:otherwise>
						 	</c:choose>
						<a href="nonpayment?code=1&nowPage=${totalBlock}&word=${word}"> ▶▶</a>
					</td>
				</tr>
				<!--페이징--------------------------------------------------->
			</tbody>
			</table>
			
			
		</c:if>
		
		<c:if test="${code==2}">
			<style type="text/css">
				.tg  {border-collapse:collapse;border-color:#ccc;border-spacing:0;}
				.tg td{background-color:#fff;border-color:#ccc;border-style:solid;border-width:1px;color:#333;
				  font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;}
				.tg th{background-color:#f0f0f0;border-color:#ccc;border-style:solid;border-width:1px;color:#333;
				  font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
				.tg .tg-mxot{border-color:inherit;font-family:"Arial Black", Gadget, sans-serif !important;;font-size:18px;text-align:center;
				  vertical-align:middle}
				.tg .tg-ffik{background-color:#f9f9f9;border-color:inherit;font-family:"Arial Black", Gadget, sans-serif !important;;font-size:18px;
				  text-align:center;vertical-align:middle}
				
				.tg .tg-wesv{
				
					text-align:center;
					vertical-align:middle;
				
				}
			</style>
			<form action="${path}/nonpayment">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="code" value="${code}">
				<table>
					<tr>
						<td>
							<input type="text"  name="word" value="${word}" class="input" >
							<input type="submit" value="검색" class="button">
						</td>
					</tr>
				</table>
			</form>
			<table class="tg">
			<thead>
			  <tr>
			    <th class="tg-mxot" rowspan="2">분류</th>
			    <th class="tg-mxot" colspan="2">항목</th>
			    <th class="tg-mxot" colspan="4">진료비용 등(단위 : 원)</th>
			    <th class="tg-mxot" rowspan="2">특이사항</th>
			  </tr>
			  <tr>
			    <td class="tg-ffik">명칭</td>
			    <td class="tg-ffik">코드</td>
			    <td class="tg-ffik">구분</td>
			    <td class="tg-ffik">비용</td>
			    <td class="tg-ffik">최저<br>비용</td>
			    <td class="tg-ffik">최대<br>비용</td>
			  </tr>
			</thead>
			<tbody>
			<c:forEach var="vo" items="${vo}">
			  <tr>
			    <td class="tg-wesv">${vo.divv}</td>
			    <td class="tg-wesv">${vo.name }</td>
			    <td class="tg-wesv">${vo.code }</td>
			    <td class="tg-wesv">${vo.standard }</td>
			    <td class="tg-wesv">${vo.cost }</td>
			    <td class="tg-wesv">${vo.min_cost}</td>
			    <td class="tg-wesv">${vo.max_cost }</td>
			    <td class="tg-wesv">${vo.issue }</td>
			  </tr>
			</c:forEach>
				<tr align="center" id="bot">
					<td colspan="11">
						<!--페이지 맨앞/1칸 앞으로이동  -->
						<a href="nonpayment?code=2&word=${word}">◀◀  </a>
							<c:choose>
								<c:when test="${nowPage==1}">
									<a href="nonpayment?code=2&nowPage=${nowPage}&word=${word}">◀  </a>
									<!--페이지가 1보다 더이상 안작아지도록  -->
								</c:when>
								<c:otherwise>
									<a href="nonpayment?code=2&nowPage=${nowPage-1}&word=${word}">◀  </a>
								</c:otherwise>
							</c:choose>
							
						<!-- max블록씩 페이지 앞으로 이동 -->							
						<c:if test="${startBlock>maxBlock}" >
							<a href="nonpayment?code=2&nowPage=${startBlock-maxBlock}">[이전블록]</a>
						</c:if> 
						
					<!--페이지 블록 -->
					<c:if test="${total>0}" >
						<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
							<c:if test="${i==nowPage}">
								<a href="nonpayment?code=2&nowPage=${i}&word=${word}" style="font-size:20px;">[${i}]</a>
							</c:if>
							<c:if test="${i!=nowPage}">
								<a href="nonpayment?code=2&nowPage=${i}&word=${word}">&nbsp;[${i}]&nbsp;</a>
							</c:if>
						</c:forEach>
					</c:if>
					
						<!-- max블록씩 페이지 뒤로 이동 -->
						<c:if test="${totalBlock>endBlock}" >
							<a href="nonpayment?code=2&nowPage=${startBlock+maxBlock}">[다음블록]</a>
						</c:if> 
						
					<!--뒤로1칸이동 / 페이지 맨뒤-->
						 	<c:choose>
						 		<c:when test="${nowPage==totalBlock}">
						 		<!--최종 페이지보다 더 뒤로 못가게  --> 
						 			<a href="nonpayment?code=2&nowPage=${nowPage}&word=${word}"> ▶</a>
						 		</c:when>
						 		<c:otherwise>
						 			<a href="nonpayment?code=2&nowPage=${nowPage+1}&word=${word}">  ▶</a>
						 		</c:otherwise>
						 	</c:choose>
						<a href="nonpayment?code=2&nowPage=${totalBlock}&word=${word}"> ▶▶</a>
					</td>
				</tr>
			</tbody>
			</table>
		</c:if>
		
		<c:if test="${code==3}">
			<style type="text/css">
				.tg  {border-collapse:collapse;border-color:#ccc;border-spacing:0;}
				.tg td{background-color:#fff;border-color:#ccc;border-style:solid;border-width:1px;color:#333;
				  font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;}
				.tg th{background-color:#f0f0f0;border-color:#ccc;border-style:solid;border-width:1px;color:#333;
				  font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
				.tg .tg-mxot{border-color:inherit;font-family:"Arial Black", Gadget, sans-serif !important;;font-size:18px;text-align:center;
				  vertical-align:middle}
				.tg .tg-ffik{background-color:#f9f9f9;border-color:inherit;font-family:"Arial Black", Gadget, sans-serif !important;;font-size:18px;
				  text-align:center;vertical-align:middle}

				.tg .tg-wesv{
				
					text-align:center;
					vertical-align:middle;
				
				}
				
				
				
			</style>
			
			<form action="${path}/nonpayment">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="code" value="${code}">
				<table>
					<tr>
						<td>
							<input type="text"  name="word" value="${word}" class="input" >
							<input type="submit" value="검색" class="button">
						</td>
					</tr>
				</table>
			</form>
			<table class="tg">
			<thead>
			  <tr>
			    <th class="tg-mxot" colspan="2">항목</th>
			    <th class="tg-mxot">진료비용 등(단위 : 원)</th>
			    <th class="tg-mxot" rowspan="2">특이사항</th>
			  </tr>
			  <tr>
			    <td class="tg-ffik">명칭</td>
			    <td class="tg-ffik">코드</td>
			    <td class="tg-ffik">구분</td>
			  </tr>
			</thead>
			<tbody>
			<c:forEach var="vo" items="${vo}">
			  <tr>
			    <td class="tg-wesv">${vo.name }</td>
			    <td class="tg-wesv">${vo.code }</td>
			    <td class="tg-wesv">${vo.cost }</td>
			    <td class="tg-wesv">${vo.issue }</td>
			  </tr>
			 </c:forEach>
			  <tr align="center" id="bot">
					<td colspan="11">
						<!--페이지 맨앞/1칸 앞으로이동  -->
						<a href="nonpayment?code=3&word=${word}">◀◀  </a>
							<c:choose>
								<c:when test="${nowPage==1}">
									<a href="nonpayment?code=3&nowPage=${nowPage}&word=${word}">◀  </a>
									<!--페이지가 1보다 더이상 안작아지도록  -->
								</c:when>
								<c:otherwise>
									<a href="nonpayment?code=3&nowPage=${nowPage-1}&word=${word}">◀  </a>
								</c:otherwise>
							</c:choose>
							
						<!-- max블록씩 페이지 앞으로 이동 -->							
						<c:if test="${startBlock>maxBlock}" >
							<a href="nonpayment?code=3&nowPage=${startBlock-maxBlock}">[이전블록]</a>
						</c:if> 
						
					<!--페이지 블록 -->
					<c:if test="${total>0}" >
						<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
							<c:if test="${i==nowPage}">
								<a href="nonpayment?code=3&nowPage=${i}&word=${word}" style="font-size:20px;">[${i}]</a>
							</c:if>
							<c:if test="${i!=nowPage}">
								<a href="nonpayment?code=3&nowPage=${i}&word=${word}">&nbsp;[${i}]&nbsp;</a>
							</c:if>
						</c:forEach>
					</c:if>
					
						<!-- max블록씩 페이지 뒤로 이동 -->
						<c:if test="${totalBlock>endBlock}" >
							<a href="nonpayment?code=3&nowPage=${startBlock+maxBlock}">[다음블록]</a>
						</c:if> 
						
					<!--뒤로1칸이동 / 페이지 맨뒤-->
						 	<c:choose>
						 		<c:when test="${nowPage==totalBlock}">
						 		<!--최종 페이지보다 더 뒤로 못가게  --> 
						 			<a href="nonpayment?code=3&nowPage=${nowPage}&word=${word}"> ▶</a>
						 		</c:when>
						 		<c:otherwise>
						 			<a href="nonpayment?code=3&nowPage=${nowPage+1}&word=${word}">  ▶</a>
						 		</c:otherwise>
						 	</c:choose>
						<a href="nonpayment?code=3&nowPage=${totalBlock}&word=${word}"> ▶▶</a>
					</td>
				</tr>
			</tbody>
			</table>
			<!--페이징--------------------------------------------------->
			<!--페이징--------------------------------------------------->
		</c:if>
		<c:if test="${code==4}">
			<style type="text/css">
				.tg  {border-collapse:collapse;border-color:#ccc;border-spacing:0;}
				.tg td{background-color:#fff;border-color:#ccc;border-style:solid;border-width:1px;color:#333;
				  font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;}
				.tg th{background-color:#f0f0f0;border-color:#ccc;border-style:solid;border-width:1px;color:#333;
				  font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
				.tg .tg-mxot{border-color:inherit;font-family:"Arial Black", Gadget, sans-serif !important;;font-size:18px;text-align:center;
				  vertical-align:middle}
				.tg .tg-ffik{background-color:#f9f9f9;border-color:inherit;font-family:"Arial Black", Gadget, sans-serif !important;;font-size:18px;
				  text-align:center;vertical-align:middle}
				
				.tg .tg-wesv{
					text-align:center;
					vertical-align:middle;
				}
			</style>
			<form action="${path}/nonpayment">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="code" value="${code}">
				<table>
					<tr>
						<td>
							<input type="text"  name="word" value="${word}" class="input" >
							<input type="submit" value="검색" class="button">
						</td>
					</tr>
				</table>
			</form>
			<table class="tg">
			<thead>
			  <tr>
			    <th class="tg-mxot" colspan="2">항목</th>
			    <th class="tg-mxot" colspan="4">진료비용 등(단위 : 원)</th>
			    <th class="tg-mxot" rowspan="2">특이사항</th>
			  </tr>
			  <tr>
			    <td class="tg-ffik">명칭</td>
			    <td class="tg-ffik">코드</td>
			    <td class="tg-ffik">구분</td>
			    <td class="tg-ffik">비용</td>
			    <td class="tg-ffik">최저<br>비용</td>
			    <td class="tg-ffik">최대<br>비용</td>
			  </tr>
			</thead>
			<tbody>
			<c:forEach var="vo" items="${vo}">
			  <tr>
			    <td class="tg-wesv">${vo.name }</td>
			    <td class="tg-wesv">${vo.code }</td>
			    <td class="tg-wesv">${vo.section }</td>
			    <td class="tg-wesv">${vo.cost }</td>
			    <td class="tg-wesv">${vo.min_cost }</td>
			    <td class="tg-wesv">${vo.max_cost }</td>
			    <td class="tg-wesv">${vo.issue }</td>
			  </tr>
			 </c:forEach>
			 	<tr align="center" id="bot">
					<td colspan="11">
						<!--페이지 맨앞/1칸 앞으로이동  -->
						<a href="nonpayment?code=4&word=${word}">◀◀  </a>
							<c:choose>
								<c:when test="${nowPage==1}">
									<a href="nonpayment?code=4&nowPage=${nowPage}&word=${word}">◀  </a>
									<!--페이지가 1보다 더이상 안작아지도록  -->
								</c:when>
								<c:otherwise>
									<a href="nonpayment?code=4&nowPage=${nowPage-1}&word=${word}">◀  </a>
								</c:otherwise>
							</c:choose>
							
						<!-- max블록씩 페이지 앞으로 이동 -->							
						<c:if test="${startBlock>maxBlock}" >
							<a href="nonpayment?code=4&nowPage=${startBlock-maxBlock}"> [이전블록]</a>
						</c:if> 
						
					<!--페이지 블록 -->
					<c:if test="${total>0}" >
						<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
							<c:if test="${i==nowPage}">
								<a href="nonpayment?code=4&nowPage=${i}&word=${word}" style="font-size:20px;">[${i}]</a>
							</c:if>
							<c:if test="${i!=nowPage}">
								<a href="nonpayment?code=4&nowPage=${i}&word=${word}">&nbsp;[${i}]&nbsp;</a>
							</c:if>
						</c:forEach>
					</c:if>
					
						<!-- max블록씩 페이지 뒤로 이동 -->
						<c:if test="${totalBlock>endBlock}" >
							<a href="nonpayment?code=4&nowPage=${startBlock+maxBlock}">[다음블록]</a>
						</c:if> 
						
					<!--뒤로1칸이동 / 페이지 맨뒤-->
						 	<c:choose>
						 		<c:when test="${nowPage==totalBlock}">
						 		<!--최종 페이지보다 더 뒤로 못가게  --> 
						 			<a href="nonpayment?code=4&nowPage=${nowPage}&word=${word}"> ▶</a>
						 		</c:when>
						 		<c:otherwise>
						 			<a href="nonpayment?code=4&nowPage=${nowPage+1}&word=${word}">  ▶</a>
						 		</c:otherwise>
						 	</c:choose>
						<a href="nonpayment?code=4&nowPage=${totalBlock}&word=${word}"> ▶▶</a>
					</td>
				</tr>
			</tbody>
			
			</table>
			<!------------------ 페이징-------------->
			<!---------------------------------------------------->
		</c:if>
		
      	</div>
      </div>
      <%@include file="../common/chatbot.jsp"%>
      <%@include file="../common/footer.jsp"%>
      <!-- end copyrights -->
      <a href="#home" data-scroll class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>
      <!-- all js files -->
      <script src="${path_resources_lifecare}js/all.js"></script>
      <!-- all plugins -->
      <script src="${path_resources_lifecare}js/custom.js"></script>
      <!-- map -->
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNUPWkb4Cjd7Wxo-T4uoUldFjoiUA1fJc&callback=myMap"></script>
   </body>

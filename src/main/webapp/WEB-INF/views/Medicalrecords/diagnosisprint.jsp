<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<jsp:useBean id="now" class="java.util.Date"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 추가 -->
<script src="${path_resources}setting/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		window.print();
	});
</script>
</head>
<body onresize="parent.resizeTo(850,750)" onload="parent.resizeTo(850,750)">

<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.tg td {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg th {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg .tg-c3ow {
	border-color: inherit;
	text-align: center;
	vertical-align: top
}

.tg .tg-dvpl {
	border-color: inherit;
	text-align: right;
	vertical-align: top
}
	
.tg .tg-c4ow {
	border-color: inherit;
	text-align: center;
	vertical-align: middel
}
</style>
	<form>
		<table class="tg" style="align:center; margin:auto;">
				<tr>
					<td class="tg-c3ow" colspan="8" style="text-align:center; height :70px; font-size:30px; background-color:#E8E8E8;">
					진단서
				</td>
				</tr>
				<tr>
					<th class="tg-c3ow" width="100px" style = "background-color:#E8E8E8">성명</th>
					<td class="tg-c3ow" width="100px">${dto.customer_name}</td>
					<th class="tg-c3ow" width="100px" style = "background-color:#E8E8E8">성별</th>
					<td class="tg-c3ow" width="100px">${dto.customer_gender}</td>
					<th class="tg-c3ow" width="100px" style = "background-color:#E8E8E8">생년월일</th>
					<td class="tg-c3ow" width="100px">${dto.customer_year}년</td>
					<th class="tg-c3ow" width="100px" style = "background-color:#E8E8E8">연령</th>
					<td class="tg-c3ow" width="100px">${dto.customer_age}세</td>
				</tr>
				<tr>
					<th class="tg-c3ow" style = "background-color:#E8E8E8">이메일 주소</th>
					<td class="tg-c3ow" colspan="4">${dto.customer_email}</td>
					<th class="tg-c3ow" style = "background-color:#E8E8E8">전화번호 </th>
					<td class="tg-c3ow" colspan="2" width="100px">
					<c:set value="${dto.customer_phone}" var="phoneNum"/>
					<c:out value="${fn:substring(phoneNum, 0, 3)}-${fn:substring(phoneNum, 3, 7)}-${fn:substring(phoneNum, 7, 11)}"/>	
					</td>
				</tr>
				<tr>
					<th class="tg-c3ow" style = "background-color:#E8E8E8">진료번호</th>
					<td class="tg-c3ow" colspan="3" style = "text-align:left">${dto.diagnosis_num}</td>
					<th class="tg-c3ow" style = "background-color:#E8E8E8">진단일</th>
					<td class="tg-c3ow" colspan="3" style = "text-align:left"><fmt:formatDate type = "both" pattern = "yyyy-MM-dd" value = "${dto.diagnosis_time}"/></td>
				</tr>
				<tr>
					<th class="tg-c3ow" style = "background-color:#E8E8E8">질병코드</th>
					<td class="tg-c3ow" colspan="2" style="text-align:left">${dto.disease_code}</td>
					<th class="tg-c3ow" style = "background-color:#E8E8E8">질병명</th>
					<td class="tg-c3ow" colspan="5" style="text-align:left">${dto.disease_name}</td>
				</tr>
				<tr>
					<th class="tg-c3ow" style = "background-color:#E8E8E8">향후 치료 소견</th>
					<td class="tg-c3ow" colspan = "7"></td>
				</tr>
				<tr>
					<th class="tg-c3ow" style = "background-color:#E8E8E8">비고</th>
					<td class="tg-c3ow" colspan = "3"></td>
					<th class="tg-c3ow" style = "background-color:#E8E8E8">용도</th>
					<td class="tg-c3ow" colspan = "3" style = "text-align:left">보험사 제출</td>
				</tr>
				<tr>
					<td class="tg-c3ow" colspan="8" style="text-align:center; height :40px; font-size:20px; background-color:#E8E8E8;">
					발행 기관
				</td>
				<tr>
					<th class="tg-c3ow" style = "background-color:#E8E8E8">발행일</th>
					<td class="tg-c3ow" colspan="7" style ="text-align:left"><fmt:formatDate type = "both" pattern="yyyy-MM-dd" value="${now}" /></td>
				</tr>
				<tr>
					<th class="tg-c3ow" style = "background-color:#E8E8E8">의료기관</th>
					<td class="tg-c3ow" colspan="7" style ="text-align:left">LifeCare</td>
				</tr>
				<tr>
					<th class="tg-c3ow" style = "background-color:#E8E8E8">주소 및 명칭</th>
					<td class="tg-c3ow" colspan="7" style ="text-align:left">서울특별시 금천구 가산동 426-5 월드메르디앙2차</td>
				</tr>
				<tr>
					<th class="tg-c3ow" style = "background-color:#E8E8E8">전화 및 Fax</th>
					<td class="tg-c3ow" colspan="7" style ="text-align:left">010-7220-7446</td>
				</tr> 
				<tr>
					<th class="tg-c3ow" style = "background-color:#E8E8E8">요양기관번호</th>
					<td class="tg-c3ow" colspan="7" style ="text-align:left">120710</td>
				</tr>
				<tr>
					<th class="tg-c4ow" colspan="7" style ="text-align:right">의사성명:${dto.doctor_name}</th>
					<td class="tg-dvpl"><img src="${path_resources}images/lifecaresign.png" width="80px" height="80px" style = "align:center; z-index:1;"/></td>
				</tr>
		</table>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery 추가 -->
<script src="${path_resources}setting/jquery-3.5.1.js"></script>
<script type="text/javascript">
</script>
</head>
<body>

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
	vertical-align: middle;
}

.tg .tg-dvpl {
	border-color: inherit;
	text-align: right;
	vertical-align: top
}
</style>
<form>
	<table class="tg" style="align:center; margin:auto;width: 800px; margin-bottom:20px;">
			<tr>
				<td class="tg-c3ow" colspan="9" style="text-align:center; height :70px; font-size:30px; background-color:#E8E8E8;">
					진료 기록부  
				</td>
			</tr>
			<tr>
				<th class="tg-c3ow" rowspan="2" width="50px" style = "background-color:#E8E8E8"> 환자 </th>
				<th class="tg-c3ow" width="100px" style = "background-color:#E8E8E8">성명</th>
				<td class="tg-c3ow" width="100px">${dto.customer_name}</td>
				<th class="tg-c3ow" width="100px" style = "background-color:#E8E8E8">성별</th>
				<td class="tg-c3ow" width="100px">${dto.customer_gender}</td>
				<th class="tg-c3ow" width="100px" style = "background-color:#E8E8E8">출생년도</th>
				<td class="tg-c3ow" width="100px">${dto.customer_year}년</td>
				<th class="tg-c3ow" width="100px" style = "background-color:#E8E8E8">연령</th>
				<td class="tg-c3ow" width="100px">${dto.customer_age}세</td>
			</tr>
			<tr>
				<th class="tg-c3ow" style = "background-color:#E8E8E8">이메일 주소</th>
				<td class="tg-c3ow" colspan="3">${dto.customer_email}</td>
				<th class="tg-c3ow" style = "background-color:#E8E8E8">전화번호 </th>
				<td class="tg-c3ow" width="100px">
				<c:set value="${dto.customer_phone}" var="phoneNum"/>
				<c:out value="${fn:substring(phoneNum, 0, 3)}-${fn:substring(phoneNum, 3, 7)}-${fn:substring(phoneNum, 7, 11)}"/>
				</td>
				<th class="tg-c3ow" style = "background-color:#E8E8E8">진료번호</th>
				<td class="tg-c3ow" width="100px">${dto.diagnosis_num}</td>
			</tr>
			<tr>
				<th class="tg-c3ow" colspan="2" style = "background-color:#E8E8E8">V/S</th>
				<td class="tg-c3ow" colspan="9" style = "text-align:left">BP = ${dto.diagnosis_bp}&nbsp;&nbsp; / &nbsp;&nbsp;RR = ${dto.diagnosis_rr}&nbsp;&nbsp; / &nbsp;&nbsp;PR = ${dto.diagnosis_pr}&nbsp;&nbsp; / &nbsp;&nbsp;PT = ${dto.diagnosis_pt}</td>
			</tr>
			<tr>	
				<th class="tg-c3ow" colspan="2" style = "background-color:#E8E8E8">PHx</th>
				<td class="tg-c3ow" colspan="9" style = "text-align:left">${dto.diagnosis_phx}</td>
			</tr>
			<tr>	
				<th class="tg-c3ow" colspan="2" style = "background-color:#E8E8E8">FHx</th>
				<td class="tg-c3ow" colspan="9" style = "text-align:left">${dto.diagnosis_fhx}</td>	
			</tr>
			<tr>	
				<th class="tg-c3ow" colspan="2" style = "background-color:#E8E8E8">PI</th>
				<td class="tg-c3ow" colspan="9" style = "text-align:left">${dto.diagnosis_pi}</td>	
			</tr>
			<tr>	
				<th class="tg-c3ow" colspan="2" style = "background-color:#E8E8E8">ROS</th>
				<td class="tg-c3ow" colspan="9" style = "text-align:left">${dto.diagnosis_ros}</td>	
			</tr>
			<tr>	
				<th class="tg-c3ow" colspan="2" style = "background-color:#E8E8E8">PEx</th>
				<td class="tg-c3ow" colspan="9" style = "text-align:left">${dto.diagnosis_pex}</td>	
			</tr>
			<tr>
				<th class="tg-c3ow" colspan="2" style = "background-color:#E8E8E8">진료 날짜 </th>
				<td class="tg-c3ow" width="100px"><fmt:formatDate type = "both" pattern = "yyyy-MM-dd" value = "${dto.diagnosis_time}"/></td>
				<th class="tg-c3ow" colspan="5" style ="text-align:right">의사성명 : ${dto.doctor_name}</th>
				<td class="tg-dvpl"><img src="${path_resources}images/lifecaresign.png" width="80px" height="80px" style = "align:center; z-index:1;"/></td>
			</tr>
		</table>
</form>
</body>
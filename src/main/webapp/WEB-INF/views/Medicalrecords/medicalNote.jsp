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

.li_table {border:1 solid red;border-top:none;border-right:none}
.li_table ul {clear: left;margin: 0;padding: 0;list-style-type: none;border-top:1 solid red;} 
/* list-style-type 블릿표시 padding: 0; 들여쓰기*/
.li_table .subject {font-weight: bold;text-align: center;}
.li_table ul li {text-align: center;float: left;margin: 0;padding: 2px, 1px;border-right:1 solid red;width: 150px;}
</style>
<form>
	<table class="tg" style="align:center; margin:auto;width: 800px; height:800px; margin-bottom:20px;">
			<tr>
				<td class="tg-c3ow" colspan="9" style="text-align:center; height :70px; font-size:30px; background-color:#E8E8E8;">
					진료 기록부  
				</td>
			</tr>
			<tr style="border-top: solid; border-left: solid;">
				<th class="tg-c3ow" rowspan="2" width="50px" style = "background-color:#E8E8E8; border-bottom: solid;"> 환자 </th>
				<th class="tg-c3ow" width="100px" style = "background-color:#E8E8E8">성명</th>
				<td class="tg-c3ow" width="100px">${dto.customer_name}</td>
				<th class="tg-c3ow" width="100px" style = "background-color:#E8E8E8">성별</th>
				<td class="tg-c3ow" width="100px">${dto.customer_gender}</td>
				<th class="tg-c3ow" width="100px" style = "background-color:#E8E8E8">출생년도</th>
				<td class="tg-c3ow" width="120px">${dto.customer_year}년</td>
				<th class="tg-c3ow" width="90px" style = "background-color:#E8E8E8">연령</th>
				<td class="tg-c3ow" width="90px" style="border-right:solid;">${dto.customer_age}세</td>
			</tr>
			<tr style="border-bottom: solid; border-right: solid;">
				<th class="tg-c3ow" style = "background-color:#E8E8E8">이메일 주소</th>
				<td class="tg-c3ow" colspan="3">${dto.customer_email}</td>
				<th class="tg-c3ow" style = "background-color:#E8E8E8">전화번호 </th>
				<td class="tg-c3ow" width="100px">
				<c:set value="${dto.customer_phone}" var="phoneNum"/>
				<c:out value="${fn:substring(phoneNum, 0, 3)}-${fn:substring(phoneNum, 3, 7)}-${fn:substring(phoneNum, 7, 11)}"/>
				</td>
				<th class="tg-c3ow" style = "background-color:#E8E8E8">진료번호</th>
				<td class="tg-c3ow" width="100px" style="border-right:solid;">${dto.diagnosis_num}</td>
			</tr>
			<tr>
				<th class="tg-c3ow" colspan="2" style = "background-color:#E8E8E8">활력증후 V/S</th>
				<td class="li_table" colspan="9" style = "text-align:left">
				<ul class="col">
				<li>혈압 BP</li>
				<li>${dto.diagnosis_bp}</li>
				<li>호흡 RR</li>
				<li>${dto.diagnosis_rr}</li>
				<li>심박수 PR</li>
				<li>${dto.diagnosis_pr}</li>
				<li>체온 BT</li>
				<li>${dto.diagnosis_pt}</li>
				</ul>
				</td>
			</tr>
			<tr>	
				<th class="tg-c3ow" colspan="2" style = "background-color:#E8E8E8">과거력 PHx</th>
				<td class="tg-c3ow" colspan="9" style = "text-align:left">${dto.diagnosis_phx}</td>
			</tr>
			<tr>	
				<th class="tg-c3ow" colspan="2" style = "background-color:#E8E8E8">가족력 FHx</th>
				<td class="tg-c3ow" colspan="9" style = "text-align:left">${dto.diagnosis_fhx}</td>	
			</tr>
			<tr style="height:150px;">	
				<th class="tg-c3ow" colspan="2" style = "background-color:#E8E8E8">현병력 PI</th>
				<td class="tg-c3ow" colspan="9" style = "text-align:left">${dto.diagnosis_pi}</td>	
			</tr>
			<tr>	
				<th class="tg-c3ow" colspan="2" style = "background-color:#E8E8E8">증세 ROS</th>
				<td class="tg-c3ow" colspan="9" style = "text-align:left">${dto.diagnosis_ros}</td>	
			</tr>
			<tr style="height:100px;">	
				<th class="tg-c3ow" colspan="2" style = "background-color:#E8E8E8">검사 PEx</th>
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
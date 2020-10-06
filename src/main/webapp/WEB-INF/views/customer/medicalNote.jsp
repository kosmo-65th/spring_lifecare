<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 추가 -->
<script src="${path_resources}setting/jquery-3.5.1.js"></script>
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
	vertical-align: top
}

.tg .tg-dvpl {
	border-color: inherit;
	text-align: right;
	vertical-align: top
}
</style>

	<form>
		<table class="tg" style="align:center; margin:auto;width: 800px;">
				<tr>
					<td class="tg-c3ow" colspan="9" style="text-align:center; height :70px" >
						진료 기록부  
					</td>
				</tr>
				<tr>
					<th class="tg-c3ow" rowspan="2" width="50px"> 환자 </th>
							
					<th class="tg-c3ow" width="100px">성명</th>
					<td class="tg-c3ow" width="100px"></td>
					<th class="tg-c3ow" width="100px">성별</th>
					<td class="tg-c3ow" width="100px"></td>
					<th class="tg-c3ow" width="100px">주민번호</th>
					<td class="tg-c3ow" width="100px"></td>
					<th class="tg-c3ow" width="100px">연령</th>
					<td class="tg-c3ow" width="100px"></td>
				</tr>
				<tr>
					<th class="tg-c3ow">이메일 주소</th>
					<td class="tg-c3ow" colspan="3"></td>
					<th class="tg-c3ow">전화번호 </th>
					<td class="tg-c3ow" width="100px"></td>
					<th class="tg-c3ow">직업</th>
					<td class="tg-c3ow" width="100px"></td>
				</tr>
				<tr>
					<td class="tg-c3ow" colspan="9">
						<textarea class="tg-c3ow" style="width:800px; height:450px; text-align:left" >
						
						
V/S : 
						
						
PHx : 
						
						
FHx : 
						
						
PI : 
						
ROS : 
						
						
PEx : 
						
						
problem : 
						
						
#1. DI
						
						
						</textarea>
					</td>
				</tr>
				<tr>
					<th class="tg-c3ow" colspan="2">진료 날짜 </th>
					<td class="tg-c3ow" width="100px"></td>
					<th class="tg-c3ow" colspan="5" style ="text-align:right"></th>
					<td class="tg-dvpl">(인)</td>
				</tr>
		</table>
	</form>
	
</body>

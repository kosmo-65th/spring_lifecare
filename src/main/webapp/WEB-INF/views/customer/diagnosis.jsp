<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
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
		<table class="tg" style="align:center; margin:auto;">
				<tr>
					<td class="tg-c3ow" colspan="8" style="text-align:center; height :100px" >
						진단서 
					</td>
				</tr>
				<tr>
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
					<th class="tg-c3ow">환자 주소</th>
					<td class="tg-c3ow" colspan="4"></td>
					<th class="tg-c3ow">전화번호 </th>
					<td class="tg-c3ow" colspan="2" width="100px"></td>
				</tr>
				<tr>
					<th class="tg-c3ow">병명 
						<br>&nbsp;＊임상적 추정 
						<br>＊최종진단<br>
					</th>
					<td class="tg-c3ow" colspan="7"></td>
				</tr>
				<tr>
					<th class="tg-c3ow">발병일</th>
					<td class="tg-c3ow" colspan="3"></td>
					<th class="tg-c3ow">진단일</th>
					<td class="tg-c3ow" colspan="3"></td>
				</tr>
				<tr>
					<th class="tg-c3ow">향후 치료 소견</th>
					<td class="tg-c3ow" colspan = "7"></td>
				</tr>
				<tr>
					<th class="tg-c3ow">비고</th>
					<td class="tg-c3ow" colspan = "3"></td>
					<th class="tg-c3ow">용도</th>
					<td class="tg-c3ow" colspan = "3"></td>
				</tr>
				<tr>
					<td class="tg-c3ow" colspan="8" style ="text-align:left">위와 같이 진단함 .<br></td>
				</tr>
				<tr>
					<th class="tg-c3ow">발행일 :</th>
					<td class="tg-c3ow" colspan="7"></td>
				</tr>
				<tr>
					<th class="tg-c3ow">의료기관 :</th>
					<td class="tg-c3ow" colspan="7"></td>
				</tr>
				<tr>
					<th class="tg-c3ow">주소 및 명칭 :</th>
					<td class="tg-c3ow" colspan="7"></td>
				</tr>
				<tr>
					<th class="tg-c3ow">전화 및 Fax :</th>
					<td class="tg-c3ow" colspan="7"></td>
				</tr> 
				<tr>
					<th class="tg-c3ow">면허번호 :</th>
					<td class="tg-c3ow" colspan="7"></td>
				</tr>
				<tr>
					<th class="tg-c3ow" colspan="7" style ="text-align:right">의사성명 :</th>
					<td class="tg-dvpl">(인)</td>
				</tr>
		</table>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
/* UI Object */
.tbl_type {margin-left: 120px; margin-top: 40px;}
.tbl_type,.tbl_type th,.tbl_type td{border: 1px solid #000;}
.tbl_type{width:750px;font-family:'돋움',dotum;font-size:15px;text-align:center;border-collapse:collapse}
.tbl_type caption{display:none}
.tbl_type tfoot{background-color:#f5f7f9;font-weight:bold}
.tbl_type th{padding:15px 0.5 20px;background-color:#4c4c4c1a;color:#000;font-family:'돋움',dotum;font-size:12px;font-weight:bold}
.tbl_type td{padding:6px 0 4px;color:#4c4c4c}
.tbl_type td.ranking{font-weight:bold}
/* //UI Object */
</style>
<title>X-RAY검사결과</title>
</head><br><br>
<img  style="margin-left:350; height:50px;" src="/lifecare/resources/img/logo.png">
<body onresize="parent.resizeTo(1000,1000)" onload="parent.resizeTo(1000,1000)">

<!--ui object -->
<table class="tbl_type" border="1">
<tr>
<th colspan="4" style="font-size:25px; font-family:'돋움',dotum; font-weight: bold;">X-RAY검사결과</th>
</tr>
<tr>
<th style="width:30%;">이름</th>
<td style="width:30%;">${vo.getCustomer_name()}</td>
<th style="width:20%;">성별</th>
<td style="width:20%;">${vo.getCustomer_gender()}</td>
</tr>
<tr>
<th style="width:70%;" colspan="2">이미지</th>
<th style="width:30%;" colspan="2">결과</th>
</tr>
<tbody>										    
<tr>												
<td rowspan="3" colspan="2"><img style="height:300px;" id="img" src="${path_resources}img/${vo.getXray_img()}"></td>
<td>정상확률</td>
    <td>${vo.getNormal_percentage()}</td>
</tr>

<tr>
<td>폐렴확률</td>
<td>${vo.getPneumonia_percentage()}</td>
</tr>
<tr>
<td>코로나확률</td>
<td>${vo.getCorona_percentage()}</td>
</tr>
</tbody>	
<tr>
<th colspan="4"  style="font-size:15px;">의사소견</th>
</tr>
<tr style="height:150px;">
<td colspan="4">${vo.getXray_result()}</td>
</tr>
</table>
<!--//ui object -->
</body>
</html>
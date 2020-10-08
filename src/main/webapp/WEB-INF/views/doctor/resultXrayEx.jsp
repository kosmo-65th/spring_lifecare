<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
/* UI Object */
.tbl_type,.tbl_type th,.tbl_type td{border:0}
.tbl_type{width:500px;height:350px;border-bottom:2px solid #dcdcdc;font-family:'돋움',dotum;font-size:12px;text-align:center;border-collapse:collapse}
.tbl_type caption{display:none}
.tbl_type tfoot{background-color:#f5f7f9;font-weight:bold}
.tbl_type th{padding:7px 0 4px;border-top:2px solid #dcdcdc;border-right:1px solid #dcdcdc;border-left:1px solid #dcdcdc;background-color:#f5f7f9;color:#666;font-family:'돋움',dotum;font-size:12px;font-weight:bold}
.tbl_type td{padding:6px 0 4px;border:1px solid #e5e5e5;color:#4c4c4c}
.tbl_type td.ranking{font-weight:bold}
/* //UI Object */
</style>
<title>X-RAY검사결과</title>
</head>
<body onresize="parent.resizeTo(530,480)" onload="parent.resizeTo(530,480)">
<!--ui object -->
<table class="tbl_type" border="1">
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
<tfoot>
<tr>
<th>의사소견</th>
<td colspan="3">${vo.getXray_result()}</td>
</tr>
</tfoot>
</table>
<!--//ui object -->
</body>
</html>
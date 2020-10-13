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
.tbl_type{width:750px;font-family:'돋움',dotum;font-size:12px;text-align:center;border-collapse:collapse}
.tbl_type caption{display:none}
.tbl_type tfoot{background-color:#f5f7f9;font-weight:bold}
.tbl_type th{padding:15px 0.5 20px;background-color:#4c4c4c1a;color:#000;font-family:'돋움',dotum;font-size:17px;font-weight:bold}
.tbl_type td{padding:6px 0 4px;color:#4c4c4c; font-size:17px;}
.tbl_type td.ranking{font-weight:bold}
/* //UI Object */
</style>
<title>암검사결과</title>
</head><br><br>
<img  style="margin-left:350; height:50px;" src="/lifecare/resources/img/logo.png">
<body onresize="parent.resizeTo(1000,1000)" onload="parent.resizeTo(1000,1000)">
<!--ui object -->
<table class="tbl_type" border="1">
<tr>
<th colspan="4" style="font-size:25px; font-family:'돋움',dotum; font-weight: bold;">암 검사결과</th>
</tr>
<tr>
<th>이름</th>
<td>${vo.getCustomer_name()}</td>
<th>성별</th>
<td>${vo.getCustomer_gender()}</td>
</tr>
<tr>
<th>radius</th>
<td>${vo.getRadius()}</td>
<th>texture</th>
<td>${vo.getTexture()}</td>
</tr>
<tr>
<th>perimeter</th>
<td>${vo.getPerimeter()}</td>
<th>area</th>
<td>${vo.getArea()}</td>
</tr>
<tr>
<th>smoothness</th>
<td>${vo.getSmoothness()}</td>
<th>compactness</th>
<td>${vo.getCompactness()}</td>
</tr>
<tr>
<th>concavity</th>
<td>${vo.getConcavity()}</td>
<th>symmetry</th>
<td>${vo.getSymmetry()}</td>
</tr>
<tr>
<th colspan="2">fractal_dimension</th>
<td colspan="2">${vo.getFractal_dimension()}</td>
</tr>
<tr>
<th colspan="2">AI검사결과확률</th>
<td colspan="2">${vo.getPercentage()}</td>
</tr>
<tr>
<th colspan="4" style="font-size:17px;">의사소견</th>
</tr>
<tr style="height:150px;">
<td colspan="4" style="font-weight:bolder;">${vo.getCancer_result()}</td>
</tr>
</table>
<!--//ui object -->
</body>
</html>
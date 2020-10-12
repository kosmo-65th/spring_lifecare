<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
/* UI Object */
.tbl_type,.tbl_type th,.tbl_type td{border: 1px solid #000;}
.tbl_type{width:500px;font-family:'돋움',dotum;font-size:12px;text-align:center;border-collapse:collapse}
.tbl_type caption{display:none}
.tbl_type tfoot{background-color:#f5f7f9;font-weight:bold}
.tbl_type th{padding:7px 0 4px;background-color:#4c4c4c1a;color:#000;font-family:'돋움',dotum;font-size:12px;font-weight:bold}
.tbl_type td{padding:6px 0 4px;color:#4c4c4c}
.tbl_type td.ranking{font-weight:bold}
/* //UI Object */
</style>
<title>암검사결과</title>
</head>
<body onresize="parent.resizeTo(530,440)" onload="parent.resizeTo(530,440)">
<!--ui object -->
<table class="tbl_type" border="1">
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
<th colspan="4">의사소견</th>
</tr>
<tr style="height:60px;">
<td colspan="4" style="font-weight:bolder;">${vo.getCancer_result()}</td>
</tr>
</table>
<!--//ui object -->
</body>
</html>
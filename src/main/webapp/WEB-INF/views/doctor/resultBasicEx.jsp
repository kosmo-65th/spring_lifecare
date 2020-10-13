<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
/* UI Object */
.tbl_type {margin-left: 120px; margin-top: 40px;}
.tbl_type,.tbl_type th,.tbl_type td{border: 1px solid #000; text-align: center;}
.tbl_type{width:750px;font-family:'돋움',dotum;font-size:12px;text-align:center;border-collapse:collapse}
.tbl_type caption{display:none}
.tbl_type tfoot{background-color:#f5f7f9;font-weight:bold}
.tbl_type th{padding:15px 0.5 20px;background-color:#4c4c4c1a;color:#000;font-family:'돋움',dotum;font-size:15px;font-weight: 700;}
.tbl_type td{padding:6px 0 4px;color:#4c4c4c; font-size:15px;}
.tbl_type td.ranking{font-weight:bold}
/* //UI Object */
</style>
<title>기초검사결과</title>
</head><br><br>
<img  style="margin-left:350; height:50px;" src="/lifecare/resources/img/logo.png">
<body onresize="parent.resizeTo(1000,1000)" onload="parent.resizeTo(1000,1000)">
<!--ui object -->
<table class="tbl_type" border="1">
<tr>
<th colspan="4" style="font-size:25px; font-family:'돋움',dotum; font-weight: bold;">기초검사결과</th>
</tr>
<tr>
<th>이름</th>
<td>${vo.getCustomer_name()}</td>
<th>성별</th>
<td>${vo.getCustomer_gender()}</td>
</tr>
<tr>
<th>키</th>
<td>${vo.getHeight()}</td>
<th>몸무게</th>
<td>${vo.getWeight()}</td>
</tr>
<tr>
<th>TC</th>
<td>${vo.getTc()}mg/dl</td>
<th>TG</th>
<td>${vo.getTg()}mg/dl</td>
</tr>
<tr>
<th>LDL</th>
<td>${vo.getLdl()}mg/dl</td>
<th>HDL</th>
<td>${vo.getHdl()}mg/dl</td>
</tr>
<tr>
<th>수축기혈압</th>
<td>${vo.getBlood1()}mm/Hg</td>
<th>이완기혈압</th>
<td>${vo.getBlood2()}mm/Hg</td>
</tr>
<tr>
<th colspan="2">공복혈당</th>
<td colspan="2">${vo.getBloodSugar()}mm/Hg</td>
</tr>
<tr>
<th>백혈구</th>
<td>${vo.getWhite()}개</td>
<th>혈색소</th>
<td>${vo.getHb()}g/dL</td>
</tr>
<tr>
<th>AST</th>
<td>${vo.getAst()}IU/L</td>
<th>ALT</th>
<td>${vo.getAlt()}IU/L</td>
</tr>
<tr>
<th colspan="2">r-GTP</th>
<td colspan="2">${vo.getGtp()}IU/L</td>
</tr>
<tr>
<th>요단백</th>
<td>${vo.getKidney1()}</td>
<th>요소질소</th>
<td>${vo.getKidney2()}mg/dL</td>
</tr>
<tr>
<th>혈창크레아티닌</th>
<td>${vo.getKidney3()}mg/dL</td>
<th>사구체여과율</th>
<td>${vo.getKidney4()}mg/min</td>
</tr>
<tr>
<th colspan="4" style="font-size:15px;">의사소견</th>
</tr>
<tr style="height:100px;">
<td colspan="4" style="font-weight:bolder;">${vo.getEx_result()}</td>
</tr>
</table>
<!--//ui object -->
</body>
</html>
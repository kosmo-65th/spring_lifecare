<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
/* UI Object */
.tbl_type,.tbl_type th,.tbl_type td{border:0}
.tbl_type{width:500px;border-bottom:2px solid #dcdcdc;font-family:'돋움',dotum;font-size:12px;text-align:center;border-collapse:collapse}
.tbl_type caption{display:none}
.tbl_type tfoot{background-color:#f5f7f9;font-weight:bold}
.tbl_type th{padding:7px 0 4px;border-top:2px solid #dcdcdc;border-right:1px solid #dcdcdc;border-left:1px solid #dcdcdc;background-color:#f5f7f9;color:#666;font-family:'돋움',dotum;font-size:12px;font-weight:bold}
.tbl_type td{padding:6px 0 4px;border:1px solid #e5e5e5;color:#4c4c4c}
.tbl_type td.ranking{font-weight:bold}
/* //UI Object */
</style>
<title>기초검사결과</title>
</head>
<body onresize="parent.resizeTo(530,480)" onload="parent.resizeTo(530,480)">
<!--ui object -->
<table class="tbl_type" border="1">
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
<tfoot>
<tr>
<th>의사소견</th>
<td colspan="3" style="font-weight:bolder;">${vo.getEx_result()}</td>
</tr>
</tfoot>
</table>
<!--//ui object -->
</body>
</html>
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
.button-primary {
	margin-top:20px;
	margin-left:420px; 
	background-color: #35cebe; 
	border: 0.1rem solid #35cebe; 
	border-radius: 499rem; 
	font-size: 1rem;
	color: #fff;
    cursor: pointer;
    display: inline-block;
    font-weight: 700;
    width: 160px;
    height: 2.8rem; 
    line-height: 2.8rem;
    text-align: center;
    text-decoration: none; 
    text-transform: uppercase;
    white-space: nowrap;
}
</style>
<script type="text/javascript">
// xray검사 결과 수정
$(function() {
    $('#updateCancer_result').click(function() {
    	var cancer_result = $("#cancer_result").val();
		var cancer_num = $("#cancer_num").val();		
		window.location = "${path}/doctor/cancer_exPro?cancer_num="+cancer_num+"&cancer_result="+cancer_result;
    });
});

</script>
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
<td colspan="2" style="color:#FF0004; background-color:#FAFA96; font-weight:bold;">${vo.getPercentage()}</td>
</tr>
<tr>
<th colspan="4" style="font-size:17px;">의사소견</th>
</tr>
<tr style="height:110px;"> 
<td colspan="4" style="padding:0px 0px 0px;"><textarea id="cancer_result" style="text-align:center; resize: none; font-size: 20px; font-weight: 500; width:100%; height:110px; vertical-align:middle;">${vo.getCancer_result()}</textarea></td>
</tr>
</table>
<input type="button" class="button-primary" value="검사기록저장" id="updateCancer_result">
<input type="hidden" id="cancer_num" value="${vo.getCancer_num()}">
<!--//ui object -->
</body>
</html>
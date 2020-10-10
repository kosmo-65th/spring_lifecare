<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
	<meta charset="utf-8">
	<title>Doctor Template</title>
	
	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700" rel="stylesheet">
	
	<!-- Template Styles -->
	<link rel="stylesheet" href="${path_resources}css/doctorfont-awesome.min.css">
	
	<!-- CSS Reset -->
	<link rel="stylesheet" href="${path_resources}css/doctornormalize.css">
	
	<!-- Milligram CSS minified -->
	<link rel="stylesheet" href="${path_resources}css/doctormilligram.min.css">
	
	<!-- Main Styles -->
	<link rel="stylesheet" href="${path_resources}css/doctorStyles.css">
	
	<link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.min.css" rel="stylesheet">
	
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
	
</head>

<body>
	<ul>
		<li><a href="${path}/doctor/doctor_main"><em class="fa fa-home"></em> Home</a></li>
		<li><a href="${path}/doctor/doctor_schedule"><em class="fa fa-table"></em> 스케쥴관리</a></li>
		<li><a href="javascript:void(0);" onclick="resReset();"><em class="fa fa-pencil-square-o"></em> 환자조회/진료</a></li>
		<li><a href="${path}/doctor/doctor_assist"><em class="fa fa-hand-o-up"></em> 검사결과조회</a></li>
		<li><a href="javascript:window.open('http://192.168.219.121:2000/standby?section=${sessionScope.major}')"><em class="fa fa-weixin"></em> 환자와의 채팅</a></li>
	</ul>
</body>
</html>
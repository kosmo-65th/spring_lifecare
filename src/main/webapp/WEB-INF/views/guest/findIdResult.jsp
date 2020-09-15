<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="${path_resources_customcss}findId.css">
<meta charset="UTF-8">
<title>아이디 찾기 결과 페이지</title>
</head>
<body>
<script src="${path_resources}setting/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function(){
	$("#loginBtn").click(function(){
		location.href='${path}/login';
	})
})
</script>
<%@include file="../common/header.jsp" %>
		<div class="title">아이디 찾기 검색결과</div>
		   <div class="findId_area">
				<p>
				 고객님의 아이디는${id}입니다.
				</p>
				<button type="button" id=loginBtn class="btn-type btn2 blue mr_2">확인</button>
				<button type="reset" class="btn-type btn3 red mr_3">취소</button>           	   
			</div>
<%@include file="../common/footer.jsp" %>
</body>
</html>
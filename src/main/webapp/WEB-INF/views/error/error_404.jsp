<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage = "true" %>
<%@ include file="/resources/setting/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="divclass1" align="center">
		<a href="javascript:history.back();">
			<img src="${path_resources}img/404error.png">
		</a>
		<br><br>
		<h2>현재 페이지는 존재하지 않습니다</h2>
	</div>
	<%@include file="../common/footer.jsp"%>
</body>
</html>
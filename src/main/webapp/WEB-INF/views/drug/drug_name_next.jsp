<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
</head>
<body>
	<ul style="list-style:none; margin-left:10px;">
<c:forEach var="i" items="${list}">
	<li>		
		<a href="javascript:nameClick('${i.getDrug_name()}');">${i.getDrug_name()}</a>
	</li>
</c:forEach>


</ul>
</body>
</html>



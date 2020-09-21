<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
</head>
<body>
<ul style="list-style:none; margin-left:10px;">
<c:forEach var="i" items="${list}">
	<li>
		<a href="${path}/doctor/doctor_medicalNote?customer_id=${i.getCustomer_id()}"&${_csrf.parameterName}=${_csrf.token}>
			${i.getCustomer_name()} (${i.getCustomer_id()})<br>
		</a>
	</li>
</c:forEach>

</ul>

</body>
</html>
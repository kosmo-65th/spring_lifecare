<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<c:if test="${deleteCnt != 1}"> <!-- Cnt 실패 -->
	<script type="text/javascript">
	alert("예약취소가 실패했습니다.");
	window.location="${path}/customer/confirmAppointment";
	</script>
</c:if>

<c:if test="${deleteCnt == 1}"> <!-- Cnt 성공 -->
	<script type="text/javascript">
	alert("예약취소가 성공했습니다.");
	window.location="${path}/customer/confirmAppointment";
	</script>
</c:if>
</body>
</html>
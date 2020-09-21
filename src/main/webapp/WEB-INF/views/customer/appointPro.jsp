<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<c:if test="${insertCnt != 1}"> <!-- updateCnt 실패 -->
	<script type="text/javascript">
	alert("예약이 실패했습니다.");
	window.location="${path}/customer/appointment";
	</script>
</c:if>

<c:if test="${insertCnt == 1}"> <!-- updateCnt 성공 -->
	<script type="text/javascript">
	alert("예약이 성공했습니다.");
	window.location="${path}/customer/mypage";
	</script>
</c:if>
</body>
</html>
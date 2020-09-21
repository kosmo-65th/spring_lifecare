<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<%@ include file="/resources/setting/setting.jsp" %> 
<meta charset="UTF-8">
</head>
<body>
<!-- 예약추가 실패시 -->
     <c:if test="${insertCnt == 0}">
		<script type="text/javascript">
			alert("예약설정에 실패했습니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${insertCnt != 0}">
	     <script type="text/javascript">
			alert("예약시간이 설정되었습니다.");
			window.location="${path}/doctor/doctor_schedule";
		</script>
	</c:if>
</body>
</html>
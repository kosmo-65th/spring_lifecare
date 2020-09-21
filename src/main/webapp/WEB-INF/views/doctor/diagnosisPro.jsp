<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/resources/setting/setting.jsp" %> 
<meta charset="UTF-8">
</head>
<body>
<!-- 회원가입 실패시 -->
     <c:if test="${insertCnt == 0}">
		<script type="text/javascript">
			alert("진료기록 저장이 실패했습니다.");
		</script>
	</c:if>
	
	<c:if test="${insertCnt != 0}">
	     <script type="text/javascript">
			alert("진료기록 저장에 성공했습니다.");
			window.location="${path}/doctor/doctor_main";
		</script>
	</c:if>
</body>
</html>
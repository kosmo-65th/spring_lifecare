<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/resources/setting/setting.jsp" %> 
<meta charset="UTF-8">
<title>회원가입 처리페이지</title>
</head>
<body>
<!-- 회원가입 실패시 -->
     <c:if test="${insertCnt == 0}">
		<script type="text/javascript">
			alert("회원가입에 실패하셨습니다.");
		</script>
	</c:if>
	
	<c:if test="${insertCnt != 0}">
	     <script type="text/javascript">
			alert("회원가입이 완료되었습니다.이메일 인증을 해주세요!!");
			window.location="joinSuccess?insertCnt=${insertCnt}";
		</script>
	</c:if>
</body>
</html>
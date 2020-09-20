<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/resources/setting/setting.jsp" %> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button id="logout" onclick="document.getElementById('logout-form').submit();">로그아웃</button>
	<form id="logout-form" action="${path}/logout" method="POST">
			 <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
	</form>

	<c:if test="${updateCnt == 0}">
	     <script type="text/javascript">
	        alert("비밀번호 변경에 실패하셨습니다.");
	     </script>
	</c:if>
	
	<c:if test="${updateCnt != 0}">
	     <script type="text/javascript">
	        alert("비밀번호가 변경되었습니다. 다시 로그인을 해주세요!!"); 
	        document.getElementById("logout").click();
	     </script>
	</c:if>
	 
</body>
</html>
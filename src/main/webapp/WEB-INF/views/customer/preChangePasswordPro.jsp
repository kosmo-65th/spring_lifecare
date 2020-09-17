<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/resources/setting/setting.jsp" %> 
<head>
<meta charset="UTF-8">
<title>비밀번호 확인 페이지</title>
</head>
<body>
<!-- 비밀번호 입력 실패시 -->
     <c:if test="${selectCnt == 0}">
		<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다.");
			window.location='Mypage';
		</script>
	</c:if>
	<c:if test="${selectCnt != 0}">
	     <script type="text/javascript">
			alert("변경할 비밀번호를 입력해주세요!!");
			window.location="changePassword?selectCnt=${selectCnt}";
		</script>
	</c:if>
	
	  
</body>

</html>
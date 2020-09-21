<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <c:if test="${cnt == 0}">
    <script>
     alert('고객님의 입력하신 정보가 존재하지 않습니다.');
     window.location="findPassword";
 </script>
  </c:if>
 <c:if test="${updateCnt == 1}">
	 <script>
		alert('입력하신 이메일 주소로 임시비밀번호가 발송되었습니다');
		window.location="login?";
	</script>
 </c:if>							                      
</body>
</html>
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
     <c:if test="${updateCnt == 0}">
	     <script type="text/javascript">
	        alert("퇴사 처리에 실패하셨습니다.");
	     </script>
	</c:if>
	
	<c:if test="${delectCnt != 0}">
    <script type="text/javascript">
        alert("퇴사 처리 되었습니다.");
        window.location="${path}/admin/doctorManagement";
   </script>
   </c:if>
</body>
</html>
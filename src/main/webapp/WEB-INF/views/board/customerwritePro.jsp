<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<body>
<h2 align = "center">글쓰기 - 처리 페이지</h2>
<!-- 글쓰기 실패 -->
<c:if test = "${writeQA == 0}">
	<script type = "text/javascript">
		alert("글 작성 실패하였습니다.");
	</script>
</c:if>

<c:if test = "${writeQA != 0}">
	<script type = "text/javascript">
		alert("글 작성 완료되었습니다.");
		window.location='${path}/board/customerboardList?';
	</script>
</c:if>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>
<html>
<body>
<h2><center>게시글 수정</center></h2>
<c:if test = "${updateCnt == 0}">
	<script type="text/javascript">
		alert("게시글 수정에 실패하였습니다.");
		window.history.back();
	</script>
</c:if>

<c:if test = "${updateCnt != 0}">
	<script type="text/javascript">
		alert("글이 수정되었습니다.");
		window.location = "${path}/board/customerboardList?";
	</script>
</c:if>

</body>
</html>
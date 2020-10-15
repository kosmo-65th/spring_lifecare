<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<!-- 비밀번호가 일치하지 않은 경우 -->
<c:if test = "${userDelete != 1}">
	<script type = "text/javascript">
		alert("입력하신 비밀번호가 다릅니다. 다시 입력해주세요");
		window.history.back();
	</script>
</c:if>

<!-- 비밀번호가 일치할 경우 -->
<c:if test = "${userDelete == 1}">
	<!-- 삭제 실패 -->
	<c:if test = "${deleteCnt != 1}">
	<script type = "text/javascript">
		alert("게시글이 삭제되지 않았습니다.");
		window.history.back();
		</script>
	</c:if>
	
	<!-- 삭제 성공 -->
	<c:if test = "${deleteCnt == 1}">
		<script type = "text/javascript">
			alert("글이 삭제되었습니다.");
			opener.parent.location.replace("${path}/board/customerboardList?");
	       	self.close();
		</script>
	</c:if>
</c:if>
<html>
<body>
</body>
</html>
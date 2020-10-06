<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<body>
<h2 align = "center">게시글 삭제</h2>
<form action="${pageContext.request.contextPath}/board/customerdeletePro?${_csrf.parameterName}=${_csrf.token}" method = "post" name = "pwdForm">
	<input type = "hidden" name = "board_sortnum" value = "${board_sortnum}">
	<input type = "hidden" name = "board_replycode" value = "${board_replycode}">
	<table align = "center">
		<tr>
			<th colspan = 2>비밀번호를 입력하세요</th>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td>
				<input class = "input" type = "password" name = "customer_pw" maxlength = 20 placeholder = "비밀번호를 입력하세요." autofocus required> 
			</td>
		</tr>
		
		<tr>
			<th colspan = 2>
				<input class = "button" type = "submit" value = "확인">
				<input class = "button" type = "button" value = "취소"
					onclick = "window.history.back();">
			</th>
		</tr>
	</table>
</form>
</body>
</html>
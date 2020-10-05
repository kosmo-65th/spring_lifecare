<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>
<html>
<body>
<form action="${pageContext.request.contextPath}/board/customermodifyView?${_csrf.parameterName}=${_csrf.token}" method = "post" name = "pwdForm">

	<!-- hidden : submit일 경우 input 태그에 보이지 않는 값을 넘길 때 사용 -->
	<input type = "hidden" name = "board_sortnum" value = "${board_sortnum}">
	<input type = "hidden" name = "customer_id" value = "${customer_id}">
	
	<table align = "center">
		<tr>
			<th colspan = 2>
				비밀번호를 입력하세요.
			</th>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td>
				<input class = "input" type = "password" name = "customer_pw" maxlength = 20 placeholder = "비밀번호 입력" autofocus required>
			</td>
		</tr>
		
		<tr>
			<th colspan = 2>
				<input class = "button" type = "submit" value = "확인">
				<input class = "button" type = "reset" value = "취소"
					onclick = "window.history.back();">
			</th>
		</tr>
	</table>
</form>
</body>
</html>
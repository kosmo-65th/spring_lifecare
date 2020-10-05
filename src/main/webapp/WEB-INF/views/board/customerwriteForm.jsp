 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<body>
<form action="${pageContext.request.contextPath}/board/customerwritePro?${_csrf.parameterName}=${_csrf.token}" method = "post" name = "writeForm">
	<table align = "center">
		<tr>
			<th>작성자</th>
			<td>
				${customer_id}
			</td>
		</tr>
		
		<tr>
			<th>제목</th>
			<td>
				<input class = "input" type = "text" name = "board_subject" maxlength = 50
					placeholder = "제목을 입력하세요." required>
			</td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td>
				<textarea class = "input" rows = 10 cols = 40 name = "board_content" style = "width:270px"
					placeholder = "글 내용을 입력하세요." word-break:break-all></textarea>
			</td>
		</tr>
		
		<tr>
			<th colspan = 2>
				<input class = "button" type = "submit" value = "작성">
				<input class = "button" type = "reset" value = "초기화">
				<input class = "button" type = "button" value = "목록보기"
					onclick = "window.location='${path}/board/customerboardList?'">
			</th>
		</tr>
	</table>
</form>
</body>
</html>
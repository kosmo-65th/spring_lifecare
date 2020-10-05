<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>
<html>
<body>
<h2><center>글 수정</center></h2>
<c:if test = "${selectCnt != 1}">
	<script type = "text/javascript">
		alert("입력하신 비밀번호가 다릅니다. 다시 입력해주세요");
		window.history.back();
	</script>
</c:if>

<c:if test = "${selectCnt == 1}">
	<form action="${pageContext.request.contextPath}/board/customermodifyPro?${_csrf.parameterName}=${_csrf.token}" method = "post" name = "modifyForm">
		<!-- num, pageNum -->
		<input type = "hidden" name = "board_sortnum" value = "${board_sortnum}">
		<table align = "center">
			<tr>
				<th colspan = 2>수정할 정보를 입력하세요.</th>
			</tr>
			
			<tr>
				<th style = "width:150px">작성자</th>
				<td style = "width:150px">${dto.customer_id}</td>
			</tr>
			
			<tr>
				<th style = "width:150px">글 제목</th>
				<td>
					<input class = "input" type ="text" name = "board_subject" maxlength = 20
						value = "${dto.board_subject}" style = "width:270px">
				</td>
			</tr>
			
			<tr>
				<th style = "width:150px">글 내용</th>
				<td>
					<textarea class = "input" rows = 10 cols = 40 name = "board_content"
						word-break:break-all>${dto.board_content}</textarea>						
				</td>
			</tr>
			
			<tr>
				<th colspan = 2>
					<input class = "button" type = "submit" value = "수정">
					<input class = "button" type = "reset" value = "초기화">
					<input class = "button" type ="button" value = "목록보기"
						onclick = "window.location='${path}/board/customerboardList?'">
				</th>
			</tr>
		</table>
		
	</form>
</c:if>

</body>
</html>
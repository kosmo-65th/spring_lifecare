<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>
<html>
<body>
<%@include file="../common/header.jsp"%>
<table align = "center">
	<tr>
		<th style = "width:150px">글 번호</th>
		<td style = "width:150px" align = "center">${dto.rNum}</td>
		
	</tr>
	
	<tr>
		<th style = "width:150px">작성자</th>
		<td style = "width:150px" align = "center">${dto.customer_id}</td>
		
		<th style = "width:150px">작성일</th>
		<td style = "width:150px" align = "center">
			<fmt:formatDate type = "both" pattern = "yyyy-MM-dd" value = "${dto.board_writedate}" />
		</td>
	</tr>
	
	<tr>
		<th style = "width:150px">글제목</th>
		<td colspan = 3 align = "center">${dto.board_subject}</td>
	</tr>
	
	<tr>
		<th>글 내용</th>
		<td colspan = 3 style = "height:200px" word-break:break-all>
		<!-- word-break:break-all : 글자 단위 자동 줄바꿈 -권장 
			 word-break:keep-all : 단어 기준 자동 줄바꿈
		-->
			${dto.board_content}
		</td>
	</tr>
	
	<tr>
		<th colspan = 4>
		<input class = "button" type = "button" value = "글 수정"
				onclick = "window.location='${path}/board/customermodifyForm?board_sortnum=${dto.board_sortnum}'">
			<input class = "button" type = "button" value = "글 삭제"
				onclick = "window.location='${path}/board/customerdeleteForm?board_sortnum=${dto.board_sortnum}&board_replycode=${dto.board_replycode}'">
			<input class = "button" type = "button" value = "목록 보기"
				onclick = "window.location='${path}/board/customerboardList?'">
		</th>
	</tr>
</table>
<%@include file="../common/footer.jsp"%>
</body>
</html>
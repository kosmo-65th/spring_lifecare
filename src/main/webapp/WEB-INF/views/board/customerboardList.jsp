<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<body>
<%@include file="../common/header.jsp"%>
<table style = "width:1000px" align = "center">
	<tr>
		<th colspan = 6 style = "height:25px" align = "right">
		 	<a href = "${path}/board/customerwriteForm?">글쓰기</a>
		</th>
	</tr>
	<tr>
		<th style = "width:15%">글번호</th>
		<th style = "width:25%">글제목</th>
		<th style = "width:10%">작성자</th>
		<th style = "width:15%">작성일</th>
		<th style = "width:5%">답변여부</th>
	</tr>
	
<!-- 게시글이 있으면 -->
<c:if test="${cnt > 0}">
<c:forEach var = "dto" items = "${dtos}">
	<tr>
		<td align = "center">
			${dto.rNum}
			<c:set var = "number" value = "${dto.board_sortnum - 1}"/>
		</td>
		<td>
		<a href = "${path}/board/customercontentForm?board_sortnum=${dto.board_sortnum}">${dto.board_subject}</a>
		</td>
		<td align = "center">${dto.customer_id}</td>
		<td><fmt:formatDate type = "both" pattern = "yyyy-MM-dd" value = "${dto.board_writedate}"/></td>
		<td align = "center">${dto.board_replycode}</td>
	</tr>
</c:forEach>
</c:if>
	
<!-- 게시글이 없으면 -->
<c:if test="${cnt == 0}">
	<tr>
		<td colspan = 6 align = "center">
			회원님께서 작성하신 Q&A가 존재 하지 않습니다. Q&A를 남겨주세요.
		</td>
	</tr>
</c:if>
</table>

<!-- 페이지 컨트롤 -->
<table style = "width:1000px" align = "center">
	<tr>
		<th align = "center">
		<!-- 게시글이 있는 경우 -->
		<c:if test = "${cnt > 0}">
			<!-- 처음[◀◀] / 이전블록[◀] -->
			<c:if test="${startPage > pageBlock}">
				<a href = "/board/customerboardList?">[◀◀]</a>
				<a href = "/board/customerboardList?pageNum=${startPage - pageBlock}">[◀]</a>
			</c:if>
			
			<!-- 블록내의 페이지 번호 -->
			<c:forEach var = "i" begin = "${startPage}" end = "${endPage}">
				<c:if test = "${i == currentPage}">
					<span><b>[${i}]</b></span>
				</c:if>
				
				<c:if test = "${i != currentPage}">
					<a href = "/board/customerboardList?pageNum=${i}">[${i}]</a>
				</c:if>
			</c:forEach>
			
			<!-- 다음블록[▶] / 마지막[▶▶] -->
			<c:if test="${pageCount > endPage}">
				<a href = "/board/customerboardList?pageNum=${startPage + pageBlock}">[▶]</a>
				<a href = "/board/customerboardList?pageNum=${pageCount}">[▶▶]</a>
			</c:if>
		</c:if>
		</th>
	</tr>
</table>
<%@include file="../common/footer.jsp"%>
</body>
</html>
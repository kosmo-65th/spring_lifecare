<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<link type="text/css" rel="stylesheet" href="${path_resources}css/payment.css">
<html>
<body>
<%@include file="../common/header.jsp"%>
<form>
<div align="center">
<div class="body" style="width:1000px;">
<br><br>
<fieldset class="payment">
<h3 style = "font-size:30px">Q&A현황</h3>
<div class="tablePay">    
    <div class="row1 header blue">
      <div class="cell1">
          	글번호
      </div>
      <div class="cell1">
        	작성자
      </div>
      <div class="cell1">
        	글제목
      </div>
      <div class="cell1">
        	작성일
      </div>
      <div class="cell1">
        	답변여부
      </div>
    </div>
<c:if test="${cnt > 0}">
	<c:forEach var = "dto" items = "${dtos}">
    <div class="row1">           
      <div class="cell1">
        	${number}
	<c:set var = "number" value = "${number - 1}"/>
      </div>
      <div class="cell1">
        	${dto.customer_id}
      </div>
      <div class="cell1">
        	<a href = "${path}/board/customercontentForm?board_sortnum=${dto.board_sortnum}&pageNum=${pageNum}">${dto.board_subject}</a>
      </div>
      <div class="cell1">
       	    <fmt:formatDate type = "both" pattern = "yyyy-MM-dd" value = "${dto.board_writedate}"/>
      </div>
      <div class="cell1">
        	${dto.board_replycode}
      </div>
     </div> 
      </c:forEach>
</c:if>        
</div>
</fieldset>	
<!-- 게시글이 없으면 -->
<c:if test="${cnt == 0}">
	<tr>
		<td colspan = 6 style = "align:center; margin:0 auto;">
			회원님께서 작성하신 Q&A가 존재 하지 않습니다. Q&A를 남겨주세요.
		</td>
	</tr>
</c:if>
<div style="float:right;">	  			
   		<input class="large button green"  type = "button" value = "글쓰기"
			onclick = "javascript:window.open('${path}/board/customerwriteForm','a','width=605,height=445,location=no,status=no,scrollbars=yes');">
</div>
<!-- 페이지 컨트롤 -->
<table style = "text-align:center; margin:0 auto;">
	<tr>
		<th align = "center">
		<!-- 게시글이 있는 경우 -->
		<c:if test = "${cnt > 0}">
			<!-- 처음[◀◀] / 이전블록[◀] -->
			<c:if test="${startPage > pageBlock}">
				<a href = "${path}/board/customerboardList?">[◀◀]</a>
				<a href = "${path}/board/customerboardList?pageNum=${startPage - pageBlock}">[◀]</a>
			</c:if>
			
			<!-- 블록내의 페이지 번호 -->
			<c:forEach var = "i" begin = "${startPage}" end = "${endPage}">
				<c:if test = "${i == currentPage}">
					<span><b>[${i}]</b></span>
				</c:if>
				
				<c:if test = "${i != currentPage}">
					<a href = "${path}/board/customerboardList?pageNum=${i}">[${i}]</a>
				</c:if>
			</c:forEach>
			
			<!-- 다음블록[▶] / 마지막[▶▶] -->
			<c:if test="${pageCount > endPage}">
				<a href = "${path}/board/customerboardList?pageNum=${startPage + pageBlock}">[▶]</a>
				<a href = "${path}/board/customerboardList?pageNum=${pageCount}">[▶▶]</a>
			</c:if>
		</c:if>
		</th>
	</tr>
</table>
</div>
</div>
</form>
<%@include file="../common/footer.jsp"%>
</body>
</html>
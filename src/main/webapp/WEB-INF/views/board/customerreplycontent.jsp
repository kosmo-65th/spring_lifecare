<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>
<link type="text/css" rel="stylesheet" href="${path_resources}css/payment.css">
<html>
<body>
<%@include file="../common/header.jsp"%>
<form>
<div align="center">
<div class="body" style="width:1000px;">
<br><br>
<h3 style = "font-size:30px" align="left">Q&A내용</h3>
<table class="tablepay">
<thead class="payment">
  <tr class="row1 header blue">
    <th class="cell1" style="width:120px;">글번호</th>
    <th class="cell1">${dto.rNum}</th>
    <th class="cell1">작성자</th>
    <th class="cell1">${dto.customer_id}</th>
    <th class="cell1">글제목</th>
    <th class="cell1">${dto.board_subject}</th>
    <th class="cell1">작성일</th>
    <th class="cell1"><fmt:formatDate type = "both" pattern = "yyyy-MM-dd" value = "${dto.board_writedate}"/></th>
  </tr>
</thead>
<tbody class="payment">
  <tr class="row1 header blue">
    <td class="cell1" rowspan="4" style="font-weight:700;">글내용</td>
  </tr>
  <tr>
  	<% pageContext.setAttribute("newLineChar", "\n"); %>
    <td class="cell1" colspan="7" rowspan="4" style="width:250px;height:250px;text-align:left;">${fn:replace(dto.board_content, newLineChar, "<br/>")}</td>
  </tr>  
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
</tbody>
</table>

<br>
	<tr>
		<th colspan = 4>
		<input class="large button green"  type = "button" value = "글 수정"
				onclick = "javascript:window.open('${path}/board/customermodifyForm?board_sortnum=${dto.board_sortnum}','a','width=605,height=445,location=no,status=no,scrollbars=yes');">
			<input class="large button green"  type = "button" value = "글 삭제"
				onclick = "javascript:window.open('${path}/board/customerdeleteForm?board_sortnum=${dto.board_sortnum}&board_replycode=${dto.board_replycode}','a','width=480,height=200,location=no,status=no,scrollbars=yes');">
			<input class="large button green"  type = "button" value = "목록 보기"
				onclick = "window.location='${path}/board/customerboardList?'">
		</th>
	</tr>
</div>
</div>
</form>
<%@include file="../common/footer.jsp"%>
</body>
</html>
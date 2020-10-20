<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>
<link type="text/css" rel="stylesheet" href="${path_resources}css/payment.css">
<style type="text/css">
	html{overflow:hidden;}
</style>
<html>
<body>
<c:if test = "${selectCnt != 1}">
	<script type = "text/javascript">
		alert("입력하신 비밀번호가 다릅니다. 다시 입력해주세요");
		window.history.back();
	</script>
</c:if>
<script type = "text/javascript">
	function goBack(){
		opener.parent.location.replace("${path}/board/customerboardList?");
      	self.close();
	}
</script>
<form action="${pageContext.request.contextPath}/board/customermodifyPro?${_csrf.parameterName}=${_csrf.token}" method = "post" name = "modifyForm">
<c:if test = "${selectCnt == 1}">
<div class="body" style="width:500px; margin-left:40px;">
<h3 style = "font-size:30px;margin-top:30px;" align="left">게시글 수정</h3>
<input type = "hidden" name = "board_sortnum" value = "${board_sortnum}">
<table class="tablepay">
	<tbody class="inputform">
			<tr class="row1 header blue">
				<th class="cell4">작성자</th>
				<td style = "width:200px">${dto.customer_id}</td>
			</tr>
			<tr class="row1 header blue">
				<td class="cell4" style = "width:200px">글제목</td>
				<td>
					<input class = "cell2" type ="text" name = "board_subject" maxlength = 20 value = "${dto.board_subject}"style="width:433px; height:56px;"> 
				</td>
			</tr>	
			<tr class="row1 header blue">
				<th class="cell4">글내용</th>
				<td style = "vertical-align:middle;">
					<textarea class = "cell3" rows = 10 cols = 56 name = "board_content">${dto.board_content}</textarea>						
				</td>
			</tr>
	</tbody>
</table>
			<div style="text-align:center">
				<th>
					<input class = "large button green" type = "submit" value = "수정">
					<input class = "large button green" type = "reset" value = "초기화">
					<input class = "large button green" type ="button" value = "목록보기" onclick = "goBack()">
				</th>
			</div>

</div>
</c:if>
</form>
</body>
</html>
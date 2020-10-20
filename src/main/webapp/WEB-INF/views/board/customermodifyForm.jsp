<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>
<link type="text/css" rel="stylesheet" href="${path_resources}css/payment.css">
<style type="text/css">
	html{overflow:hidden;}
</style>
<html>
<body>
<script type = "text/javascript">
	function goBack(){
		opener.parent.location.replace("${path}/board/customerboardList?");
      	self.close();
	}
</script>
<form action="${pageContext.request.contextPath}/board/customermodifyView?${_csrf.parameterName}=${_csrf.token}" method = "post" name = "pwdForm">
<div align="center">
<div class="body" style="width:1000px;">
<fieldset class="payment">
<h3 style = "align:left;font-size:30px;">게시글 수정(비밀번호 입력)</h3>
	<input type = "hidden" name = "board_sortnum" value = "${board_sortnum}">
	<input type = "hidden" name = "customer_id" value = "${customer_id}">
	<div style="text-align:left">
		<tr>
			<th>비밀번호</th>
			<td>
				<input class = "input" type = "password" name = "customer_pw" maxlength = 20 placeholder = "비밀번호를 입력하세요." autofocus required> 
			</td>
		</tr>
		<tr>
			<th colspan = 2 align=center>
				<input class = "large button green" type = "submit" value = "확인">
				<input class = "large button green" type = "button" value = "취소"
					onclick = "goBack()">
			</th>
		</tr>
	</div>
</fieldset>
</div>
</div>	
</form>
</body>
</html>
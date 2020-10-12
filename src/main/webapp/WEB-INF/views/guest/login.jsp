<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>

<%@ page import="util.FinalString" %>
<%! String ip =FinalString.CALLBACKIP.getValue(); %> 

<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="${path_resources_customcss}login.css">
<meta charset="UTF-8">
<title>로그인</title>
<script src="${path_resources}js/idsave-for-cookie.js"></script>
<script type="text/javascript"></script>
<!-- 로그인 실패시 메시지 -->
<c:if test="${fail == 1}">
	<script type="text/javascript">
 		alert("${errMsg}")
	</script>
</c:if>
</head>
<body>
	<%@include file="../common/header_error.jsp"%>
	<div class="divclass1" align="center">
		<form action="${path}/login_check" method="post" name="login">
			<input type ="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<div class="loginform">
				<div class="titles">로그인</div>
				<h1 id="msg">Welcome Life Care</h1>
				<input type="text" name="userid" id="label_id" class="idbox" placeholder="아이디"><br>
				<input type="password" name="passwd" class="pwdbox" placeholder="패스워드"><br>
				<input type="checkbox" id="idsave"> 아이디 저장
				<input type="checkbox" name="autologin"> 자동 로그인
				<ul class="idpwdfind">
					<li>&nbsp;&nbsp;<a href="${path}/findId">아이디 찾기</a>&nbsp; | <a href="${path}/findPassword">비밀번호찾기</a></li>
				</ul>
				<input type="submit" class="btnclass1" value="로그인" style="cursor: pointer"> 
				<input type="button" class="btnclass2" value="회원가입" style="cursor: pointer" onClick="location.href='${path}/preJoinIn'">
				<div class="socialLogin">
					<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=LFKH6Ooda771daTdxSSO&redirect_url=http://<%=ip %>//lifecare/naverLogin&state=3">
						<img src="${path_resources}img/btn_naver.png" border="0" title="네이버 아이디로 로그인" width="185" height="40" style="cursor: pointer">
					</a> 
					<a href="https://kauth.kakao.com/oauth/authorize?client_id=db39a7b6654b2f994af177b271416561&redirect_uri=http://<%=ip %>/lifecare/kakaoLogin&response_type=code">
						<img src="${path_resources}img/btn_kakao.png" alt="" style="cursor: pointer">
					</a>
				</div>
			</div>
		</form>
	</div>
	<%@include file="../common/footer.jsp"%>
</body>
</html>
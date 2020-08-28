<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="${path_resources_customcss}login.css">
<meta charset="UTF-8">
	<!-- Site Icons -->	
	<link rel="shortcut icon" href="${path_resources_lifecare}images/fevicon.ico.png" type="image/x-icon" />
   	<link rel="apple-touch-icon" href="${path_resources_lifecare}images/apple-touch-icon.png">
   	<!-- Site Icons -->
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="divclass1" align="center">
		<form action="" method="post" name="">
			<input type = "hidden" name="${_csrf.parameterName}" value = "${_csrf.token}">
			<div class="titles">로그인</div>
			<div class="loginform">
				<h1 id="msg">Welcome Life Care</h1>
				<input type="text" name="userid" class="idbox" placeholder="아이디"><br>
				<input type="password" name="passwd" class="pwdbox" placeholder="패스워드">
				<ul class="idsave">
					<input type="checkbox" name="idsave" checked=""> 아이디 저장
				</ul>
				<ul class="idpwdfind">
					<li>&nbsp;&nbsp;<a href="${path}/guest/findId">아이디 찾기</a>&nbsp; | <a href="guest/findPassword">비밀번호찾기</a></li>
				</ul>
				<a href="#"><input type="button" class="btnclass1" value="로그인" style="cursor: pointer"></a> 
				<a href="#"><input type="button" class="btnclass2" value="회원가입" style="cursor: pointer"></a>
				<ul class="socialLogin">
					<a><img src="${path_resources}img/btn_naver.png" border="0" title="네이버 아이디로 로그인" width="185" height="40" style="cursor: pointer"></a>
					<a><img src="${path_resources}img/btn_kakao.png" alt=""style="cursor: pointer"></a>
				</ul>
			</div>
		</form>
	</div>
	<%@include file="../common/footer.jsp"%>
</body>
</html>
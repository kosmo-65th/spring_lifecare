<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="${path5}login.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
<div class="divclass1" align="center">
<form action="" method="post">
<div class="titles" >로그인</div>
<div class="loginform">
<h1 id="msg">Welcome Life Care</h1>
<input type="text" name="id" class="idbox" placeholder="아이디"><br>
<input type="password" name="pwd" class="pwdbox" placeholder="패스워드">
<ul class="idsave"><input type="checkbox" name="idsave" checked="">아이디 저장</ul>
<ul class="idpwdfind">
	<li>
		&nbsp;&nbsp;<a href="">아이디 찾기</a>&nbsp; | <a href="">비밀번호 찾기</a>
	</li>
</ul>
	<a href="#" ><input type="button" class="btnclass1" value="로그인" style="cursor:pointer"></a>
	<a href="#" ><input type="button" class="btnclass2" value="회원가입" style="cursor:pointer"></a>
<ul class="socialLogin">
	<a><img src="${path}img/btn_naver.png" border="0" title="네이버 아이디로 로그인" width="185" height="40" style="cursor:pointer"></a>
	<a><img src="${path}img/btn_kakao.png" alt="" style="cursor:pointer"></a>
</ul>
</div>
</form>
</div>
	<%@include file="footer.jsp" %>
</body>
</html>
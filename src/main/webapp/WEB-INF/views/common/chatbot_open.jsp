<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	window.open("http://192.168.219.123:3000/?id=${sessionScope.userSession}","chat-bot","resiable=no,width=650,height=650,menubar=no")
	
	location.href="/lifecare";
</script>

</head>
<body>

</body>
</html>
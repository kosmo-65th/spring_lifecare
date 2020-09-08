<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chatbot(){
		window.open("http://192.168.219.124:3000/","chat-bot","resiable=no,width=650,height=650,menubar=no")
	}
</script>
</head>
<body>
  	<a href="javascript:void(0" onclick="chatbot();"><img src="${path_resources}img/chatBot.png" style="width: 120px; height: 120px; margin-top:-120px; position: fixed;"></a>
</body>
</html>
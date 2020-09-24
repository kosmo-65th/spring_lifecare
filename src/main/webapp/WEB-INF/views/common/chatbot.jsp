<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	//챗봇띄우는 펑션(챗봇은 common에서 include한 이미지로 킨다.)
	function chatbot(){
	window.open("http://192.168.219.113:3000/","chat-bot","resiable=no,width=650,height=650,menubar=no")
	}
</script>
<style type="text/css">
@media (min-width:1930px) {

    .chatbot{
		float: right;
		position: fixed;
		margin-left: 92%;
		bottom: 10%;
	}	
} 
@media (max-width:1920px) {

    .chatbot{
		float: right;
		position: fixed;
		margin-left: 92%;
		bottom: 10%;
	}	
} 

@media (max-width:1280px) {

    .chatbot{
		float: right;
		position: fixed;
		margin-left:92%;
		bottom: 4%;
	}	
}

@media (max-width:1024px) {

    .chatbot{
		float: right;
		position: fixed;
		margin-left:85%;
		bottom: 15%;
	}	
} 
</style>
</head>
<body>
	<div class="chatbot">
  		<a href="javascript:void(0)" onclick="chatbot();"><img title="chat-bot" src="${path_resources}img/chatBot.png" 
  		style="width: 120px; height: 120px;"></a>
  	</div>
  	
</body>
</html>
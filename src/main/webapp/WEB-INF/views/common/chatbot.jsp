<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/resources/setting/setting.jsp" %> 
<style type="text/css">
 @media (min-width:1930px) {
    .chatbot{
		position: fixed;
		bottom: 1%;
		left: 93%;
	}	
} 
@media (max-width:1920px) {
    .chatbot{
		position: fixed;
		bottom: 1%;
		left: 93%;
	}	
} 

@media (max-width:1280px) {
    .chatbot{
		float: right;
		position: fixed;
		bottom: 1%;
		left: 93%;
	}	
}

@media (max-width:1024px) {
    .chatbot{
		float: right;
		position: fixed;
		bottom: 1%;
		left: 93%;
	}	
} 
.chatbot{
	z-index: 99999999999999999999999999;
} 
</style>
<body onresize="parent.resizeTo(800,800)" onload="parent.resizeTo(800,800)">
	<div class="chatbot">
  		<a href= "${path}/customer/chatbot" onclick="chatbot();">
  		<img class="chatbot" title="chat-bot" src="${path_resources}img/chatBot.png" 
  		style="width: 120px; height: 120px;"></a>
  	</div>
</body>
</html>
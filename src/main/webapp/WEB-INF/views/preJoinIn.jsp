<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %> 
 
<!DOCTYPE html>
<html>
<title>회원가입 하기</title>
<style>
 .title {
	  display: inline-block;
	  width: 100%;
	  text-align: center;
	  font-weight: 500;
	  color: #1a1a1a;
	  font-size: 34px;
	  line-height: 1;
	  margin-bottom: 30px;
  }
 
  .join_area {
    width: 900px;
    margin: 0px auto 50px;
    text-align: center;
    padding: 50px 170px;
    border: 1px solid #ebebeb;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
  }
  

  .join_area p {
    color: #424242;
    font-size: 30px;
    line-height: 1;
    margin-bottom: 30px;
   }  
   
   .join_box_wrap #normal {
	   width: 300px;
	   background: #fff;
	   border: 1px solid #ddd;
   }
   
    .join_box_wrap #doctor {
	    width: 300px;
	    background: #fff;
	    border: 1px solid #ddd;
   }
   .btn1{
   	width:300px;
   	height:80px;
   	margin:7px;
   }
   .btn2{
   	width:300px;
   	height:80px;
   	margin:7px;
   	
   }
   
</style>
<head>
<%@include file="./header.jsp" %>
<meta charset="UTF-8">
<body>
	<div align="center">
	     <div class="title">회원가입 하기</div>
	        <div class="join_area">
	          <p>WELCOME TO LIFECARE</p>
	                  라이프케어 홈페이지에 가입하시면 다양한 서비스를 이용하실 수 있습니다. 
	                  고객님들에게 더 만족스러운 서비스를 제공하기 위해 항상 노력하겠습니다. 
	         </div>
	         <input type="button" class="btn1" value="일반">
	         <input type="button" class="btn2" value="의사">
		</div>
</body>
<%@include file="footer.jsp" %>
</html>
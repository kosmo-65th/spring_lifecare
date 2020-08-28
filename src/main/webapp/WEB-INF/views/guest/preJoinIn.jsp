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
  
   .preJoin {
      width: 150px;
      height: 200px;
      margin: 20px;
      display: inline-block;   
   }
   
   .lifeJoin { 
       width: 100%;  
       text-align: center;  
       width: 900px;
       margin: 0px auto 50px;
       box-sizing: border-box;
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
   }

   .join {  
	   height: 100px;  
	   display: inline-block;
	}
	
	.join ul{
		  float:right;
		  margin-right:70px;
		  margin-left:70px;
	}
	
	.tablestyle{
		border-spacing: 20px;
  		border-collapse: separate;
	}
	.tablestyle td:hover{
		background:#bebebe;
	}
	
	.tablestyle td{
		border:1px solid #c8c8c8;
	}
	 
	.tablestyle img{
		margin:30px;
	}
</style>
<meta charset="UTF-8">
<body>
	<%@include file="../common/header.jsp" %>
	<div align="center">
	     <div class="title">회원가입 하기</div>
	        <div class="join_area">
	          <p>WELCOME TO LIFECARE</p>
	                  라이프케어 홈페이지에 가입하시면 다양한 서비스를 이용하실 수 있습니다. 
	                  고객님들에게 더 만족스러운 서비스를 제공하기 위해 항상 노력하겠습니다. 
	                  
             <table class="tablestyle">
	     		<tr>
	     			<td><a href="${path}/guest/JoinInForm"><img src="${path_resources}images/client.png" width="200px" height="250px" /></a></td>
	     			<td><a href="${path}/guest/doctorJoin"><img src="${path_resources}images/doc.png" width="200px" height="250px" /></a></td>
	     		</tr>
	     	</table>
	        </div>	
	     </div>   
	     <div class="lifeJoin" >
	     	
	     <div class="letter">
	     	  
	     
	       </div>
	     </div>
	     
	     <%@include file="../common/footer.jsp" %>
</body>
</html>
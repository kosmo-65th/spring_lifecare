<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
<%@include file="../common/header.jsp" %>
<form action="${pageContext.request.contextPath}/customer/preModify?${_csrf.parameterName}=${_csrf.token}" method="post" name="informationForm" onsubmit="">
     <div class="title">내 정보 관리</div>
        <div class="information_area">
          <p><!-- 세션으로 이름 가져올것 -->님의 개인 정보 관리</p>              
              <!-- 세션으로 아이디를 가져올 것 -->                         
               <input type="text" name="customer_id"  id="" class="mb10" value="">
               <!-- 세션으로 이름을 가져올 것 -->      
               <input type="text" name="customer_name"  id="" class="mb10" value="">            
               <!-- 비밀번호 수정 -->
               <input type="password" name="customer_pw" id=""  class="mb10" value="" > 
               <!-- 휴대폰 번호 수정  -->                   
               <input type="text" name="customer_phone" id=""  class="mb10" value=""> 
               <!-- 이메일주소는 세션으로 가져올 것 -->       
               <input type="text" name="customer_email" id=""  class="mb10" value="">            
         </div>                               
        <div class="press">
              <button type="submit" class="btn-type btn2 blue mr_2">내 정보 수정하기</button>
              <button type="reset" class="btn-type btn3 blue mr_3">회원 탈퇴하기</button>
          </div>
   </form>
 <%@include file="../common/footer.jsp" %>
  </body>
</html>
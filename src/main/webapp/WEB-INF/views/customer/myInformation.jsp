<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="${path_resources_customcss}myInformation.css">
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
<%@include file="../common/header.jsp" %>
<form action="${pageContext.request.contextPath}/customer/modify?${_csrf.parameterName}=${_csrf.token}" method="post" name="informationForm" onsubmit="">
     <div class="title">내 정보 관리</div>
        <div class="information_area">
          <p>${sessionScope.userSession}님의 개인 정보 관리</p> 
             ${customer.customer_name}고객님의 개인 정보를  조회 하실 수 있습니다.                                                
               <input type="text" name="customer_id"  id="" class="mb10" value="아이디 : ${customer.customer_id}" readonly>     
               <input type="text" name="customer_name"  id="" class="mb10" value="이름 : ${customer.customer_name}" readonly >            
               <input type="text" name="customer_gender"  id="" class="mb10" value="성별 : ${customer.customer_gender}" readonly>            
               <input type="text" name="customer_year"  id="" class="mb10" value="생년월일 : ${customer.customer_year}" readonly>
               <input type="text" name="customer_phone" id=""  class="mb10" value="휴대폰 번호 : ${customer.customer_phone}" readonly>   
               <input type="text" name="customer_email" id=""  class="mb10" value="이메일 주소 : ${customer.customer_email}" readonly>                                          
        <div class="press"> 
              <button type="submit" class="btn-type btn2 blue mr_2">수정하기</button>
              <button type="button" style="background:#FF0000; border:1px; width:14%; height:4.7%; color:#fff">취소</button> 
        </div>
      </div>
   </form>
 <%@include file="../common/footer.jsp" %>
  </body>
</html>
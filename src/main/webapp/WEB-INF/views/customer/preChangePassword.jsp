<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="${path_resources_customcss}changePassword.css">
<meta charset="UTF-8">
<title>내 정보 수정하기</title>
</head>
<%@include file="../common/header.jsp" %>
<body>
<form action="${pageContext.request.contextPath}/customer/preChangePasswordPro?${_csrf.parameterName}=${_csrf.token}" method="post" name="passwordChangeForm">
     <input type="hidden" name="customer_id" value="${vo.getCustomer_id()}">
      <div class="title"></div>
        <div class="information_area">
          <p>PLEASE, PUT YOUR CURRENT PASSWORD INTO THIS BLANK.</p>
             ${sessionScope.userSession} 고객님의 개인정보 보안을 위해 <span style="color: blue;">비밀번호를 한번 더 </span>입력해주세요 .<br>
             <input type="text" name="customer_id" id="userId" class="mb10" value="${sessionScope.userSession}" readonly>
             <input type="password" name="customer_pw" id="userPw" placeholder="비밀번호 입력" class="mb10" value="" >
            
             <div class="press">
             <button type="submit" id="btnPassword" class="btn-type btn2 blue mr_2">확인</button>
             <button type="reset" class="btn-type btn3 red mr_3">취소</button>
           </div>        
        </div>         
     </form> 	
<%@include file="../common/footer.jsp" %>
</body>
</html>
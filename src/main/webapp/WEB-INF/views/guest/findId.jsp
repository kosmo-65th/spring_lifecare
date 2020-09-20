<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="${path_resources_customcss}findId.css">
<meta charset="UTF-8">

<title>아이디 찾기</title>
</head>
<body> 
<script src="${path_resources}setting/jquery-3.5.1.js"></script>
<script type="text/javascript">
	
    // 휴대폰 번호 정규식
	var phoneJ = /^[0-9]{10,11}$/;
	
    $(document).ready(function(){

    //휴대폰 번호 검사
    $("#userPhone").blur(function() {
    		if (phoneJ.test($(this).val())) {
    				console.log(nameJ.test($(this).val()));
    				$("#idCheck").text('');
    		} else {
    			$('#idCheck').text('(02, -)를 제외하고 입력해 주세요');
    			$('#idCheck').css('color', 'red');
    		}
    	});
    		
      });




</script>
<%@include file="../common/header.jsp" %>
    <form action="${pageContext.request.contextPath}/findIdResult?${_csrf.parameterName}=${_csrf.token}" method="post" name="idResultForm">
      <div class="title">아이디 찾기</div>
        <div class="findId_area">
          <p>FORGOT YOUR ID?</p>
                           아이디가 기억나지 않으세요? 분실하신 아이디를 찾으실 수 있습니다.
                           회원가입 시 입력하신  휴대폰번호를 이용하여 분실하신 아이디를 조회하실 수 있습니다.     
               <input type="text" name="customer_phone" id="userPhone" placeholder="휴대폰 번호를 입력해주세요." class="mb10" value="" required> 
               <div class="findId"  id="idCheck"></div>             
               <div class="press">
              <button type="submit" class="btn-type btn2 blue mr_2">확인</button>
              <button type="reset" class="btn-type btn3 red mr_3">취소</button>
             </div>                 
         </div>      
      </form>
      <%@include file="../common/footer.jsp" %>
   </body>
</html>
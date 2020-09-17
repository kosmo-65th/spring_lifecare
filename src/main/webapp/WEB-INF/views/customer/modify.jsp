<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="${path_resources_customcss}modify.css">
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<script src="${path_resources}setting/jquery-3.5.1.js"></script>
<script type="text/javascript">

    //이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^[0-9]{10,11}$/;
	
	$(document).ready(function(){
		
	//이름
	$("#userName").blur(function() {
		if (nameJ.test($(this).val())) {
				console.log(nameJ.test($(this).val()));
				$("#nameChk").text('');
		} else {
			$('#nameChk').text('이름을 확인해주세요');
			$('#nameChk').css('color', 'red');
		}
	});
		
	//이메일 중복확인
	$("#userEmail").blur(function() {
 			var user_email = $('#userEmail').val();
 			$.ajax({
 				url : '${pageContext.request.contextPath}/user/email?userEmail='+ user_email,
 				type : 'get',
 				success : function(result) {
 					console.log("1 = 중복o / 0 = 중복x : "+ result);							
 					if (result == '1') {
						$("#emailChk").text("사용중인 이메일 주소 입니다.");
						$("#emailChk").css("color", "red");
						document.joinInform.hiddenEmail.value = "0";
					} else {
						if(mailJ.test(user_email)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#emailChk").text("사용가능한 이메일 주소 입니다.");
							$("#emailChk").css("color", "blue");
							document.joinInform.hiddenEmail.value = "1";
						} else if(user_email == ""){
							$('#emailChk').text('이메일을 입력해주세요.');
							$('#emailChk').css('color', 'red');
							document.joinInform.hiddenEmail.value = "0";		
						} else {								
							$('#emailChk').text("@포함 이메일 주소를 입력해 주세요.");
							$('#emailChk').css('color', 'red');
							document.joinInform.hiddenEmail.value = "0";
						}
					}
				}, error : function() {
						console.log("실패");
				}

			});	
        });
	 // 휴대전화중복확인
 	  $("#userPhone").blur(function() {
			var user_phone = $('#userPhone').val();
			$.ajax({
				url : '${pageContext.request.contextPath}/user/JoinIn?userPhone='+ user_phone,
				type : 'get',
				success : function(result) {
					console.log("1 = 중복o / 0 = 중복x : "+ result);							
					if (result == '1') {
						$("#numberChk").text("사용중인 휴대폰 번호입니다.");
						$("#numberChk").css("color", "red");
						document.joinInform.hiddenPhone.value = "0";
					} else {
						if(phoneJ.test(user_phone)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#numberChk").text("사용가능한 휴대폰 번호 입니다.");
							$("#numberChk").css("color", "blue");
							document.joinInform.hiddenPhone.value = "1";
						} else if(user_phone == ""){
							$('#numberChk').text('휴대폰 번호를 입력해주세요.');
							$('#numberChk').css('color', 'red');
							document.joinInform.hiddenPhone.value = "0";
						} else {								
							$('#numberChk').text("(02, -)를 제외하고 입력해 주세요");
							$('#numberChk').css('color', 'red');
							document.joinInform.hiddenPhone.value = "0";
						}
					}
				}, error : function() {
						console.log("실패");
				}

			});
        });
    });	
</script>
<body>
<%@include file="../common/header.jsp" %>
<form action="${pageContext.request.contextPath}/customer/modifyViewPro?${_csrf.parameterName}=${_csrf.token}" method="post" name="Modifyform" onsubmit="">
   <input type="hidden" name="customer_id" value="${vo.getCustomer_id()}">
     <div class="title">내 정보 관리</div>
        <div class="information_area">
          <p> ${sessionScope.userSession}님의 개인 정보 관리</p>
               *표시는 필수 입력 항목 입니다. 개인 정보를 정확하게 수정해주세요.                                        
               <input type="text" name="customer_id"  id="userId" class="mb10" value="${sessionScope.userSession}" readonly>      
               <input type="text" name="customer_name"  id="userName" placeholder="이름" class="mb10" value="${customer_name}" required>  
               <div class="nameCheck"  id="nameChk"></div>                
               <input type="text" name="customer_phone" id="userPhone" placeholder="휴대폰 번호" class="mb10" value="${vo.getCustomer_phone()}" required> 
               <div class="phoneCheck"  id="numberChk"></div>              
               <input type="text" name="customer_email" id="userEmail" placeholder="이메일 주소" class="mb10" value="${vo.getCustomer_email()}" required>
               <div class="emailCheck"  id="emailChk"></div>
               <input type="text"  name="customer_gender" id="userGender" class="mb10" value="${vo.getCustomer_email()}">
               <input type="text"  name="customer_gender" id="userGender" class="mb10" value="${vo.getCustomer_email()}">                                 
         </div>
                                       
        <div class="press">
              <button type="submit" class="btn-type btn2 blue mr_2">확인</button>
              <button type="reset" class="btn-type btn3 blue mr_3">취소</button>
          </div>
</form>
 <%@include file="../common/footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="${path_resources_customcss}changePassword.css">
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<script src="${path_resources}setting/jquery-3.5.1.js"></script>
<script type="text/javascript">

	var msg_pwdChk = "비밀번호가 일치하지 않습니다.";
	 
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/; 
	
	function changePasswordFocus(){
	  if(document.passwordChangeForm.newPassword.value != document.passwordChangeForm.newPasswordChk.value){
		 alert(msg_pwdChk);
		 document.passwordChangeForm.newPasswordChk.value = "";
		 document.passwordChangeForm.newPasswordChk.focus();
	     return false;			    
	   }
	}
	
	$(document).ready(function(){
	
    //새 비밀번호
    $("#newPassword").blur(function() {
	  if (pwJ.test($(this).val())) {
			console.log('true');
			$("#newPwd").text('');
	  } else {
		console.log('false');
		$('#newPwd').text('숫자 or 문자로만 4~12자리로 입력해주세요.');
		$('#newPwd').css('color', 'red');
	  }
   });

    //새 비밀번호 확인
    $("#newPasswordChk").blur(function() {
	 if ($('#newPassword').val() != $(this).val()) {
		$('#newPwdChk').text('비밀번호가 일치하지 않습니다.');
		$('#newPwdChk').css('color', 'red');
	 } else {	
		$('#newPwdChk').text('비밀번호가 일치합니다');
		$('#newPwdChk').css('color', 'blue');		
	 }

  });
	
 });
</script>
<%@include file="../common/header.jsp" %>
<body>
<form action="${pageContext.request.contextPath}/customer/changePasswordPro?${_csrf.parameterName}=${_csrf.token}" method="post" name="passwordChangeForm" onsubmit="return changePasswordFocus();">
  <input type="hidden" name="customer_id" value="${vo.getCustomer_id()}">
      <div class="title">비밀번호 변경</div>
        <div class="information_area">
          <p>DO YOU WANT TO CHANGE YOUR PASSWORD?</p>
             ${sessionScope.userSession}고객님의 변경하실 비밀번호를 입력해주세요.<br> 
               <input type="password" name="customer_pw" id="newPassword" placeholder="새 비밀번호" class="mb10" value="${vo.getCustomer_pw()}" >
               <div class="newPw"  id="newPwd"></div>
               <input type="password" name="customer_pw" id="newPasswordChk" placeholder="새 비밀번호 확인" class="mb10" value="${vo.getCustomer_pw()}" >
               <div class="newPwChk"  id="newPwdChk"></div>
               <div class="press">
               <button type="submit" id="btnPassword" class="btn-type btn2 blue mr_2">비밀번호 변경</button>
               <button type="reset" class="btn-type btn3 red mr_3">취소</button>
            </div>        
         </div>         
      </form> 
 <%@include file="../common/footer.jsp" %>
</body>
</html>
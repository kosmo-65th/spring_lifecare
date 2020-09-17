<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="${path_resources_customcss}joinIn.css">
<meta charset="UTF-8">
<title>회원가입</title>

</head>
<%@include file="../common/header.jsp" %>
<body>
<script src="${path_resources}setting/jquery-3.5.1.js"></script>
<script type="text/javascript">
	
	var hiddenId = "";
	
    var msg_pwdChk = "비밀번호가 일치하지 않습니다.";
      
    //모든 공백 체크 정규식
  	var empJ = /\s/g;
  	//아이디 정규식
  	var idJ = /^[a-z0-9]{4,12}$/;
  	// 비밀번호 정규식
  	var pwJ = /^[A-Za-z0-9]{4,12}$/; 
  	// 이름 정규식
  	var nameJ = /^[가-힣]{2,6}$/;
  	// 이메일 검사 정규식
  	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
  	// 휴대폰 번호 정규식
  	var phoneJ = /^[0-9]{10,11}$/;
  	
    
    function joinInFocus(){
	   if (document.joinInform.userPwd.value != document.joinInform.userRePwd.value){
			alert(msg_pwdChk);
			document.joinInform.userRePwd.value = "";
			document.joinInform.userRePwd.focus();
		    return false;			    
       }
	   if(!idJ.test(userId.value)){
    	   alert("아이디를 다시 확인해주세요 .");
    	   document.joinInform.userId.value = "";
		   document.joinInform.userId.focus();
		   return false;
	   } 
	   if(!nameJ.test(userName.value)){
    	   alert("이름을 다시 확인해주세요 .");
    	   document.joinInform.userName.value = "";
		   document.joinInform.userName.focus();
		   return false;
	   }
	   if(!mailJ.test(userEmail.value)){
    	   alert("이메일 정보를 다시 확인해주세요.");
    	   document.joinInform.userEmail.value = "";
		   document.joinInform.userEmail.focus();
		   return false;
	   }
	   if(!phoneJ.test(userPhone.value)){
    	   alert("휴대폰 정보를 다시 확인해주세요 .");
    	   document.joinInform.userPhone.value = "";
		   document.joinInform.userPhone.focus();
		   return false;
	   }
		// join - hiddenId : 중복확인 버튼 클릭여부 체크(0:클릭안함, 1:클릭함)
		if(document.joinInform.hiddenId.value == "0") {
		   alert("중복확인을 다시 확인해주세요 .");
		   document.joinInform.userId.value = "";
		   document.joinInform.userId.focus();
		   return false;
		}
		if(document.joinInform.hiddenPhone.value == "0") {
			alert("중복확인을 다시 확인해주세요 .");
			document.joinInform.userPhone.value = "";
			document.joinInform.userPhone.focus();
			return false;
		}
		if(document.joinInform.hiddenEmail.value == "0") {
			alert("중복확인을 다시 확인해주세요 .");
			document.joinInform.userEmail.value = "";
			document.joinInform.userEmail.focus();
			return false;
		}
		
    }	

    $(document).ready(function(){
    		
       //아이디 중복확인
   	   $("#userId").blur(function() {
 			var user_id = $('#userId').val();
 			$.ajax({
 				url : '${pageContext.request.contextPath}/user/JoinInForm?userId='+ user_id,
 				type : 'get',
 				success : function(result) {
 					console.log("1 = 중복o / 0 = 중복x : "+ result);							
 					if (result == '1') {
						$("#idChk").text("사용중인 아이디입니다.");
						$("#idChk").css("color", "red");
						document.joinInform.hiddenId.value = "0";
					} else {
						if(idJ.test(user_id)){			
							$("#idChk").text("사용가능한 아이디 입니다.");
							$("#idChk").css("color", "blue");
							document.joinInform.hiddenId.value = "1";
						} else if(user_id == ""){
							$('#idChk').text('아이디를 입력해주세요.');
							$('#idChk').css('color', 'red');
							document.joinInform.hiddenId.value = "0";			
						} else {								
							$('#idChk').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 ");
							$('#idChk').css('color', 'red');
							document.joinInform.hiddenId.value = "0";
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
   	  
   	 // 이메일 중복확인
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
   	 
       //비밀번호
	  $("#userPwd").blur(function() {
		  if (pwJ.test($(this).val())) {
				console.log('true');
				$("#pwChk").text('');
		} else {
			console.log('false');
			$('#pwChk').text('숫자 or 문자로만 4~12자리로 입력해주세요.');
			$('#pwChk').css('color', 'red');
		}
	 });

	
     //비밀번호 확인
	 $("#userRePwd").blur(function() {
		if ($('#userPwd').val() != $(this).val()) {
			$('#rePwChk').text('비밀번호가 일치하지 않습니다.');
			$('#rePwChk').css('color', 'red');
		} else {	
			$('#rePwChk').text('비밀번호가 일치합니다');
			$('#rePwChk').css('color', 'blue');		
		}

	 });

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
		
  });
    
</script>
   <form action="${pageContext.request.contextPath}/JoinInPro?${_csrf.parameterName}=${_csrf.token}" method="post" name="joinInform" onsubmit="return joinInFocus();">  
      <input type="hidden" name="hiddenId" value="0">
      <input type="hidden" name="hiddenPhone" value="0">
      <input type="hidden" name="hiddenEmail" value="0">
      <div class="title">회원가입</div>
        <div class="joinIn_area">
          <p>WELCOME TO LIFECARE</p>    
               <input type="text" name="customer_id"  id="userId" placeholder="아이디" class="mb10" value="" required>         
               <div class="idChk"  id="idChk"></div>              
               <input type="password" name="customer_pw" id="userPwd" placeholder="비밀번호" class="mb10" value="" required> 
               <div class="pwd"  id="pwChk"></div>
               <input type="password" name="customer_PwChk" id="userRePwd" placeholder="비밀번호확인" class="mb10" value="" required>  
               <div class="pwdChk" id="rePwChk"></div>  
               <input type="text" name="customer_name" id="userName" placeholder="이름" class="mb10" value="" required>
               <div class="name" id="nameChk"></div>
               <div align="center">
               <div style="border:1px solid #ccc; width:334.8px;height:90px; margin-bottom:10px;">  
               		<div style="margin-top:10px;">
               		성별을 선택해주세요.
               <select name="customer_gender" required id="sex" style="width:95px; margin-left:18px;"> 
	                <option value="여자">여자</option>
	                <option value="남자">남자</option>	                  
	           </select> 
	           		</div>
	           		<div style="margin-top:10px;"> 
	            	출생년도 선택해 주세요. 
               <select name="customer_year" required id="birthday">
               		 <option value="년도">-출생년도-</option> 
               		 <%for(int i=1910; i<=2002; i++) { %>
               		 <option value="<%=i%>"> <%=i+ "년" %></option>
               		 <%} %> 
               </select>
               		</div>
               	</div>
               </div>
               <input type="text" name="customer_phone" id="userPhone" placeholder="휴대폰 번호" class="mb10" value="" required>
               <div class="number" id="numberChk"></div>              
               <input type="text" name="customer_email" id="userEmail" placeholder="이메일 주소" class="mb10" value="" required>
               <div class="email" id="emailChk"></div>               
            <div class="press">
              <button type="submit" id="reg_submit" class="btn-type btn2 blue mr_2">회원가입</button>
              <button type="reset" class="btn-type btn3 red mr_2">취소</button>
          </div>
         </div>   
      </form>
   </body>
<%@include file="../common/footer.jsp" %>
</html>

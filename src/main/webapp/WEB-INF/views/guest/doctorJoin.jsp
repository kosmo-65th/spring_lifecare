<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="${path_resources_customcss}doctorJoin.css">
<meta charset="UTF-8">
<title>의사 회원가입</title>
</head>
<%@include file="../common/header.jsp" %>
<body>
<script src="${path_resources}setting/jquery-3.5.1.js"></script>
<script type="text/javascript">

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
	// 면허 번호 정규식
	var numJ = /^[0-9]{5,6}$/;
	
	
	function dJoinInFocus(){
	  if(document.joinInform.doctorPwd.value != document.joinInform.doctorRePwd.value){
		 alert(msg_pwdChk);
		 document.joinInform.doctorRePwd.value = "";
		 document.joinInform.doctorRePwd.focus();
		 return false;		
	  }
	  if(!idJ.test(doctorId.value)){
	   	    alert("아이디를 다시 확인해주세요 .");
	   	    document.joinInform.doctorId.value = "";
			document.joinInform.doctorId.focus();
			return false;   
	  }
	  if(!nameJ.test(doctorName.value)){
	   	    alert("이름을 다시 확인해주세요 .");
	   	    document.joinInform.doctorName.value = "";
			document.joinInform.doctorName.focus();
			return false;
	  }
	  if(!mailJ.test(doctorEmail.value)){
	   	     alert("이메일 정보를 다시 확인해주세요.");
	   	     document.joinInform.doctorEmail.value = "";
			 document.joinInform.doctorEmail.focus();
			   return false;
	   }
	   if(!phoneJ.test(doctorPhone.value)){
	   	     alert("휴대폰 정보를 다시 확인해주세요 .");
	   	     document.joinInform.doctorPhone.value = "";
			 document.joinInform.doctorPhone.focus();
			 return false;
	   }
	// join - hiddenId : 중복확인 버튼 클릭여부 체크(0:클릭안함, 1:클릭함)
		if(document.joinInform.hiddenId.value == "0") {
		   alert("아이디 중복확인을 다시 확인해주세요 .");
		   document.joinInform.doctorId.value = "";
		   document.joinInform.doctorId.focus();
		   return false;
		}
		if(document.joinInform.hiddenPhone.value == "0") {
			alert("휴대폰 번호를 다시 확인해주세요 .");
			document.joinInform.doctorPhone.value = "";
			document.joinInform.doctorPhone.focus();
			return false;
		}
		if(document.joinInform.hiddenEmail.value == "0") {
			alert("이메일을 다시 확인해주세요 .");
			document.joinInform.doctorEmail.value = "";
			document.joinInform.doctorEmail.focus();
			return false;
		}
  	
	}
	
	 $(document).ready(function(){
		 
		//의사 아이디 중복확인
	   	$("#doctorId").blur(function() {
	 		var doctor_id = $('#doctorId').val();
	 		$.ajax({
	 				url : '${pageContext.request.contextPath}/user/dJoinInForm?doctorId='+ doctor_id,
	 				type : 'get',
	 				success : function(result) {
	 					console.log("1 = 중복o / 0 = 중복x : "+ result);							
	 					if (result == '1') {
							$("#idChk").text("사용중인 아이디입니다.");
							$("#idChk").css("color", "red");
							document.joinInform.hiddenId.value = "0";
						} else {
							if(idJ.test(doctor_id)){			
								$("#idChk").text("사용가능한 아이디 입니다.");
								$("#idChk").css("color", "blue");
								document.joinInform.hiddenId.value = "1";
							} else if(doctor_id == ""){
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
		
	   	  // 의사 휴대전화 중복확인
	   	  $("#doctorPhone").blur(function() {
	 			var doctor_phone = $('#doctorPhone').val();
	 			$.ajax({
	 				url : '${pageContext.request.contextPath}/user/dJoinIn?doctorPhone='+ doctor_phone,
	 				type : 'get',
	 				success : function(result) {
	 					console.log("1 = 중복o / 0 = 중복x : "+ result);							
	 					if (result == '1') {
							$("#numberChk").text("사용중인 휴대폰 번호입니다.");
							$("#numberChk").css("color", "red");
							document.joinInform.hiddenPhone.value = "0";
						} else {
							if(phoneJ.test(doctor_phone)){
								// 0 : 아이디 길이 / 문자열 검사
								$("#numberChk").text("사용가능한 휴대폰 번호 입니다.");
								$("#numberChk").css("color", "blue");
								document.joinInform.hiddenPhone.value = "1";
							} else if(doctor_phone == ""){
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
	   	  
	   	  
	       // 의사 이메일 중복확인
	    	$("#doctorEmail").blur(function() {
	  			var doctor_email = $('#doctorEmail').val();
	  			$.ajax({
	  				url : '${pageContext.request.contextPath}/user/dEmail?doctorEmail='+ doctor_email,
	  				type : 'get',
	  				success : function(result) {
	  					console.log("1 = 중복o / 0 = 중복x : "+ result);							
	  					if (result == '1') {
	 						$("#emailChk").text("사용중인 이메일 주소 입니다.");
	 						$("#emailChk").css("color", "red");
	 						document.joinInform.hiddenEmail.value = "0";
	 					} else {
	 						if(mailJ.test(doctor_email)){
	 							// 0 : 아이디 길이 / 문자열 검사
	 							$("#emailChk").text("사용가능한 이메일 주소 입니다.");
	 							$("#emailChk").css("color", "blue");
	 							document.joinInform.hiddenEmail.value = "1";
	 			
	 						} else if(doctor_email == ""){
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
	       
	    	// 의사 면허 중복확인
	    	$("#doctorNum").blur(function() {
	  			var doctor_num = $('#doctorNum').val();
	  			$.ajax({
	  				url : '${pageContext.request.contextPath}/user/dNum?doctorNum='+ doctor_num,
	  				type : 'get',
	  				success : function(result) {
	  					console.log("1 = 중복o / 0 = 중복x : "+ result);							
	  					if (result == '1') {
	 						$("#numChk").text("사용중인 면허번호 입니다.");
	 						$("#numChk").css("color", "red");
	 						document.joinInform.hiddenNum.value = "0";
	 					} else {
	 						if(numJ.test(doctor_num)){
	 							// 0 : 아이디 길이 / 문자열 검사
	 							$("#numChk").text("사용가능한 면허번호 입니다.");
	 							$("#numChk").css("color", "blue");
	 							document.joinInform.hiddenNum.value = "1";
	 			
	 						} else if(doctor_num == ""){
	 							$('#numChk').text('면허번호을 입력해주세요.');
	 							$('#numChk').css('color', 'red');
	 							document.joinInform.hiddenNum.value = "0";		
	 						} else {								
	 							$('#numChk').text("10글자 내로 입력해 주세요.");
	 							$('#numChk').css('color', 'red');
	 							document.joinInform.hiddenNum.value = "0";
	 						}
	 					}
	 				}, error : function() {
	 						console.log("실패");
	 				}

	 			});
	        }); 
	          
	      //비밀번호
	  	  $("#doctorPwd").blur(function() {
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
	  	 $("#doctorRePwd").blur(function() {
	  		if ($('#doctorPwd').val() != $(this).val()) {
	  			$('#rePwChk').text('비밀번호가 일치하지 않습니다.');
	  			$('#rePwChk').css('color', 'red');
	  		} else {	
	  			$('#rePwChk').text('비밀번호가 일치합니다');
	  			$('#rePwChk').css('color', 'blue');		
	  		}

	  	 });

	  	//이름
	  	$("#doctorName").blur(function() {
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
	<form action="${pageContext.request.contextPath}/insertDoctor?${_csrf.parameterName}=${_csrf.token}" method="post" name="joinInform" enctype="multipart/form-data" onsubmit="return dJoinInFocus();">
	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	 <input type="hidden" name="hiddenId" value="0">
     <input type="hidden" name="hiddenPhone" value="0">
     <input type="hidden" name="hiddenEmail" value="0">
     <input type="hidden" name="hiddenNum" value="0">
	    <div class="title">의사 회원가입</div>
        	<div class="djoinIn_area">
          		<p>WELCOME TO LIFECARE</p>
	               <input type="text" name="doctor_id"  id="doctorId" placeholder="아이디" class="mb10" value="" required>
	               <div class="idChk"  id="idChk"></div>    
	               <input type="password" name="doctor_pw" id="doctorPwd" placeholder="비밀번호" class="mb10" value="" required>
	               <div class="pwd"  id="pwChk"></div>
	               <input type="password" name="doctor_rePw" id="doctorRePwd" placeholder="비밀번호확인" class="mb10" value="" required> 
	               <div class="pwdChk" id=rePwChk></div>      
	               <input type="text" name="doctor_name" id="doctorName" placeholder="이름" class="mb10" value="" required>
	               <div class="dNameChk" id=nameChk></div> 
	               <input type="text" name="doctor_num" id="doctorNum" placeholder="의사면허번호를 입력해주세요." class="mb10" value="" required> 
	               <div class="numberChk" id=numChk></div>    
	               <input type="text" name="doctor_phone" id="doctorPhone" placeholder="휴대폰 번호" class="mb10" value="" required> 
	               <div class="number" id=numberChk></div>         
	               <input type="text" name="doctor_email" id="doctorEmail" placeholder="이메일 주소" class="mb10" value="" required>
	               <div class="email" id=emailChk></div>
	               <div align="center">
               <div style="border:1px solid #ccc; width:100%;height:90px; margin-bottom:10px;">  
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
	               
	               <h3>프로필 사진을 올려주세요.</h3>       
	               <input type="file" name="doctor_faceimg" id="img" required>
	               <img src="resources/upload/${vo.filename2 }" width="400" height="200">
	               <h3>전공을 클릭해서 선택해 주세요.</h3>      
	               <select  name="doctor_major" required id="major" >
	                   <option value="내과">내과</option>
	                   <option value="외과">외과</option>
	                   <option value="정신과">정신과</option>
	                   <option value="신경과">신경과</option>
	                   <option value="산부인과">산부인과</option>
	                   <option value="비뇨기과">비뇨기과</option>
	                   <option value="안과">안과</option>     
	               </select>
	               <h3>직책을 클릭해서 선택해 주세요.</h3>        
	               <select name="doctor_position" required id="position">  
	                   <option value="인턴">인턴</option>
	                   <option value="레지던트">레지던트</option>
	                   <option value="펠로우">펠로우</option>
	                   <option value="부교수">부교수</option>
	                   <option value="정교수">정교수</option>   
	               </select>        
           	 <div class="press">
	              <button type="submit" class="btn-type btn2 blue mr_2">승인 요청</button>
	              <button type="reset" class="btn-type btn3 red mr_2">취소</button>
            </div>
         </div> 
    </form>
</body>
<%@include file="../common/footer.jsp" %>
</html>
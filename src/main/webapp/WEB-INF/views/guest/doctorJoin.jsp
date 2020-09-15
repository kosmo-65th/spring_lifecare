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
	<form action="" method="post" name="joinInform" onsubmit="">
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
	               <input type="text" name="doctor_num" id="doctorNum" placeholder="의사면허번호를 입력해주세요." class="mb10" value="" required>     
	               <input type="text" name="doctor_phone" id="" placeholder="휴대폰 번호" class="mb10" value="" required> 
	               <div class="number" id=numberChk></div>         
	               <input type="text" name="doctor_email" id="" placeholder="이메일 주소" class="mb10" value="" required>
	               <div class="email" id=emailChk></div>
	               <h3>프로필 사진을 올려주세요.</h3>           
	               <input type="file" name="doctor_faceimg" id="img" placeholder="" required>
	               <h3>전공을 선택해 주세요.</h3> 
	               <select required id="major">
	                   <option></option>
	                   <option></option>
	                   <option></option>
	                   <option></option>
	                   <option></option>
	                   <option></option>
	                   <option></option>     
	               </select>
	               <h3>직책을 선택해 주세요.</h3>        
	               <input type="text" name="doctor_position" id="" placeholder="직책을 입력해주세요." class="mb10" value="" required >          
           	<div class="press">
	              <button type="submit" class="btn-type btn2 blue mr_2">승인 요청</button>
	              <button type="reset" class="btn-type btn3 red mr_2">취소</button>
            </div>
         </div> 
    </form>
</body>
<%@include file="../common/footer.jsp" %>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<link type="text/css" rel="stylesheet" href="${path_resources}css/mypage.css">
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<br><br>
	<div class="body">
    <div class="infoWrap">
       <p class="myThumb"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/img_member_default.gif"></p>
       <div class="myInfo">
           <strong class="id"><span>${sessionScope.userSession}</span></strong>님 저희 LIFECARE를 이용해 주셔서 감사합니다.
           <p>원하시는 메뉴를 선택해주세요.</p>
       </div>
    </div>
    
    <br><br><br><br>
     
    <div class="shopMain_left">
    
		<div class="shopMain">
	        <h3><a href="${pathA}/user/cartList"><strong>CONFIRM</strong> 예약 조회</a></h3>
	        <p><a href="${pathA}/user/cartList">고객님께서 예약하셨던 예약내역을 보여드립니다.</a></p>
	    </div>
	      
	    <div class="shopMain">
	        <h3><a href="${pathA}/user/cartList"><strong>DIAGNOSIS</strong> 진료결과 조회</a></h3>
	        <p><a href="${pathA}/user/cartList">고객님께서 진료받으셨던 진료내역 목록을 보여드립니다.</a></p>
	    </div>  
	    
	    <div class="shopMain">
	        <h3><a href="${pathA}/user/orderList"><strong>PRESCRIPTION</strong> 처방내역 조회</a></h3>
	        <p><a href="${pathA}/user/orderList">고객님께서 처방받으셨던 처방내역 목록을 보여드립니다.</a></p>
	    </div>
	    
	     <div class="shopMain">
	        <h3><a href="${path}/customer/payment"><strong>PAYMENT</strong> 결제내역 조회</a></h3>
	        <p><a href="${path}/customer/payment">고객님의 결제정보를 관리하는 공간입니다.</a></p>
	    </div> 
	    
    </div>
       
    <div class="shopMain_right">
    
	    <div class="shopMain">
	        <h3><a href="${pathA}/user/myPage_board"><strong>Q&A</strong> 게시판 관리</a></h3>
	        <p><a href="${pathA}/user/myPage_board">고객님께서 궁금하던 사항을 질문할 수 있는 게시물 공간입니다.<br>고객님께서 질문하신 게시물을 한눈에 확인할 수 있습니다.</a></p>
	    </div>
	    
	    <div class="shopMain">
	        <h3><a href="${path}/customer/modify"><strong>PROFILE</strong> 회원 정보</a></h3>
	        <p><a href="${path}/customer/modify">회원이신 고객님의 개인정보를 관리하는 공간입니다.</a></p>
	    </div>
	    
	     <div class="shopMain">
	        <h3><a href="${path}/customer/preChangePassword"><strong>Password change</strong> 비밀번호 변경</a></h3>
	        <p><a href="${path}/customer/preChangePassword">고객님의 비밀번호를 변경합니다.. </a></p>
	    </div>   
	    
	    <div class="shopMain">
	        <h3><a href="${pathA}/user/deleteForm.do"><strong>Membership Withdrawal</strong> 회원탈퇴</a></h3>
	        <p><a href="${pathA}/user/deleteForm.do">고객님께서 가입하셨던 ID 및 이름 등의 정보가 모두 사라집니다. </a></p>
	    </div>  
	    
    </div>
    </div>
	<%@include file="../common/footer.jsp"%>
	
</body>
</html>
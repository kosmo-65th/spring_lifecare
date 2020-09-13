<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %> 
   <!-- Basic -->
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <!-- Mobile Metas -->
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="viewport" content="initial-scale=1, maximum-scale=1">
   <!-- Site Metas -->
   <title>Life Care</title>
   <meta name="keywords" content="">
   <meta name="description" content="">
   <meta name="author" content="">
   <!-- CSS -->
   <link rel="stylesheet" href="${path_resources_lifecare}css/bootstrap2.min.css">
   <link rel="stylesheet" href="${path_resources_lifecare}style2.css">
   <link rel="stylesheet" href="${path_resources_lifecare}css/colors.css">
   <link rel="stylesheet" href="${path_resources_lifecare}css/versions.css">
   <link rel="stylesheet" href="${path_resources_lifecare}css/responsive.css">
   <link rel="stylesheet" href="${path_resources_lifecare}css/custom.css">
   <link rel="stylesheet" href="${path_resources_lifecare}css/pbor.css">
   <!-- CSS -->
   
   <!-- jQuery 추가 -->
   <script src="${path_resources}setting/jquery-3.5.1.js"></script>
   
   <!-- 팝업창 띄우는 자바스크립트 -->
    <script type="text/javascript">
		function getCookie(name) {
	    	var cookie = document.cookie;
	    	if (document.cookie != "") {
	         	var cookieArray = cookie.split("; ");
	         	for ( var index in cookieArray) {
	            	var cookieName = cookieArray[index].split("=");
	            	if (cookieName[0] == "popupYN") {
	                	return cookieName[1];
	             	}
	         	}
	    	} return ;    
		}
		
		$(document).ready(function(){
			popUp();
		});
	 
		function popUp() {
	    	var cookieCheck = getCookie("popupYN");
	    	if (cookieCheck != "N"){
	         	window.open('${path}/popup', 'newpop', 'width=630,height=570,left=0,top=0');
	    	}
		}
		
		</script>
	
   <!-- [if lt IE 9] -->
   </head>
   <body class="clinic_version">
      <!-- LOADER -->
      <div id="preloader">
         <img class="preloader" src="${path_resources_lifecare}images/loaders/heart-loading2.gif" alt="">
      </div>
      <!-- END LOADER -->
      <%@include file="../common/header.jsp" %>
      <div id="home" class="parallax first-section wow fadeIn" style="background-image:url('${path_resources_lifecare}images/slider-bg.png');">
         <div class="container" style="background: white;">
         
      		<div class="boxTypeGray paRightsImg bgType05"> 
      		<strong class="boxTit">life-care는</strong>
				<p> <span class="colorPoint">환자중심, 인간존중, 지식창조, 사회봉사</span> 라는  경영이념을 통해 신체적/정신적 어려움으로 병원을 찾는 <br> <span class="colorPoint">모든 환자의 권리를 존중</span>하고,&nbsp;
				<span class="colorPoint">최선의 진료를 제공</span>하기 위하여 다음과 같이 선언한다.</p> 
			</div> 
				<ul class="listText col2">
					<li> 
						<div class="title"><i>01</i>존엄의 권리</div> 
						<p> 환자는 존엄한 인간으로서 예우받을 권리가 있다. </p>
					</li>
					<li> 
						<div class="title"><i class="colorPoint03">02</i>평등의 권리</div> 
						<p>환자는 성별, 연령, 종교 또는 사회적 신분을 떠나 평등한 진료를 받을 권리가 있다.</p>
					</li> 
					<li> 
						<div class="title"><i>03</i>설명을 들을 권리</div> 
						<p>환자는 의료진으로부터 질병의 진단, 치료계획, 결과, 예후에 대한 설명을 들을 권리가 있다.</p>
					</li> 
					<li> 
						<div class="title"><i class="colorPoint03">04</i>개인신상 비밀을 보호받을 권리</div> 
						<p>환자는 진료내용, 신체의 비밀 및 개인생활의 비밀을 보호받을 권리가 있다.</p>
					</li> 
				</ul>
		</div>
      </div>
      <%@include file="../common/chatbot.jsp"%>
      <%@include file="../common/footer.jsp" %>
      <!-- end copyrights -->
      <a href="#home" data-scroll class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>
      <!-- all js files -->
      <script src="${path_resources_lifecare}js/all.js"></script>
      <!-- all plugins -->
      <script src="${path_resources_lifecare}js/custom.js"></script>
      <!-- map -->
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNUPWkb4Cjd7Wxo-T4uoUldFjoiUA1fJc&callback=myMap"></script>
   </body>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %> 

<!-- jsoup 웹 크롤링  -->
<%@ page import="org.jsoup.Jsoup"%>
<%@ page import="org.jsoup.nodes.Document"%>
<%@ page import="org.jsoup.nodes.Element"%>
<%@ page import="org.jsoup.select.Elements"%>
<%@ page import="java.util.Iterator"%>
<!-- jsoup 웹 크롤링  -->
<!DOCTYPE html>
<html>
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
   <link type="text/css" rel="stylesheet" href="${path_resources_customcss}findWay.css">
   
   <!-- 코로나 css -->
   <link rel="stylesheet" href="${path_resources}css/covid19css.css">
   <link rel="stylesheet" href="${path_resources}css/covid19_3css.css">
   <!-- 코로나 css -->
   
   <!-- CSS -->
   
   <!-- 코로나  js -->
   <script src="${path_resources}js/covid19_3.js"></script> 
   <script src="${path_resources}js/covid19_1.js"></script>
   <script src="${path_resources}js/covid19_2.js"></script>
   <script src="${path_resources}js/covid19_4.js"></script> 
   <script src="${path_resources}js/covid19_5.js"></script>
   <script src="${path_resources}js/covid19_6.js"></script>
   <!-- 코로나  js -->
   
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
	         	window.open('${path}/popup', 'newpop', 'left=0,top=0,width=630,height=570,directoryies=no,titlebar=no');
	    	}
		}
		
		$(function(){
			$('#abc').hide();	
		})
		
		
		</script>
		<!-- 코로나 데이터 크롤링 -->
		<%
		 	Document doc2 = Jsoup.connect("http://ncov.mohw.go.kr/").get();
			
			Elements posts1 = doc2.body().getElementsByClass("regional_patient_status_A");
			Elements posts2 = doc2.body().getElementsByClass("live_left");
			
		%>
		<!-- 코로나 데이터 크롤링 -->
		
   <!-- [if lt IE 9] -->
   <body class="clinic_version">
      <!-- LOADER -->
      <div id="preloader">
         <img class="preloader" src="${path_resources_lifecare}images/loaders/heart-loading2.gif" alt="">
      </div>
      <!-- END LOADER -->
      <%@include file="./common/header.jsp" %>
      <div id="home" class="parallax first-section wow fadeIn" style="background-image:url('${path_resources_lifecare}images/slider-bg.png');">
         <div class="container">
            <div class="row">
               <div class="col-md-12 col-sm-12">
                  <div class="text-contant">
                     <h2>
                        <span class="center"><span class="icon"><img src="${path_resources_lifecare}images/icon-logo.png" /></span></span>
                        <a href="" class="typewrite" data-period="2000" data-type='[ "Welcome to life care", "Take care of you", "Hospital for you" ]'>
                        <span class="wrap"></span>
                        </a>
                     </h2>
                  </div>
               </div>
            </div>
            <!-- end row -->
         </div>
         <!-- end container -->
      </div>
      <!-- end section -->
      <div id="time-table" class="time-table-section">
         <div class="container">
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
               <div class="row">
                  <div class="service-time one" style="background:#2895f1;">
                     <span class="info-icon"><i class="fa fa-ambulance" aria-hidden="true"></i></span>
                     <h3>응급 상황</h3>
                     <p>우리가 홈런에 합당하다고 생각하는 것처럼, 아첨으로 이러한 고통의 시급함과 볼타의 질량뿐만 아니라 그는</p>
                  </div>
               </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
               <div class="row">
                  <div class="service-time middle" style="background:#0071d1; height:380px;">
                     <span class="info-icon"><i class="fa fa-clock-o" aria-hidden="true"></i></span> 
                     <h3>근무 시간</h3>
                     <div class="time-table-section">
                        <ul>
                           <li><span class="left">월요일 - 금요일</span><span class="right">8.00 – 18.00</span></li>
                           <li><span class="left">토요일</span><span class="right">8.00 – 16.00</span></li>
                           <li><span class="left">일요일</span><span class="right">8.00 – 13.00</span></li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
               <div class="row">
                  <div class="service-time three" style="background:#0060b1;">
                     <span class="info-icon"><i class="fa fa-hospital-o" aria-hidden="true"></i></span>
                     <h3>클리닉 시간표</h3>
                     <p>우리가 홈런에 합당하다고 생각하는 것처럼, 아첨으로 이러한 고통의 시급함과 볼타의 질량뿐만 아니라 그는.</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div align="center" style="margin:40px;">
      <div style="width:75%;">
      <div style="border-bottom:1px solid #000; background-color:#E0ECF8;">
      	<p style="font-size:30px;">실시간 코로나19(COVID-19) 현황</p>
      </div>
	      <div align="right"> 
	      	<a href="${path}/covid19" style="color:gray;">코로나 정보 상세보기 >></a>
	      </div>
      </div>
		<%= posts1 %>
		<div id="abc"> 
		<%= posts2 %>
		</div>
	  </div>
      
      <br>
      <div style="margin-top:50px;"></div>
      <div id="map" style="width:47%;height:500px; margin:0 auto;"></div>
      <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a4dcbf8bd992d42aecc63827327a181&libraries=services"></script>
      <script>
	       var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	         mapOption = { 
	            center: new kakao.maps.LatLng(37.478845,126.878594), // 지도의 중심좌표
	            level: 3 // 지도의 확대 레벨
	         };
	
	  		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	  		// 마커가 표시될 위치
	  		var markerPosition  = new kakao.maps.LatLng(37.478845,126.878594); 
	
	  		// 마커를 생성
	  		var marker = new kakao.maps.Marker({
	     	position: markerPosition
	  		});
	
	  		marker.setMap(map);
      </script>  
        <br>
       <div style="width:47%; margin:0 auto;">
        <img src="${path_resources }img/LFMAP.JPG" >
  		 </div>
      <%@include file="./common/footer.jsp" %>
      <!-- end copyrights -->
      <!-- all js files -->
      <script src="${path_resources_lifecare}js/all.js"></script>
      <!-- all plugins -->
      <script src="${path_resources_lifecare}js/custom.js"></script>
      <!-- map -->
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNUPWkb4Cjd7Wxo-T4uoUldFjoiUA1fJc&callback=myMap"></script>
     <script>
     $(function(){
    	 
			//검사현황
			IS_data = {
			    label: ["결과음성", "검사중", "결과양성"],
			    figure: [parseInt("2,179,452".replace(",")), parseInt("24,274".replace(",")), parseInt("22,975".replace(","))]
			};
			
			//전국 파이
			RPR_A_MAIN_data = {
				label : ["대구","기타","서울","경기","경북"],
				figure : [7124,5212,4972,4156,1511]
			};
			
			//WPS
			WPS_data = {
			    date: ["09.14","09.15","09.16","09.17","09.18","09.19","09.20"],
			    complete_day:[263,389,432,233,228,199,188],
			    confirm_day:[109,106,113,153,126,110,82],
			   //cure_total:[3433,3146,2827,2742,2635,2545,2434],
			   //complete_total:[18489,18878,19310,19543,19771,19970,20158]
			};
			
			ISChart();
			WPSChart();
			RPRAMainChart();		
			RPSAChart();
			RPSACityRatio();
		});
     </script>
   </body>
   </html>

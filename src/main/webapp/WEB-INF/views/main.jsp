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
   
   <!-- Site Icons -->
   <link rel="shortcut icon" href="${path3}images/fevicon.ico.png" type="image/x-icon" />
   <link rel="apple-touch-icon" href="${path3}images/apple-touch-icon.png">
   <!-- Site Icons -->
   <!-- CSS -->
   <link rel="stylesheet" href="${path3}css/bootstrap2.min.css">
   <link rel="stylesheet" href="${path3}style2.css">
   <link rel="stylesheet" href="${path3}css/colors.css">
   <link rel="stylesheet" href="${path3}css/versions.css">
   <link rel="stylesheet" href="${path3}css/responsive.css">
   <link rel="stylesheet" href="${path3}css/custom.css">
   <!-- CSS -->
   
   <!-- Modernizer for Portfolio -->
   <script src="${path3}js/modernizer.js"></script>
   <!-- [if lt IE 9] -->
   </head>
   <body class="clinic_version">
      <!-- LOADER -->
      <div id="preloader">
         <img class="preloader" src="${path3}images/loaders/heart-loading2.gif" alt="">
      </div>
      <!-- END LOADER -->
      <header>
      	<%@include file="header.jsp" %>
      </header>
      <div id="home" class="parallax first-section wow fadeIn" data-stellar-background-ratio="0.4" style="background-image:url('${path3}images/slider-bg.png');">
         <div class="container">
            <div class="row">
               <div class="col-md-12 col-sm-12">
                  <div class="text-contant">
                     <h2>
                        <span class="center"><span class="icon"><img src="${path3}images/icon-logo.png" alt="#" /></span></span>
                        <a href="" class="typewrite" data-period="2000" data-type='[ "Welcome life care", "Take care of you", "Hospital for you" ]'>
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
                  <div class="service-time middle" style="background:#0071d1;">
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
      <%@include file="footer.jsp" %>
      <!-- end copyrights -->
      <a href="#home" data-scroll class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>
      <!-- all js files -->
      <script src="${path3}js/all.js"></script>
      <!-- all plugins -->
      <script src="${path3}js/custom.js"></script>
      <!-- map -->
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNUPWkb4Cjd7Wxo-T4uoUldFjoiUA1fJc&callback=myMap"></script>
   </body>
</html>

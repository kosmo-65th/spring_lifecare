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
   <link rel="stylesheet" href="${path_resources_lifecare}style1.css">
   
   	<link rel="stylesheet" href="${path_resources}asset/base.min.css">
	<link rel="stylesheet" href="${path_resources}asset/common.min.css">
	<link rel="stylesheet" href="${path_resources}asset/content.min.css">
	<link rel="stylesheet" href="${path_resources}asset/notosanskr.min.css">
	
   <link rel="stylesheet" href="${path_resources_lifecare}css/colors.css">
   <link rel="stylesheet" href="${path_resources_lifecare}css/versions.css">
   <link rel="stylesheet" href="${path_resources_lifecare}css/responsive.css">
   <link rel="stylesheet" href="${path_resources_lifecare}css/custom.css">
   <link rel="stylesheet" href="${path_resources_lifecare}css/pbor.css">
   <!-- CSS -->
   
   <style>
   
   	.d {
	   	visibility: visible;
		color: #000;
		font-size: 16px;
		word-spacing: 0;
		letter-spacing: -.5px;
		vertical-align: baseline;
		padding: 0;
		border-radius: 0;
		-webkit-font-smoothing: antialiased;
		text-size-adjust: none;
		list-style: none;
		-webkit-tap-highlight-color: transparent;
		font-family: 'Noto Sans KR Regular','Noto Sans CJK KR','Noto Sans KR','맑은 고딕',sans-serif;
		font-weight: 400;
		outline: 0!important;
		position: relative;
		margin: 0 0 15px;
		padding-left: 18px;
		word-break: keep-all;
		
   	}
   	.division{
   		visibility: visible;
		font-size: 16px;
		word-spacing: 0;
		letter-spacing: -.5px;
		color: #666;
		vertical-align: baseline;
		padding: 0;
		border-radius: 0;
		-webkit-font-smoothing: antialiased;
		text-size-adjust: none;
		list-style: none;
		-webkit-tap-highlight-color: transparent;
		font-family: 'Noto Sans KR Regular','Noto Sans CJK KR','Noto Sans KR','맑은 고딕',sans-serif;
		font-weight: 400;
		outline: 0!important;
		position: relative;
		padding-left: 18px;
		word-break: keep-all;
		margin: 0 0 5px;
   	
   	}
   	em {
   		visibility: visible;
		color: #000;
		font-size: 16px;
		word-spacing: 0;
		letter-spacing: -.5px;
		word-break: keep-all;
		vertical-align: baseline;
		margin: 0;
		padding: 0;
		border-radius: 0;
		-webkit-font-smoothing: antialiased;
		text-size-adjust: none;
		list-style: none;
		-webkit-tap-highlight-color: transparent;
		font-family: 'Noto Sans KR Regular','Noto Sans CJK KR','Noto Sans KR','맑은 고딕',sans-serif;
		font-weight: 400;
		font-style: normal;
		outline: 0!important;
		position: absolute;
		top: 0;
		left: 0;
   	
   	}
   </style>
   
   
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
      <div class="ul" style="background-image:url('${path_resources_lifecare}images/slider-bg.png') !important; ">
      	<div class="container" style="background-color: white; padding: 20px">
      	<br><br><br>
      		<h3 style="font-size: 30px;">비공개대상자료 : 공공기관의 정보공개에 관한 법률 9조 1항 준용</h3> 
			<ol> 
			<li class="d"><em>1.</em> 다른법률또는법률에서위임한명령(국회규칙&middot;대법원규칙&middot;헌법재판소규칙&middot;중앙선거관리위원회규칙&middot;대통령령및조례로한정한다)에따라비밀이나비공개사항으로규정된정보</li> 
			<li class="d"><em>2.</em> 국가안전보장&middot;국방&middot;통일&middot;외교관계 등에 관한 사항으로서 공개될 경우 국가의 중대한 이익을 현저히 해칠 우려가 있다고 인정되는 정보</li> 
			<li class="d"><em>3.</em> 공개될 경우 국민의 생명&middot;신체 및 재산의 보호에 현저한 지장을 초래할 우려가 있다고 인정되는 정보</li> 
			<li class="d"><em>4.</em> 진행 중인 재판에 관련된 정보와 범죄의 예방, 수사, 공소의 제기 및 유지, 형의 집행, 교정(矯正), 보안처분에 관한 사항으로서 공개될 경우 그 직무수행을 현저히 곤란하게 하거나 형사피고인의 공정한 재판을 받을 권리를 침해한다고 인정할 만한 상당한 이유가 있는 정보</li> 
			<li class="d"><em>5.</em> 감사&middot;감독&middot;검사&middot;시험&middot;규제&middot;입찰계약&middot;기술개발&middot;인사관리에 관한 사항이나 의사결정 과정 또는 내부검토 과정에 있는 사항 등으로서 공개될 경우 업무의 공정한 수행이나 연구&middot; 개발에 현저한 지장을 초래한다고 인정할 만한 상당한 이유가 있는 정보. 다만, 의사결정 과정 또는 내부검토 과정을 이유로 비공개할 경우에는 의사결정 과정 및 내부검토 과정이 종료되면 제10조에 따른 청구인에게 이를 통지하여야 한다.</li> 
			<li class="d"><em>6.</em> 해당 정보에 포함되어 있는 성명&middot;주민등록번호 등 개인에 관한 사항으로서 공개될 경우 사생활의 비밀 또는 자유를 침해할 우려가 있다고 인정되는 정보. 다만, 다음 각 목에 열거한 개인에 관한 정보는 제외한다. 
			
			<ol class="division"> 
			<li class="d"><em>가.</em> 법령에서 정하는 바에 따라 열람할 수 있는 정보 </li> 
			<li class="d"><em>나.</em> 공공기관이 공표를 목적으로 작성하거나 취득한 정보로서 사생활의 비밀 또는 자유를 부당하게 침해하지 아니하는 정보 </li> 
			<li class="d"><em>다.</em> 공공기관이 작성하거나 취득한 정보로서 공개하는 것이 공익이나 개인의 권리 구제를 위하여 필요하다고 인정되는 정보 </li> 
			<li class="d"><em>라.</em> 직무를 수행한 공무원의 성명&middot;직위 </li> 
			<li class="d"><em>마.</em> 공개하는 것이 공익을 위하여 필요한 경우로서 법령에 따라 국가 또는 지방자치 단체가 업무의 일부를 위탁 또는 위촉한 개인의 성명&middot;직업</li> 
			</ol>
			</li>
			 
			<li class="d"><em>7.</em> 법인&middot;단체 또는 개인(이하 "법인등"이라 한다)의 경영상&middot;영업상 비밀에 관한 사항으로서 공개될 경우 법인등의 정당한 이익을 현저히 해칠 우려가 있다고 인정되는 정보. 다만, 다음 각 목에 열거한 정보는 제외한다. 
			<ol> 
			<li class="d"><em>가.</em> 사업활동에 의하여 발생하는 위해(危害)로부터 사람의 생명&middot;신체 또는 건강을 보호 하기 위하여 공개할 필요가 있는 정보 </li> 
			<li class="d"><em>나.</em> 위법&middot;부당한 사업활동으로부터 국민의 재산 또는 생활을 보호하기 위하여 공개할 필요가 있는 정보</li> 
			</ol> </li> 
			<li><em>8.</em> 공개될 경우 부동산 투기, 매점매석 등으로 특정인에게 이익 또는 불이익을 줄 우려가 있다고 인정되는 정보</li> 
			</ol>
		 </div>
      </div>
      <%@include file="../common/chatbot.jsp"%>
      <%@include file="../common/footer.jsp"%>
      <!-- end copyrights -->
      <a href="#home" data-scroll class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>
      <!-- all js files -->
      <script src="${path_resources_lifecare}js/all.js"></script>
      <!-- all plugins -->
      <script src="${path_resources_lifecare}js/custom.js"></script>
      <!-- map -->
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNUPWkb4Cjd7Wxo-T4uoUldFjoiUA1fJc&callback=myMap"></script>
   </body>

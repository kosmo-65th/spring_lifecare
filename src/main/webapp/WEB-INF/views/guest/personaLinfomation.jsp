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
   <style type="text/css">
		ul {
		  margin: 0px;
		  padding: 0px;
		  width:1000px;
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
      	<div class="container" id="overflow" style="background-color: white; padding: 20px;">
      	
			
			<h2 style="font-size: 40px;">개인정보처리방침</h2>
			
			<p class="privacyIntro">서울대학교병원은 개인정보 보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 <br>
			처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.<br>
			 서울대학교병원은 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.<br>
			 본 방침은<span class="b">&nbsp;2020년 6월 30일</span>부터 새롭게 시행됩니다.&nbsp;</p>
			<div class="contTitleWrap"> 
			<h3>제1조(개인정보의 처리 목적)</h3></div>
			<div class="contTextWrap"> 
			<p>서울대학교병원은 개인정보를 다음의 목적을 위해 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 사용되지 않으며, 처리 목적이 변경될 시에는 개인정보 보호법 제18조에 따라 필요한 조치를 이행할 예정입니다.<br>
			 <br></p></div>
			<div class="contTextWrap"><strong>가. 홈페이지 회원가입 및 관리</strong></div>
			<p>회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별&middot;인증, 회원자격 유지&middot;관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지, 만14세 미만 아동 개인정보 수집 시 법정대리인 동의 여부 확인, 각종 고지&middot;통지, 고충처리, 분쟁 조정을 위한 기록 보존, 서비스 이용에 대한 통계 수집 등을 목적으로 홈페이지 회원 가입시 및 서비스 제공시 수집하여 개인정보를 처리합니다.</p>
			<div class="contTextWrap"><strong><br> 나. 진료서비스제공</strong></div>
			<ul class="listType01 colorType01"> 
			<li class="b">진료 및 입원, 검진 예약, 예약 조회 및 기타 진료 서비스 이용에 따른 본인 확인과 안내 절차에 사용</li> 
			<li class="b">진료 예약 및 검사 예약 일정에 대한 고지 서비스</li> 
			<li class="b">진료비 계산서, 진료비 내역서, 제증명 및 검진 관련 물품의 발송</li> 
			<li class="b">병원에서 발행하는 각종 행사 소식지, 진료 정보 및 임상연구정보 제공</li> 
			<li class="b">고충 민원 상담 및 회신 서비스 및 불만처리 등을 위한 원활한 의사소통 경로 확보</li> 
			<li class="b">진단 및 치료를 위한 진료 서비스와 진료비 청구, 수납, 환급 등의 원무 서비스 제공</li> 
			<li class="b">진료 및 업무, 교육, 연구, 통계, 환자서비스에 필요한 최소한의 분석 자료</li> 
			<li class="b">온라인 수탁검사 및 임상시험 심사를 위한 기초 자료</li> 
			<li class="b">진료의뢰 또는 회송병원 의료인이 진료를 위한 목적으로 요청 시 진료정보 제공</li> 
			<li class="b">기타 진료와 관련된 서비스</li> 
			</ul>
			<div class="contTextWrap"><strong><br> 다.개인건강기록서비스 (SNUH myCare)&nbsp;</strong></div>
			<ul class="listType01 colorType01"> 
			<li class="b">서비스 제공, 본인인증 등을 목적으로 개인정보를 처리합니다.</li> 
			<li class="b">애플리케이션을 통한 진료이력조회, 검사결과조회, 건강수첩(운동, 체중, 혈압, 혈당), 투약시간알림 기능 제공<br>
			 <br></li> 
			</ul>
			<div class="contTextWrap"><strong>라. 민원사무처리</strong></div>
			<p>민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락&middot;통지, 처리결과 통보 등을 목적으로 개인정보를 처리합니다.<br>
			 <br></p>
			<div class="contTextWrap"><strong>마. 재화 또는 서비스 제공</strong></div>
			<p>서비스 제공, 콘텐츠 제공, 맞춤 서비스 제공, 본인인증, 연령인증 등을 목적으로 개인정보를 처리합니다.<br>
			 <br></p>
			<div class="contTextWrap"><strong>바. 모바일앱 서비스 제공</strong></div>
			<p>내일정, 진료예약정보, 진료내역 정보, 진료시간표 등 진료 관련 서비스, 검사결과, 처방약, 건강수첩&middot;와파린 수첩 서비스, 환자등록번호 확인 서비스, 주차비 결제, 처방비&middot;진료비 결제 서비스 및 이에 부수하는 서비스 제공<br> ※ 단, 모바일팩스 서비스는 제3자((주)SK텔링크)의 어플리케이션 연동으로 이루어짐에 따라, 개인정보 처리에 대한 서울대학교병원의 법적인 책임이 없으며, 해당 어플리케이션의 이용약관을 따릅니다.</p>
			<div class="contTextWrap"><br></div>
			<div class="contTitleWrap"> 
			<h3>제2조(개인정보의 처리 및 보유기간)</h3></div>
			<div class="contTextWrap"> 
			<p>서울대학교병원은 법령에 따른 개인정보 보유&middot;이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유&middot;이용기간 내에서 개인정보를 처리&middot;보유합니다.</p></div>
			<p><strong><br> 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.</strong></p>
			<ul class="paddingList"> 
			<li>1)&nbsp;홈페이지 회원 가입 및 관리 : <font size="4em" color="blue">홈페이지 탈퇴시까지</font> 다만, 다음의 사유에 해당하는 경우에는 해당 사유 종료시까지 
			<ul> 
			<li>가)&nbsp;관계 법령 위반에 따른 수사&middot;조사 등이 진행 중인 경우에는 해당 수사&middot;조사 종료 시까지</li> 
			<li>나)&nbsp;홈페이지 이용에 따른 채권&middot;채무관계 잔존시에는 해당 채권&middot;채무관계 정산시까지</li> 
			</ul></li> 
			<li>2)&nbsp;진료 서비스 : 「의료법」시행규칙 15조 "진료에 관한 기록의 보존"에 준하여 보존</li> 
			<li>3)&nbsp;개인건강기록서비스 : <font size="4em" color="blue">홈페이지 탈퇴시까지</font></li> 
			<li>4)&nbsp;민원사무 처리 : 민원처리 종료 후 2년</li> 
			<li>5)&nbsp;「정보통신망 이용촉진 및 정보보호 등에 관한 법률」시행령 제29조에 따른 본인확인정보 보관 : 게시판에 정보 게시가 종료된 후 6개월</li> 
			<li>6)&nbsp;모바일앱: 모바일 앱 회원 탈퇴시까지</li> 
			</ul>
			<div class="contTitleWrap"> 
			<h3>제3조(개인정보의 제3자 제공)</h3></div>
			<div class="contTextWrap"> 
			<p>서울대학교병원은 원칙적으로 정보주체의 개인정보를 수집&middot;이용 목적으로 명시한 범위 내에서<br>
			 처리하며, 다음 각 호의 경우를 제외하고는 정보주체의 사전 동의 없이는 본래의 목적 범위를<br> 초과하여 처리하거나 제3자에게 제공하지 않습니다.</p></div>
			<ul class="paddingList"> 
			<li>&#9312;&nbsp;정보주체로부터 별도의 동의를 받는 경우</li> 
			<li>&#9313;&nbsp;법률에 특별한 규정이 있는 경우</li> 
			<li>&#9314;&nbsp;정보주체 또는 법정대리인이 의사표시를 할 수 없는 상태에 있거나, 주소불명 등으로 사전 동의를 받을 수 없는<br> 경우로서, 명백히 정보주체 또는 제3자의 급박한 생명, 신체, 재산의 이익을 위하여 필요하다고 인정되는 경우</li> 
			<li>&#9315;&nbsp;통계작성 및 학술연구 등의 목적을 위하여 필요한 경우로서, 특정 개인을 알아 볼 수 없는 형태로 개인정보를<br> 제공하는 경우</li> 
			<li>&#9316;&nbsp;개인정보를 목적 외의 용도로 이용하거나, 이를 제3자에게 제공하지 아니하면 다른 법률에서 정하는 소관 업무를 수행할 수 없는 경우로서, 보호위원회의 심의&middot;의결을 거친 경우</li> 
			<li>&#9317;&nbsp;조약, 그 밖의 국제협정의 이행을 위하여 외국정보 또는 국제기구에 제공하기 위하여 필요한 경우</li> 
			<li>&#9318;&nbsp;범죄의 수사와 공소의 제기 및 유지를 위하여 필요한 경우</li> 
			<li>&#9319;&nbsp;법원의 재판업무 수행을 위하여 필요한 경우</li> 
			<li>&#9320;&nbsp;형 및 감호, 보호처분의 집행을 위하여 필요한 경우</li> 
			</ul>
			<div class="tableType01"> 
			<table status="default"> 
			<caption>개인정보의 제3자 목록</caption> 
			<thead> 
			<tr> 
			<th class="NamoSE_border_show" scope="col" style="width: 38px; border-width: 0.994318px;">순서</th> 
			<th class="NamoSE_border_show" scope="col" style="width: 109px; border-width: 0.994318px;">제공목적</th> 
			<th class="NamoSE_border_show" scope="col" style="width: 122px; border-width: 0.994318px;">제공 받는 자</th> 
			<th class="NamoSE_border_show" scope="col" style="width: 128px; border-width: 0.994318px;">제공근거</th> 
			<th class="NamoSE_border_show" scope="col" style="width: 222px; border-width: 0.994318px;">제공하는 개인정보 항목</th> 
			<th class="NamoSE_border_show" scope="col" style="width: 100px; border-width: 0.994318px;">보유기간</th> 
			</tr> 
			</thead> 
			<tbody> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="font-size: 12pt;">1</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">암환자 등록</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">중앙암등록</span></p><span style="font-size: 12pt;"> </span> 
			<p style="text-align: left;"><span style="font-size: 12pt;">본부</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">암관리법 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">14</span><span style="font-size: 12pt;">조</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">성별</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">나이</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">주민등록번호</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">주소</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">직업</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">외국인</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">행려병자</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">입원일</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">퇴원일</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">외래방문일</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">입력자 면허번호</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">암진단 관련정보</span></p></td> 
			<td style="width: 88px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">이용 목적 달성 또는 보유기간 경과 시</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">2</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">감염병 진단 검사 의뢰</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">질병관리본부</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">보건환경연구원</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">감염병의 예방 및 관리에 관한 법률 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">2,4</span><span style="font-size: 12pt;">조시행 령 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">4</span><span style="font-size: 12pt;">조</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">생년월일</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">감염병명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">발병일</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">성별</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">예방접종여부</span></p></td> 
			<td style="width: 90px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">준영구</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">3</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">중증소아 재택의료팀 상담</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">재택방문 관련 정보 제공</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">연계 가능한 서비스 제공</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">국민건강보험<br> 심사평가원</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">중앙호스피스센터 공고 </span></p><span style="font-size: 12pt;"> </span> 
			<p style="text-align: left;"><span style="font-size: 12pt;">제 </span><span style="letter-spacing: 0pt; font-size: 12pt;">2018-01(2018.6.7.)</span><span style="font-size: 12pt;">호</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">개인정보</span><span style="letter-spacing: 0pt; font-size: 12pt;">(</span><span style="font-size: 12pt;">성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">생년월일</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">주소</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">연락처</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">가족구성원 정보 등</span><span style="letter-spacing: 0pt; font-size: 12pt;">), </span><span style="font-size: 12pt;">건강정보</span><span style="letter-spacing: 0pt; font-size: 12pt;">(</span><span style="font-size: 12pt;">진단명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">의료적 요구</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">처치내용 등</span><span style="letter-spacing: 0pt; font-size: 12pt;">), </span><span style="font-size: 12pt;">사회보장정보</span><span style="letter-spacing: 0pt; font-size: 12pt;">(</span><span style="font-size: 12pt;">기초생활수급</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">차상위장애인</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">차상위자화르 한부모가정</span><span style="letter-spacing: 0pt; font-size: 12pt;">), </span><span style="font-size: 12pt;">장애인 등록정보</span><span style="letter-spacing: 0pt; font-size: 12pt;">(</span><span style="font-size: 12pt;">장애보장</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">장애등급</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">중증장애</span><span style="letter-spacing: 0pt; font-size: 12pt;">), </span><span style="font-size: 12pt;">기타 지역사회자원 연계 시 후원기관 또는 후원인 등의 요구항목</span></p></td> 
			<td style="width: 92px; border-width: 0.994318px;"> 
			<p class="0" style="font-size: 9pt; text-align: left;"><span style="font-size: 12pt;">시범사업 기간</span><span style="letter-spacing: 0pt; font-size: 12pt;">(~2021</span><span style="font-size: 12pt;">년 </span><span style="letter-spacing: 0pt; font-size: 12pt;">12</span><span style="font-size: 12pt;">월 </span><span style="letter-spacing: 0pt; font-size: 12pt;">31</span><span style="font-size: 12pt;">일까지</span><span style="letter-spacing: 0pt; font-size: 12pt;">)</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">4</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">소아청소년 완화의료팀 상담</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">연계 가능한 서비스 제공</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">중앙호스피스센터</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">중앙호스피스센터 공고 </span></p><span style="font-size: 12pt;"> </span> 
			<p style="text-align: left;"><span style="font-size: 12pt;">제 </span><span style="letter-spacing: 0pt; font-size: 12pt;">2018-01(2018.6.7.)</span><span style="font-size: 12pt;">호</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">개인정보</span><span style="letter-spacing: 0pt; font-size: 12pt;">(</span><span style="font-size: 12pt;">성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">생년월일</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">주민등록번호</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">주소</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">연락처</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">가족구성원 정보 등</span><span style="letter-spacing: 0pt; font-size: 12pt;">), </span><span style="font-size: 12pt;">건강정보</span><span style="letter-spacing: 0pt; font-size: 12pt;">(</span><span style="font-size: 12pt;">진단명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">진단일자 등</span><span style="letter-spacing: 0pt; font-size: 12pt;">), </span><span style="font-size: 12pt;">사회보장정보</span><span style="letter-spacing: 0pt; font-size: 12pt;">(</span><span style="font-size: 12pt;">의료급여</span><span style="letter-spacing: 0pt; font-size: 12pt;">), </span><span style="font-size: 12pt;">장애인 등록정보</span><span style="letter-spacing: 0pt; font-size: 12pt;">(</span><span style="font-size: 12pt;">장애보장</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">장애등급</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">중증장애</span><span style="letter-spacing: 0pt; font-size: 12pt;">), </span><span style="font-size: 12pt;">기타 지역사회자원 연계 시 후원기관 또는 후원인 등의 요구항목</span></p></td> 
			<td style="width: 94px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">소아청소년 완화의료 사업 종료시</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">5</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">환자 의료비 지원</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">후원단체</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">정보주체의 동의</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">생년월일</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">주소</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">연락처</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">진료과 등</span></p></td> 
			<td style="width: 95px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">3</span><span style="font-size: 12pt;">년</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">6</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">자원봉사자 활동 등록</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">자원봉사센터</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">정보주체의 동의</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">생년월일</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">주소</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">연락처</span></p></td> 
			<td style="width: 96px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">3</span><span style="font-size: 12pt;">년</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">7</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">공공의료기관 청렴도조사</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">국민권익위원회</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">부패 방지 및 권익 위원회 설치와 운영에 관한 법률 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">12</span><span style="font-size: 12pt;">조제</span><span style="letter-spacing: 0pt; font-size: 12pt;">6</span><span style="font-size: 12pt;">호</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">제</span><span style="letter-spacing: 0pt; font-size: 12pt;">27</span><span style="font-size: 12pt;">조의</span><span style="letter-spacing: 0pt; font-size: 12pt;">2,</span><span style="font-size: 12pt;">제</span><span style="letter-spacing: 0pt; font-size: 12pt;">29</span><span style="font-size: 12pt;">조</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">의약품</span><span style="letter-spacing: 0pt; font-size: 12pt;">/</span><span style="font-size: 12pt;">의료기기 계약 상대방</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">소속 직원</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">입원환자의 보호자</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">관리</span><span style="letter-spacing: 0pt; font-size: 12pt;">/</span><span style="font-size: 12pt;">감독기관 업무담당자 등의 성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">전화번호</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">이메일</span></p></td> 
			<td style="width: 97px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">이용 목적 달성 또는 보유기간 경과 시</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">8</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">NGS</span><span style="font-size: 12pt;">패널검사 승인기관 관리</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">건강보험<br> 심사평가원</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p class="0" style="font-size: 9pt; text-align: left;"><span style="font-size: 12pt;">선별급여지정 및 실시동의기준 </span><span style="letter-spacing: 0pt; font-size: 12pt;">(</span><span style="font-size: 12pt;">보건복지부고시 </span><span style="letter-spacing: 0pt; font-size: 12pt;">2017-50</span><span style="font-size: 12pt;">호</span><span style="letter-spacing: 0pt; font-size: 12pt;">)</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">출생연월</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">성별</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">나이</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">등록번호 등</span></p></td> 
			<td style="width: 99px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">3</span><span style="font-size: 12pt;">년</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">9</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">본인확인절차</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">카카오 법인택시 사용 및 사용 후 내역 확인</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">카카오 모빌리티</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">정보주체의 동의</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">사용자 이메일주소</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">사용자 전화번호</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">부서별 담당자</span></p></td> 
			<td style="width: 101px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">이용 목적 달성 또는 보유기간 경과 시</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">10</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">보건복지부 진료정보교류<br> 사업수행</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">진료정보교류<br>
			 시스템을<br> 사용하는 진료의뢰 - 회송의료기관, 보건복지부, 건강보험심사평가원, 국민건강보험공단</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p class="0" style="font-size: 9pt; text-align: left;"><span style="font-size: 12pt;">개인정보 보호법</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">의료법</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span></p><span style="font-size: 12pt;"> </span> 
			<p style="text-align: left;"><span style="font-size: 12pt;">보건의료기본법 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">44</span><span style="font-size: 12pt;">조 및 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">26</span><span style="font-size: 12pt;">조</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">진료정보교류사업 지침</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">정보 주체의 동의</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">연락처</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">주민등록번호</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">주소</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">환자 상태 및 의뢰</span><span style="letter-spacing: 0pt; font-size: 12pt;">(</span><span style="font-size: 12pt;">회송</span><span style="letter-spacing: 0pt; font-size: 12pt;">)</span><span style="font-size: 12pt;">사유</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">진료정보</span></p></td> 
			<td style="width: 103px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">'</span><span style="font-size: 12pt;">진료정보교류에 관한 개인정보 제공동의 철회서</span><span style="letter-spacing: 0pt; font-size: 12pt;">' </span><span style="font-size: 12pt;">제출 전까지</span></p><span style="font-size: 12pt;"> </span> 
			<p class="0" style="font-size: 9pt; text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">(</span><span style="font-size: 12pt;">단</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">법령에 의하여 의무적으로 보존이 필요한 경우 해당 기간 동안에는 보유됨</span><span style="letter-spacing: 0pt; font-size: 12pt;">)</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">11</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">환자 진료의 연속성 유지</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">진료의뢰의사 및 회송 기관의 의사</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">의료법</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">개인정보 보호법</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">정보 주체의 동의</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">성명명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">성별</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">생년월일</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">나이</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">병원등록번호</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">진료정보</span></p></td> 
			<td style="width: 105px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">1</span><span style="font-size: 12pt;">년</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">12</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">클라이언트대표자</span><span style="letter-spacing: 0pt; font-size: 12pt;">(</span><span style="font-size: 12pt;">지불보증주체</span><span style="letter-spacing: 0pt; font-size: 12pt;">)</span><span style="font-size: 12pt;">에게 지불보증서 수령 및 청구</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">쿠웨이트대사관</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">정보주체의 동의</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">진단명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">생년월일</span></p></td> 
			<td style="width: 106px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">5</span><span style="font-size: 12pt;">년</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">13</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">후불 해외보험사 지불보증서 수령 및 청구</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">계약되어 있는 해외보험사</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">정보주체의 동의</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">진단명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">퇴원 기록지</span></p></td> 
			<td style="width: 107px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">3</span><span style="font-size: 12pt;">년</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">14</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">주한 미군 승인서 수령 및 청구</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">주한 미군</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">정보주체의 동의</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">진단명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">사회보장정보</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">3</span><span style="font-size: 12pt;">년</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">15</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">사우디문화원 지불보증 확인</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">사우디 문화원</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">정보주체의 동의</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">진단명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">생년월일</span></p></td> 
			<td style="width: 111px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">1</span><span style="font-size: 12pt;">년</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">16</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">계약되어진<br>
			 후불대사관<br> 진료비 청구</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">기타 주한 대사관</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">정보주체의 동의</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">생년월일</span></p></td> 
			<td style="width: 113px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">3</span><span style="font-size: 12pt;">년</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">17</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">호스피스<br>
			 전문기관의 <br> 서비스 이용 현황 및 환자 가족의 만족도 조사</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">중앙호스피스센터</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">호스피스완화의료 및 임종과정에 있는 환자의 연명의료결정에 관한 법률 제 </span><span style="letter-spacing: 0pt; font-size: 12pt;">29</span><span style="font-size: 12pt;">조</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">연령</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">환자와의 관계</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">자택주소</span><span style="letter-spacing: 0pt; font-size: 12pt;">(</span><span style="font-size: 12pt;">현 거주지</span><span style="letter-spacing: 0pt; font-size: 12pt;">), </span><span style="font-size: 12pt;">연락처</span><span style="letter-spacing: 0pt; font-size: 12pt;">(</span><span style="font-size: 12pt;">휴대폰</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">자택전화</span><span style="letter-spacing: 0pt; font-size: 12pt;">), </span><span style="font-size: 12pt;">이메일</span></p></td> 
			<td style="width: 115px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">1. </span><span style="font-size: 12pt;">설문조사 완료 후 즉시 삭제 </span></p><span style="font-size: 12pt;"> </span> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">2. </span><span style="font-size: 12pt;">설문조사 미실 시 </span><span style="letter-spacing: 0pt; font-size: 12pt;">2</span><span style="font-size: 12pt;">년 후 삭제 </span></p><span style="font-size: 12pt;"> </span> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">3. </span><span style="font-size: 12pt;">정보제공자가 개인정보 삭제를 요청할 경우 즉시 삭제</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">18</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">호스피스<br>
			 전문기관에<br> 대한 평가</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">중앙호스피스센터</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">호스피스완화의료 및 임종과정에 있는 환자의 연명의료결정에 관한 법률 제 </span><span style="letter-spacing: 0pt; font-size: 12pt;">30</span><span style="font-size: 12pt;">조</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">주민등록번호</span></p></td> 
			<td style="width: 116px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">10</span><span style="font-size: 12pt;">년</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">19</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">연명 의료 중단 등 결정을 이행하는 경우 그 결과를 지체 없이 보건복지부령으로 정하는 바에 따라 관리기관의 장에게 통보</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">(</span><span style="font-size: 12pt;">재</span><span style="letter-spacing: 0pt; font-size: 12pt;">)</span><span style="font-size: 12pt;">국가생명<br> 윤리정책원</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">호스피스완화의료 및 임종과정에 있는 환자의 연명의료결정에 관한 법률 제 </span><span style="letter-spacing: 0pt; font-size: 12pt;">31</span><span style="font-size: 12pt;">조</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">주민등록번호</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">주소</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">전화번호</span></p></td> 
			<td style="width: 117px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">10</span><span style="font-size: 12pt;">년</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">20</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p class="0" style="font-size: 9pt; text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">DUR (</span><span style="font-size: 12pt;">조제</span><span style="letter-spacing: 0pt; font-size: 12pt;">)</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">건강보험 심사평가원</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p class="0" style="font-size: 9pt; text-align: left;"><span style="font-size: 12pt;">약사법 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">26</span><span style="font-size: 12pt;">조</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">의료법 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">18</span><span style="font-size: 12pt;">조의</span><span style="letter-spacing: 0pt; font-size: 12pt;">2, </span><span style="font-size: 12pt;">약사법 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">23</span><span style="font-size: 12pt;">조의</span><span style="letter-spacing: 0pt; font-size: 12pt;">2, </span><span style="font-size: 12pt;">약사법 시행규칙 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">15</span><span style="font-size: 12pt;">조</span><span style="letter-spacing: 0pt; font-size: 12pt;">3</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">주민등록번호</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">전화번호</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">조제정보</span></p></td> 
			<td style="width: 119px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">이용 목적 달성 또는 보유기간 경과 시</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">21</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">서울대학교 연건캠퍼스교직원 </span></p><span style="font-size: 12pt;"> </span> 
			<p style="text-align: left;"><span style="font-size: 12pt;">건강검진 청구</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">국민건강보험공단</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">국민건강보험법 시행령</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">주민등록번호</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">주소</span></p></td> 
			<td style="width: 120px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">2</span><span style="font-size: 12pt;">년</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">22</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">퇴원손상심층조사</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">질병관리본부</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p class="0" style="font-size: 9pt; text-align: left;"><span style="font-size: 12pt;">보건의료기본법 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">41</span><span style="font-size: 12pt;">조</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">제</span><span style="letter-spacing: 0pt; font-size: 12pt;">53</span><span style="font-size: 12pt;">조</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">제</span><span style="letter-spacing: 0pt; font-size: 12pt;">54</span><span style="font-size: 12pt;">조</span><span style="letter-spacing: 0pt; font-size: 12pt;">,</span></p><span style="font-size: 12pt;"> </span> 
			<p style="text-align: left;"><span style="font-size: 12pt;">제</span><span style="letter-spacing: 0pt; font-size: 12pt;">57</span><span style="font-size: 12pt;">조</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">통계법 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">18</span><span style="font-size: 12pt;">조</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">제</span><span style="letter-spacing: 0pt; font-size: 12pt;">26</span><span style="font-size: 12pt;">조</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">국민건강증진법 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">25</span><span style="font-size: 12pt;">조</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">개인정보보호법 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">58</span><span style="font-size: 12pt;">조</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p class="0" style="font-size: 9pt; text-align: left;"><span style="font-size: 12pt;">성별</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">나이</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">생년월일</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">거주지우편번호</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">진료비지불원</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span></p><span style="font-size: 12pt;"> </span> 
			<p class="0" style="font-size: 9pt; text-align: left;"><span style="font-size: 12pt;">입원일</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">퇴원일</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">입원경로</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">진단코드</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">수술코드</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span></p><span style="font-size: 12pt;"> </span> 
			<p style="text-align: left;"><span style="font-size: 12pt;">퇴원결과</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">원사인코드</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">손상관련정보</span></p></td> 
			<td style="width: 121px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">영구</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">23</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">사망원인보완조사</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">통계청</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px;"> 
			<p class="0" style="font-size: 9pt; text-align: left;"><span style="font-size: 12pt;">통계법 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">17</span><span style="font-size: 12pt;">조 및 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">18</span><span style="font-size: 12pt;">조에 의한 지정통계</span><span style="letter-spacing: 0pt; font-size: 12pt;">(</span><span style="font-size: 12pt;">제</span><span style="letter-spacing: 0pt; font-size: 12pt;">101054</span><span style="font-size: 12pt;">호</span><span style="letter-spacing: 0pt; font-size: 12pt;">),</span></p><span style="font-size: 12pt;"> </span> 
			<p class="0" style="font-size: 9pt; text-align: left;"><span style="font-size: 12pt;">인구동향조사규칙 </span><span style="letter-spacing: 0pt; font-size: 12pt;">(</span><span style="font-size: 12pt;">기획재정부령 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">425</span><span style="font-size: 12pt;">호</span><span style="letter-spacing: 0pt; font-size: 12pt;">)</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">영아</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">임산부</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">태아 사망 관련정보</span></p><span style="font-size: 12pt;"> </span> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">: </span><span style="font-size: 12pt;">사망장소</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">사망시간</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">다태상태</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">출생순위</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">분만방법</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">임신주수</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">출생시 체중</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">분만시간</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">출생시 두위</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">출생시 신장</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">아프가점수</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">산전관리</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">직전임신결과</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">임신</span><span style="letter-spacing: 0pt; font-size: 12pt;">&middot;</span><span style="font-size: 12pt;">분만 기간 중 질환</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">혈압</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">체중</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">신장</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">흡연상태</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">혼인상태</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">교육수준</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">직업</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">국적</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">사망원인</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">합병증</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">과거질환</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">타기관 의뢰여부</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">수술여부</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">수혈여부</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">임신 횟수</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">직전임신 종결일자</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">임신의 결과</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">성별</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">총사산아수</span></p></td> 
			<td style="width: 121px; border-width: 0.994318px;"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">영구</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px; height: 47px;"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">24</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px; height: 48px;" rowspan="1"> 
			<p class="0" style="font-size: 9pt; text-align: left;"><span style="font-size: 12pt;">코로나</span><span style="letter-spacing: 0pt; font-size: 12pt;">-19 </span></p><span style="font-size: 12pt;"> </span> 
			<p style="text-align: left;"><span style="font-size: 12pt;">입원환자 역학조사</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px; height: 49px;" rowspan="1"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">질병관리본부</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px; height: 50px;" rowspan="1"> 
			<p class="0" style="font-size: 9pt; text-align: left;"><span style="font-size: 12pt;">감염병의 예방 및 관리에 관한 법률 제 </span><span style="letter-spacing: 0pt; font-size: 12pt;">5</span><span style="font-size: 12pt;">조 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">3</span><span style="font-size: 12pt;">항</span><span style="letter-spacing: 0pt; font-size: 12pt;">,</span></p><span style="font-size: 12pt;"> </span> 
			<p class="0" style="font-size: 9pt; text-align: left;"><span style="font-size: 12pt;">제</span><span style="letter-spacing: 0pt; font-size: 12pt;">18</span><span style="font-size: 12pt;">조</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">동법 시행령 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">12</span><span style="font-size: 12pt;">조 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">1</span><span style="font-size: 12pt;">항 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">4</span><span style="font-size: 12pt;">호</span><span style="letter-spacing: 0pt; font-size: 12pt;">,</span></p><span style="font-size: 12pt;"> </span> 
			<p style="text-align: left;"><span style="font-size: 12pt;">제</span><span style="letter-spacing: 0pt; font-size: 12pt;">76</span><span style="font-size: 12pt;">조의</span><span style="letter-spacing: 0pt; font-size: 12pt;">2 </span><span style="font-size: 12pt;">제</span><span style="letter-spacing: 0pt; font-size: 12pt;">1</span><span style="font-size: 12pt;">항 제</span><span style="letter-spacing: 0pt; font-size: 12pt;">2</span><span style="font-size: 12pt;">호</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px; height: 73px;" rowspan="1"> 
			<p class="0" style="font-size: 9pt; text-align: left;"><span style="font-size: 12pt;">성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">성별</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">생년월일</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">주민등록번호</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">인종</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">키</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">몸무게</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span></p><span style="font-size: 12pt;"> </span> 
			<p style="text-align: left;"><span style="font-size: 12pt;">입원일</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">퇴원일</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">사망일</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">전원일</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">코로나</span><span style="letter-spacing: 0pt; font-size: 12pt;">19</span><span style="font-size: 12pt;">진단 관련정보</span></p></td> 
			<td style="width: 121px; border-width: 0.994318px; height: 84px;" rowspan="1"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">질병관리본부<br> 시스템 내규에 따름 </span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 38px; border-width: 0.994318px; height: 47px;" colspan="1" rowspan="1"> 
			<p class="0" style="text-align: center; word-break: keep-all; font-size: 9pt;"><span style="letter-spacing: 0pt; font-size: 12pt;">25</span></p></td> 
			<td style="width: 109px; border-width: 0.994318px; height: 48px;" rowspan="1" colspan="1"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">이식 등록</span></p></td> 
			<td style="width: 122px; border-width: 0.994318px; height: 49px;" rowspan="1" colspan="1"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">국립장기<br> 이식관리센터</span></p></td> 
			<td style="width: 128px; border-width: 0.994318px; height: 50px;" rowspan="1" colspan="1"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">장기등 이식에 관한 법률</span></p></td> 
			<td class="alignL" style="width: 222px; border-width: 0.994318px; height: 73px;" rowspan="1" colspan="1"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">가</span><span style="letter-spacing: 0pt; font-size: 12pt;">. </span><span style="font-size: 12pt;">혈연 기증자의 성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">주민등록번호</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">체중</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">혈액형</span><span style="letter-spacing: 0pt; font-size: 12pt;">, HLA </span><span style="font-size: 12pt;">검사 결과</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">주소</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">전화번호</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">기증할 장기등</span></p><span style="font-size: 12pt;"> </span> 
			<p style="text-align: left;"><span style="font-size: 12pt;">&nbsp;</span></p><span style="font-size: 12pt;"> </span> 
			<p style="text-align: left;"><span style="font-size: 12pt;">나</span><span style="letter-spacing: 0pt; font-size: 12pt;">. </span><span style="font-size: 12pt;">이식대기자의 성명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">주민등록번호</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">진단명</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">체중</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">혈액형</span><span style="letter-spacing: 0pt; font-size: 12pt;">, HLA </span><span style="font-size: 12pt;">검사 결과</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">주소</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">전화번호</span><span style="letter-spacing: 0pt; font-size: 12pt;">, </span><span style="font-size: 12pt;">이식이필요한 장기등</span></p></td> 
			<td style="width: 121px; border-width: 0.994318px; height: 84px;" rowspan="1" colspan="1"> 
			<p style="text-align: left;"><span style="font-size: 12pt;">가</span><span style="letter-spacing: 0pt; font-size: 12pt;">. </span><span style="font-size: 12pt;">장기등기증자 등록의 경우</span></p><span style="font-size: 12pt;"> </span> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">1) </span><span style="font-size: 12pt;">살아있는 사람 또는 사망한 자로서 등록을 한 경우 </span><span style="letter-spacing: 0pt; font-size: 12pt;">: </span><span style="font-size: 12pt;">적출 후 </span><span style="letter-spacing: 0pt; font-size: 12pt;">10</span><span style="font-size: 12pt;">년</span></p><span style="font-size: 12pt;"> </span> 
			<p style="text-align: left;"><span style="font-size: 12pt;">&nbsp;</span></p><span style="font-size: 12pt;"> </span> 
			<p style="text-align: left;"><span style="font-size: 12pt;">나</span><span style="letter-spacing: 0pt; font-size: 12pt;">. </span><span style="font-size: 12pt;">장기등<br>
			 이식대기자 <br> 등록의 경우</span></p><span style="font-size: 12pt;"> </span> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">1) </span><span style="font-size: 12pt;">장기등의 이식이 이루어지지 않은 경우 </span><span style="letter-spacing: 0pt; font-size: 12pt;">: </span><span style="font-size: 12pt;">사망 후 </span><span style="letter-spacing: 0pt; font-size: 12pt;">1</span><span style="font-size: 12pt;">년</span></p><span style="font-size: 12pt;"> </span> 
			<p style="text-align: left;"><span style="letter-spacing: 0pt; font-size: 12pt;">2) </span><span style="font-size: 12pt;">장기등의 이식이 이루어진 경우 </span><span style="letter-spacing: 0pt; font-size: 12pt;">: </span><span style="font-size: 12pt;">이식 후 </span><span style="letter-spacing: 0pt; font-size: 12pt;">10</span><span style="font-size: 12pt;">년</span></p></td> 
			</tr> 
			</tbody> 
			</table></div>
			<div class="contTitleWrap"> 
			<h3>제4조(개인정보처리 위탁)</h3></div>
			<p><strong>가. 서울대학교병원은 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.</strong></p>
			<div class="tableType01"> 
			<table status="default"> 
			<caption>개인정보 처리 위탁</caption> 
			<thead> 
			<tr> 
			<th class="NamoSE_border_show" scope="col" style="width: 66px; border-width: 0.994318px;">순서</th> 
			<th class="NamoSE_border_show" scope="col" style="width: 148px; border-width: 0.994318px;">수탁업체명</th> 
			<th class="NamoSE_border_show" scope="col" style="width: 287px; border-width: 0.994318px;">위탁 업무 내용</th> 
			<th class="NamoSE_border_show" scope="col" style="width: 172px; border-width: 0.994318px;">보유기간</th> 
			</tr> 
			</thead> 
			<tbody> 
			<tr> 
			<td style="width: 48px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">1</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>이지케어텍</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>종합의료정보시스템 종합관리 용역</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 50px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">2</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span style="letter-spacing: 0pt;">㈜</span><span>인피니트 헬스케어</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span style="font-family: 굴림; letter-spacing: 0pt;">PACS</span><span>시스템의 운영</span><span style="font-family: 굴림; letter-spacing: 0pt;">/</span><span>유지보수</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 52px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">3</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>삼광의료재단</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>검체검사 위</span><span style="font-family: 굴림; letter-spacing: 0pt;">/</span><span>수탁</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 54px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">4</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>이원의료재단</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>검체검사 위</span><span style="font-family: 굴림; letter-spacing: 0pt;">/</span><span>수탁</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 55px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">5</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>녹십자의료재단</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>검체검사 위</span><span style="font-family: 굴림; letter-spacing: 0pt;">/</span><span>수탁</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 56px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">6</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span style="font-family: 굴림; letter-spacing: 0pt;">(</span><span>재</span><span style="font-family: 굴림; letter-spacing: 0pt;">)</span><span>씨젠의료재단</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>검체검사 위</span><span style="font-family: 굴림; letter-spacing: 0pt;">/</span><span>수탁</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 57px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">7</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span style="font-family: 굴림; letter-spacing: 0pt;">(</span><span>재</span><span style="font-family: 굴림; letter-spacing: 0pt;">)</span><span>서울의과학연구소</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>검체검사 위</span><span style="font-family: 굴림; letter-spacing: 0pt;">/</span><span>수탁</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 59px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">8</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span style="letter-spacing: 0pt;">㈜</span><span>이지메디컴</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>서울대학교병원 재고관리 및 </span><span style="font-family: 굴림; letter-spacing: 0pt;">CCDS </span><span>용역</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 61px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">9</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span style="letter-spacing: 0pt;">㈜</span><span>크레비스 파트너스</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>후원회 관리 전산프로그램</span><span style="font-family: 굴림; letter-spacing: 0pt;">(DONUS) </span><span>운영</span><span style="font-family: 굴림; letter-spacing: 0pt;">/</span><span>개발</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 63px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">10</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>비즈밸리</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>소아청소년 완화재택의료 시범사업</span><span style="font-family: 굴림; letter-spacing: 0pt;">, </span><span>중증소아 재택의료 시범사업 홈페이지 유지보수</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 65px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">11</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>한국생산성본부</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>서울대학교병원 </span><span style="font-family: 굴림; letter-spacing: 0pt;">2019</span><span>년 기획재정부 주관 공공기관 고객만족도 조사</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 66px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">12</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>로덱스</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>수신자 물품 배송 위탁</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 67px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">13</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>한양대학교병원</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span style="font-family: 굴림; letter-spacing: 0pt;">2020</span><span>년 배치전건강진단 </span></p> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>및 특수건강진단 실시 </span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span style="font-family: 굴림; letter-spacing: 0pt;">30</span><span>년</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 69px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">14</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>포씨게이트</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>카카오톡 알림톡 모바일 수납서비스</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 71px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">15</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>비엘팜</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>복막투석액 직배송</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 73px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">16</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>프레지니우스메디칼케어코리아</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span>직배송</span><span style="font-family: 굴림; letter-spacing: 0pt;">(</span><span>복막투석액</span><span style="font-family: 굴림; letter-spacing: 0pt;">)</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 75px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">17</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>박스터</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span>직배송</span><span style="font-family: 굴림; letter-spacing: 0pt;">(</span><span>복막투석액</span><span style="font-family: 굴림; letter-spacing: 0pt;">)</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 76px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">18</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>보령제약</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span>직배송</span><span style="font-family: 굴림; letter-spacing: 0pt;">(</span><span>복막투석액</span><span style="font-family: 굴림; letter-spacing: 0pt;">)</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 66px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">19</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>신광신약</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span>환자맞춤형</span><span style="font-family: 굴림; letter-spacing: 0pt;">(</span><span>타이로신제제</span><span style="font-family: 굴림; letter-spacing: 0pt;">- TYRST,TYRSC,TYRSHC,TYRSHT)</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 66px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">20</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>알레파인터내셔널</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span>환자맞춤형</span><span style="font-family: 굴림; letter-spacing: 0pt;">(NHM)</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 66px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">21</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">Syapse</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span style="font-family: 굴림; letter-spacing: 0pt;">Syapse </span><span>정밀의료 플랫폼 운영</span><span style="font-family: 굴림; letter-spacing: 0pt;">/</span><span>개발</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 66px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">22</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span style="font-family: 굴림; letter-spacing: 0pt;">(</span><span>주</span><span style="font-family: 굴림; letter-spacing: 0pt;">)</span><span>나셀프</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>건강증진센터 뉴스레터 발간 및 발송</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 66px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">23</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>대한결핵협회 결핵연구원</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>항결핵제 감수성검사</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 66px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">24</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>현대씨엔알</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>인재원 시설관리 및 편의시설 위탁 용역 계약 </span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 66px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">25</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span style="letter-spacing: 0pt;">㈜</span><span>데브몬</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span style="font-family: 굴림;">&nbsp;</span></p> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span style="font-family: 굴림; letter-spacing: 0pt;">CTMS </span><span>유지보수</span></p> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span style="font-family: 굴림;">&nbsp;</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 66px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">26</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>카카오 모빌리티</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>업무용 택시</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 66px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">27</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">IGM</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>영상검사기록 </span><span style="font-family: 굴림; letter-spacing: 0pt;">CD</span><span>등록 키오스크</span></p> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>운영</span><span style="font-family: 굴림; letter-spacing: 0pt;">/</span><span>개발</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 66px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">28</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">SCI</span><span>평가정보</span><span style="letter-spacing: 0pt;">㈜</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>홈페이지 본인인증</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 66px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">29</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">NICE</span><span>평가정보</span><span style="letter-spacing: 0pt;">㈜</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>홈페이지 본인인증</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 66px; border-width: 0.994318px; height: 20px;"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">30</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px; height: 23px;" rowspan="1"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span style="letter-spacing: 0pt;">㈜</span><span>레몬헬스케어</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px; height: 24px;" rowspan="1"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>서울대학교병원 고객용 스마트 모바일 어플리케이션 구축 사업 유지보수 계약</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px; height: 25px;" rowspan="1"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			<tr> 
			<td style="width: 66px; border-width: 0.994318px; height: 10px;" colspan="1" rowspan="1"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all; letter-spacing: 0pt;"><span style="font-family: 굴림; letter-spacing: 0pt;">31</span></p></td> 
			<td valign="middle" style="width: 148px; border-width: 0.994318px; height: 23px;" rowspan="1" colspan="1"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>브로드씨엔에스</span></p></td> 
			<td valign="middle" style="width: 287px; border-width: 0.994318px; height: 24px;" rowspan="1" colspan="1"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>병원 콜센터 시스템</span></p></td> 
			<td style="width: 172px; border-width: 0.994318px; height: 25px;" rowspan="1" colspan="1"> 
			<p class="0" style="line-height: 120%; text-align: center; word-break: keep-all;"><span>위탁계약 종료시까지</span></p></td> 
			</tr> 
			</tbody> 
			</table></div>
			<p><br>
			 <span style="font-weight: 700;">나. 서울대학교병원은 위탁계약 체결 시 개인정보 보호법 제26조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적/관리적 보호조치, 위탁업무의 목적 및 범위, 재 위탁 제한, 안전성 확보 조치에 관한 사항, 수탁자에 대한 관리/감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.</span><br>
			 <strong><br> 다. 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체 없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.</strong></p>
			<div class="contTitleWrap"> 
			<h3>제5조(정보주체와 법정대리인의 권리, 의무 및 행사방법)</h3></div>
			<div class="contTextWrap"> 
			<p>이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수 있습니다.</p></div>
			<p><strong>가. 정보주체는 서울대학교병원에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.</strong></p>
			<ul class="paddingList"> 
			<li>1)개인정보 열람요구</li> 
			<li>2)오류 등이 있을 경우 정정 요구</li> 
			<li>3)삭제요구</li> 
			<li>4)처리정지 요구<br></li> 
			</ul>
			<p><strong>나. ㉮항에 따른 권리 행사는 서울대학교병원에 개인정보 보호법 시행규칙 별지 제8호 서식에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 서울대학교병원은 이에 대해 지체 없이 조치하겠습니다.<br>
			 <br></strong><strong>다. 정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 서울대학교병원은 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.<br>
			 <br></strong><strong>라. ㉮항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.</strong><br>
			 <br>
			 <strong>마. 서울대학교병원은 권리행사를 요구를 받은 날로부터 10일 이내에 정보주체의 요구에 상응하는 조치를 취하고 그 결과를 정보주체에게 알리겠습니다.</strong></p>
			<div class="contTitleWrap"> 
			<h3>제6조(처리하는 개인정보 항목)</h3></div>
			<div class="contTextWrap"> 
			<p>서울대학교병원은 다음의 개인정보 항목을 처리하고 있습니다.<br>
			 <br></p></div>
			<div class="contTextWrap"><strong>가. 홈페이지 회원가입 및 관리</strong></div>
			<ul class="listType01"> 
			<li class="b">필수항목: 로그인ID, 비밀번호, 이름, 성별, 자택주소, 이메일, 생년월일, 국적</li> 
			<li class="b">선택항목: 자택전화번호, 휴대전화번호 (둘 중 하나는 필수), 식별정보(IPin, 휴대전화확인)</li> 
			<li class="b">14세미만 추가 필수항목: 법적대리인 이름, 관계, 식별정보</li> 
			</ul>
			<div class="contTextWrap"><strong>나. 병원정보시스템</strong></div>
			<p>의료법에 준하는 개인정보(이름, 주민등록번호, 주소, 연락처 등) 및 진료정보.<br>
			 <br></p>
			<div class="contTextWrap"><strong>다. 차량 등록 및 주차이력관리</strong></div>
			<p>필수항목 : 차량번호, 등록번호<br>
			 <br></p>
			<div class="contTextWrap"><strong>라. 모바일앱 회원가입 및 관리</strong></div>
			<ul class="listType01"> 
			<li class="b">필수항목: 로그인ID (모바일앱 가입ID, SNS(네이버, 구글)을 통해 회원가입 시 이메일주소, 서울대병원 홈페이지를 통해 회원가입 시 홈페이지 가입ID), 비밀번호, 이름, 생년월일, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 접속로그, 이용기록</li> 
			<li class="b">선택항목: 주민등록번호, 환자번호, 자택주소, 휴대전화번호, 차량번호, 건강수첩(혈압, 혈당, 키, 체중 등), 와파린수첩(와파린 투약 용량, 혈액검사 결과 등)</li> 
			<li class="b">만 14세 미만 추가 필수항목: 법정대리인 이름, CI, DI</li> 
			<p>※ 주민등록번호는 개인정보보호를 위해 모바일앱 서버에 저장하지 않고 국민건강보험법, 개인정보보호 가이드라인(의료기관, 2015. 2.) 등의 근거에 따라 건강보험 자격 조회 및 환자명부의 확인을 위해서 최소한으로 사용합니다.</p> 
			</ul>
			<div class="contTextWrap"><strong>마. 채용사이트 지원자 정보</strong></div>
			<p>지원서 양식 및 시행 회차에 따라 개별 동의를 통해서 처리함.<br>
			 <br></p>
			<div class="contTextWrap"><strong>바. 비회원 진료예약</strong></div>
			<p>성명, 환자등록번호(또는 주민등록번호), 휴대전화번호<br>
			 <br></p>
			<div class="contTextWrap"><strong>사. 외국인 진료 예약</strong></div>
			<ul class="listType01"> 
			<li class="b">필수항목: 성명, 성별, 생년월일, 여권번호, 여권만료일, 국적, 전화번호, 이메일주소, 증상, 한국 내 거주 주소, 외국인 등록증 번호(등록증 소지자만 해당)</li> 
			<li class="b">선택항목 : 긴급연락처(성명, 휴대전화번호), 가능한 예약일자, 민간보험가입여부, 사용언어</li> 
			</ul>
			<div class="contTextWrap"><strong>아.&nbsp;서울대학교병원의 개인정보파일 현황은 아래의 방법으로 확인하실 수 있습니다.</strong></div>
			<ul class="listType01"> 
			<li class="b"><span>개인정보보호 종합지원포털(</span><a href="www.privacy.go.kr" target="_blank" title="새 창으로 이동"><span>www.privacy.go.kr</span></a><span>) &rarr;민원마당&rarr; 개인정보의 열람 등 요구 &rarr; 개인정보파일 목록 검색 &rarr; 기관명에 &ldquo;서울대학교병원&rdquo; 입력 후 조회</span></li> 
			</ul>
			<div class="contTitleWrap"> 
			<h3>제7조(개인정보의 파기)</h3></div>
			<div class="contTextWrap"> 
			<p>서울대학교병원은 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체 없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.<br>
			 <br></p></div>
			<div class="contTextWrap"><strong>가. 파기절차</strong></div>
			<p>이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.<br>
			 <br></p>
			<div class="contTextWrap"><strong>나. 파기기한</strong></div>
			<p>이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.<br>
			 <br></p>
			<div class="contTextWrap"><strong>다. 파기방법</strong></div>
			<p>전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다. 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.</p>
			<div class="contTitleWrap"> 
			<h3>제8조(개인정보의 안전성 확보 조치)</h3></div>
			<div class="contTextWrap"> 
			<p>서울대학교병원은 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.</p></div>
			<div class="contTextWrap"><strong><br> 가. 개인정보 취급 직원의 최소화 및 교육</strong></div>
			<p>개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화하여 개인정보를 관리하는 대책을 시행하고 있습니다.</p>
			<div class="contTextWrap"><strong><br> 나. 정기적인 자체 감사 실시</strong></div>
			<p>개인정보 취급 관련 안정성 확보를 위해 정기적(년 1회 이상)으로 자체 감사를 실시하고 있습니다.</p>
			<div class="contTextWrap"><strong><br> 다. 내부관리계획의 수립 및 시행</strong></div>
			<p>개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.</p>
			<div class="contTextWrap"><strong><br> 라. 개인정보의 암호화</strong></div>
			<p>이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.</p>
			<div class="contTextWrap"><strong><br> 마. 해킹 등에 대비한 기술적 대책</strong></div>
			<p>서울대학교병원은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신&middot;점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.</p>
			<div class="contTextWrap"><strong><br> 바. 개인정보에 대한 접근 제한</strong></div>
			<p>개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여, 변경, 말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.</p>
			<div class="contTextWrap"><strong><br> 사. 접속기록의 보관 및 위변조 방지</strong></div>
			<p>개인정보처리시스템에 접속한 기록을 최소 1년 이상 (고유식별정보 또는 민감정보가 포함되어 있는 경우 2년 이상) 보관, 관리하고 있으며, 접속 기록이 위변조 및 도난, 분실되지 않도록 보안기능 사용하고 있습니다.</p>
			<div class="contTextWrap"><strong><br> 아. 문서보안을 위한 잠금장치 사용</strong></div>
			<p>개인정보가 포함된 서류, 보조저장매체 등을 잠금장치가 있는 안전한 장소(캐비닛 등)에 보관하고 있습니다.</p>
			<div class="contTextWrap"><strong><br> 자. 비인가에 대한 출입 통제</strong></div>
			<p>개인정보를 보관하고 있는 개인정보처리시스템의 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립&middot;운영하고 있습니다.</p>
			<div class="contTitleWrap"> 
			<h3>제9조 (개인정보 보호책임자)</h3></div>
			<p><strong>가. 서울대학교병원은 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.<br>
			 <br></strong></p>
			<p><strong>개인정보 보호책임자</strong></p>
			<ul class="listType01"> 
			<li class="b">직책 : 정보화실장</li> 
			<li class="b">연락처 : 02-2072-7600</li> 
			</ul>
			<div class="contTextWrap"><strong>1) 홈페이지 부문</strong></div>
			<p><strong>&nbsp;개인정보 보호담당자</strong></p>
			<ul class="listType01"> 
			<li class="b">직책 : 홍보팀장</li> 
			<li class="b">연락처 : 02-2072-0596,&nbsp;<a href="mailto:webmaster@snuh.org">webmaster@snuh.org</a></li> 
			</ul>
			<p><strong>&nbsp;개인정보 보호 담당부서</strong></p>
			<ul class="listType01"> 
			<li class="b">부서명 : 홍보팀</li> 
			<li class="b">연락처 : 02-2072-0596,&nbsp;<a href="mailto:webmaster@snuh.org">webmaster@snuh.org</a>, FAX: 02-744-8217</li> 
			</ul>
			<div class="contTextWrap"><strong>2) 진료정보 부문</strong></div>
			<p><strong>&nbsp;개인정보 보호담당자</strong></p>
			<ul class="listType01"> 
			<li class="b">직책 : 정보/시스템보안팀장</li> 
			<li class="b">연락처 : 02-2072-2770</li> 
			</ul>
			<p><strong>&nbsp;개인정보 보호 담당부서</strong></p>
			<ul class="listType01"> 
			<li class="b">부서명 : 정보/시스템보안팀</li> 
			<li class="b">연락처 : 02-2072-2770</li> 
			</ul>
			<div class="contTextWrap"><strong>3) 모바일앱 부문</strong></div>
			<p><strong>&nbsp;개인정보 보호담당자</strong></p>
			<ul class="listType01"> 
			<li class="b">직책 : PI팀장</li> 
			<li class="b">연락처 : 02-2072-1514</li> 
			</ul>
			<p><strong>&nbsp;개인정보 보호 담당부서</strong></p>
			<ul class="listType01"> 
			<li class="b">부서명 : PI팀</li> 
			<li class="b">연락처 : 02-2072-1514</li> 
			</ul>
			<div class="contTextWrap"><strong>서울대학교병원과 패밀리사이트 통합회원관리(SSO서비스)</strong></div>
			<div class="tableType01"> 
			<table> 
			<caption>서울대학교병원과 패밀리 사이트</caption> 
			<tbody> 
			<tr> 
			<th class="NamoSE_border_show" scope="row" style="width: 220px; border-width: 0.994318px;">사이트명(도메인)</th> 
			<td style="width: 398px; border-width: 0.994318px;">담당부서</td> 
			</tr> 
			<tr> 
			<th class="NamoSE_border_show" scope="row" style="width: 222px; border-width: 0.994318px;">어린이병원(<a href="//child.snuh.org">child.snuh.org</a>)</th> 
			<td style="width: 400px; border-width: 0.994318px;">소아기획조정실</td> 
			</tr> 
			<tr> 
			<th class="NamoSE_border_show" scope="row" style="width: 224px; border-width: 0.994318px;">암병원(<a href="//cancer.snuh.org">cancer.snuh.org</a>)</th> 
			<td style="width: 402px; border-width: 0.994318px;">암병원 기획팀</td> 
			</tr> 
			<tr> 
			<th class="NamoSE_border_show" scope="row" style="width: 225px; border-width: 0.994318px;">병원 진료과 홈페이지</th> 
			<td style="width: 404px; border-width: 0.994318px;">각 진료과</td> 
			</tr> 
			<tr> 
			<th class="NamoSE_border_show" scope="row" style="width: 226px; border-width: 0.994318px;">병원 행정부서 홈페이지</th> 
			<td style="width: 405px; border-width: 0.994318px;">각 부서</td> 
			</tr> 
			<tr> 
			<th class="NamoSE_border_show" scope="row" style="width: 227px; border-width: 0.994318px;">병원 센터/클리닉 홈페이지</th> 
			<td style="width: 406px; border-width: 0.994318px;">센터/클리닉</td> 
			</tr> 
			</tbody> 
			</table></div>
			<p><strong>나. 정보주체께서는 서울대학교병원의 서비스(또는 사업)를 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 서울대학교병원은 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.</strong></p>
			<div class="contTitleWrap"> 
			<h3>제10조(개인정보 열람청구)</h3></div>
			<p><strong>가. 정보주체는 개인정보 보호법 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다. 서울대학교병원은 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다. (14세 미만 아동은 법적 대리인의 동의를 통해 가능함)</strong></p>
			<p><strong><br> 홈페이지&nbsp;개인정보 열람청구 접수&middot;처리부서</strong></p>
			<ul class="listType01"> 
			<li class="b">부서명 : 홍보팀</li> 
			<li class="b">담당자 : 김태우</li> 
			<li class="b">연락처 : 02-2072-0596,&nbsp;<a href="mailto:webmaster@snuh.org">webmaster@snuh.org</a>, FAX: 02-747-8217</li> 
			</ul>
			<p><strong>진료정보 개인정보 열람청구 접수&middot;처리부서</strong></p>
			<ul class="listType01"> 
			<li class="b">부서명 : 정보/시스템보안팀</li> 
			<li class="b">연락처 : 02-2072-2770</li> 
			<li class="b">안내 :&nbsp;<a href="//www.snuh.org/content/M002005006.do" target="_blank">http://www.snuh.org/content/M002005006.do</a></li> 
			</ul>
			<p><strong>모바일앱&nbsp;개인정보 열람청구 접수&middot;처리부서</strong></p>
			<ul class="listType01"> 
			<li class="b">부서명 : PI팀</li> 
			<li class="b">연락처 : 02-2072-1514,&nbsp;<a href="mailto:pi@snuh.org">pi@snuh.org</a></li> 
			</ul>
			<p><strong><br>
			 나. 정보주체께서는 ㉮항의 열람청구 접수/처리부서 이외에, 행정안전부의 &lsquo;개인정보보호 종합지원 포털&rsquo; 웹사이트(<a href="//www.privacy.go.kr" target="_blank">www.privacy.go.kr</a>)를 통하여서도 개인정보 열람청구를 하실 수 있습니다.</strong><strong>다. 열람 정정요구시 본인 또는 제3자를 현저하게 해할 우려가 있거나, 서비스 제공자의 업무에 현저한 지장을 미칠 경우, 다른 법령에 위반하는 경우가 있을 경우 등의 사유로 열람 및 정정요구를 거부 할 수 있습니다</strong></p>
			<p><strong>행정안전부 개인정보보호 종합지원 포털 &rarr; 개인정보 민원 &rarr; 개인정보 열람등 요구 (본인확인을 위하여 아이핀(I-PIN)이 있어야 함)</strong></p>
			<div class="contTitleWrap"> 
			<h3>제11조(권익침해 구제방법)</h3></div>
			<p>아래의 기관은 서울대학교병원과는 별개의 기관으로서, 서울대학교병원의 자체적인 개인정보 불만처리, 피해구제 결과에 만족하지 못하시거나 보다 자세한 도움이 필요하시면 문의하여 주시기 바랍니다.</p>
			<p><strong><br></strong><strong style="font-size: 12pt;">개인정보 분쟁조정위원회 :&nbsp;</strong><span style="font-size: 12pt;">1833-6972 (&nbsp;</span><a href="https://www.kopico.go.kr/" target="_blank" style="font-size: 12pt;">www.kopico.go.kr</a>&nbsp;)<strong><br> 개인정보 침해신고센터 :&nbsp;</strong><span style="font-size: 12pt;">(국번 없이) 118 (&nbsp;</span><a href="https://privacy.kisa.or.kr/" target="_blank" style="font-size: 12pt;">privacy.kisa.or.kr</a>&nbsp;)<br>
			 <strong style="font-size: 12pt;">대검찰청 사이버수사과 :&nbsp;</strong><span style="font-size: 12pt;">(국번없이) 1301 cid@spo.go.kr (<a href="//www.spo.go.kr" target="_blank">www.spo.go.kr</a>)</span><br>
			 <span style="font-weight: bold;">경찰청 사이버안전국 :&nbsp;</span>(국번없이) 182&nbsp;<span style="font-size: 10pt;"><span>(</span><a href="https://www.police.go.kr/www/security/cyber.jsp" target="_blank" title="새 창으로 이동"><span>https://www.police.go.kr/www/security/cyber.jsp</span></a><span>)</span></span></p>
			<p>또한, 개인정보의 열람, 정정&middot;삭제, 처리정지 등에 대한 정보주체자의 요구에 대하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익을 침해 받은 자는 행정심판법이 정하는 바에 따라 행정심판을 청구할 수 있습니다. 중앙행정심판위원회(<a href="//www.simpan.go.kr" target="_blank">www.simpan.go.kr</a>)의 전화번호 안내 참조</p>
			<div class="contTitleWrap"> 
			<h3>제12조(개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항)</h3></div>
			<p class="conTxt">서울대학교병원은 이용자에게 특화된 맞춤서비스를 제공하기 위해서 이용자들의 정보를 수시로 저장하고 불러오는 '쿠키(cookie)'를 운용합니다. 쿠키란 웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에 보내는 아주 작은 텍스트 파일로서 이용자의 컴퓨터 하드디스크에 저장됩니다. 서울대학교병원은 다음과 같은 목적을 위해 쿠키를 사용합니다.<br>
			 <br></p>
			<p><strong>쿠키의 사용 목적</strong></p>
			<p>회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 개인 맞춤 서비스 제공 이용자는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 이용자는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.</p>
			<p><strong><br> 쿠키 설정 거부 방법</strong></p>
			<p>쿠키 설정을 거부하는 방법으로는 이용자가 사용하는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.설정방법 예(인터넷 익스플로어의 경우) : 웹 브라우저 상단의 도구 &gt;인터넷 옵션 &gt;개인정보단, 쿠키 설치를 거부하였을 경우 로그인이 필요한 일부 서비스 이용에 어려움이 있을 수 있습니다.</p>
			<p><strong><br> 이용자는 서울대학교병원 홈페이지에서 수집하는 개인정보에 대해 동의를 거부할 권리가 있으며, 동의 거부 시에는 회원가입 및 인터넷 진료예약, 민원등록, 개인건강기록서비스 (SNUH myCare) 등의 홈페이지 서비스가 일부 제한됩니다.</strong></p>
			<div class="contTitleWrap"> 
			<h3>제13조(영상정보처리기기 운영/관리에 관한 사항)</h3></div>
			<p class="conTxt">서울대학교병원(이하 병원)은 개인정보 보호법 제25조제1항에 근거하여 영상정보처리기기를 설치&middot;운영하고 있으며, 본 방침을 통해 병원에서 처리하는 영상정보가 어떠한 용도와 방식으로 이용&middot;관리되고 있는지 알려 드립니다.&nbsp;<br></p>
			<p><br></p>
			<p><strong>설치 근거 및 설치 목적</strong></p>
			<p>환자 및 시설안전, 화재 및 범죄 예방, 주ㆍ정차관리</p>
			<p><strong><br> 설치 대수, 설치 위치 및 촬영범위</strong></p>
			<p>설치대수 : 1,053대&nbsp;<br>
			 설치 위치 및 촬영 범위 : 로비, 복도, 주차장, 승강기 등&nbsp;<br> ※ 업무의 효율적인 수행을 위해 부득이하게 설치 수량, 위치 또는 촬영 범위를 변경할 수 있습니다.</p>
			<p><br></p>
			<p><strong>영상정보의 촬영시간, 보관기간, 보관장소 및 처리방법</strong></p>
			<p>촬영시간 : 24시간&nbsp;<br>
			 보관기간 : 촬영일로부터 30일 이내<br>
			 (단, 어린이집의 경우 영유아보육법에 따라 60일 보관)<br>
			 보관장소 : 처리기기 설치장소, 주차관제실 등 출입제한구역<br> 처리방법 : 개인영상정보의 목적 외 이용, 제3자 제공, 파기, 열람 등 요구에 관한 사항을 기록ㆍ관리하고, 보관기간 만료 시 복원이 불가능한 방법으로 영구 삭제(출력물의 경우 파쇄 또는 소각)합니다.</p>
			<p><br></p>
			<p><strong>개인영상정보의 신청 방법 및 장소에 관한 사항</strong></p>
			<p>신청 방법: 사전 연락 후 방문 신청<br>
			 신청 장소: 비상계획과<br> 전화번호 : (02) 2072-2164</p>
			<p><br></p>
			<p><strong>정보주체의 영상정보 열람 등 요구에 대한 조치</strong></p>
			<p>귀하는 개인영상정보에 관하여 열람 또는 존재확인 등을 원하는 경우 언제든지 영상정보처리기기 운영자에게 요구하실 수 있습니다. 단, 귀하가 촬영된 개인영상정보 및 명백히 정보주체의 급박한 생명, 신체, 재산의 이익을 위하여 필요한 개인영상정보에 한정됩니다.<br>
			 정보주체의 열람 등 청구에도 불구하고 아래와 같은 경우에는 개인영상정보 열람 등 청구를 거부할 수 있습니다.<br>
			 1) 개인영상정보의 보관기간이 경과하여 파기한 경우<br> 2) 기타 정보주체의 열람 등 요구를 거부할 만한 정당한 사유가 존재하는 경우</p>
			<p><br></p>
			<p><strong>영상정보의 보호를 위한 기술적ㆍ관리적 및 물리적 조치</strong></p>
			<p>병원에서 처리하는 영상정보는 암호화 조치 등을 통하여 안전하게 관리되고 있습니다. 또한 병원은 개인영상정보보호를 위한 관리적 대책으로서 개인정보에 대한 접근 권한을 차등부여하고 있고, 개인영상정보의 위,변조 방지를 위하여 개인영상정보의 생성 일시, 열람 시 열람 목적ㆍ열람자ㆍ열람 일시 등을 기록하여 관리하고 있습니다. 이 외에도 개인영상정보의 안전한 물리적 보관을 위하여 잠금장치를 설치하고 있습니다.</p>
			<p><br></p>
			<p><strong>영상정보처리기기 운영&middot;관리방침 변경에 관한 사항</strong></p>
			<p>이 영상정보처리기기 운영&middot;관리방침은 2019년 6월 30일에 제정되었으며, 법령&middot;정책 또는 보안기술의 변경에 따라 내용의 추가&middot;삭제 및 수정이 있을 시에는 시행하기 최소 7일전에 병원 홈페이지를 통해 변경사유 및 내용 등을 공지하도록 하겠습니다.</p>
			<div class="contTitleWrap"> 
			<h3>제14조(개인정보 처리방침 변경)</h3></div>
			<p>이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.이상의 '홈페이지' 개인정보보호정책은 2005년 8월 1일(<a href="//www.snuh.org/footer/privacy/p1.do" target="_blank">보기</a>)부터 시행되었으며</p>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
	<meta charset="utf-8">
	<title>Doctor Template</title>
	
	<!-- jQuery 추가 -->
	<script src="${path_resources}js/jquery-3.5.1.min.js"></script>
	
	<!-- css -->
	<style type="text/css">
	<!-- 프로필 css -->
		.card{
		    -moz-border-radius: 2%;
		    -webkit-border-radius: 2%;
		    border-radius: 2%;
		    box-shadow: 5px 5px 0 rgba(0,0,0,0.08);
		}
		
		.profile .profile-body {
		    padding: 20px;
		    background: #f7f7f7;
		    width: 1440px;
		}
		
		.profile .profile-bio {
		    background: #fff;
		    position: relative;
		    padding: 15px 10px 5px 15px;
		}
		
		.profile .profile-bio a {
		    left: 50%;
		    bottom: 20px;
		    margin: -62px;
		    text-align: center;
		    position: absolute;
		}
		
		.profile .profile-bio h2 {
		    margin-top: 0;
		    font-weight: 200;
		}
	
		.css3-tab {
		  list-style: none;
		  position: relative;
		  width: 100%;
		}
		.css3-tab input[type='radio'] {
		  display: none;
		}
		.css3-tab .css3-tab-nav {
		  display: table;
		  table-layout: fixed;
		  width: 100%;
		}
		.css3-tab .css3-tab-nav label {
		  display: table-cell;
		  background-color: #666666;
		  color: #FFFFFF;
		  padding: 15px;
		  text-align: center;
		  transition: all .3s ease 0s;
		}
		.css3-tab .css3-tab-nav label:hover {
		  cursor: pointer;
		  background: white;
		  color: #666666;
		  transition: all .3s ease 0s;
		}
		@media (max-width: 692px) {
		  .css3-tab .css3-tab-nav {
		    display: block;
		    margin: 0 0 20px;
		  }
		  .css3-tab .css3-tab-nav label {
		    display: block;
		    box-sizing: border-box;
		    width: 100%;
		    padding: 20px;
		  }
		}
		.css3-tab .css3-tab-content {
		  overflow: hidden;
		  padding: 25px;
		  display: none;
		  background: #FFF;
		  clear: left;
		  box-sizing: border-box;
		}
		.css3-tab input[id='tabOne']:checked ~ .css3-tab-nav label[for='tabOne'] {
		  background: #35cebe;
		  color: white;
		  cursor: default;
		}
		.css3-tab input[id='tabOne']:checked ~ div.tab-one {
		  display: block;
		  border-top: solid 3px #35cebe;
		}
		.css3-tab input[id='tabTwo']:checked ~ .css3-tab-nav label[for='tabTwo'] {
		  background: #35cebe;
		  color: white;
		  cursor: default;
		}
		.css3-tab input[id='tabTwo']:checked ~ div.tab-two {
		  display: block;
		  border-top: solid 3px #35cebe;
		}
		.css3-tab input[id='addNew']:checked ~ .css3-tab-nav label[for='addNew'] {
		  background: #35cebe;
		  color: white;
		  cursor: default;
		}
		.css3-tab input[id='addNew']:checked ~ div.add-new {
		  display: block;
		  border-top: solid 3px #35cebe;
		}
	
	</style>
	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700" rel="stylesheet">
	
	<!-- Template Styles -->
	<link rel="stylesheet" href="${path_resources}css/doctorfont-awesome.min.css">
	
	<!-- CSS Reset -->
	<link rel="stylesheet" href="${path_resources}css/doctornormalize.css">
	
	<!-- Milligram CSS minified -->
	<link rel="stylesheet" href="${path_resources}css/doctormilligram.min.css">
	
	<!-- Main Styles -->
	<link rel="stylesheet" href="${path_resources}css/doctorStyles.css">
	
	<link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.min.css" rel="stylesheet">
	
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
</head>
<script type="text/javascript">

function logout() {
	var chk = confirm("로그아웃 하시겠습니까?");
	
	if(chk){
		document.getElementById('logout-form').submit();
	} else {
			alert("로그아웃 취소 되었습니다.")
			return false;
	}
}

//환자조회/진료 클릭시 발생 이벤트
function resReset(){
	$('#keyword').focus();
}

// 환자조회 keyup
$(function() {
	$('#keyword').keyup(function() {
		var keyword = $('#keyword').val();  // input 태그에서 입력한 키워드
		
		if(keyword.length == 0) {        // 검색글자수가 0인 경우
			$('#searchDisplay').css("display", "none");       // 숨김
		} else {
			$('#searchDisplay').css("visibility", "visible");      // 표시
			$('#searchDisplay').css("display", "flex");
			$('#searchDisplay').css("align-items", "center");
			$('#searchDisplay').css("min-width", "0");
			$('#searchDisplay').css("max-height", "none");
			$('#searchDisplay').css("background", "#f9f9f9");
			$('#searchDisplay').css("width", "570px");
		}
		
		// keyword -> search_next.ja(search_next.jsp) -> result -> 콜백함수 -> display에 출력
		$.ajax({
			url : '${pageContext.request.contextPath}/search_next?${_csrf.parameterName}=${_csrf.token}',
			type : 'POST',
			data : 'keyword=' + keyword,
			success : function(result) { // 콜백함수 호출
				$('#searchDisplay').html(result);   // 결과  출력
			},
			error : function() {
				alert("오류");
			}
		});
	});
	
});

</script>
<body>
	<div class="navbar">
		<div class="row">
			<div class="column column-30 col-site-title"><a href="${path}/doctor/doctor_main" class="site-title float-left">Lifecare</a></div>
			<div class="column column-40 col-search"><a href="#" class="search-btn fa fa-search"></a>
				<input type="text" id="keyword" name="" value="" placeholder="Search..." style="margin-bottom: 0;"  autocomplete="off">
					<div id="searchDisplay" class="col">
					<!-- 결과 출력 위치 -->
					</div>
			</div>
			<div class="column column-30">
				<div class="user-section"><a href="javascript:void(0)"  onclick="logout();">
					<img src="${path_resources}img/${doctor.getDoctor_faceimg()}" alt="profile photo" class="circle float-left profile-photo" width="50" height="auto">
					<div class="username">
						<h4>${doctor.getDoctor_name()}</h4>
						<p>${doctor.getDoctor_major()}</p>
					</div>
				</a></div>
			</div>
		</div>
	</div>
	<form id="logout-form" action="${path}/logout" method="POST">
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
	</form>
	<div class="row">
		<div id="sidebar" class="column">
			<h5>Navigation</h5>
			<jsp:include page="./doctor_nav.jsp"></jsp:include>
		</div>
		<section id="main-content" class="column column-offset-20">
					
			<!-- Pure CSS Menu -->
			<div class="row grid-responsive">
				<div class="column">
					<div class="card">
						<div class='css3-tab'>
							<input type='radio' name='a' id='tabOne' tabindex="1" checked>
							<input type='radio' name='a' id='tabTwo' tabindex="2">
							<input type='radio' name='a' id='addNew' tabindex="3">
							<div class="css3-tab-nav">
								<label for='tabOne'>기초검사결과</label>
								<label for='tabTwo'>X-RAY검사결과</label>
								<label for='addNew'>암(유방)검사결과</label>
							</div>
							<div class='css3-tab-content tab-one'>	
								<div class="card-block">
									<table>
										<thead>
											<tr style="background:#35cebe; color:white;">
												<th style="width:15%">이름</th>
												<th style="width:25%">검사종류</th>
												<th style="width:30%">소견</th>
												<th style="width:20%">검사날짜</th>
												<th style="width:10%">검사결과</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="i" items="${list1}">
											<tr>
												<td>${i.getCustomer_name()}</td>
												<td>기초검사</td>
												<td>${i.getEx_result()}</td>
												<td>${i.getBasic_date()}</td>
												<td><a href="javascript:void(0)" onclick="window.open('${path}/doctor/resultBasicEx?ex_num=${i.getEx_num()}','기초검사결과','resizable=no width=530 height=370');return false"><img style="width:30px; height:30px" src="${path_resources}images/돋보기.png"></a></td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class='css3-tab-content tab-two'>
								<div class="card-block">
									<table>
										<thead>
											<tr style="background:#35cebe; color:white;">
												<th style="width:15%">이름</th>
												<th style="width:25%">검사종류</th>
												<th style="width:30%">소견</th>
												<th style="width:20%">검사날짜</th>
												<th style="width:10%">검사결과</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="i" items="${list3}">
											<tr>
												<td>${i.getCustomer_name()}</td>
												<td>X-RAY검사</td>
												<td>${i.getXray_result()}</td>
												<td>${i.getXray_date()}</td>
												<td><a href="javascript:void(0)" onclick="window.open('${path}/doctor/resultXrayEx?xray_num=${i.getXray_num()}','x-ray검사결과','resizable=no width=530 height=370');return false"><img style="width:30px; height:30px" src="${path_resources}images/돋보기.png"></a></td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class='css3-tab-content add-new'>
								<div class="card-block">
									<table>
										<thead>
											<tr style="background:#35cebe; color:white;">
												<th style="width:15%">이름</th>
												<th style="width:25%">검사종류</th>
												<th style="width:30%">소견</th>
												<th style="width:20%">검사날짜</th>
												<th style="width:10%">검사결과</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="i" items="${list2}">
											<tr>
												<td>${i.getCustomer_name()}</td>
												<td>암(유방)검사</td>
												<td>${i.getCancer_result()}</td>
												<td>${i.getCancer_date()}</td>
												<td><a href="javascript:void(0);" onclick="window.open('${path}/doctor/resultCancerEx?cancer_num=${i.getCancer_num()}','암검사결과','resizable=no width=530 height=370');return false"><img style="width:30px; height:30px" src="${path_resources}images/돋보기.png"></a></td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<p class="credit">HTML5 Admin Template by <a href="https://www.medialoot.com">Medialoot</a></p>
		</section>
	</div>		
</body>
</html>
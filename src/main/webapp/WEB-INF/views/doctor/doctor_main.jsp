<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<style>
	.fc-ltr .fc-list-heading-alt{
		margin-right:15px !important;		
	}
	
</style>
<head>
	<meta charset="utf-8">
	<title>Doctor Template</title>
	
	<!-- jQuery 추가 -->
	<script src="${path_resources}js/jquery-3.5.1.min.js"></script>
	
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
	
	<!-- 캘린더 js -->
	<link href='${path_resources}calendar/packages/core/main.css' rel='stylesheet' />
	<link href='${path_resources}calendar/packages/list/main.css' rel='stylesheet' />
	<script src='${path_resources}calendar/packages/core/main.js'></script>
	<script src='${path_resources}calendar/packages/list/main.js'></script>
	<script>
	
	function logout() {
		var chk = confirm("로그아웃 하시겠습니까?");
		
		if(chk){
			document.getElementById('logout-form').submit();
		} else {
				alert("로그아웃 취소 되었습니다.")
				return false;
		}
	}
		
  	document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'list' ],
	  
      eventClick: function(info) {
          var eventObj = info.event;

          if (eventObj.url) {
        	  window.location.href = eventObj.url;

            info.jsEvent.preventDefault(); // prevents browser from following link in current tab.
          } else {
                alert('Clicked ' + eventObj.title);
          }
          },
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'listDay,listWeek,dayGridMonth'
      },

      // customize the button names,
      // otherwise they'd all just say "list"
      views: {
        listDay: { buttonText: 'list day' },
        listWeek: { buttonText: 'list week' }
      },

      defaultView: 'listWeek',
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: 
          function(info, successCallback, failureCallback){
			
			var header = '${_csrf.headerName}';
			var token = '${_csrf.token}';
		
		    $.ajax({
		        type: "POST",
		        url: "${pageContext.request.contextPath}/reservationList",
		        beforeSend: function(xhr){
					xhr.setRequestHeader(header, token);
				},
				dataType: "json",
		        success: function (result) {
		        	
		        	var events = [];
		        	
		        	for(var i = 0; i < result.length; i++){
		        		
		        		var event = {
		        				title: result[i].title,
		        				start: result[i].start,
		        				duration: '02:00',
		        				url: result[i].url
		        		};
		        	
		        		events.push(event);
		        		
		        	}
		        	
		        	successCallback(events);
		        },
		        
		        error : function(){
		        	alert("DB에서 데이터 불러오는 중 에러 발생");
		        }
		    })
		}
    });

    calendar.render();
  });

</script>
<style>
  	#calendar {
   		width: 1470px;
    	float: left;
  	}
</style>	
</head>
<script type="text/javascript">
// 환자조회/진료 클릭시 발생 이벤트
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
				<input type="text" id="keyword" name="" value="" placeholder="Search..." style="margin-bottom: 0;" autocomplete="off">
					<div id="searchDisplay">
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
				</a>
				</div>
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
						
						
		
			<!--일정표-->
			<div class="row grid-responsive mt-1">
				<div class="column">
					<div class="card">
						<div id='calendar'></div>
					</div>
				</div>
			</div>
			
			<!--Tables-->
			<div class="row grid-responsive">
				<div class="column ">
					<div class="card" style="margin-top:50px;">
						<div class="card-title">
							<h3>Recent Customer</h3>
						</div>
						<div class="card-block">
							<table>
								<thead>
									<tr style="background:#35cebe; color:white;">
										<th>구분</th>
										<th>이름</th>
										<th>성별</th>
										<th>나이</th>
										<th>진단</th>
										<th>진료일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="i" items="${list}">
									<tr>
										<td>${i.getInsurance()}</td>
										<td>${i.getCustomer_name()}</td>
										<td>${i.getCustomer_gender()}</td>
										<td><fmt:formatNumber value="${2020 - i.getCustomer_year()}" pattern="#,###"/>세</td>
										<td>${i.getDisease_code()}</td>
										<td><fmt:formatDate type = "both" pattern = "yyyy-MM-dd" value = "${i.getDiagnosis_time()}"/></td>
									</tr>
									</c:forEach>	
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>					
			<p class="credit">HTML5 Admin Template by <a href="https://www.medialoot.com">Medialoot</a></p>
		</section>
	</div>		
	<!-- Start of UiPath Chatbot widget -->
    <script>
  window.addEventListener("message", function (event) {
      if (event.data.hasOwnProperty("frameSize")) {
          const size = event.data.frameSize;
          document.getElementById("uipath-chatbot-iframe").style.height = size.height;
          document.getElementById("uipath-chatbot-iframe").style.width = size.width;
      }
  });
</script>
<iframe src="https://chatbot.uipath.com/web-channel?connectionId=058b734c-abbb-4acb-b9d6-8976248ebae5"
  id="uipath-chatbot-iframe"
  style="
      z-index: 9999;
      position: fixed;
      bottom: 0;
      right: 0;
      height: 112px;
      width: 120px;
      border: 0;">
</iframe>
<!-- End of UiPath Chatbot widget -->			
</body>
</html>
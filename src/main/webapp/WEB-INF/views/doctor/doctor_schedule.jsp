<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
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
	<link href='${path_resources}calendar/packages/daygrid/main.css' rel='stylesheet' />
	<link href='${path_resources}calendar/packages/timegrid/main.css' rel='stylesheet' />

	<script src='${path_resources}calendar/packages/core/main.js'></script>
	<script src='${path_resources}calendar/packages/list/main.js'></script>	
	<script src='${path_resources}calendar/packages/interaction/main.js'></script>
	<script src='${path_resources}calendar/packages/daygrid/main.js'></script>
	<script src='${path_resources}calendar/packages/timegrid/main.js'></script>
	<style type="text/css">	
	.fc-scroller { 
		overflow-y: hidden !important;
	}
	
	/* 달력 클릭했을 때 튀어나오는 모달 창에 대한 css 설정 시작 */
	
	#modal {
		display: none; 
		position: fixed; 
		z-index: 999; 
		left: 0;
		top: 0;
        width: 100%; 
        height: 100%; 
        overflow: auto; 
        background-color: rgb(0,0,0); 
        background-color: rgba(0,0,0,0.4); 
	}
	
	#modal_change {
		display: none; 
		position: fixed; 
		z-index: 999; 
		left: 0;
		top: 0;
        width: 100%; 
        height: 100%; 
        overflow: auto; 
        background-color: rgb(0,0,0); 
        background-color: rgba(0,0,0,0.4); 
	}
	
    .modal-content {
        background-color: #fefefe;
        margin: 12% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 50%;                   
    }
    
	.close {
		color: #aaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
		text-align: right;
	}
      
	.close:hover,
	.close:focus {
		color: black;
		text-decoration: none;
		cursor: pointer;
	}
      
	/* 달력 클릭했을 때 튀어나오는 모달 창에 대한 css 설정 끝 */
	
	.fc-content {
		cursor: pointer;
	}
	</style>
	
	
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
	
	//달력을 생성할 위치를 변수 CalendarEl에 지정	
    var calendarEl = document.getElementById('calendar');
 
	//달력 설정 정의하기 시작
    var calendar = new FullCalendar.Calendar(calendarEl, {
		
    	//FullCalendar의 기능은 plugin을 통해 구현할 수 있음
		//각 plugin에 대한 설명은 공식 홈페이지 DOCS > Plugin Index 참고
      plugins: [ 'interaction', 'dayGrid'],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      editable:false,
      selectable:true,
      selectOverlap:true,
      eventLimit:true,
      displayEventTime:false,
      
	  columnHeaderText: function(date) {
			let weekList = ["일", "월", "화", "수", "목", "금", "토"];
			return weekList[date.getDay()];
	  },
	  
		//달력 클릭하면 숨겨놨던 모달창 보이게 만들기
		select: function(info){
			
			var modal = document.getElementById('modal');
			 
			modal.style.display="block";
			
			let today = new Date(); // 전역 변수, 오늘 날짜 / 내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
			let year = today.getFullYear(); // 년도
			let month = today.getMonth() + 1;  // 월
			let date1 = today.getDate() + 1;  // +1일
			let date2 = today.getDate() + 2;  // +2일
			let date3 = today.getDate() + 3;  // +3일
			let date4 = today.getDate() + 4;  // +4일
			let date5 = today.getDate() + 5;  // +5일
			let day = today.getDay();  // 요일	
			
			document.getElementById("date1").innerText = year + '/' + month + '/' + date1;
			document.getElementById("date2").innerText = year + '/' + month + '/' + date2;
			document.getElementById("date3").innerText = year + '/' + month + '/' + date3;
			document.getElementById("date4").innerText = year + '/' + month + '/' + date4;
			document.getElementById("date5").innerText = year + '/' + month + '/' + date5;
			
			// input값에 값주기
			$('#start1').val(year + '/' + month + '/' + date1);
			$('#start2').val(year + '/' + month + '/' + date2);
			$('#start3').val(year + '/' + month + '/' + date3);
			$('#start4').val(year + '/' + month + '/' + date4);
			$('#start5').val(year + '/' + month + '/' + date5);
			
			document.appointForm.appoint_date[0].value = year + '/0' + month + '/' + date1;
			document.appointForm.appoint_date[1].value = year + '/0' + month + '/' + date2;
			document.appointForm.appoint_date[2].value = year + '/0' + month + '/' + date3;
			document.appointForm.appoint_date[3].value = year + '/0' + month + '/' + date4;
			document.appointForm.appoint_date[4].value = year + '/0' + month + '/' + date5;						
			
			var day1 = String(year)+"0"+String(month)+String(date1);
			var day2 = String(year)+"0"+String(month)+String(date2);
			var day3 = String(year)+"0"+String(month)+String(date3);
			var day4 = String(year)+"0"+String(month)+String(date4);
			var day5 = String(year)+"0"+String(month)+String(date5);
			var days = [day1, day2, day3, day4, day5];
			
			var times = [$('#time0').val(), $('#time1').val(), $('#time2').val(), $('#time3').val(), $('#time4').val(),
				$('#time5').val(),$('#time6').val(),$('#time7').val(),$('#time8').val(),$('#time9').val(),$('#time10').val(),
				$('#time11').val(),$('#time12').val(),$('#time13').val(),$('#time14').val(),$('#time15').val(),$('#time16').val()
				,$('#time17').val(),$('#time18').val(),$('#time19').val()];
			
			var doctor_id = $(':input[name=doctor_id]').val();
			var obj = new Object();
			var result = "";
			$.ajax({
				url : '${pageContext.request.contextPath}/getAppointList',
				type : 'GET',   // 전송방식
				dataType : 'json', // 요청한 데이터 형식 ("html", "xml", "json", "text")
				success : function(obj) { // 콜백함수 - 전송에 성공했을 때의 결과가 data에 전달된다.
					for(var i=0; i<obj.length; i++) {
						if(obj[i].doctor_id == doctor_id) {
							for(var j=0; j<5; j++) {
 								if(days[j] == obj[i].appoint_date) { 									
									if(j == 0) {
										for(x=0; x<=3; x++) {
											if(times[x] == obj[i].appoint_time) {
												$('#time'+x).attr("disabled", true);
												$('#timeText'+x).css("color", "red");
											}
										}
									}
									if(j == 1) {
										for(x=4; x<=7; x++) {
											if(times[x] == obj[i].appoint_time) {
												$('#time'+x).attr("disabled", true);
												$('#timeText'+x).css("color", "red");
											}
										}
									}
									if(j == 2) {
										for(x=8; x<=11; x++) {
											if(times[x] == obj[i].appoint_time) {
												$('#time'+x).attr("disabled", true);
												$('#timeText'+x).css("color", "red");
											}
										}
									}
									if(j == 3) {
										for(x=12; x<=15; x++) {
											if(times[x] == obj[i].appoint_time) {
												$('#time'+x).attr("disabled", true);
												$('#timeText'+x).css("color", "red");
											}
										}
									}
									if(j == 4) {
										for(x=16; x<=19; x++) {
											if(times[x] == obj[i].appoint_time) {
												$('#time'+x).attr("disabled", true);
												$('#timeText'+x).css("color", "red");
											}
										}
									}
								}
							}					
						}															
					}
					$('#appointTime').html(result);
				},
				error : function() {
					alert('오류');
				}
			});											
			
			document.appointForm.appoint_time[0].value = day1 + "09:00";
			document.appointForm.appoint_time[1].value = day1 + "11:00";
			document.appointForm.appoint_time[2].value = day1 + "14:00";
			document.appointForm.appoint_time[3].value = day1 + "16:00";
			document.appointForm.appoint_time[4].value = day2 + "09:00";
			document.appointForm.appoint_time[5].value = day2 + "11:00";
			document.appointForm.appoint_time[6].value = day2 + "14:00";
			document.appointForm.appoint_time[7].value = day2 + "16:00";
			document.appointForm.appoint_time[8].value = day3 + "09:00";
			document.appointForm.appoint_time[9].value = day3 + "11:00";
			document.appointForm.appoint_time[10].value = day3 + "14:00";
			document.appointForm.appoint_time[11].value = day3 + "16:00";
			document.appointForm.appoint_time[12].value = day4 + "09:00";
			document.appointForm.appoint_time[13].value = day4 + "11:00";
			document.appointForm.appoint_time[14].value = day4 + "14:00";
			document.appointForm.appoint_time[15].value = day4 + "16:00";
			document.appointForm.appoint_time[16].value = day5 + "09:00";
			document.appointForm.appoint_time[17].value = day5 + "11:00";
			document.appointForm.appoint_time[18].value = day5 + "14:00";
			document.appointForm.appoint_time[19].value = day5 + "16:00";
			
			var span = document.getElementsByClassName("close")[0];     

			span.onclick = function() {
			    modal.style.display = "none";
			};
			
			window.onclick = function(event) {
	            if (event.target == modal) {
	                modal.style.display = "none";
	            }
	        };
		},
		
		//이벤트 클릭했을 때 실행
		eventClick: function(info){
			
			//info.event.start 데이터를 그대로 집어넣으면 input 태그의 datetime-local와 형식이 달라서 데이터가 안 들어감
			//toISOString()으로 형식을 바꿔주고 끝자리 8자리를 잘라줘야 데이터가 들어감
			document.getElementById('origin_title').value=info.event.title;
			document.getElementById('title_change').value=info.event.title;
			document.getElementById('start_change').value=dateChange(info.event.start);
			document.getElementById('end_change').value=dateChange(info.event.end);
			document.getElementById('memo_change').value=info.event.extendedProps.description;

			var modal = document.getElementById('modal_change');
			modal.style.display="block";
								
			var span = document.getElementsByClassName("close")[1];     

			span.onclick = function() {
			    modal.style.display = "none";
			};
			
			window.onclick = function(event) {
	            if (event.target == modal) {
	                modal.style.display = "none";
	            }
	        };
		},
		
	  //DB에서 일정 정보 불러오기
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
			$('#searchDisplay').css("border-radius", "499rem");
			
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
				<input type="text" id="keyword" name="" value="" placeholder="Search..." style="margin-bottom: 0;">
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
			<ul>
				<li><a href="${path}/doctor/doctor_main"><em class="fa fa-home"></em> Home</a></li>
				<li><a href="${path}/doctor/doctor_schedule"><em class="fa fa-table"></em> 스케쥴관리</a></li>
				<li><a href="javascript:void(0);" onclick="resReset();"><em class="fa fa-pencil-square-o"></em> 환자조회/진료</a></li>
				<li><a href="#alerts"><em class="fa fa-hand-o-up"></em> 진료도우미</a></li>
				<li><a href="javascript:window.open('http://192.168.219.113:2000/standby?section=')"><em class="fa fa-hand-o-up"></em> 환자와의 채팅</a></li>
			</ul>
		</div>
		
		<section id="main-content" class="column column-offset-20">
		<!-- 달력에 일정 추가하는 모달창 시작
		============================================= -->
		<div id = "modal">
			<div class="modal-content">
                <div class="modal-header">
                	<span class="close">&times;</span>
                    <h5 class="modal-title" id="insertModalLabel">예약가능 일자 설정</h5>    
                </div>
                <div class="modal-body">
                    <form name="appointForm" method="POST" action="${path}/doctor/appointSetPro">
                    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    	<input type="hidden" name="doctor_id" value="${doctor.getDoctor_id()}">
                        <div class="form-group">
                            <label>의사</label>
                            <input type="text" class="form-control" id="title" maxlength="30" value="${doctor.getDoctor_name()} (${doctor.getDoctor_id()})" disabled>                            
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group" style="margin-left:10px;">
                                    <label>예약일자</label>
                                    <div id="date1"></div><input style="display:none;" type="checkbox" name="appoint_date" class="form-control" id="start1">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" style="margin-left:40px;">
                                    <label>예약가능 시간 설정</label>
                                      <input type='checkbox' name='appoint_time' value='09:00' id="time0"><span id="timeText0">09:00</span>
                                      <input type='checkbox' name='appoint_time' value='11:00' id="time1"><span id="timeText1">11:00</span>
									  <input type='checkbox' name='appoint_time' value='14:00' id="time2"><span id="timeText2">14:00</span>
									  <input type='checkbox' name='appoint_time' value='16:00' id="time3"><span id="timeText3">16:00</span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group" style="margin-left:10px;">
                                    <label>예약일자</label>
                                    <div id="date2"></div><input style="display:none;" type="checkbox" name="appoint_date" class="form-control" id="start2">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" style="margin-left:40px;">
                                    <label>예약가능 시간 설정</label>
                                      <input type='checkbox' name='appoint_time' value='09:00' id="time4"/><span id="timeText4">09:00</span>
                                      <input type='checkbox' name='appoint_time' value='11:00' id="time5"/><span id="timeText5">11:00</span>
									  <input type='checkbox' name='appoint_time' value='14:00' id="time6"/><span id="timeText6">14:00</span>
									  <input type='checkbox' name='appoint_time' value='16:00' id="time7"/><span id="timeText7">16:00</span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group" style="margin-left:10px;">
                                    <label>예약일자</label>
                                    <div id="date3"></div><input style="display:none;" type="checkbox" name="appoint_date" class="form-control" id="start3">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" style="margin-left:40px;">
                                    <label>예약가능 시간 설정</label>
                                      <input type='checkbox' name='appoint_time' value='09:00' id="time8"/><span id="timeText8">09:00</span>
                                      <input type='checkbox' name='appoint_time' value='11:00' id="time9"/><span id="timeText9">11:00</span>
									  <input type='checkbox' name='appoint_time' value='14:00' id="time10"/><span id="timeText10">14:00</span>
									  <input type='checkbox' name='appoint_time' value='16:00' id="time11"/><span id="timeText11">16:00</span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group" style="margin-left:10px;">
                                    <label>예약일자</label>
                                    <div id="date4"></div><input style="display:none;" type="checkbox" name="appoint_date" class="form-control" id="start4">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" style="margin-left:40px;">
                                    <label>예약가능 시간 설정</label>
                                      <input type='checkbox' name='appoint_time' value='09:00' id="time12"/><span id="timeText12">09:00</span>
                                      <input type='checkbox' name='appoint_time' value='11:00' id="time13"/><span id="timeText13">11:00</span>
									  <input type='checkbox' name='appoint_time' value='14:00' id="time14"/><span id="timeText14">14:00</span>
									  <input type='checkbox' name='appoint_time' value='16:00' id="time15"/><span id="timeText15">16:00</span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group" style="margin-left:10px;">
                                    <label>예약일자</label>
                                    <div id="date5"></div><input style="display:none;" type="checkbox" name="appoint_date" class="form-control" id="start5">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" style="margin-left:40px;">
                                    <label>예약가능 시간 설정</label>
                                      <input type='checkbox' name='appoint_time' value='09:00' id="time16"/><span id="timeText16">09:00</span>
                                      <input type='checkbox' name='appoint_time' value='11:00' id="time17"/><span id="timeText17">11:00</span>
									  <input type='checkbox' name='appoint_time' value='14:00' id="time18"/><span id="timeText18">14:00</span>
									  <input type='checkbox' name='appoint_time' value='16:00' id="time19"/><span id="timeText19">16:00</span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group" style="margin-left:10px;">
                                    <label style="color:red;">비활성화는 이미예약설정된 시간임</label>
										<div id="appointTime"></div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-outline-primary">예약일정 추가하기</button>
                        </div>
                    </form>
                </div>
           </div>
		</div>		
		<!-- 달력에 일정 추가하는 모달창 끝
		============================================= -->
			<!-- 달력출력 -->
			<div id='calendar'></div>
		
			<p class="credit">HTML5 Admin Template by <a href="https://www.medialoot.com">Medialoot</a></p>
		</section>
	</div>
</body>
</html>
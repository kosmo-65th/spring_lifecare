<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
	<title>Doctor Template</title>
	
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
	</style>
<script>

document.addEventListener('DOMContentLoaded', function() {
	
	//달력을 생성할 위치를 변수 CalendarEl에 지정	
    var calendarEl = document.getElementById('calendar');
 
	//달력 설정 정의하기 시작
    var calendar = new FullCalendar.Calendar(calendarEl, {
		
    	//FullCalendar의 기능은 plugin을 통해 구현할 수 있음
		//각 plugin에 대한 설명은 공식 홈페이지 DOCS > Plugin Index 참고
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      defaultDate: '2020-02-12',
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true, //달력에 생성된 이벤트를 수정할 수 있는지에 대한 설정(T/F)
      events: [
        {
          title: 'Business Lunch',
          start: '2020-02-03T13:00:00',
          constraint: 'businessHours'
        },
        {
          title: 'Meeting',
          start: '2020-02-13T11:00:00',
          constraint: 'availableForMeeting', // defined below
          color: '#257e4a'
        },
        {
          title: 'Conference',
          start: '2020-02-18',
          end: '2020-02-20'
        },
        {
          title: 'Party',
          start: '2020-02-29T20:00:00'
        },

        // areas where "Meeting" must be dropped
        {
          groupId: 'availableForMeeting',
          start: '2020-02-11T10:00:00',
          end: '2020-02-11T16:00:00',
          rendering: 'background'
        },
        {
          groupId: 'availableForMeeting',
          start: '2020-02-13T10:00:00',
          end: '2020-02-13T16:00:00',
          rendering: 'background'
        },

        // red areas where no events can be dropped
        {
          start: '2020-02-24',
          end: '2020-02-28',
          overlap: false,
          rendering: 'background',
          color: '#ff9f89'
        },
        {
          start: '2020-02-06',
          end: '2020-02-08',
          overlap: false,
          rendering: 'background',
          color: '#ff9f89'
        }
      ]
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
<body>

	<div class="navbar">
		<div class="row">
			<div class="column column-30 col-site-title"><a href="${path}/doctor/doctor_main" class="site-title float-left">Lifecare</a></div>
			<div class="column column-40 col-search"><a href="#" class="search-btn fa fa-search"></a>
				<input type="text" name="" value="" placeholder="Search..." />
			</div>
			<div class="column column-30">
				<div class="user-section"><a href="#">
					<img src="${path_resources}images/doctor.png" alt="profile photo" class="circle float-left profile-photo" width="50" height="auto">
					<div class="username">
						<h4>한승운</h4>
						<p>진료과</p>
					</div>
				</a></div>
			</div>
		</div>
	</div>
	<div class="row">
		<div id="sidebar" class="column">
			<h5>Navigation</h5>
			<ul>
				<li><a href="${path}/doctor_main"><em class="fa fa-home"></em> Home</a></li>
				<li><a href="${path}/doctor_schedule"><em class="fa fa-table"></em> 스케쥴관리</a></li>
				<li><a href="${path}/doctor_medicalNote"><em class="fa fa-pencil-square-o"></em> 환자조회/진료</a></li>
				<li><a href="#alerts"><em class="fa fa-hand-o-up"></em> 진료도우미</a></li>
			</ul>
		</div>
		
		<section id="main-content" class="column column-offset-20">
		
			<div id='calendar'></div>
		
			<p class="credit">HTML5 Admin Template by <a href="https://www.medialoot.com">Medialoot</a></p>
		</section>
	</div>
</body>
</html>
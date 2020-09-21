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
      defaultDate: '2020-02-12',
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
      events: [
        {
          title: 'Business Lunch',
          start: '2020-02-03 13:00:00',
          constraint: 'businessHours'
        },
        {
          title: 'Meeting',
          start: '2020-02-13 11:00:00',
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
          start: '2020-02-29 20:00:00'
        },

        // areas where "Meeting" must be dropped
        {
          groupId: 'availableForMeeting',
          start: '2020-02-11 10:00:00',
          end: '2020-02-11T16:00:00',
          rendering: 'background'
        },
        {
          groupId: 'availableForMeeting',
          start: '2020-02-13 10:00:00',
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
			$('#searchDisplay').css("visibility", "hidden");       // 숨김
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
				<li><a href="javascript:void(0);" onclick="resReset();"><em class="fa fa-pencil-square-o"></em> 환자조회/진료</a></li>
				<li><a href="#alerts"><em class="fa fa-hand-o-up"></em> 진료도우미</a></li>
			</ul>
		</div>
		
		<section id="main-content" class="column column-offset-20">
		<!-- 달력에 일정 추가하는 모달창 시작
		============================================= -->
		<div id = "modal">
			<div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="insertModalLabel">예약가능 일자 설정</h5>
                    
                     <span class="close">&times;</span> 
                </div>
                <div class="modal-body">
                    <form method="POST" action="javascript:insertSkd();">
                    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    	
                        <div class="form-group">
                            <label>의사</label>
                            <input type="text" class="form-control" id="title" maxlength="30">
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group" style="margin-left:10px;">
                                    <label>예약일자 설정</label>
                                    <input type="date" name="start" class="form-control" id="start" required="">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" style="margin-left:40px;">
                                    <label>예약가능 시간 설정</label>
                                      <input type='checkbox' name='appoint_time' value='09:00' checked />09:00
                                      <input type='checkbox' name='appoint_time' value='11:00' checked />11:00
									  <input type='checkbox' name='appoint_time' value='14:00' checked />14:00
									  <input type='checkbox' name='appoint_time' value='16:00' checked />16:00
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>메모</label>
                            <textarea class="form-control" id="memo" name="memo" placeholder="memo" style="resize: none;" maxlength="100"></textarea>
                        </div>
                        <hr>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="${path_resources}css/appointment.css">
<link type="text/css" rel="stylesheet" href="${path_resources}css/payment.css">
<!-- jQuery 추가 -->
<script src="${path_resources}js/jquery-3.5.1.min.js"></script>

<script type="text/javascript" src="${path_resources}js/appointment2.js"></script>
<script type="text/javascript">

//radio 버튼 클릭 이벤트 
$(document).ready(function(){
	$('input:radio[name=selectRe]').click(function(){	
		var appoint_num = $('input:radio[name=selectRe]:checked').val();
		document.reservationForm.appoint_num.value = appoint_num;
		
		var obj = new Object();
		var doctor_major = "";
		var doctor_name = "";
		var reservation_date = "";
		$.ajax({
			url : '${pageContext.request.contextPath}/customer/getReservationInfo?appoint_num=' + appoint_num,
			type : 'GET',   // 전송방식
			dataType : 'json', // 요청한 데이터 형식 ("html", "xml", "json", "text")
			success : function(obj) { // 콜백함수 - 전송에 성공했을 때의 결과가 data에 전달된다.
				for(var i=0; i<obj.length; i++) {
					doctor_major = obj[i].doctor_major; 
					doctor_name = obj[i].doctor_name;
					reservation_date = obj[i].reservation_date;
				}
				var date = new Date(reservation_date);
				var date2 = date.toLocaleString();

				$('#myDp').html(doctor_major);
				$('#myDr').html(doctor_name); // 예약정보 확인에 뿌리기
				$('#myTm').html(date2);
			},
			error : function() {
				alert('오류');
			}
		});
	});
	
});

function joinInFocus(){
   if (document.reservationForm.appoint_num.value == "0"){
		alert("취소할 날짜를 선택해주세요.");
	    return false;			    
   }
}

</script>
</head>
<body>
<%@include file="../common/header.jsp" %>
<div id="contents" style="margin:0 auto;">
<div class="reserBox">
		<div class="reserStep" style="width:900px">
		<h2>My Reservations</h2>
		<div class="reserArea pz">
			<div id="reserDen">
				<div class="tablePay" style="text-align:center;">    
				    <div class="row1 header blue" style="background:#20385f;">
				      <div class="cell1">
				        	&nbsp;
				      </div>
				      <div class="cell1">
				        	구분
				      </div>
				      <div class="cell1">
				        	진료과
				      </div>
				      <div class="cell1">
				        	담당교수
				      </div>
				      <div class="cell1">
				        	예약시간
				      </div>
				    </div>
				    <c:forEach var="i" items="${list}">
				    <div class="row1">
				      <div class="cell1">
				        	<input type="radio" name="selectRe" value="${i.getAppoint_num()}">
				      </div>			    
				      <div class="cell1" id="insurance">
				        	${i.getInsurance()}
				      </div>
				      <div class="cell1" id="doctor_major">
				        	${i.getDoctor_major()}
				      </div>
				      <div class="cell1" id="doctor_name">
				        	${i.getDoctor_name()}
				      </div>
				      <div class="cell1" id="reservation_date">
				        	${i.getReservation_date()}
				      </div>
				    </div>
					</c:forEach>
</div>
			</div>
		</div>
	</div>

	<div class="reserStep">
		<h2>예약정보 확인</h2>
		<div class="reserArea rline">
		<form action="${path}/customer/cancelAppointment" name="reservationForm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden" name="appoint_num" value="0">
			<dl class="myInfo">
				<dt>환자명</dt>
				<dd>&nbsp;${customer_name}</dd>
				<dt>환자ID</dt>
				<dd>&nbsp;${sessionScope.userSession}</dd>
				<dt>진료과</dt>
				<dd id="myDp">&nbsp;</dd>
				<dt>의료진</dt>
				<dd id="myDr">&nbsp;</dd>
				<dt>예약시간</dt>
				<dd id="myTm">&nbsp;</dd>
			</dl>
				<a style="width:300; margin-left:10;" href="javascript:reservationForm.submit();" onclick="return joinInFocus();" class="btn btn-blue btn-br btn-lg4"><span class="ico_cancel"></span>예약취소</a>
			</form>
		</div>
		<div class="reserArea tac">
			<div class="btnArea">
			</div>
		</div>
	</div>
</div>
</div>
<%@include file="../common/footer.jsp" %>
</body>
</html>

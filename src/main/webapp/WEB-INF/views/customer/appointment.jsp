<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
    a { color:#000000;text-decoration:none; }
    .scriptCalendar { text-align:center; }
    .scriptCalendar > thead > tr > td { width:20px;height:30px; }
    .scriptCalendar > thead > tr:first-child > td { font-weight:bold; }
    .scriptCalendar > thead > tr:last-child > td { background-color:#90EE90; }
    .scriptCalendar > tbody > tr > td { width:20px;height:30px; }
</style>
<link type="text/css" rel="stylesheet" href="${path_resources}css/appointment.css">
<!-- jQuery 추가 -->
<script src="${path_resources}js/jquery-3.5.1.min.js"></script>

<script type="text/javascript" src="${path_resources}js/appointment2.js"></script>
<%-- <script type="text/javascript" src="${path_resources}js/appointment_layout.js"></script> --%>
<script type="text/javascript">

// 달력소스	
document.addEventListener("DOMContentLoaded", function() {
      buildCalendar();
});

var today = new Date(); // @param 전역 변수, 오늘 날짜 / 내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
var date = new Date();  // @param 전역 변수, today의 Date를 세어주는 역할

/**
 * @brief   이전달 버튼 클릭
 */
function prevCalendar() {
	if(document.Form1.medDp.value == "" || document.Form1.medDr.value == ""){
		alert("의료진을 선택해 주세요");
		return;
	}
    this.today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
    buildCalendar2();  
}

/**
 * @brief   다음달 버튼 클릭
 */
function nextCalendar() {
	if(document.Form1.medDp.value == "" || document.Form1.medDr.value == ""){
		alert("의료진을 선택해 주세요");
		return;
	}
    this.today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
    buildCalendar2();    // @param 명월 캘린더 출력 요청
}

/**
 * @brief   캘린더 오픈
 * @details 날짜 값을 받아 캘린더 폼을 생성하고, 날짜값을 채워넣는다.
 */
function buildCalendar() {

    let doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
    let lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);

    let tbCalendar = document.querySelector(".scriptCalendar > tbody");

    document.getElementById("calYear").innerText = today.getFullYear();                                  // @param YYYY월
    document.getElementById("calMonth").innerText = autoLeftPad((today.getMonth() + 1), 2);   // @param MM월

    // @details 이전 캘린더의 출력결과가 남아있다면, 이전 캘린더를 삭제한다.
    while(tbCalendar.rows.length > 0) {
        tbCalendar.deleteRow(tbCalendar.rows.length - 1);
    }

    // @param 첫번째 개행
    let row = tbCalendar.insertRow();

    // @param 날짜가 표기될 열의 증가값
    let dom = 1;

    // @details 시작일의 요일값( doMonth.getDay() ) + 해당월의 전체일( lastDate.getDate())을  더해준 값에서
    //               7로 나눈값을 올림( Math.ceil() )하고 다시 시작일의 요일값( doMonth.getDay() )을 빼준다.
    let daysLength = (Math.ceil((doMonth.getDay() + lastDate.getDate()) / 7) * 7) - doMonth.getDay();

    // @param 달력 출력

    // @details 시작값은 1일을 직접 지정하고 요일값( doMonth.getDay() )를 빼서 마이너스( - )로 for문을 시작한다.
    for(let day = 1 - doMonth.getDay(); daysLength >= day; day++) {

        let column = row.insertCell();

        // @param 평일( 전월일과 익월일의 데이터 제외 )
        if(Math.sign(day) == 1 && lastDate.getDate() >= day) {

            // @param 평일 날짜 데이터 삽입

            column.innerText = autoLeftPad(day, 2);

            // @param 일요일인 경우
            if(dom % 7 == 1) {
                column.style.color = "#FF4D4D";
            }

            // @param 토요일인 경우
            if(dom % 7 == 0) {
                column.style.color = "#4D4DFF";
                row = tbCalendar.insertRow();   // @param 토요일이 지나면 다시 가로 행을 한줄 추가한다.
            }
        }

        // @param 평일 전월일과 익월일의 데이터 날짜변경
        else {
            let exceptDay = new Date(doMonth.getFullYear(), doMonth.getMonth(), day);
            column.innerText = autoLeftPad(exceptDay.getDate(), 2);
            column.style.color = "#A9A9A9";
        }

        // @brief   전월, 명월 음영처리
        // @details 현재년과 선택 년도가 같은경우
        if(today.getFullYear() == date.getFullYear()) {

            // @details 현재월과 선택월이 같은경우
            if(today.getMonth() == date.getMonth()) {

                // @details 현재일보다 이전인 경우이면서 현재월에 포함되는 일인경우
                if(date.getDate() > day && Math.sign(day) == 1) {
                    column.style.backgroundColor = "#E5E5E5";
                }

                // @details 현재일보다 이후이면서 현재월에 포함되는 일인경우
                else if(date.getDate() < day && lastDate.getDate() >= day) {
                    column.style.backgroundColor = "#FFFFFF";
                    column.style.cursor = "pointer";
                    column.onclick = function(){ calendarChoiceDay(this); }
                }

                // @details 현재일인 경우
                else if(date.getDate() == day) {
                    column.style.backgroundColor = "#FFFFE6";
                    column.style.cursor = "pointer";
                    column.onclick = function(){ calendarChoiceDay(this); }
                }

            // @details 현재월보다 이전인경우
            } else if(today.getMonth() < date.getMonth()) {
                if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                    column.style.backgroundColor = "#E5E5E5";
                }
            }

            // @details 현재월보다 이후인경우
            else {
                if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                    column.style.backgroundColor = "#FFFFFF";
                    column.style.cursor = "pointer";
                    column.onclick = function(){ calendarChoiceDay(this); }
                }
            }
        }

        // @details 선택한년도가 현재년도보다 작은경우
        else if(today.getFullYear() < date.getFullYear()) {
            if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                column.style.backgroundColor = "#E5E5E5";
            }
        }

        // @details 선택한년도가 현재년도보다 큰경우
        else {
            if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                column.style.backgroundColor = "#FFFFFF";
                column.style.cursor = "pointer";
                column.onclick = function(){ calendarChoiceDay(this); }
            }
        }
        dom++;
    }
}

function buildCalendar2() {

    let doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
    let lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);

    let tbCalendar = document.querySelector(".scriptCalendar > tbody");

    document.getElementById("calYear").innerText = today.getFullYear();                                  // @param YYYY월
    document.getElementById("calMonth").innerText = autoLeftPad((today.getMonth() + 1), 2);   // @param MM월

    // @details 이전 캘린더의 출력결과가 남아있다면, 이전 캘린더를 삭제한다.
    while(tbCalendar.rows.length > 0) {
        tbCalendar.deleteRow(tbCalendar.rows.length - 1);
    }

    // @param 첫번째 개행
    let row = tbCalendar.insertRow();

    // @param 날짜가 표기될 열의 증가값
    let dom = 1;

    // @details 시작일의 요일값( doMonth.getDay() ) + 해당월의 전체일( lastDate.getDate())을  더해준 값에서
    //               7로 나눈값을 올림( Math.ceil() )하고 다시 시작일의 요일값( doMonth.getDay() )을 빼준다.
    let daysLength = (Math.ceil((doMonth.getDay() + lastDate.getDate()) / 7) * 7) - doMonth.getDay();

    // @param 달력 출력

    // @details 시작값은 1일을 직접 지정하고 요일값( doMonth.getDay() )를 빼서 마이너스( - )로 for문을 시작한다.
    for(let day = 1 - doMonth.getDay(); daysLength >= day; day++) {

        let column = row.insertCell();

        // @param 평일( 전월일과 익월일의 데이터 제외 )
        if(Math.sign(day) == 1 && lastDate.getDate() >= day) {

            // @param 평일 날짜 데이터 삽입

            column.innerText = autoLeftPad(day, 2);

            // @param 일요일인 경우
            if(dom % 7 == 1) {
                column.style.color = "#FF4D4D";
            }

            // @param 토요일인 경우
            if(dom % 7 == 0) {
                column.style.color = "#4D4DFF";
                row = tbCalendar.insertRow();   // @param 토요일이 지나면 다시 가로 행을 한줄 추가한다.
            }
        }

        // @param 평일 전월일과 익월일의 데이터 날짜변경
        else {
            let exceptDay = new Date(doMonth.getFullYear(), doMonth.getMonth(), day);
            column.innerText = autoLeftPad(exceptDay.getDate(), 2);
            column.style.color = "#A9A9A9";
        }

        // @brief   전월, 명월 음영처리
        // @details 현재년과 선택 년도가 같은경우
        if(today.getFullYear() == date.getFullYear()) {

            // @details 현재월과 선택월이 같은경우
            if(today.getMonth() == date.getMonth()) {

                // @details 현재일보다 이전인 경우이면서 현재월에 포함되는 일인경우
                if(date.getDate() > day && Math.sign(day) == 1) {
                    column.style.backgroundColor = "#E5E5E5";
                }

                // @details 현재일보다 이후이면서 현재월에 포함되는 일인경우
                else if(date.getDate() < day && lastDate.getDate() >= day) {
                	$.ajax({
                		url : '${pageContext.request.contextPath}/customer/getTimeList',
                		type : 'GET',   // 전송방식
                		dataType : 'json', // 요청한 데이터 형식 ("html", "xml", "json", "text")
                		success : function(obj) { // 콜백함수 - 전송에 성공했을 때의 결과가 data에 전달된다.
                			for(var i=0; i<obj.length; i++) {
                				if(obj[i].doctor_id == $(':input[name=doctor_num]').val() && obj[i].appoint_date == document.getElementById("calYear").innerText + document.getElementById("calMonth").innerText + column.innerText) {
                                    column.style.backgroundColor = "#FFFFFF";
                                    column.style.cursor = "pointer";
                                    column.onclick = function(){ calendarChoiceDay(this); }				
                				}															
                			}
                		},
                		error : function() {
                			alert('오류');
                		}
                	});

                }

            // @details 현재월보다 이전인경우
            } else if(today.getMonth() < date.getMonth()) {
                if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                    column.style.backgroundColor = "#E5E5E5";
                }
            }

            // @details 현재월보다 이후인경우
            else {
                if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                	$.ajax({
                		url : '${pageContext.request.contextPath}/customer/getTimeList',
                		type : 'GET',   // 전송방식
                		dataType : 'json', // 요청한 데이터 형식 ("html", "xml", "json", "text")
                		success : function(obj) { // 콜백함수 - 전송에 성공했을 때의 결과가 data에 전달된다.
                			for(var i=0; i<obj.length; i++) {
                				if(obj[i].doctor_id == $(':input[name=doctor_num]').val() && obj[i].appoint_date == document.getElementById("calYear").innerText + document.getElementById("calMonth").innerText + column.innerText) {
                                    column.style.backgroundColor = "#FFFFFF";
                                    column.style.cursor = "pointer";
                                    column.onclick = function(){ calendarChoiceDay(this); }				
                				}															
                			}
                		},
                		error : function() {
                			alert('오류');
                		}
                	});
                }
            }
        }

        // @details 선택한년도가 현재년도보다 작은경우
        else if(today.getFullYear() < date.getFullYear()) {
            if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                column.style.backgroundColor = "#E5E5E5";
            }
        }

        // @details 선택한년도가 현재년도보다 큰경우
        else {
            if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                column.style.backgroundColor = "#FFFFFF";
                column.style.cursor = "pointer";
                column.onclick = function(){ calendarChoiceDay(this); }
            }
        }
        dom++;
    }
}
/**
 * @brief   날짜 선택
 * @details 사용자가 선택한 날짜에 체크표시를 남긴다.
 */
function calendarChoiceDay(column) {
	// 진료과나 의료진 선택 안했을시
	if(document.Form1.medDp.value == "" || document.Form1.medDr.value == ""){
		alert("의료진을 선택해 주세요");
		return;
	}
	
    // @param 기존 선택일이 존재하는 경우 기존 선택일의 표시형식을 초기화 한다.
    if(document.getElementsByClassName("choiceDay")[0]) {
        document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#FFFFFF";
        document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
    }
    // @param 선택일 체크 표시
    column.style.backgroundColor = "#FF9999";
    // @param 선택일 클래스명 변경
    column.classList.add("choiceDay");
    
    var year = document.getElementById("calYear").innerHTML;
    var month = document.getElementById("calMonth").innerHTML;
    var day = column.innerHTML;
    var date = year + month + day;
    $(':input[name=sday]').val(date);
    getTimeList(document.Form1.doctor_num.value, date);          
}


// 예약 가능한 시간 뿌리기
function getTimeList(doctor_num, date){
	var obj = new Object();
	var result = "";
	$.ajax({
		url : '${pageContext.request.contextPath}/customer/getTimeList',
		type : 'GET',   // 전송방식
		dataType : 'json', // 요청한 데이터 형식 ("html", "xml", "json", "text")
		success : function(obj) { // 콜백함수 - 전송에 성공했을 때의 결과가 data에 전달된다.
			for(var i=0; i<obj.length; i++) {
				if(obj[i].doctor_id == doctor_num && obj[i].appoint_date == date) {
					result += "<a href=\"javascript:void(0);\" onclick=\"selectTime('" + obj[i].appoint_time + "', '" + i + "', '" + obj[i].appoint_num + "');\"><li id=\"dt" + i + "\">" + obj[i].appoint_time + "</li></a>";					
				}															
			}
			$('#denTlist').html(result);
			$('#myDate').html(date); // 예약정보 확인에 뿌리기
		},
		error : function() {
			alert('오류');
		}
	});
}

// 예약정보 확인에 예약시간 뿌리기
function selectTime(appoint_time, i, appoint_num){
	for(var j=0; j<100; j++) {
		if(document.getElementById('dt' + j)) {
			document.getElementById('dt' + j).style.background = "#fff";
		}
	}
	$('#myTm').html(appoint_time); // 예약정보 확인에 뿌리기
	$(':input[name=medTm]').val(appoint_time);
	$(':input[name=appoint_num]').val(appoint_num);
	document.getElementById('dt' + i).style.background = "#7eb9fb";

}
/**
 * @brief   숫자 두자릿수( 00 ) 변경
 * @details 자릿수가 한지라인 ( 1, 2, 3등 )의 값을 10, 11, 12등과 같은 두자리수 형식으로 맞추기위해 0을 붙인다.
 * @param   num     앞에 0을 붙일 숫자 값
 * @param   digit   글자의 자릿수를 지정 ( 2자릿수인 경우 00, 3자릿수인 경우 000 … )
 */
function autoLeftPad(num, digit) {
    if(String(num).length < digit) {
        num = new Array(digit - String(num).length + 1).join("0") + num;
    }
    return num;
}

$(document).ready(function(){		 	
	
	// 현재 내가 새롭게 만들고 있는 소스
	// 1. 진료과 선택
	var doctor_major = "";
	$(':input[name=den]').click(function(){
		if($("input[name=den]:checked").val() == "내과"){
			changeSelect();
			doctor_major = "내과";
			document.Form1.medDp.value = doctor_major;
			getDeptDoctorList(doctor_major);
		} else if($("input[name=den]:checked").val() == "외과") {
			changeSelect();
			doctor_major = "외과";
			document.Form1.medDp.value = doctor_major;
			getDeptDoctorList(doctor_major);
		} else if($("input[name=den]:checked").val() == "정신과") {
			changeSelect();
			doctor_major = "정신과";
			document.Form1.medDp.value = doctor_major;
			getDeptDoctorList(doctor_major);
		} else if($("input[name=den]:checked").val() == "신경과") {
			changeSelect();
			doctor_major = "신경과";
			document.Form1.medDp.value = doctor_major;
			getDeptDoctorList(doctor_major);
		} else if($("input[name=den]:checked").val() == "산부인과") {
			changeSelect();
			doctor_major = "산부인과";
			document.Form1.medDp.value = doctor_major;
			getDeptDoctorList(doctor_major);
		} else if($("input[name=den]:checked").val() == "비뇨기과") {
			changeSelect();
			doctor_major = "비뇨기과";
			document.Form1.medDp.value = doctor_major;
			getDeptDoctorList(doctor_major);
		} else if($("input[name=den]:checked").val() == "안과") {
			changeSelect();
			doctor_major = "안과";
			document.Form1.medDp.value = doctor_major;
			getDeptDoctorList(doctor_major);
		}
	});
	
	// 2. 진료과 선택하면 해당 진료과 의사 뿌리기
	function getDeptDoctorList(major){
		var obj = new Object();
		var myDp = major;
		var result = "<ul>\n";
		$.ajax({
			url : '${pageContext.request.contextPath}/customer/getDeptDoctorList',
			type : 'GET',   // 전송방식
			dataType : 'json', // 요청한 데이터 형식 ("html", "xml", "json", "text")
			success : function(obj) { // 콜백함수 - 전송에 성공했을 때의 결과가 data에 전달된다.
				for(var i=0; i<obj.length; i++) {
					if(obj[i].doctor_major == major) {
						result += "<li>\n";
						result += "<span class=\"imgDen\" id=\"imgDen"+ obj[i].doctor_num +"\">";						
						result += "<img src=\"${path_resources}images/doctor.png\" alt=\"\" />";
						result += "</span>\n";
						result += "<dl>\n";
						result += "<dt>" + obj[i].doctor_major + "</dt><br>\n";
						result += "<dt><strong>"+ obj[i].doctor_name +"</strong> "+ obj[i].doctor_position +"</a></dt>\n";
						result += "<dd class=\"btnRe\">\n";
																		 // selectDoctor가 실행돼야 체크박스가 뜸
						result += "<span><a href=\"javascript:void(0);\" onclick=\"selectDoctor('" + obj[i].doctor_num + "', '" + obj[i].doctor_name + "');\" class=\"btnRd btnRd_blue\"><span class=\"ico_check\"></span>예약</a></span>\n";
						result += "</dd>\n";
						result += "</dl>\n";
						result += "</li><br><br>\n";						
					}															
				}
				result += "</ul>\n";
				$('#reserDen').html(result);
				$('#myDp').html(myDp); // 예약정보 확인에 뿌리기			
			},
			error : function() {
				alert('오류');
			}
		});
	}	
		
});

//3. 의료진 예약 클릭
function selectDoctor(doctor_num, doctor_name){
	medTmInit(); // 날짜, 시간 초기화		
	$(':input[name=medDr]').val(doctor_name);
	$(':input[name=doctor_num]').val(doctor_num);
	removeClassExec('.imgChoice', "imgChoice"); //doctor image select class
	$('#imgDen'+doctor_num).addClass("imgChoice");	
			
	$('#myDr').html(doctor_name); // 예약정보 확인에 뿌리기
	document.Form1.medDr.value = doctor_name;
	document.Form1.doctor_num.value = doctor_num;
	buildCalendar2();
}

// 진료과 바꾸면 진료과 선택 제외하고 초기화
function changeSelect() {
	$(':input[name=medDp]').val("");
	document.Form1.medDr.value = "";
	$(':input[name=doctor_num]').val("");
	$(':input[name=medDpRes]').val("");
	$(':input[name=sday]').val("");
	$(':input[name=medTm]').val("");
	$(':input[name=appoint_num]').val("");	
	$('#reserDen').html(null);
	$('#denTlist').html(null);
	$('#myDr').html("&nbsp;");
	$('#myDate').html("&nbsp;");
	$('#myTm').html("&nbsp;");
    // @param 기존 선택일이 존재하는 경우 기존 선택일의 표시형식을 초기화 한다.
    if(document.getElementsByClassName("choiceDay")[0]) {
        document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#FFFFFF";
        document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
    }
}
// 예약정보 초기화
function resReset(){
	$(':input[name=medDp]').val("");
	$(':input[name=doctor_num]').val("");
	$(':input[name=medDpRes]').val("");
	$(':input[name=sday]').val("");
	$(':input[name=medTm]').val("");
	$(':input[name=appoint_num]').val("");
	$('#reserDen').html(null);
	$('#denTlist').html(null);
	// medDpInit();
	// 예약정보확인 초기화
	$('#myDp').html("&nbsp;");
	$('#myDr').html("&nbsp;");
	$('#myDate').html("&nbsp;");
	$('#myTm').html("&nbsp;");
    // @param 기존 선택일이 존재하는 경우 기존 선택일의 표시형식을 초기화 한다.
    if(document.getElementsByClassName("choiceDay")[0]) {
        document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#FFFFFF";
        document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
    }
}

function medTmInit(){
	$(':input[name=sday]').val("");
	$(':input[name=medTm]').val("");
	emptyHtmlExec('.denTime li');
	selectInfoInit();
}

// 예약정보 확인에 뿌려주는 역활
function selectInfoInit(){
	$('.myDp').html("&nbsp;");
	$('.myDr').html("&nbsp;");
	$('.myTm').html("&nbsp;");
}

function autoDoctorLoad(medDr, medDrNm, medDrRk, spcYn){
	medTmInit();
	if(medDr == "-99"){
		alert("예약이 불가능합니다.");
		return;
	}
	
	var medDp = $('input[name=medDp]').val();	//진료과 코드
	var medDpRes = $('input[name=medDpRes]').val();	//진료과 진료타입체크
	var medDrRes = $('input[name=medDrRes]').val();	//의료진 진료타입체크
	
	if(medDp == "" || medDr == ""){
		alert("의료진을 선택해 주세요");
		return;
	}
	
	$(':input[name=medDr]').val(medDr);
	$(':input[name=medDrNm]').val(medDrNm);
	$(':input[name=medDrRk]').val(medDrRk);
	$(':input[name=spcYn]').val(spcYn);
	
	if(spcYn == "01"){
		$(':input[name=medSpcYn]').val("Y");
	}else{
		$(':input[name=medSpcYn]').val("N");
	}
	//console.log(medDr)
	removeClassExec('.imgChoice', "imgChoice"); //doctor image select class
	$('#imgDen'+medDr).addClass("imgChoice");
	
	syear = $('input[name=syear]').val();
	smonth = $('input[name=smonth]').val();
	
	var param = {
		syear:syear,
		smonth:smonth,
		medDp:medDp,
		medDpRes:medDpRes,
		medDr:medDr,
		medDrRes:medDrRes
	};
	reqAjax('/gw/med/treat/treatmentDate.json', param, true, new resultDate());
}

// 예약하기 클릭했을때 js
function resInsert(){
	if(!$(':input[name=medDp]').val()){
		alert("진료과를 선택해 주세요.");
		return;
	}
	
	if(!$(':input[name=medDr]').val()){
		alert("의료진을 선택해 주세요.");
		return;
	}
	
	if(!$(':input[name=sday]').val()){
		alert("날짜를 선택해 주세요.");
		return;
	}
	
	if(!$(':input[name=medTm]').val()){
		alert("시간을 선택해 주세요.");
		return;
	}
	
	if(confirm("진료예약을 하시겠습니까?")){
		$('#Form1').submit();
	}
}

</script>
</head>
<body>
<%@include file="../common/header.jsp" %>
<div id="contents" style="margin:0 auto;">
<!-- 예약 폼 -->
<form name="Form1" id="Form1" method="post" action="${path}/customer/appointPro">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<input type="hidden" name="medDp" title="진료과" value="">
<input type="hidden" name="doctor_num" title="의사ID" value="">
<input type="hidden" name="medDr" title="의료진" value="">
<input type="hidden" name="sday" title="예약날짜" value="">
<input type="hidden" name="medTm" title="예약시간" value="">
<input type="hidden" name="appoint_num" title="예약번호" value="">

<div class="reserBox">
	<!-- 1단계 -->
	<div class="reserStep">
		<h2>1.환자정보 확인</h2>
		<div class="reserArea">
			<dl class="myInfo">
				<dt>환자명</dt>
				<dd>${customer_name}</dd>
				<dt>환자ID</dt>
				<dd>${sessionScope.userSession}</dd>
			</dl>
		</div>		
	<!-- 2단계 -->
		<h2>2.진료과 선택</h2>
		<div class="reserArea">							
				<input style="margin-left:20;" type="radio" id="den1" name="den" class="bg1" value="내과"><label style="margin: 5 10;" for="den1">내과</label><br>		
				<input style="margin-left:20;" type="radio" id="den2" name="den" class="bg1" value="외과"><label style="margin: 5 10;" for="den2">외과</label><br>		
				<input style="margin-left:20;" type="radio" id="den3" name="den" class="bg1" value="정신과"><label style="margin: 5 10;" for="den3">정신과</label><br>			
				<input style="margin-left:20;" type="radio" id="den4" name="den" class="bg1" value="신경과"><label style="margin: 5 10;" for="den4">신경과</label><br>
				<input style="margin-left:20;" type="radio" id="den5" name="den" class="bg1" value="산부인과"><label style="margin: 5 10;" for="den5">산부인과</label><br>			
				<input style="margin-left:20;" type="radio" id="den6" name="den" class="bg1" value="비뇨기과"><label style="margin: 5 10;" for="den6">비뇨기과</label><br>		
				<input style="margin-left:20;" type="radio" id="den7" name="den" class="bg1" value="안과"><label style="margin: 5 10;" for="den7">안과</label>	
		</div>
	</div>	
	<!-- 3단계 -->
	<div class="reserStep">
		<h2>3.의료진 선택</h2>
		<div class="reserArea pz">
			<div id="reserDen">
				<!-- 의사리스트 뿌려주는 곳 -->
			</div>
		</div>
	</div>
	<!-- 4단계 -->
	<div class="reserStep">
		<h2>4.날짜 / 시간 선택</h2>
		<div class="reserArea pz">
			<!-- 달력 -->
			<div class="calen">
<%-- 				<div class="calenCtrl">
					<a href="javascript:void(0);" id="preH" onclick=" return alert('예약하실 수 없는 달입니다.');"><img src="${path_resources}img/btn_calenL.png" alt="이전달"></a>
					<span id="curDate">2020. 9</span>
					<a href="javascript:void(0);" id="nexH" onclick=" nextCalendar('2020','10');"><img src="${path_resources}img/btn_calenR.png" alt="다음달"></a>
				</div> --%>
					<table class="scriptCalendar">
    					<thead>
        					<tr>
            					<td onClick="prevCalendar();" style="cursor:pointer;">&#60;&#60;</td>
            					<td colspan="5">
                				<span id="calYear">YYYY</span>년
                				<span id="calMonth">MM</span>월
            					</td>
            					<td onClick="nextCalendar();" style="cursor:pointer;">&#62;&#62;</td>
       	 					</tr>
        					<tr>
            					<td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>
        					</tr>
    					</thead>
    					<tbody></tbody>
   	 				</table>
				<!-- 20170605 달력수정 -->
				<p style="color:red; font-size:14px;">*예약가능 날짜만 선택이 가능하니 문의사항이 있으시면 전화문의 바랍니다.</p>
				<!-- 20170605 달력수정 -->
			</div>
			<!-- //달력 -->
			
			<div class="denTime">
				<h3 class="tit3">진료시간을 선택하세요</h3>
				<ul id="denTlist">											
				<!-- 가능한 시간 뿌려주는 곳 -->
				</ul>
			</div>
		</div>
	</div>
	<!-- 5단계 -->
	<div class="reserStep">
		<h2>5.예약정보 확인</h2>
		<div class="reserArea rline">
			<dl class="myInfo">
				<dt>환자명</dt>
				<dd>${customer_name}</dd>
				<dt>환자ID</dt>
				<dd>${sessionScope.userSession}</dd>
				<dt>진료과</dt>
				<dd id="myDp">&nbsp;</dd>
				<dt>의료진</dt>
				<dd id="myDr">&nbsp;</dd>
				<dt>예약일시</dt>
				<dd id="myDate">&nbsp;</dd>
				<dt>예약시간</dt>
				<dd id="myTm">&nbsp;</dd>
			</dl>
		</div>
		<div class="reserArea tac">
			<div class="btnArea">
			</div>
		</div>
	</div>
</div>
<br>
<div class="btnSet tac" style="margin-left:500;">
	<a href="javascript:Form1.submit();" class="btn btn-blue btn-br btn-lg4"><span class="ico_mouse"></span>진료예약</a>
	<a href="javascript:void(0);" onclick="resReset();" class="btn btn-black btn-br btn-lg4"><span class="ico1_return2"></span>예약정보 초기화</a>
</div>
</form>
</div>
<%@include file="../common/footer.jsp" %>
</body>
</html>
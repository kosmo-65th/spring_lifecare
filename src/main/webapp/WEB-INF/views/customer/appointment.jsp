<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="${path_resources}css/appointment.css">
<!-- jQuery 추가 -->
<script src="${path_resources}setting/jquery-3.5.1.js"></script>

<script type="text/javascript" src="${path_resources}js/appointment.js"></script>
<script type="text/javascript" src="${path_resources}js/appointment2.js"></script>
<%-- <script type="text/javascript" src="${path_resources}js/appointment_layout.js"></script> --%>
<script type="text/javascript">

p_medDp="";
p_medDpRes="";
p_medDr="";
p_medDrRes="";

var dTimeList;
var dHolidayList;
var jsonStr;

$(document).ready(function(){
	
	var d = new Date();
	var ty = (d.getFullYear());
	var tm = (d.getMonth()+1);
	var td = (d.getDate());
	
	if(td == getMonthEndDate(ty, tm)){
		maxCnt = 4;
	}
	
	loadCalendar();	//날짜 넣기
	//$('input[name=syear]').val("2020");
	//$('input[name=smonth]').val("9");
	//drawCalendar($.parseJSON(jsonStr));
	
	if(p_medDp != ""){//진료시간표에서 예약 클릭 후 실행시
		$(':input[name=medDp]').val(p_medDp);
		$(':input[value='+ p_medDp +']').attr("checked", true);
		$(':input[name=medDpNm]').val($(':input[value='+ p_medDp +']').next().text());
		$(':input[name=medDpRes]').val($(':input[name=res'+ p_medDp +']').val());
		
		// 달력정보 start ------------------------------------------>
		jsonStr = '{';
		jsonStr += '"toYear":"2020"';
		jsonStr += ',"toMonth":"9"';
		jsonStr += ',"toDay":"14"';
		jsonStr += ',"year":"2020"';
		jsonStr += ',"month":"9"';
		jsonStr += ',"endDay":"30"';
		jsonStr += ',"lastweek":"4"';
		jsonStr += ',"prevYear":"2020"';
		jsonStr += ',"prevMon":"8"';
		jsonStr += ',"nextYear":"2020"';
		jsonStr += ',"nextMon":"10"';
		jsonStr += '}';
		// 달력정보 end ------------------------------------------>
		
		getDeptDoctorList(p_medDp);
	}
	
	$(':input[name=den]').click(function(){
		var strAge = $(':input[name=age'+$(this).val()+']').val();
		
		if(strAge != "N"){
			if(strAge.split("|")[0] == "U"){
				if(parseInt("29") < parseInt(strAge.split("|")[1])){
					alert(strAge.split("|")[1] +"이상만 예약하실 수 있습니다.");
					return;
				}
			}else if(strAge.split("|")[0] == "D"){
				if(parseInt("29") > parseInt(strAge.split("|")[1])){
					alert(strAge.split("|")[1] +"이하만 예약하실 수 있습니다.");
					return;
				}
			} 
		}
		
		syear = $('input[name=syear]').val();
		smonth = $('input[name=smonth]').val();
		
		loadCalendar();
		
		mvCnt = 0;
		medDpInit();
		
		$('input[name=medDp]').val($(this).val());
		$('input[name=medDpNm]').val($(this).next().text());
		$('input[name=medDpRes]').val($(':input[name=res'+$(this).val()+']').val());
		
		getDeptDoctorList($(this).val());
	});
	
	$(document).on('click','.layerView', function(){
		layerPopupOpen(this);
        return false;
	});
});


//이전월
function preCalendar(yy, mm){
	
	if(!$(':input[name=medDp]').val()){
		alert("진료과를 선택해 주세요");
		return;
	}
	
	if(!$(':input[name=medDr]').val()){
		alert("의료진을 선택해 주세요");
		return;
	}
	
	loadCalendar(yy,mm);
	mvCnt--;
	
	autoDoctorLoad($(':input[name=medDr]').val(), $(':input[name=medDrNm]').val(), $(':input[name=medDrRk]').val(), $(':input[name=spcYn]').val());
}

//다음월
function nextCalendar(yy, mm){
	
	if(!$(':input[name=medDp]').val()){
		alert("진료과를 선택해 주세요");
		return;
	}
	
	if(!$(':input[name=medDr]').val()){
		alert("의료진을 선택해 주세요");
		return;
	}
	
	loadCalendar(yy,mm);
	mvCnt++;
	autoDoctorLoad($(':input[name=medDr]').val(), $(':input[name=medDrNm]').val(), $(':input[name=medDrRk]').val(), $(':input[name=spcYn]').val());
}

//진료과 초기화
function init(){
	$("#Form1")[0].reset();
	$(':input[name=medDp]').val("");
	$(':input[name=medDpNm]').val("");
	$(':input[name=medDpRes]').val("");
	medDpInit();
}

//의사 초기화
function medDpInit(){
	$(':input[name=medDr]').val("");
	$(':input[name=medDrNm]').val("");
	$(':input[name=medDrRk]').val("");
	$(':input[name=medDrRes]').val("");
	medTmInit();
}

//날짜,시간 초기화
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

// 1. 진료과 선택하면 의사리스트 뿌려주는 js
function getDeptDoctorList(dcDept){
	var param = {
		dcDept1:dcDept
	};
	reqAjax('${path_resources}js/deptDoctorList.json', param, true, new resultDoctor());
}

// 2. 의사리스트 결과
var resultDoctor = function(){
	this.run = function(data){
		if(data != null){
			var str2 = "";
			var str = "<ul>\n";
			$.each(data.resultList, function(k,v){
				
				var dcCode = v.dcCode;
				
				if(v.dcDept1rtp == ""){                                            
					dcCode = "-99";
				}				
				
				str += "<li>\n";
				str += "	<span class=\"imgDen\" id=\"imgDen"+ dcCode +"\">";
				
				if(v.streFileNm != "" && v.streFileNm != null){
					str += "<img src=\"/cmm/fms/getFileImage.do?streDr="+ v.fileStreCours +"&streFileNm="+ v.streFileNm +"\" alt=\""+ v.dcName +" 사진\" />";
				}else{
					str += "<img src=\"/static/img/gw/common/img_default.gif\" alt=\"\" />";
				}
				
				str += "</span>\n";
				str += "	<dl>\n";
				str += "		<dt><strong>"+ v.dcName +"</strong> "+ v.dcRank +"</dt>\n";
				str += "		<dd>"+ v.dcSpecial +"</dd>\n";
				str += "		<dd class=\"btnRe\">\n";
				if(v.choiSel == "01"){
					str += "			<span><a href=\"javascript:void(0);\" class=\"btnRd btnRd_white\">선</a></span>\n";
				}	
				str += "			<span><a href=\"javascript:void(0);\" onclick=\"selectDoctor('"+ dcCode +"','"+ v.dcName +"','"+ v.dcRank +"','"+ v.choiSel +"','C','"+ v.dcDept1rtp +"');\" class=\"btnRd btnRd_blue\"><span class=\"ico_check\"></span>예약</a></span>\n";
				str += "		</dd>\n";
				str += "	</dl>\n";
				str += "</li>\n";
				
				if(p_medDr != "" && p_medDr == dcCode){
					selectDoctor(dcCode,v.dcName,v.dcRank,v.choiSel,'A', v.dcDept1rtp);
				}
			});
			str += "</ul>\n";

			emptyExec('.reserDen');	//의료진 초기화
			$('.reserDen').append(str);
			$('.hdnDen').empty().append(str2);
			$('#imgDen'+p_medDr).addClass("imgChoice");

		}
	}
}

// 3. 의료진 예약 클릭
function selectDoctor(medDr, medDrNm, medDrRk, spcYn, chk, medDrRes){
	medTmInit();
	
	var medDpRes = $('input[name=medDpRes]').val();	//진료과 진료타입체크
	
	if(chk == "A"){ // 의사선택하면 달력에 예약가능한 일자 뿌리기
		drawCalendar($.parseJSON(jsonStr));
	}else{
		loadCalendar();
	}
	
	if(medDr == "-99"){
		alert("예약이 불가능합니다.");
		return;
	}
	
	var medDp = $('input[name=medDp]').val();	//의료진코드 체크
	if(medDp == "" || medDr == ""){
		alert("의료진을 선택해 주세요");
		return;
	}
	
	$(':input[name=medDr]').val(medDr);
	$(':input[name=medDrNm]').val(medDrNm);
	$(':input[name=medDrRk]').val(medDrRk);
	$(':input[name=medDrRes]').val(medDrRes);
	$(':input[name=spcYn]').val(spcYn);
	
	if(spcYn == "01"){
		$(':input[name=medSpcYn]').val("Y");
	}else{
		$(':input[name=medSpcYn]').val("N");
	}
	
	removeClassExec('.imgChoice', "imgChoice"); //doctor image select class
	$('#imgDen'+medDr).addClass("imgChoice");
	
	mvCnt = 0;
	
	var param = {
		syear:toYear,
		smonth:toMonth,
		medDp:medDp,
		medDpRes:medDpRes,
		medDr:medDr,
		medDrRes:medDrRes
	};
	
	reqAjax('/gw/med/treat/treatmentDate.json', param, true, new resultDate());
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


// 4. 달력 예약날짜 클릭
function loadResTime(that,medDy,pos){
	//medTmInit();
	
	var param = {
		patno:$(':input[name=patno]').val(),
		syear:$(':input[name=syear]').val(),
		smonth:$(':input[name=smonth]').val(),
		sday:medDy,
		medDp:$(':input[name=medDp]').val(),
		medDr:$(':input[name=medDr]').val(),
		patGubn:$(':input[name=patGubn]').val(),
		revGubn:$(':input[name=revGubn]').val()
	};
	
	reqAjax('/gw/med/treat/treatmentTime.json', param, true, new resultTime());
	
	drawTimeList2(dTimeList);
	
	$('.dateCh').removeClass("dateCh");
	$('#d'+ pos).addClass("dateCh").find('a').html(medDy +"<span class=\"hidden\">선택</span>");
	$(':input[name=sday]').val(medDy);
}

// 5. 달력 예약날짜 클릭 - 결과
var resultTime = function(){
	this.run = function(data){
		if(data != null){
			emptyHtmlExec('.denTime li');//시간 초기화
			if(data.rev_yn == "Y"){
				$.each(data.timeList, function(k,v){
					$('#dt'+k).html("<a href=\"javascript:void(0);\"  onclick=\"setResTime(this,'"+ v.acepttime +"');\">"+ v.acepttime +"</a>"); 
				});
			}else{
				alert("선택하신 진료과에 이미 등록된 예약이 있습니다.\n마이페이지 진료예약현황에서 변경하여 주시기 바랍니다.");
				return;
			}
		}
	}
}

// 의료진 예약 클릭 결과
var resultDate = function(){
	this.run = function(data){
		if(data != null){
			drawCalendar(data.calendarInfo);
			
			$(':input[name=patGubn]').val(data.patGubn);
			
			dTimeList = data.timeList;
			drawTimeList(dTimeList);
			
			dHolidayList = data.holidayList;
			drawHolidayList(dHolidayList);
		}
	}
}

function drawTimeList(dTimeList){
	$.each(dTimeList, function(k,v){
		var ss = parseInt(v.meddate.substr(6,2));
		var dd = ss+(week-1);
		$('#d'+ dd).addClass("sp").html("<a href=\"javascript:void(0);\" onclick=\"loadResTime(this,'"+ ss +"','"+ dd +"');\">"+ ss +"<span>예약</span></a>");
	});
}

function drawTimeList2(dTimeList){
	$.each(dTimeList, function(k,v){
		var ss = parseInt(v.meddate.substr(6,2));
		var dd = ss+(week-1);
		$('#d'+ dd + " a").html(ss +"<span>예약</span>");
	});
}

function drawHolidayList(dHolidayList){
	$.each(dHolidayList, function(k,v){
		//var dd = v.startdate.substr(6,2);
		var ss = parseInt(v.startdate.substr(6,2));

		var end = parseInt(v.enddate.substr(6,2));
		var cnt = 0;
		if(ss === end){
			var dd = ss+(week-1);
			$('#d'+ dd).removeClass("sp").addClass("nsp").html(ss +"<span>휴진</span>");
		}else{
			for(i=ss,j=end;i<=j;i++){
				var dd = ss+(week-1)+cnt;
				if($('#d'+dd).attr("class") != 'sat' && $('#d'+dd).attr("class") != 'sun'){
					$('#d'+ dd).removeClass("sp").addClass("nsp").html(ss+cnt +"<span>휴진</span>");
				}
				cnt++;
			}
		}			
	}); 
}

function setResTime(that, medTm){
	removeClassExec('.denTlist .on', "on");
	$(that).addClass("on");
	$(':input[name=medTm]').val(medTm);
	
	$('.myDp').text($(':input[name=medDpNm]').val());
	$('.myDr').text($(':input[name=medDrNm]').val() + " " + $(':input[name=medDrRk]').val());
	$('.myTm').text($(':input[name=syear]').val() +"-"+ addZeros($(':input[name=smonth]').val(),2) +"-"+ addZeros($(':input[name=sday]').val(),2) +" "+ $(':input[name=medTm]').val());
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

// 초기화 클릭했을때 js
function resReset(){
	init();
	emptyExec('.reserDen');	
	loadCalendar();
}

</script>
</head>
<body>
<%@include file="../common/header.jsp" %>
<div id="contents" style="margin:0 auto;">
<!-- 예약 폼 -->
<form name="Form1" id="Form1" method="post" action="/gw/med/treat/treatInsert.do">
<input type="hidden" name="menuNo" value="200034">
<input type="hidden" name="syear" value="2020">
<input type="hidden" name="smonth" value="9">
<input type="hidden" name="sday" title="예약날짜" value="">
<input type="hidden" name="medDp" title="진료과" value="01">
<input type="hidden" name="medDpNm" title="진료과명" value="구강내과">
<input type="hidden" name="medDpRes" title="진료과타입" value="F">
<input type="hidden" name="medDr" title="의료진" value="">
<input type="hidden" name="medDrNm" value="">
<input type="hidden" name="medDrRk" value="">
<input type="hidden" name="medDrRes" value="">
<input type="hidden" name="patGubn">
<input type="hidden" name="medTm" title="예약시간" value="">
<input type="hidden" name="spcYn">
<input type="hidden" name="medSpcYn">
<input type="hidden" name="meddept" value="">
<input type="hidden" name="rsvdr" value="">
<input type="hidden" name="revDate" value=" ">
<input type="hidden" name="revGubn" value="">
<input type="hidden" name="patno" value="">

<div class="reserBox">
	<!-- 1단계 -->
	<div class="reserStep">
		<h2>1.환자정보 확인</h2>
		<div class="reserArea">
			<dl class="myInfo">
				<dt>환자명</dt>
				<dd>&nbsp;</dd>
				<dt>환자ID</dt>
				<dd>${sessionScope.userSession}</dd>
			</dl>
		</div>		
	<!-- 2단계 -->
		<h2>2.진료과 선택</h2>
		<div class="reserArea">							
				<input type="hidden" name="age01" value="N">
				<input type="hidden" name="res01" value="F">
				<span class="radiobox"><input type="radio" id="den1" name="den" class="bg1" value="01"><label for="den1">내과</label></span>			
				<input type="hidden" name="age03" value="N">
				<input type="hidden" name="res03" value="F">
				<span class="radiobox"><input type="radio" id="den2" name="den" class="bg1" value="03"><label for="den2">외과</label></span>			
				<input type="hidden" name="age04" value="N">
				<input type="hidden" name="res04" value="F">
				<span class="radiobox"><input type="radio" id="den3" name="den" class="bg1" value="04"><label for="den3">정신과</label></span>				
				<input type="hidden" name="age05" value="N">
				<input type="hidden" name="res05" value="F">
				<span class="radiobox"><input type="radio" id="den4" name="den" class="bg1" value="05"><label for="den4">신경과</label></span>
				<input type="hidden" name="age06" value="N">
				<input type="hidden" name="res06" value="F">
				<span class="radiobox"><input type="radio" id="den5" name="den" class="bg1" value="06"><label for="den5">산부인과</label></span>			
				<input type="hidden" name="age07" value="N">
				<input type="hidden" name="res07" value="F">
				<span class="radiobox"><input type="radio" id="den6" name="den" class="bg1" value="07"><label for="den6">비뇨기과</label></span>		
				<input type="hidden" name="age28" value="N">
				<input type="hidden" name="res28" value="F">
				<span class="radiobox"><input type="radio" id="den7" name="den" class="bg1" value="28"><label for="den7">안과</label></span>			
		</div>
	</div>	
	<!-- 3단계 -->
	<div class="reserStep">
		<h2>3.의료진 선택</h2>
		<div class="reserArea pz">
			<div class="reserDen">
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
				<div class="calenCtrl">
					<a href="javascript:void(0);" id="preH" onclick=" return alert('예약하실 수 없는 달입니다.');"><img src="${path_resources}img/btn_calenL.png" alt="이전달"></a>
					<span id="curDate">2020. 9</span>
					<a href="javascript:void(0);" id="nexH" onclick=" nextCalendar('2020','10');"><img src="${path_resources}img/btn_calenR.png" alt="다음달"></a>
				</div>
				<table class="tbCalen">
				<thead>
				<tr>
					<th scope="col" class="sun">SUN</th>
					<th scope="col">MON</th>
					<th scope="col">TUE</th>
					<th scope="col">WED</th>
					<th scope="col">THU</th>
					<th scope="col">FRI</th>
					<th scope="col" class="sat">SAT</th>
				</tr>
				</thead>
				<tbody>										
						<tr><td class="sun" id="d1"></td>																																	
						<td id="d2"></td>																											
						<td id="d3">1</td>																											
						<td id="d4">2</td>																											
						<td id="d5">3</td>																											
						<td id="d6">4</td>																				
						<td class="sat" id="d7">5</td></tr>																					
						<tr><td class="sun" id="d8">6</td>																																							
						<td id="d9">7</td>																											
						<td id="d10">8</td>																											
						<td id="d11">9</td>						
						<td id="d12">10</td>					
						<td id="d13">11</td>					
						<td class="sat" id="d14">12</td></tr>	
						<tr><td class="sun" id="d15">13</td>	
						<td id="d16">14</td>
						<td id="d17">15</td>
						<td id="d18">16</td>
						<td id="d19">17</td>
						<td id="d20">18</td>
						<td class="sat" id="d21">19</td></tr>
						<tr><td class="sun" id="d22">20</td>
						<td id="d23">21</td>
						<td id="d24">22</td>
						<td id="d25">23</td>
						<td id="d26">24</td>
						<td id="d27">25</td>
						<td class="sat" id="d28">26</td></tr>
						<tr><td class="sun" id="d29">27</td>
						<td id="d30">28</td>
						<td id="d31">29</td>
						<td id="d32">30</td>
						<td id="d33"></td>
						<td id="d34"></td>
						<td class="sat" id="d35"></td></tr>
						<tr><td class="sun" id="d36"></td>
						<td id="d37"></td>
						<td id="d38"></td>
						<td id="d39"></td>
						<td id="d40"></td>
						<td id="d41"></td>
						<td class="sat" id="d42"></td></tr>
				</tbody>
				</table>
				<!-- 20170605 달력수정 -->
				<p style="color:red; font-size:14px;">인터넷 예약 마감시(또는 재진환자의 경우) 날짜 선택이 안될 수 있으니 전화문의 바랍니다.</p>
				<!-- 20170605 달력수정 -->
			</div>
			<!-- //달력 -->
			
			<div class="denTime">
				<h3 class="tit3">진료시간을 선택하세요</h3>
				<ul class="denTlist">
				
					<li id="dt0">10:00</li>
				
					<li id="dt1">12:00</li>
				
					<li id="dt2">14:00</li>
				
					<li id="dt3">16:00</li>
				
					<li id="dt4"></li>
				
					<li id="dt5"></li>								
				
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
				<dd>&nbsp;</dd>
				<dt>환자ID</dt>
				<dd>${sessionScope.userSession}</dd>
				<dt>진료과</dt>
				<dd class="myDp">&nbsp;</dd>
				<dt>의료진</dt>
				<dd class="myDr">&nbsp;</dd>
				<dt>예약일시</dt>
				<dd class="myTm">&nbsp;</dd>
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
	<a href="javascript:void(0);" onclick="resInsert();" class="btn btn-blue btn-br btn-lg4"><span class="ico_mouse"></span><strong>진료예약</strong></a>
	<a href="javascript:void(0);" onclick="resReset();" class="btn btn-black btn-br btn-lg4"><span class="ico1_return2"></span>예약정보 초기화</a>
</div>
</form>
</div>
<%@include file="../common/footer.jsp" %>
</body>
</html>
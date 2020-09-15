var syear, smonth, toYear, toMonth, toDay, week, p_medDp, p_medDr;
var mvCnt = 0;
var maxCnt = 3;

function reqAjax(url, data, async, f){
	var result=null;
	if(async=="undefined"){
		async = true;
	}
	$.ajax({
		type: "POST",
		async:async,
		url:url,
		dataType:"json",
		data:data,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		beforeSend: function() {
			$("#ajax_load").append("<div id=\"ajax_load_indicator\"><p style=\"text-align:center;padding:0 0 20px 0\"><img src=\"/static/img/commons/ajax-loader.gif\" alt=\"데이터를 가져오고 있습니다.\" /></p></div>");
			$('#ajax_load_indicator').show().fadeIn('fast'); }
		, success: function(data) { result = data; }
		, error: function(data, status, err){
			alert(data);
			result = null;
		}
		, complete: function() { $('#ajax_load_indicator').fadeOut();$('#ajax_load_indicator').remove();
			if(f){f.run(result);}else{ajaxResult(result);} 
		}
	});	
}

//empty()
function emptyExec(slt){
	$(slt).empty();
}

//empty() and append()
function emptyAppExec(slt, app){
	$(slt).empty().append(app);
}

//html empty(0
function emptyHtmlExec(s){
	$(s).html("");
}

//removeClass
function removeClassExec(slt, clsNm){
	$(slt).removeClass(clsNm);
}

function getMonthEndDate(yy, mm){
	var dt = new Date(yy, mm, 0);
	return dt.getDate();
}

function addZeros(n, digits) {
	var zero = '';
	if(n != undefined && n != ""){
		n = n.toString();
		if (n.length < digits) {
			for (i = 0; i < digits - n.length; i++) {
				zero += '0';
			}
		}
	}
	return zero + n;
}

//달력
function loadCalendar(syear,smonth){
	$('input[name=syear]').val(syear);
	$('input[name=smonth]').val(smonth);
	
	var param = {
		syear:syear,
		smonth:smonth
	};
	reqAjax('/gw/med/treat/calendarInfo.json', param, true, new resultCalendar());
}

//달력결과
var resultCalendar = function(){
	this.run = function(data){
		if(data != null){
			drawCalendar(data.calendarInfo);
		}
	}
}

function drawCalendar(clnd){
	var str = "";

	//달력 정보
	syear = clnd.year;			//해당년
	smonth = clnd.month;		//해당월

	$('input[name=syear]').val(syear);
	$('input[name=smonth]').val(smonth);

	toYear = clnd.toYear;		//현재년
	toMonth = clnd.toMonth;	//현재월
	toDay = clnd.toDay;		//현재일
	var prevYear = clnd.prevYear;	//해당 이전년
	var prevMon = clnd.prevMon;	//해당 이전월
	var nextYear = clnd.nextYear;	//해당 다음년
	var nextMon = clnd.nextMon;	//해당 다음월
	var endDay = clnd.endDay;		//해당월 마지막일
	week = clnd.week;
	var newLine=0;
	
	//--------------> 월 이동 관련 start ---------------------------------------------
	if(mvCnt < 1){
		str = " return alert('예약하실 수 없는 달입니다.');";
	}else{
		str = " preCalendar('"+ prevYear +"','"+ prevMon +"');";
	}
	$('#preH').attr("onclick",str); //이전달 버튼
	
	$('#curDate').html(syear +". "+ smonth);	//현재달 표시
	
	if(mvCnt < maxCnt){
		str = " nextCalendar('"+ nextYear +"','"+ nextMon +"');";
	}else{
		str = "	return alert('예약하실 수 없는 달입니다.');";
	}
	$('#nexH').attr("onclick",str);	//다음달 버튼
	//--------------> 월 이동 관련 end ---------------------------------------------

	$('.tbCalen td').text(""); //달력 초기화
	removeClassExec(".dateCh", "dateCh");
	removeClassExec(".nsp", "nsp");
	
	for(var i=1;i<=endDay;i++){	//1일부터 말일
		$('#d'+(i+(week-1))).text(i);
	}
}

function drawCalendar2(clnd){
	var str = "";

	//달력 정보
	syear = clnd.year;			//해당년
	smonth = clnd.month;		//해당월

	$('input[name=syear]').val(syear);
	$('input[name=smonth]').val(smonth);

	toYear = clnd.toYear;		//현재년
	toMonth = clnd.toMonth;	//현재월
	toDay = clnd.toDay;		//현재일
	var prevYear = clnd.prevYear;	//해당 이전년
	var prevMon = clnd.prevMon;	//해당 이전월
	var nextYear = clnd.nextYear;	//해당 다음년
	var nextMon = clnd.nextMon;	//해당 다음월
	var endDay = clnd.endDay;		//해당월 마지막일
	var week = clnd.week;
	var newLine=0;
	
	//--------------> 월 이동 관련 start ---------------------------------------------
	if(mvCnt < 1){
		str = " return alert('예약하실 수 없는 달입니다.');";
	}else{
		str = " preCalendar('"+ prevYear +"','"+ prevMon +"');";
	}
	$('#preH').attr("onclick",str); //이전달 버튼
	
	$('#curDate').html(syear +". "+ smonth);	//현재달 표시
	
	if(mvCnt < maxCnt){
		str = " nextCalendar('"+ nextYear +"','"+ nextMon +"');";
	}else{
		str = "	return alert('예약하실 수 없는 달입니다.');";
	}
	$('#nexH').attr("onclick",str);	//다음달 버튼
	//--------------> 월 이동 관련 end ---------------------------------------------

	str = "<table class=\"tbCalen\">\n";
	str += "<caption>의료진 날짜(달력)</caption>\n";
	str += "<thead>\n";
	str += "	<tr>\n";
	str += "		<th scope=\"col\" class=\"sun\">SUN</th>\n";
	str += "		<th scope=\"col\">MON</th>\n";
	str += "		<th scope=\"col\">TUE</th>\n";
	str += "		<th scope=\"col\">WED</th>\n";
	str += "		<th scope=\"col\">THU</th>\n";
	str += "		<th scope=\"col\">FRI</th>\n";
	str += "		<th scope=\"col\" class=\"sat\">SAT</th>\n";
	str += "	</tr>\n";
	str += "</thead>\n";
	str += "<tbody>\n";
	str += "<tr>\n";

	for(var i=1;i<week;i++){ //1일이전 빈공간 생성
		if(i == 1 ){
			str += "	<td class=\"sun\"></td>\n";
		}else if(i == 7){
			str += "	<td class=\"sat\"></td>\n";
		}else{
			str += "	<td></td>\n";
		}
		newLine++;
	}

	for(var i=1;i<=endDay;i++){	//1일부터 말일
		var addClass = "";
		var resDate = i;				

		str += "	<td id=\"d"+ i +"\"";
		if(newLine == 0 ){ //일요일
			str += " class=\"sun"+ addClass +"\"";
		}else if(newLine == 6){ //토요일
			str += " class=\"sat"+ addClass +"\"";
		}else{	//평일
			str += " class=\""+ addClass +"\"";
		
			if(toYear == syear){
				if(smonth > toMonth){
				}else if(smonth == toMonth){
					if(toDay == i){
						addClass = " today";
					}else if(toDay < i){
					}
				}
			}else if(toYear < syear){
			}
		}
		str += ">"+ resDate +"</td>\n";

		newLine++;

		if(newLine == 7 && i != endDay) {
			str += "</tr>\n<tr>\n";
			newLine = 0;
		}
	}
	
	for(var i=newLine;i<7;i++){
		if(i == 1 ){
			str += "	<td class=\"sun\"></td>\n";
		}else if(i == 7){
			str += "	<td class=\"sat\"></td>\n";
		}else{
			str += "	<td></td>\n";
		}
	}

	str += "</tr>\n";
	str += "</tbody>\n";
	str += "</table>\n";
	
	emptyAppExec('.divCalen',str);
	$('.hnPat').empty();
}

$(document).ready(function(){
});//ready
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

$(document).ready(function(){
});//ready
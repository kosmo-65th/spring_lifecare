/**
 * 
 */
function searchEnter(){
	if(event.keyCode == 13){
		if($("#drug_name").val() == ""){
			alert("제품명을 입력해주세요.");
			return false;
		}else{
			$("#proYN").val("");
			$("#rowLength").val(50);
			$("#TabState").val("0");
			$("#pageNo").val(1);
			$("#frm").submit();
		}
	}
}
function searchEnter2(){
	if(event.keyCode == 13){
//		alert($("#interaction_search_word").val());
//		searchMediCounsel();
		if($("#firm_name").val() == ""){
			alert("회사명을 입력해주세요.");
			return false;
		}else{
			$("#proYN").val("");
			$("#rowLength").val(50);
			$("#TabState").val("0");
			$("#pageNo").val(1);
			$("#frm").submit();
		}
	}
}
function searchEnter3(){
	if(event.keyCode == 13){
//		alert($("#interaction_search_word").val());
//		searchMediCounsel();
		if($("#drug_print_front").val() == ""){
			alert("문자를 입력해주세요.");
			return false;
		}else{
			$("#proYN").val("");
			$("#rowLength").val(50);
			$("#TabState").val("0");
			$("#pageNo").val(1);
			$("#frm").submit();
		}
	}
}
function searchEnter4(){
	if(event.keyCode == 13){
//		alert($("#interaction_search_word").val());
//		searchMediCounsel();
		if($("#drug_print_back").val() == ""){
			alert("문자를 입력해주세요.");
			return false;
		}else{
			$("#proYN").val("");
			$("#rowLength").val(50);
			$("#TabState").val("0");
			$("#pageNo").val(1);
			$("#frm").submit();
		}
	}
}
function idfySend() {
	$("#proYN").val("");
	$("#rowLength").val(50);
	$("#TabState").val("0");
	$("#pageNo").val(1);
	$("#frm").submit();
}
function moveform() {
		
		//기준이 될 div  현재 top값
		var topset = $("#result").offset().top;
//		alert(topset);

		//움직일 div top 값
		var offset = $("#result").offset().top;
//		alert(offset);

		// 148 :  헤더 차지값, 826 : top버튼 눌렀을때 최상단부터 기준div top값
		var chaset = 148 - ( 1168 - parseInt(topset));
//		alert(chaset);

		$("html,body").stop().animate({
			scrollTop : offset - chaset
		},0);

		sideCalc();
}
function pageBar(page_val) {
	
//	alert(page_val)

	//페이징 처리를 위한 계산
	var startp = "";
	var endp = "";

	//현재 요청들어온 페이지
	var req_page = page_val;
	
	//현재 페이지값이 0이라면 1로 강제셋팅
	if(req_page == ""){
		req_page ='1';
	}else{
		req_page = page_val;
	}
	
//	$("#req_page").val(page_val);

	
	//전체 페이지를 나누기 위해 count 체크
	var totalCnt = 0;

//	alert(totalCnt)


		//하단 페이징바 작업
		var pagingHtml = "";
		// <<버튼 작업 - 무조건 처음으로
		pagingHtml += "<a style='cursor:pointer' onclick='javascript:changePage(1)' class='first ico' alt='처음'></a>";

		var nexted = parseInt(page_val)-1; 
		// <버튼 작업 - 이전페이지로 이동		
		//if(parseInt(page_val) < 10){
			// 10페이지보다 작으면 1페이지로 보낸다.
			//pagingHtml += "<a style='cursor:pointer' onclick='javascript:changePage(1)' class='left ico' alt='이전'></a>"
		//}else if(parseInt(page_val) >= 10){
			// 10페이지보다 크면 9페이지 전으로 넘긴다
		if(nexted > 1){
			pagingHtml += "<a style='cursor:pointer' onclick='javascript:changePage("+nexted+")' class='left ico' alt='이전'></a>"
		}else{
			pagingHtml += "<a style='cursor:pointer' onclick='javascript:changePage(1)' class='left ico' alt='이전'></a>"
		}
			
		pagingHtml += "<span>"
		
		var postPbar;
		var prePbar;
		var maxPbar;
		var ceilvalue = Math.ceil(totalCnt/50);
		
		//현재페이지 값이 6페이지와 같거나 크면 첫번째 for문을 시작한다.
		if(parseInt(page_val) >= 6){
			if((parseInt(page_val)+5) > ceilvalue){
				postPbar = Math.ceil(parseInt(totalCnt)/parseInt('50'));
				prePbar = postPbar - 5;
			}else{
				postPbar = parseInt(page_val) + 5;
				prePbar = parseInt(page_val) - 4;
			}

//			alert(postPbar)
//			alert(prePbar)
			
			for(var i = prePbar  ; i <= postPbar ; i++){
				pagingHtml += "<a style='cursor:pointer' onclick='javascript:changePage("+i+ ")' target='_self'";
				if(page_val == i){
					pagingHtml += "class='current' >"+i+"</a>";
				}else{
					pagingHtml += ">"+i+"</a>";
				}

				if(i == ceilvalue){
					break;
				}
			}

		}else if(parseInt(page_val) < 6){
			//현재 페이지가 6페이지보다 작은 1,2페이지 일때
			//10보다 크면 10페이지까지 최초에 찍어준다. 그렇지 않고 10미만이라면 총 페이지바 값을 max로 잡는다.
			if(ceilvalue > 10){
				maxPbar = 10;
			}else if(ceilvalue <= 10){
				maxPbar = ceilvalue
			}

			for(var j = 1 ; j <= maxPbar; j++){
				pagingHtml += "<a style='cursor:pointer' onclick='javascript:changePage("+ j + ")' target='_self'"
				if(page_val == j){
					pagingHtml += "class='current' >"+j+"</a>"
				}else{
					pagingHtml += ">"+j+"</a>"
				}				
			}
			pagingHtml += "</span>";		
		}

//		alert(ceilvalue)

		
		
		if((parseInt(page_val) <=5) && (ceilvalue >= parseInt(page_val)+9)){
			pagingHtml+= "<a style='cursor:pointer' class='right ico' alt='다음' target='_self' onclick='javascript:changePage("+(parseInt(page_val)+1) +")'></a>"
		}else if((parseInt(page_val) <=5) && (ceilvalue <= parseInt(page_val)+9)){
			pagingHtml+= "<a style='cursor:pointer' class='right ico' alt='다음' target='_self' onclick='javascript:changePage("+ (parseInt(page_val)+1) +")'></a>"
		}else if((parseInt(page_val) >5) && (ceilvalue >= parseInt(page_val)+9)){
			pagingHtml+= "<a style='cursor:pointer' class='right ico' alt='다음' target='_self' onclick='javascript:changePage("+(parseInt(page_val)+1) +")'></a>"
		}else if((parseInt(page_val) >5) && (ceilvalue <= parseInt(page_val)+9)){
			pagingHtml+= "<a style='cursor:pointer' class='right ico' alt='다음' target='_self' onclick='javascript:changePage("+ (parseInt(page_val)+1) +")'></a>"
		}
		
		pagingHtml += "<a style='cursor:pointer' onclick='javascript:changePage(" + ceilvalue + ")' class='last ico' alt='마지막'></a>"

		if($("#idfytotal0").length > 0) {
			$("#paging").html(pagingHtml);
		}
}

function changePage(val) {
	$("#pageNo").val(val);
	$("#frm").submit();
}


function changeTab(val1,val2) {
	$("#proYN").val(val1);
	$("#TabState").val(val2);
	$("#pageNo").val(1);

//	$("totalr0").val(val3);
//	$("totalr1").val(val4);
//	$("totalr2").val(val5);
	
	$("#frm").submit();
}


function line_selectBoxToggle(val,text){
	//파라미터 셋팅
	//$('#search_flag').val(val);

	//글자변경
//	$('#line_selectBoxTitle').text(text);
	
	switch(val){
		case "10" : 
			$("#inner_line_list li").css("display","");
			$("#line_li_10").css("display","none");
			$("#line_hiddenLi").css("display","");
			$("#listup").val("10");
			$("#pageNo").val(1);
			//result_more($("#sunb_count").val(),'','1');
			break;
		case "20" : 
			$("#inner_line_list li").css("display","");
			$("#line_li_20").css("display","none");
			$("#line_hiddenLi").css("display","");
			$("#listup").val("20");
			$("#pageNo").val(1);
			//result_more($("#sunb_count").val(),'','1');
			break;
		case "30" : 
			$("#inner_line_list li").css("display","");
			$("#line_li_30").css("display","none");
			$("#line_hiddenLi").css("display","");
			$("#listup").val("30");
			$("#pageNo").val(1);
			//result_more($("#sunb_count").val(),'','1');
			break;
		case "40" : 
			$("#inner_line_list li").css("display","");
			$("#line_li_40").css("display","none");
			$("#line_hiddenLi").css("display","");
			$("#listup").val("40");
			$("#pageNo").val(1);
			//result_more($("#sunb_count").val(),'','1');
			break;
		case "50" : 
			$("#inner_line_list li").css("display","");
			$("#line_li_50").css("display","none");
			$("#line_hiddenLi").css("display","");
			$("#listup").val("50");
			$("#pageNo").val(1);
			//result_more($("#sunb_count").val(),'','1');
			break;
		case "100" : 
			$("#inner_line_list li").css("display","");
			$("#line_li_100").css("display","none");
			$("#line_hiddenLi").css("display","");
			$("#listup").val("100");
			$("#pageNo").val(1);
			//result_more($("#sunb_count").val(),'','1');
			break;
	}
	$("#rowLength").val(val);

	$("#frm").submit();
}

//onKeyUp시에 제품명 불러오는 ajax호출
function drugNmAjax(){

	if ($('#drug_name').val().length < 2) {
		return false;
	}

	if (window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		//getKpicAtc_btn('1','','','');
		$("#ul_drugList").css('display','none');
//		$("#btn_detail_search").click();
		return false;
	}

	//var e = jQuery.Event( "keydown", { keyCode: 35 } );	$("#input_upsoNm").trigger( e );
	if($('#drug_name').val().length > 2){		
		$("#ul_drugList").css('display','');
		getDrugName();
	}else{
		$("#ul_drugList").css('display','none');
	}
}

//제품명 가져오기
function getDrugName(val){

	//데이터 호출
	$.ajax({
		type:"GET",
		url:'http://apis.data.go.kr/1470000/MdcinGrnIdntfcInfoService/getMdcinGrnIdntfcInfoList',
		async:true,
		cache: false,
		dataType:"json",
		success:function(data){
			//console.log(data);
			if (data != "") {
				var htmlData = "";
				for(var i = 0; i<data.length; i++){
		   			htmlData += "<li title='"+data[i].drug_name+"'>"
					htmlData += "<a class='overtxt' style='cursor:pointer' onclick=\"javascript:$('#drug_name').val('"+data[i].drug_name+"');$('#ul_drugList').css('display','none')\">"
					htmlData += data[i].drug_name
					htmlData += "</a>"
					htmlData += "</li>"
				}
				$('#ul_drugList').html(htmlData);
			
			$('#ul_drugList').css("overflow-y","auto");
			$('#ul_drugList').css("width","194px");
			$('#ul_drugList').css("max-height","100px");
			}
		},
		//complete:function(data){
			//console.log(data.responseText)
		//},
		error:function(xhr, status, error){
			alert('서버와의 통신 중 오류가 발생하였습니다.');
		}
	});
}//getDrugName end


//onKeyUp시에 회사명 불러오는 ajax호출
function upsoNmAjax(){	

	if (window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		//getKpicAtc_btn('1','','','');
		$("#ul_upsoList").css('display','none');
//		$("#btn_detail_search").click();
		return false;
	}

	//var e = jQuery.Event( "keydown", { keyCode: 35 } );	$("#input_upsoNm").trigger( e );
	if($('#firm_name').val().length > 0){
		$("#ul_upsoList").css('display','');
		getUpsoName();
	}else{
		$("#ul_upsoList").css('display','none');
	}
}

//회사명 가져오기
function getUpsoName(val){	

	//데이터 호출
	$.ajax({
		type:"GET",
//		url:'http://localapi.health.kr:8090/getUpsoName.localapi?upsonm='+$('#firm_name').val(),
		url:'/searchDrug/ajax/ajax_getUpsoName.asp?upsonm='+encodeURIComponent($('#firm_name').val()),
		async:true,
		cache: false,
//		dataType:"jsonp",
		dataType:"json",
	
		success:function(data){
			//console.log(data);
			var htmlData = "";
			for(var i = 0; i<data.length; i++){
				htmlData += "<li title='"+data[i].firm_name+"'>"
				htmlData += "<a class='overtxt' style='cursor:pointer' onclick=\"javascript:$('#firm_name').val('"+data[i].firm_name+"');$('#ul_upsoList').css('display','none')\">"
				htmlData += data[i].firm_name
				htmlData += "</a>"
				htmlData += "</li>"
			}
			$('#ul_upsoList').html(htmlData);

			$('#ul_upsoList').css("overflow-y","auto");
			$('#ul_upsoList').css("width","194px");
			$('#ul_upsoList').css("max-height","100px");
		},
		//complete:function(data){
			//console.log(data.responseText)
		//},
		error:function(xhr, status, error){
			alert('서버와의 통신 중 오류가 발생하였습니다.');
		}
	});
}//getUpsoName end





function list_setting() {
	if ($("#type_01_hidden").val() == "true") {
		$("#type_01").addClass("selected");
	}
	if ($("#type_02_hidden").val() == "true") {
		$("#type_02").addClass("selected");
	}
	if ($("#type_03_hidden").val() == "true") {
		$("#type_03").addClass("selected");
	}
	if ($("#type_etc_hidden").val() == "true") {
		$("#type_etc").addClass("selected");
	}
	if($("#typeids li input[type=checkbox]:checked").length > 0) {
		$("#type_all").removeClass("selected");
	}

	if ($("#shape_01_hidden").val() == "true") {
		$("#shape_01").addClass("selected");
	}
	if ($("#shape_02_hidden").val() == "true") {
		$("#shape_02").addClass("selected");
	}
	if ($("#shape_03_hidden").val() == "true") {
		$("#shape_03").addClass("selected");
	}
	if ($("#shape_04_hidden").val() == "true") {
		$("#shape_04").addClass("selected");
	}
	if ($("#shape_05_hidden").val() == "true") {
		$("#shape_05").addClass("selected");
	}
	if ($("#shape_06_hidden").val() == "true") {
		$("#shape_06").addClass("selected");
	}
	if ($("#shape_10_hidden").val() == "true") {
		$("#shape_10").addClass("selected");
	}
	if ($("#shape_09_hidden").val() == "true") {
		$("#shape_09").addClass("selected");
	}
	if ($("#shape_08_hidden").val() == "true") {
		$("#shape_08").addClass("selected");
	}
	if ($("#shape_etc_hidden").val() == "true") {
		$("#shape_etc").addClass("selected");
	}
	if($("#shapeids li input[type=checkbox]:checked").length > 0) {
		$("#shape_all").removeClass("selected");
	}
	if($(".shapeETC").find("[type=checkbox]:checked").length > 0) {
		$("#shape_all").removeClass("selected");
	}

	if ($("#color_white_hidden").val() == "true") {
		$("#color_white").addClass("selected");
	}
	if ($("#color_yellow_hidden").val() == "true") {
		$("#color_yellow").addClass("selected");
	}
	if ($("#color_orange_hidden").val() == "true") {
		$("#color_orange").addClass("selected");
	}
	if ($("#color_pink_hidden").val() == "true") {
		$("#color_pink").addClass("selected");
	}
	if ($("#color_red_hidden").val() == "true") {
		$("#color_red").addClass("selected");
	}
	if ($("#color_brown_hidden").val() == "true") {
		$("#color_brown").addClass("selected");
	}
	if ($("#color_ygreen_hidden").val() == "true") {
		$("#color_ygreen").addClass("selected");
	}
	if ($("#color_green_hidden").val() == "true") {
		$("#color_green").addClass("selected");
	}
	if ($("#color_bgreen_hidden").val() == "true") {
		$("#color_bgreen").addClass("selected");
	}
	if ($("#color_blue_hidden").val() == "true") {
		$("#color_blue").addClass("selected");
	}
	if ($("#color_navy_hidden").val() == "true") {
		$("#color_navy").addClass("selected");
	}
	if ($("#color_wine_hidden").val() == "true") {
		$("#color_wine").addClass("selected");
	}
	if ($("#color_purple_hidden").val() == "true") {
		$("#color_purple").addClass("selected");
	}
	if ($("#color_grey_hidden").val() == "true") {
		$("#color_grey").addClass("selected");
	}
	if ($("#color_black_hidden").val() == "true") {
		$("#color_black").addClass("selected");
	}
	if ($("#color_transp_hidden").val() == "true") {
		$("#color_transp").addClass("selected");
	}
	if ($("#colorids li input[type=checkbox]:checked").length > 0) {
		$("#color_all").removeClass("selected");
	}

	if ($("#line_no_hidden").val() == "true") {
		$("#line_no").addClass("selected");
	}
	if ($("#line_plus_hidden").val() == "true") {
		$("#line_plus").addClass("selected");
	}
	if ($("#line_minus_hidden").val() == "true") {
		$("#line_minus").addClass("selected");
	}
	if ($("#line_etc_hidden").val() == "true") {
		$("#line_etc").addClass("selected");
	}
	if ($("#lineids li input[type=checkbox]:checked").length > 0) {
		$("#line_all").removeClass("selected");
	}


}
function hidden_frm_setting() {
	$("#item_ingr_hidden").val(encodeURIComponent($("#item_ingr").val()));
	$("#pageSize_hidden").val(encodeURIComponent($("#pageSize").val()));
	$("#produceKind_hidden").val(encodeURIComponent($("#produceKind").val()));
	$("#pageNum_hidden").val(encodeURIComponent($("#pageNum").val()));
	
	$("#drug_print_front_hidden").val(encodeURIComponent($("#drug_print_front").val()));
	$("#match1_hidden").val(encodeURIComponent($("#match1").is(":checked")));
	$("#drug_print_back_hidden").val(encodeURIComponent($("#drug_print_back").val()));
	$("#match2_hidden").val(encodeURIComponent($("#match2").is(":checked")));
	
	$("#type_01_hidden").val(encodeURIComponent($("#type_01 [type=checkbox]").is(":checked")));
	$("#type_02_hidden").val(encodeURIComponent($("#type_02 [type=checkbox]").is(":checked")));
	$("#type_03_hidden").val(encodeURIComponent($("#type_03 [type=checkbox]").is(":checked")));
	$("#type_etc_hidden").val(encodeURIComponent($("#type_etc [type=checkbox]").is(":checked")));
	$("#type_all_hidden").val(encodeURIComponent($("#type_all [type=checkbox]").is(":checked")));

	$("#drug_name_hidden").val(encodeURIComponent($("#drug_name").val()));
	$("#firm_name_hidden").val(encodeURIComponent($("#firm_name").val()));

	$("#shape_01_hidden").val(encodeURIComponent($("#shape_01 [type=checkbox]").is(":checked")));
	$("#shape_02_hidden").val(encodeURIComponent($("#shape_02 [type=checkbox]").is(":checked")));
	$("#shape_03_hidden").val(encodeURIComponent($("#shape_03 [type=checkbox]").is(":checked")));
	$("#shape_04_hidden").val(encodeURIComponent($("#shape_04 [type=checkbox]").is(":checked")));
	$("#shape_05_hidden").val(encodeURIComponent($("#shape_05 [type=checkbox]").is(":checked")));
	$("#shape_06_hidden").val(encodeURIComponent($("#shape_06 [type=checkbox]").is(":checked")));
	$("#shape_10_hidden").val(encodeURIComponent($("#shape_10 [type=checkbox]").is(":checked")));
	$("#shape_09_hidden").val(encodeURIComponent($("#shape_09 [type=checkbox]").is(":checked")));
	$("#shape_08_hidden").val(encodeURIComponent($("#shape_08 [type=checkbox]").is(":checked")));
	$("#shape_etc_hidden").val(encodeURIComponent($("#shape_etc [type=checkbox]").is(":checked")));
	$("#shape_all_hidden").val(encodeURIComponent($("#shape_all [type=checkbox]").is(":checked")));

	$("#shape1_hidden").val(encodeURIComponent($("#shape1 [type=checkbox]").is(":checked")));
	$("#shape2_hidden").val(encodeURIComponent($("#shape2 [type=checkbox]").is(":checked")));
	$("#shape3_hidden").val(encodeURIComponent($("#shape3 [type=checkbox]").is(":checked")));
	$("#shape4_hidden").val(encodeURIComponent($("#shape4 [type=checkbox]").is(":checked")));
	$("#shape5_hidden").val(encodeURIComponent($("#shape5 [type=checkbox]").is(":checked")));
	$("#shape6_hidden").val(encodeURIComponent($("#shape6 [type=checkbox]").is(":checked")));
	$("#shape7_hidden").val(encodeURIComponent($("#shape7 [type=checkbox]").is(":checked")));
	$("#shape8_hidden").val(encodeURIComponent($("#shape8 [type=checkbox]").is(":checked")));
	$("#shape9_hidden").val(encodeURIComponent($("#shape9 [type=checkbox]").is(":checked")));
	$("#shape10_hidden").val(encodeURIComponent($("#shape10 [type=checkbox]").is(":checked")));
	$("#shape11_hidden").val(encodeURIComponent($("#shape11 [type=checkbox]").is(":checked")));
	$("#shape12_hidden").val(encodeURIComponent($("#shape12 [type=checkbox]").is(":checked")));
	$("#shape13_hidden").val(encodeURIComponent($("#shape13 [type=checkbox]").is(":checked")));
	$("#shape14_hidden").val(encodeURIComponent($("#shape14 [type=checkbox]").is(":checked")));
	$("#shape15_hidden").val(encodeURIComponent($("#shape15 [type=checkbox]").is(":checked")));
	$("#shape16_hidden").val(encodeURIComponent($("#shape16 [type=checkbox]").is(":checked")));
	$("#shape17_hidden").val(encodeURIComponent($("#shape17 [type=checkbox]").is(":checked")));
	$("#shape18_hidden").val(encodeURIComponent($("#shape18 [type=checkbox]").is(":checked")));
	$("#shape19_hidden").val(encodeURIComponent($("#shape19 [type=checkbox]").is(":checked")));
	$("#shape20_hidden").val(encodeURIComponent($("#shape20 [type=checkbox]").is(":checked")));
	$("#shape21_hidden").val(encodeURIComponent($("#shape21 [type=checkbox]").is(":checked")));

	$("#color_white_hidden").val(encodeURIComponent($("#color_white [type=checkbox]").is(":checked")));
	$("#color_yellow_hidden").val(encodeURIComponent($("#color_yellow [type=checkbox]").is(":checked")));
	$("#color_orange_hidden").val(encodeURIComponent($("#color_orange [type=checkbox]").is(":checked")));
	$("#color_pink_hidden").val(encodeURIComponent($("#color_pink [type=checkbox]").is(":checked")));
	$("#color_red_hidden").val(encodeURIComponent($("#color_red [type=checkbox]").is(":checked")));
	$("#color_brown_hidden").val(encodeURIComponent($("#color_brown [type=checkbox]").is(":checked")));
	$("#color_ygreen_hidden").val(encodeURIComponent($("#color_ygreen [type=checkbox]").is(":checked")));
	$("#color_green_hidden").val(encodeURIComponent($("#color_green [type=checkbox]").is(":checked")));
	$("#color_bgreen_hidden").val(encodeURIComponent($("#color_bgreen [type=checkbox]").is(":checked")));
	$("#color_blue_hidden").val(encodeURIComponent($("#color_blue [type=checkbox]").is(":checked")));
	$("#color_navy_hidden").val(encodeURIComponent($("#color_navy [type=checkbox]").is(":checked")));
	$("#color_wine_hidden").val(encodeURIComponent($("#color_wine [type=checkbox]").is(":checked")));
	$("#color_purple_hidden").val(encodeURIComponent($("#color_purple [type=checkbox]").is(":checked")));
	$("#color_grey_hidden").val(encodeURIComponent($("#color_grey [type=checkbox]").is(":checked")));
	$("#color_black_hidden").val(encodeURIComponent($("#color_black [type=checkbox]").is(":checked")));
	$("#color_transp_hidden").val(encodeURIComponent($("#color_transp [type=checkbox]").is(":checked")));
	$("#color_all_hidden").val(encodeURIComponent($("#color_all [type=checkbox]").is(":checked")));

	$("#line_no_hidden").val(encodeURIComponent($("#line_no [type=checkbox]").is(":checked")));
	$("#line_plus_hidden").val(encodeURIComponent($("#line_plus [type=checkbox]").is(":checked")));
	$("#line_minus_hidden").val(encodeURIComponent($("#line_minus [type=checkbox]").is(":checked")));
	$("#line_etc_hidden").val(encodeURIComponent($("#line_etc [type=checkbox]").is(":checked")));
	$("#line_all_hidden").val(encodeURIComponent($("#line_all [type=checkbox]").is(":checked")));

	$("#hidden_autosearch").val("start");
}
function refreshIdfy() {
	//문자
		$("#drug_print_front").val("");
		$("#drug_print_back").val("");
		$("#drug_name").val("");
		$("#firm_name").val("");
		
		$("ul.idty li").removeClass("selected");
		$("#shapeETC_selected").css("border","");

		$("ul.idty li").find("[type=checkbox]").prop("checked",false);

		$(".shapeETC [type=checkbox]").prop("checked",false);
		$("#shape_etc_text ul").empty();
		$("#selectMarkList").empty();

		$("#type_all").addClass("selected");
		$("#shape_all").addClass("selected");
		$("#color_all").addClass("selected");
		$("#line_all").addClass("selected");

		$("#ul_drugList").empty();
		$("#ul_upsoList").empty();

		$("#match1").prop("checked",false);
		$("#match2").prop("checked",false);

//		$("#ul_drugList").css("max-height","0px");
//		$("#ul_upsoList").css("max-height","0px");


}

function resultByMain() {
	//문자
	if("" != "") {
		$("#drug_print_front").val("");
	}
	
	//색깔
	if("" == "하양") {
		$("#color_white").addClass("selected");
		$("#color_white input:[type=checkbox]").prop("checked",true);
	}
	if("" == "노랑") {
		$("#color_yellow").addClass("selected");
		$("#color_yellow input:[type=checkbox]").prop("checked",true);
	}
	if("" == "주황") {
		$("#color_orange").addClass("selected");
		$("#color_orange input:[type=checkbox]").prop("checked",true);
	}
	if("" == "분홍") {
		$("#color_pink").addClass("selected");
		$("#color_pink input:[type=checkbox]").prop("checked",true);
	}
	if("" == "빨강") {
		$("#color_red").addClass("selected");
		$("#color_red input:[type=checkbox]").prop("checked",true);
	}
	if("" == "갈색") {
		$("#color_brown").addClass("selected");
		$("#color_brown input:[type=checkbox]").prop("checked",true);
	}
	if("" == "연두") {
		$("#color_ygreen").addClass("selected");
		$("#color_ygreen input:[type=checkbox]").prop("checked",true);
	}
	if("" == "초록") {
		$("#color_green").addClass("selected");
		$("#color_green input:[type=checkbox]").prop("checked",true);
	}
	if("" == "청록") {
		$("#color_bgreen").addClass("selected");
		$("#color_bgreen input:[type=checkbox]").prop("checked",true);
	}
	if("" == "파랑") {
		$("#color_blue").addClass("selected");
		$("#color_blue input:[type=checkbox]").prop("checked",true);
	}
	if("" == "남색") {
		$("#color_navy").addClass("selected");
		$("#color_navy input:[type=checkbox]").prop("checked",true);
	}
	if("" == "자주") {
		$("#color_wine").addClass("selected");
		$("#color_wine input:[type=checkbox]").prop("checked",true);
	}
	if("" == "보라") {
		$("#color_purple").addClass("selected");
		$("#color_purple input:[type=checkbox]").prop("checked",true);
	}
	if("" == "회색") {
		$("#color_grey").addClass("selected");
		$("#color_grey input:[type=checkbox]").prop("checked",true);
	}
	if("" == "검정") {
		$("#color_black").addClass("selected");
		$("#color_black input:[type=checkbox]").prop("checked",true);
	}
	if("" == "투명") {
		$("#color_transp").addClass("selected");
		$("#color_transp input:[type=checkbox]").prop("checked",true);
	}

	if ($("#colorids li input[type=checkbox]:checked").length > 0) {
		$("#color_all").removeClass("selected");
	}
	//모양
	if("" != "") {
		$("#shape_01").addClass("selected");
		$("#shape_01 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#shape_02").addClass("selected");
		$("#shape_02 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#shape_03").addClass("selected");
		$("#shape_03 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#shape_04").addClass("selected");
		$("#shape_04 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#shape_05").addClass("selected");
		$("#shape_05 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#shape_06").addClass("selected");
		$("#shape_06 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#shape_07").addClass("selected");
		$("#shape_07 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#shape_08").addClass("selected");
		$("#shape_08 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#shape_09").addClass("selected");
		$("#shape_09 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#shape_10").addClass("selected");
		$("#shape_10 input:[type=checkbox]").prop("checked",true);
	}

	if($("#shapeids li input[type=checkbox]:checked").length > 0) {
		$("#shape_all").removeClass("selected");
	}

	//제형
	if("" != "") {
		$("#type_01").addClass("selected");
		$("#type_01 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#type_02").addClass("selected");
		$("#type_02 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#type_03").addClass("selected");
		$("#type_03 input:[type=checkbox]").prop("checked",true);
	}
	if("" != "") {
		$("#type_etc").addClass("selected");
		$("#type_etc input:[type=checkbox]").prop("checked",true);
	}
	if($("#typeids li input[type=checkbox]:checked") > 0) {
		$("#type_all").removeClass("selected");
	}


	idfytotal('');

}
//색깔
function search_group(id,type)
{
	if(!$(id).hasClass("selected")){
//		alert("여기옴")
//		alert(id)
//		alert(type)
		$(".type"+type).not(id).addClass("selected");
	}
}
//모양
function search_shapes(val) {
	if (val == "all") {
		$("#shape_select a").text("모양전체");
	} else {
		$("#shape_select a img").prop("src","images/pills/shape"+val+".jpg");
	}
}
//제형
function search_types(val) {
	if (val == "all") {
		$("#form_select a").text("제형전체");
	} else if (val == "other") {
		$("#form_select a").text("기타");
	} else {
		$("#form_select a img").prop("src","images/pills/type"+val+".jpg");
	}
}
function shape() {
	
	$.ajax({
		type:"POST",
		url:"temp.asp",
		data:$(".idty li.selected input:[name='shapes']").serialize(),
		//dataType:"JSONP",
		success:function(data){
			
		},
		error:function(request,status,error){
		}
	});
}


// 프린트목록 구성
//          식별IDX, 제품명
function printList(val,val1) {
	var chkprint = 0;

	if($("input:checkbox[id='print"+val+"']").is(":checked") == true) {
//		alert(val + val1);
//		alert(produceKind);
		var htmlData = "";
		htmlData = htmlData + "<li id="+val+">"+val1+"<input type='hidden' name='drug_code' value='"+val+"'/><span onclick=\"removeList('"+val+"')\"class='delete ico'></span></li>";

//		if(produceKind == ""){
//			alert("들어옴");
			$("#printListAll li").each(function() {
				if($(this).prop("id") == val) {
					alert("이미 출력목록에 담긴 약품입니다.");
					$("#print"+val).prop("checked",false);
					chkprint = 1;
				}
			});
			if (chkprint != 1) {
				$("#printListAll").append(htmlData);
				$("#printList").val($("#printListAll").html());
				selectCnt = selectCnt + 1
				$(".printCnt").text(selectCnt);
			}

	} else {
			$("#printListAll #"+val).remove();
				$("#printList").val($("#printListAll").html());
			selectCnt = selectCnt - 1
			$(".printCnt").text(selectCnt);
	}
}
function selectPrint() {
	if(cartItems.length == 0) {
		alert("선택된 목록이 없습니다.");
		return false;
	}
	$('#printfrm').empty();
	//카트 내용을 폼에 추가
	for (var i=0; i<cartItems.length; i++) {
		$('#printfrm').append('<input type="hidden" name="drug_code" value="'+cartItems[i].code+'" style="display:none">');
	}

//	
//	if(produceKind == ""){
		$("#selectCntall").val(selectCnt);
		$("#printfrm").submit();
//	}else if(produceKind == "Y"){
//		$("#selectCntproy").val(selectCnt);
//		$("#printfrmProY").submit();
//	}else if(produceKind == "N"){
//		$("#selectCntpron").val(selectCnt);
//		$("#printfrmProN").submit();
//	}
}
//엔터키
function markEnter(){
	if(event.keyCode == 13){
		idfysearchmark();
	}
}
//식별제품상세정보 이동
function drugDetail(val,val1) {
	
//	$("#select_drug_idx").val(val);
//	$("#select_drug_code").val(val1);
//	$("#result_frm").submit();
	location.href="/searchIdentity/result.asp?didx="+val+"&dcode="+val1;
//	window.open("/searchIdentity/result.asp?didx="+val+"&dcode="+val1,"","");

}
//의약품상세정보 이동
function drug_detailHref(val){
//	location.href='/searchDrug/result_drug.asp?drug_cd='+val;
	window.open('/searchDrug/result_drug.asp?drug_cd='+val,'','');
}
//결과목록 이동
function moveresult() {		
		//기준이 될 div top값
		var topset = $("#result").offset().top;
		$("html,body").stop().animate({
			scrollTop : topset - 148
		},1500);
}
// 기타 선택하기 - 전체
function shapeETCAll() {
	if($("#shape0").is(":checked")== true) {
		var htmlData = "";
		$(".shapeETC").find("[type=checkbox]").prop("checked",true);
		$("#shape_etc_text ul").empty();
		$("#shapeETC_selected").css("border","2px solid #435cc8");
		$("#shape_all").removeClass("selected");
	} else {
		$(".shapeETC").find("[type=checkbox]").prop("checked",false);
		$("#shapeETC_selected").css("border","");
		$("#shape_etc_text ul").empty();
	}
}
// 기타 선택하기
//                 모양번호, 모양명
function shape_etcc(val) {
	if($("#shape"+val).is(":checked") == true) {
		var htmlData = "";
		htmlData += "<li id=s"+val+">"+$("#shape"+val).val()+"<span class='delete ico' onclick=\"shape_etc_delete('"+val+"')\"></span></li>";
		$("#shape_etc_text ul").append(htmlData);
		$("#shapeETC_selected").css("border","2px solid #435cc8");
		shape_clicks('');
		$("#shape0").prop("checked",false);
	} else {
		$("#shape_etc_text ul #s"+val).remove();
		if($("#etclist [type=checkbox]:checked").length == 0) {
			$("#shapeETC_selected").css("border","");
		}
		$("#shape0").prop("checked",false);

		$("#shape_etc_text ul").empty();

		var k = 0;
		var htmlData = "";
		$("#etclist li").each(function() {
			if(k != 0) {
				if($(this).find("[type=checkbox]").is(":checked") == true) {
					htmlData += "<li id=s"+k+">"+$(this).find("[type=checkbox]").val()+"<span class='delete ico' onclick=\"shape_etc_delete('"+k+"')\"></span></li>";
				}
			}
			k = k+1;
		});
//		console.log(htmlData);
		$("#shape_etc_text ul").append(htmlData);

	}
}
// 기타 선택중 X표시
function shape_etc_delete(val) {
	$("#shape_etc_text ul #s"+val).remove();
	$(".shapeETC #shape"+val).prop("checked",false);

	if($("#shape_etc_text ul li").length == 0){
		$("#shapeETC_selected").css("border","");
	}
}

// 제형 전체 <-> 그외 구분
function type_clicks(val) {
	if(val == "전체") {
		$("#typeids li").removeClass("selected");
		$("#typeids li input[type=checkbox]").prop("checked",false);
	} else {
		$("#type_all").removeClass("selected");
	}
}
// 모양 전체 <-> 그외 구분
function shape_clicks(val) {
	if(val == "전체") {
		$("#shapeids li").removeClass("selected");
		$("#shapeids li input[type=checkbox]").prop("checked",false);
		$("#shapeETC_selected").css("border","");
		$(".shapeETC").find("[type=checkbox]").prop("checked",false);
		$("#shape_etc_text ul").empty();
	} else {
		$("#shape_all").removeClass("selected");
	}
}
// 색상 전체 <-> 그외 구분
function color_clicks(val) {
	if(val == "전체") {
		$("#colorids li").removeClass("selected");
		$("#colorids li input[type=checkbox]").prop("checked",false);
	} else {
		$("#color_all").removeClass("selected");
	}
}
// 분할선 전체 <-> 그외 구분
function line_clicks(val) {
	if(val == "전체") {
		$("#lineids li").removeClass("selected");
		$("#lineids li input[type=checkbox]").prop("checked",false);
	} else {
		$("#line_all").removeClass("selected");
	}
}

// 출력목록 카트
var cartItems = new Array();

function initCart() {
	if (getCookie('cartItems') != "") {
		cartItems = JSON.parse(getCookie('cartItems'));
	}


	// 카트에 담긴 제품들에 체크박스
	for (var i = 0; i < cartItems.length; i++) {
		$('.chk_'+cartItems[i].code).prop('checked',true);
	}
	// 카트에 담긴 제품을 출력목록에 표시
	for (var i = 0; i < cartItems.length; i++) {
		$("#printListAll").append("<li id=li_"+cartItems[i].code+"><span class='overtxt'>"+cartItems[i].name+"</span><span onclick=\"cartDelItem('"+cartItems[i].code+"')\"class='delete ico'></span></li>");
	}


	// 목록 건수 표시
	$('.printCnt').text(cartItems.length);
}

function cartCheckbox(cboxID,drug_code,drug_name) {
	

	if ($('#'+cboxID).is(':checked') ) {		
		cartAddItem(drug_code,drug_name);
	} else {
		cartDelItem(drug_code);
	}

}
function cartAddItem(itemCode,itemName) {
	var item = new Object();
	item.code = itemCode;
	item.name =itemName;

	cartItems.push(item);
	$("#printListAll").append("<li id=li_"+itemCode+">"+itemName+"<span onclick=\"cartDelItem('"+itemCode+"')\"class='delete ico'></span></li>");

	// 목록 건수 표시
	$('.printCnt').text(cartItems.length);

	setCookie('cartItems',JSON.stringify(cartItems),1);
}

function cartDelItem(itemCode) {
	// 카트에서 삭제
	cartItems = cartItems.filter(function(returnableObjects){return returnableObjects.code !== itemCode;});
	// 체크박스 제거
	$('.chk_'+itemCode).prop('checked',false);
	// 출력목록에서 삭제
	$("#li_"+itemCode).remove();
	// 목록 건수 표시
	$('.printCnt').text(cartItems.length);

	setCookie('cartItems',JSON.stringify(cartItems),1);
}

// 쿠키 저장하기
function setCookie( name, value, expiredays )
{
	var todayDate = new Date();
	//todayDate.setDate( todayDate.getDate() + expiredays );
	todayDate.setTime(todayDate.getTime() + 60 * 60 * 1000); //1시간 후
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

// 쿠키 가져오기
function getCookie(name) {
;
        var nameOfCookie = name + "=";
        var x = 0
        while ( x <= document.cookie.length ) {
        var y = (x+nameOfCookie.length);
        if ( document.cookie.substring( x, y ) == nameOfCookie ) {
                if ( (endOfCookie=document.cookie.indexOf( ";",y )) == -1 )
                endOfCookie = document.cookie.length;
                return unescape( document.cookie.substring(y, endOfCookie ) );
        }
                x = document.cookie.indexOf( " ", x ) + 1;
                if ( x == 0 )
                        break;
        }

        return "";
}
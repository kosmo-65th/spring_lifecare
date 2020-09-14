//common rollover image
/*function imgOn(item){
var image = item.find("img");
var imgsrc = jQuery(image).attr("src");
if (jQuery(image).length){
var on = imgsrc.replace(/_off/,"_on");
jQuery(image).attr("src",on);};};
function imgOff(item){
var image = item.find("img");
for(var i=0;i<image.length;i++){
var imgsrc = jQuery(image[i]).attr("src");
var off = imgsrc.replace(/_on/,"_off");
jQuery(image[i]).attr("src",off);};};*/

var console = window.console || {log:function(){}};

//common rollover image
function imgOn(item){
	var image = item.find("img");
	var imgsrc = jQuery(image).attr("src");
	if (jQuery(image).length){
		var on = imgsrc.replace(/_off/,"_on").replace(/file2/,"file1");
		jQuery(image).attr("src",on);
	};
};

function imgOff(item){
	var image = item.find("img");
	for(var i=0;i<image.length;i++){
		var imgsrc = jQuery(image[i]).attr("src");
		var off = imgsrc.replace(/_on/,"_off").replace(/file1/,"file2");
		jQuery(image[i]).attr("src",off);
	};
};

//달력 컨트롤 활성
function showCalendar(ele, eleText, target){;
	var sText = eleText;
	var sobjId = ele.slice(0, -4);//-lry 문자열 지움
	var eleIfr = "<div id=\""+ele+"\" class=\"calendarSLayer\"><iframe id=\""+sobjId+"-ifrm\" name=\""+sobjId+"-ifrm\" class=\"calendar-frame\" src=\"/static/view/layerCalendar.jsp\" title=\""+sText+" 날짜입력 프레임\" frameborder=\"0\" scrolling=\"no\"><\/iframe></div>";
	if (!$('#'+ele).length) {$("#calendarID_"+sobjId).append(eleIfr);}//레이어 생성
	var $this = $(target);
	var widD = ($(window).width() -$(".calendar-frame").width())/2;
	var r_posx = $this.width()+$this.offset().left - $this.parent().find(".calendar-frame").width() -10;
	if($(window).width() > 767){
		if(($("#content").width()/2) < $this.parent().prev().position().left){	//중간에서 오른쪽에 있을 경우
			$this.next().find(".calendar-frame").css("right", "0");
		}else{
			$this.next().find(".calendar-frame").css("left", "0");
		}
		//alert(1)
	}else{
		//$this.next().css("left", -widD);
		$this.next().css({"right": + r_posx +"px"});
		//$this.next().addClass("abc")
		//alert(widD)
	}
	var ele = document.getElementById(ele);
	if(ele.style.display != 'block'){
		$(".calendarSLayer").css("display", "none");
		$(".calendarzone").css("z-index", "0");	
		ele.style.display ="block";
		ele.parentNode.style.zIndex = "100";
	}else{
		$(".calendarSLayer").remove();  //레이어 제거
	}
	return false;
}
function fnSetDynamicCalendar() {
	//console.time("concatenation");
	$(':text.sdate,:text.edate,:text.date').each(function(i) {
		$this = $(this);
		if ($this.attr("data-dateControl")==undefined) {
			$this.attr("data-dateControl",true);
			switch ($this[0].className){
				case "sdate":
				  sText = "시작";break;
				case "edate":
				  sText = "종료";break;
				case "date":
				  sText = "";break;
				default:
				  sText = "";
			}
			var sobjId = $this.attr("id");
			if (!sobjId) {
				$this.attr("id",$this.attr("name"));
				sobjId = $this.attr("name");
			}
			var innerhtml	="<div class='calendarzone' id='calendarID_"+sobjId+"'>"
							+"<input type='button' value='"+sText+"날짜 달력에서 선택'"
							+"onclick=\"return showCalendar('" + sobjId + "-lry','" + sText + "',this)\"/>"
							+"</div>";
			$this.after( innerhtml );
		}
	});
	//console.timeEnd("concatenation")
}
$(function() {
	fnSetDynamicCalendar();//초기 달력 세팅
	//roll over
	jQuery(".rv a").bind('mouseover keyup' , function()    { imgOn(jQuery(this))})
	jQuery(".rv a").bind('mouseout blur' , function()    { imgOff(jQuery(this))})

});
$(document).on("click",".calendarzone input", function() {  // 추가선택자를 넣고 동적이벤트 바인딩을 할경우 선택자는 document로 지정한다.
	//console.log('추가 이벤트 내역')
});
// function chk
function getNumber(fCss, vali_str){
	var temp = trim(fCss.substr(fCss.indexOf(vali_str), fCss.length));
	if (temp.indexOf(" ")>-1){temp = temp.substr(0,temp.indexOf(" "));}
	if (temp.indexOf("-")>-1){
		var arr = temp.split("-");
		temp = arr[1];
	} else {temp=0;}
	try{temp=parseInt(temp);} catch (e){temp=0;}
	return temp;
}
// 앞/뒤에서 White Space가 제거된 값반환
function trim(value) {
	return value.replace(/^\s+|\s+$/g,"");
}
// autoWidth
$(function() {
	var time=new Date();
	// console.log(time)
	$('[class*=w-]').each(function(index, el) {
		w=getNumber(this.className,'w-')
		$(this).css('width',w)
	});
	var endTime=new Date();
	// console.log(endTime-time)
})


function checkSearchForm(form){
	if (!form.q.value) {
		alert("검색어를 입력하세요.");
		form.q.focus();
		return false;
	}
	return true;
}






//UNIQUENESS & PEOPLE UI/UX DEPT.
//PAGINGRESPONES VER 1.3
/*
버그수정
var pagingBtnWidth = 34;//페이징 숫자버튼 너비
var pagingCtrlWidth = 34*4;//페이징컨트롤 이전,다음,처음,마지막 너비
var totalPaging = 10;// 한번에 나오는 페이징 개수
마지막줄 100 // 갱신 시간 단위 1/1000
*/
$(function() {
	var pagination = $('.pagination');
	var pagingBtnWidth = 38;//페이징 숫자버튼 너비
	var pagingCtrlWidth = pagingBtnWidth*4;//페이징컨트롤 이전,다음,처음,마지막 너비
	var minimumPaging = 3;
	var pagingCtrlView = true;
	var pagingType; // 디버그용도
	var pg;//보여줄 페이징 개수
	var item = pagination.find('li').not('.i');//페이징 중 컨트롤을 제외 한 숫자 
	var totalPaging = item.length;// 한번에 나오는 페이징 개수
	var currentPage = item.index(item.parent().find('.active')); //활성화된 페이징
	var prevBtn = pagination.find('.prev')//이전버튼 
	var nextBtn = pagination.find('.next')//다음버튼
	var firstBtn = pagination.find('.first')//처음
	var endBtn = pagination.find('.end');//마지막
	var paginationClone = pagination.clone()
	var href=item.find('a').eq(0).attr('href')
	var lastpage
	if (endBtn.hasClass('disabled')) {
		lastpage=item.eq(-1).text()
	}else{
		var pt = /(pageIndex\=)\d+/i;
		lastpage = pt.exec(endBtn.find('a').attr('href'));
		pt=/\d+/i;
		lastpage = pt.exec(lastpage)
	}

	//실제 동작 함수
	function resizeDiv(){
		var windowWith = $(window).width();
		if (windowWith<=360) {
			pg=minimumPaging;
		}else{
			pg = Math.floor((windowWith-pagingCtrlWidth)/pagingBtnWidth);
			if (pg>totalPaging) {pg=totalPaging}
		}

		if (currentPage<minimumPaging) {
			pagingType = 'A';
			from = 0;
			to = pg;
		}else if(currentPage<totalPaging-2 ) {
			pagingType = 'B';
			from = Math.floor(currentPage-(pg/2))
			to = Math.floor(currentPage+(pg/2))
		}else{
			pagingType = 'C';
			from = totalPaging-pg;
			to = totalPaging;
		}
		console.log('from=',from,'item.length=',item.length,'pg=',pg,'currentPage=',currentPage)
		if (from>item.length) {from=0}
		console.log(pagingType,' 시작=',from,' 끝=',to)
		item.hide();
		for (var i = 0; i < totalPaging; i++) {
			if (i>=from&&i<=to) {
				item.eq(i).show()
			}
		}
		function linkreplace(target,argument) {
					target.find('a').attr('href',href.replace(/(pageIndex=)\w+/,'pageIndex='+argument))
					target.removeClass('disabled')
				}
		//이전 페이지 링크변경
		if (currentPage>0 && item.eq(0).css('display')=='none') {
			console.log('이전버튼 활성화')
			prevBtn.html(item.find('a').eq(0).clone().html('<span class="s"><span>이전 <span class="t">목록으로 이동</span></span></span>'));
			linkreplace(prevBtn,Number(item.eq(from).text())-1)
		}else{
			prevBtn.html(paginationClone.find('.prev').html());
		}
		//다음버튼
		if (item.eq(-1).css('display')=='none') {
			console.log('이전버튼 활성화')
			nextBtn.html(item.find('a').eq(0).clone().html('<span class="s"><span>다음 <span class="t">목록으로 이동</span></span></span>'));
			linkreplace(nextBtn,Number(item.find('a:visible').eq(-1).text())+1)
		}else{
			nextBtn.html(paginationClone.find('.next').html());
		}

		//처음버튼
		if (item.eq(0).css('display')=='none') {
			firstBtn.html(item.find('a').eq(0).clone().html('<span class="s"><span>처음 <span class="t">목록으로 이동</span></span></span>'));
			linkreplace(firstBtn,1)
		}else{
			firstBtn.html(paginationClone.find('.first').html())
		}
		//마지막버튼
		if (item.eq(-1).css('display')=='none') {
			endBtn.html(item.find('a').eq(0).clone().html('<span class="s"><span>끝 <span class="t">목록으로 이동</span></span></span>'));
			linkreplace(endBtn,lastpage)
		}else{
			endBtn.html(paginationClone.find('.end').html())
		}
		pagination.find('.i').addClass('disabled').has('a').removeClass('disabled');
	}
	resizeDiv();
	(function($,sr){
		var debounce = function (func, threshold, execAsap) {
				var timeout;
				return function debounced () {
						var obj = this, args = arguments;
						function delayed () {
								if (!execAsap)
									func.apply(obj, args);
								timeout = null;
						};
						if (timeout)
								clearTimeout(timeout);
						else if (execAsap)
								func.apply(obj, args);
						timeout = setTimeout(delayed, threshold || 100);
				};
		}
		jQuery.fn[sr] = function(fn){  return fn ? this.bind('resize', debounce(fn)) : this.trigger(sr); };
	})(jQuery,'smartresize');
	$(window).smartresize(function(){
		resizeDiv();
	});
});

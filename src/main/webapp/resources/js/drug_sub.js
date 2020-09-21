//$.fn.clicktoggle = function(a, b) {
//    return this.each(function() {
//        var clicked = false;
//        $(this).click(function() {
//            if (clicked) {
//                clicked = false;
//                return b.apply(this, arguments);
//            }
//            clicked = true;
//            return a.apply(this, arguments);
//        });
//    });
//};
function Left(str, n){
	if (n <= 0)
	  return "";
	else if (n > String(str).length)
	  return str;
	else
	  return String(str).substring(0,n);
}

function banner_margin(){
	if($('body').attr('style') != ""){
		var sizeval = (parseInt(Left($("aside#aside_sub").css('margin-left'),3))+120);
		$("aside#aside_sub").css('margin-left',"'"+sizeval+"px'");
		//$("aside#aside_sub").css('margin-left','903px');
		
	}
}


$(function(){//jquery준비

//nav
	$("#nav_cont .bar").show();
	$(".secDepth").hide();
	$("#nav_cont ul li.selected .secDepth").show();
	$("#nav_cont ul li.selected").addClass("current");
	$(".secDepth ul li a.selected").addClass("current");
	
	$(".secDepth ul li a").mouseover(function(){
		$(".secDepth ul li a").removeClass("current");
		$(this).addClass("current");
	}).mouseout(function(){
		$(this).removeClass("current");
		$(".secDepth ul li a.selected").addClass("current");
		headerMenuSetting();
	});
	
	$("#nav_cont > ul > li").mouseover(function(){
		$("#nav_cont > ul > li").removeClass("current");
		$(".secDepth").hide();
		$(this).addClass("current");
		$(".secDepth").eq($(this).index()).show();
	}).mouseout(function(){
		$("#nav_cont > ul > li").removeClass("current");
		$(".secDepth").hide();
		$("#nav_cont ul li.selected").addClass("current");
		$("#nav_cont ul li.selected .secDepth").show();
		headerMenuSetting();
	});

	
//화면이 164px 이동시 navi 고정
	var offset=164;
	$(window).scroll(function(){
		if($(this).scrollTop()>offset){
			$("nav").addClass("fixed");
		}else {
			$("nav").removeClass("fixed");
		};
	});	

//화면이 164px 이동시 aside 고정
	var offset=164;
	$('.go_top.ico').css('margin-bottom','90px')

	$(window).scroll(function(){
		if($(this).scrollTop()>offset){
			$("aside#aside_sub").addClass("fixed");
			 //banner_margin();
			//스크롤위치가 고정되어야 할 최소범위를 지났을 경우 //평균값
//			if($(this).scrollTop()>650){
//				//스크롤 할때마다 위치와 브라우저의 크기를 계산해서 변수에 담는다.
//				var val = $(this).scrollTop()-$(window).height();
//				
//				if(val > 0){
//					//양수일 경우 브라우저 사이즈가 작아진 상태이므로 -연산에 -20을 더해서(보기좋게) css를 적용한다.
//					$('#aside_sub').css('margin-top',-val-20);
//				
//				}else if(val < 0){
//					//음수일 경우 브라우저 상태가 사용자pc에 일정크기 이상으로 확대되어있으므로 바로 대입한다.
//					$('#aside_sub').css('margin-top',val);
//				}
//
//				//$('.go_top.ico').css('margin-bottom',$(document).height()-$('footer').offset().top);  --> Test Code
//				//90px이상 띄웠을때, 적당한 위치에 잡힌다.
//				$('.go_top.ico').css('margin-bottom','90px')
//			}
			
		}else {
			//console.log('아님?')
			//$("aside#aside_sub").removeClass("fixed");
			//플로팅 배너 초기화
//			$('#aside_sub').css('margin-top','0px')
			
			
		};
	});
	
	
//결과 내 검색 필터링 박스 
	$(".category_list").hide();
	$(".category").toggle(function(){
		$(this).find("ul").show();
		},function(){
			$(this).find("ul").hide();
		});	

//의약품상세검색 내 필터링 박스 
	$(".search_table table .category_list").hide();
	$(".search_table .category").toggle(function(){
		$(this).find("ul").show();
		},function(){
			$(this).find("ul").hide();
		});			

//50줄보기 선택 박스 
	$(".lines .category_list").hide();
	$(".lines").toggle(function(){
		$(this).find("ul").show();
		},function(){
			$(this).find("ul").hide();
		});		
		
//인포 버튼 마우스오버시 팝업
	$(".infoOver > p").hide();
	$(".infoOver").mouseover(function(){
		$(this).find(" > p").show();
	}).mouseout(function(){
		$(this).find(" > p").hide();
	});
	
	$(".comp > div, printList > div").hide();
	$(".comp, .printList").mouseover(function(){
		$(this).find(" > div").show();
	}).mouseout(function(){
		$(this).find(" > div").hide();
	});
	
//의약품식별검색 출력담기 마우스오버 팝업
	// $("td.print").mouseover(function(){
		// $("#search_identity th.infoOver p").show();
	// }).mouseout(function(){
		// $("#search_identity th.infoOver p").hide();
	// });
	
//의약품식별검색 출력담기 마우스오버 팝업
	$("#search_identity td.print").mouseover(function(){
		$("#search_identity th.info_print .infoOver p").show();
	}).mouseout(function(){
		$("#search_identity th.info_print .infoOver p").hide();
	});
	

	
//인포 버튼 클릭시 팝업	
	if (parseInt($().jquery.split(".")[0]) >= 1 && parseInt($().jquery.split(".")[1]) >= 7) {
		$(".infoOver > a").on("click",function(){
			if ($(this).parent().find("div").filter(':visible').length > 0) {
				$(this).parent().find("div").hide();
			} else {
				$(".infoOver > div").hide();
				$(this).parent().find("div").show();
			}
			return false;
		});	
	} else {
		$(".infoOver > a").live("click",function(){
			if ($(this).parent().find("div").filter(':visible').length > 0) {
				$(this).parent().find("div").hide();
			} else {
				$(".infoOver > div").hide();
				$(this).parent().find("div").show();
			}
			return false;
		});	
	}
	
//의약품식별검색 성분,함량 더보기 toggle
	$(".ingredinfo > div").hide();
	$(".ingredinfo > a").toggle(function(){		
		$('.ingredinfo .popupbx').hide();
		$(this).parent().find("div").show();
		},function(){
			$(this).parent().find("div").hide();
		});		
	
//식별 상세이미지 클릭시 적용시킴(임시)
	$(".infoOvers > div").hide();
	$(".infoOvers").click(function(){
		$(".infoOvers > div").hide();
		$(this).parent().find("div").show();
		return false;
	});

//	$(".infoOvers").click(function(){
//		$(".infoOvers > div").parent().hide();
//		$(this).parent().find("div").show();
//		return false;
//	});

	if (parseInt($().jquery.split(".")[0]) >= 1 && parseInt($().jquery.split(".")[1]) >= 7) {
		$(".popupbx a.close").on("click",function(){
			$(".popupbx").hide();
			return false;
		});
	} else {
		$(".popupbx a.close").live("click",function(){
			$(".popupbx").hide();
			return false;
		});
	}
		
//생산,수입 실적이 있는 품목 탭 클릭시 해당내용 보여줌	
	$("#result_recorded table").css("display","none");
	$("#result_recorded .tab3 li").eq(0).addClass("selected");
	$("#result_recorded table").eq(0).show();	
	$("#result_recorded .tab3 li").click(function(){
		$("#result_recorded .tab3 li").removeClass("selected");
		$(this).addClass("selected");
		$("#result_recorded table").hide();
		$("#result_recorded table").eq($(this).index()).show();
		return false;		
	});
//생산,수입 미확인 또는 중단 품목 탭 클릭시 해당내용 보여줌	
	$("#result_unrecorded table").css("display","none");
	$("#result_unrecorded .tab3 li").eq(0).addClass("selected");
	$("#result_unrecorded table").eq(0).show();	
	$("#result_unrecorded .tab3 li").click(function(){
		$("#result_unrecorded .tab3 li").removeClass("selected");
		$(this).addClass("selected");
		$("#result_unrecorded table").hide();
		$("#result_unrecorded table").eq($(this).index()).show();
		return false;		
	});	
	
//tab2 탭 클릭시 해당내용 보여줌	
	$(".tab2_cont").hide();
	$(".tab2_cont").eq(0).show();	
//	$("ul.tab2 li").eq(0).addClass("selected");
	$("ul.tab2 li").click(function(){
		$("ul.tab2 li").removeClass("selected");
		$(this).addClass("selected");
		
		// 170731 요청에 따라 탭 -> 스크롤로 변경
		//$(".tab2_cont").hide();
		//$(".tab2_cont").eq($(this).index()).show();


		sideCalc();
		return false;		
	});	
//임부약물사용 tab2 탭 클릭시 해당내용 보여줌	
	$("#preg_result .tab2_cont").hide();
	$("#preg_result .tab2_cont").eq(0).show();
//	$("#preg_result ul.tab2 li").eq(0).addClass("selected");
	$("#preg_result ul.tab2 li").click(function(){
		$("#preg_result ul.tab2 li").removeClass("selected");
		$(this).addClass("selected");
		$("#preg_result .tab2_cont").hide();
		$("#preg_result .tab2_cont").eq($(this).index()).show();
		sideCalc();
		return false;		
	});	

//tab3 탭 클릭시 해당내용 보여줌		
$(".tab3_cont").css("display","none");
//	$(".tab3 li").eq(0).addClass("selected");
	$(".tab3_cont").eq(0).show();	
	$(".tab3 li").click(function(){
		$(this).parent().find("li").removeClass("selected");
		$(this).addClass("selected");
		//$(".tab3_cont").hide(); - 2017.05.25 식별검색시 로딩바가 감춰지는 현상때문에 주석처리 .  불필요함
		$(".tab3_cont").eq($(this).index()).show();
		return false;		
	});	
	
//임부안전성 선택 
//	$("#chooseRank .dur li").clicktoggle(function(){
//		
//			$(this).addClass("selected");
//		},function(){
//			$(this).removeClass("selected");
//		});	
//	$("#chooseRank .fda li").clicktoggle(function(){
//			$(this).addClass("selected");
//		},function(){
//			$(this).removeClass("selected");
//		});	

	
	
//의약품식별검색 - 모양,색깔, 분할선 선택하기
	$('#search_identity ul.idty > li').click(function(){
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			$(this).find('input[type="checkbox"]').prop("checked",false);
		} else {
			$(this).addClass('selected');
		}
	});
//성상변경내역 테이블 클릭시 하단에 상세보기
	$(".infoExra").css("display","none");
	$(".changeinfo").click(function(){
		$(".changeinfo").css("background-color","#fff");
		$(".infoExra").slideUp("fast");
		if($(this).next().css("display")=="none"){
			$(this).css("background-color","#f9f9f9");
			$(this).next().slideDown("fast");
		};return false;
	});	
	
//KPIC약효분류		
	$(".tree ul li ul").css("display","none");
	$("#sort a.sort1").addClass("current");
	
	//클릭시 해당 하위 리스트 보이기
	$(".tree span.ico").click(function(){
		$(this).parent().removeClass("selected");
		$(this).parent().parent().find(">ul").slideUp("fast");
		if($(this).parent().parent().find(">ul").css("display")=="none"){
			$(this).parent().addClass("selected");
			$(this).parent().parent().find(">ul").slideDown("fast");
		};return false;
	});
	//대분류 클릭
	$("#sort a.sort1,.tree .btns .btn04").click(function(){
		$("#sort a").removeClass("current");
		$(this).addClass("current");
		$(".tree ul").show();
		$(".tree ul.depth01 ul").hide();
		$(".tree .list").addClass("selected");
		$(".tree ul.depth01 .list").removeClass("selected");
		sideCalc();
		return false;
	});
	//중분류 클릭
	$("#sort a.sort2").click(function(){
		$("#sort a").removeClass("current");
		$(this).addClass("current");
		$(".tree ul").show();
		$(".tree ul.depth02 ul").hide();
		$(".tree .list").addClass("selected");
		$(".tree ul.depth02 .list").removeClass("selected");
		sideCalc();
		return false;
	});
	//소분류 클릭
	$("#sort a.sort3").click(function(){
		$("#sort a").removeClass("current");
		$(this).addClass("current");
		$(".tree ul").show();
		$(".tree ul.depth03 ul").hide();
		$(".tree .list").addClass("selected");
		$(".tree ul.depth03 .list").removeClass("selected");
		sideCalc();
		return false;
	});
	//펼쳐보기
	$("#sort a.sort4").click(function(){

		$("#sort a").removeClass("current");

		$(this).addClass("current");
		
		$(".tree ul").show();
				
		$(".tree .list").not(".minus").addClass("selected");
		
		sideCalc();

		return false;
	});

//ATC코드
	//클릭시 해당 하위 리스트 보이기
	$(".ATCcode span.ico").click(function(){
		$(this).parent().parent().parent().parent().removeClass("selected");
		$(this).parent().parent().parent().parent().parent().find(">ul").slideUp("fast");
		if($(this).parent().parent().parent().parent().parent().find(">ul").css("display")=="none"){
			$(this).parent().parent().parent().parent().addClass("selected");
			$(this).parent().parent().parent().parent().parent().find(">ul").slideDown("fast");
		};return false;
	});
	

	
});//jquery종료



function sideCalc(){
	
	//우측 사이드바 footer를 넘지않도록 설정 : 시작
	var catcher = $('#catcher');
	var sticky = $('#aside_sub');
	var footer = $('footer');
	var footTop = footer.offset().top;
	var lastStickyTop = sticky.offset().top;
	$(window).scroll(function() {
		if(isScrolledTo(sticky)) {
			sticky.css('position','fixed');
			sticky.css('top','52px');
	}

	var stopHeight = catcher.offset().top + catcher.height();
	var stickyFoot = sticky.offset().top + sticky.height();

	if($(this).scrollTop()>stopHeight){
		$("aside#aside_sub").addClass("fixed");
	
	}

	if(stickyFoot > footTop -50){
	  
	  sticky.css({
		position:'absolute',
		top: (footTop - 50) - sticky.height()
	 });
	} else {
	  if ( stopHeight > sticky.offset().top) {
		
		sticky.css('position','absolute');
		sticky.css('top',stopHeight);
	  }
	}
	});//우측 사이드바 footer 넘지않게 설정 : 종료




}

//우측 사이드바 footer 넘지않게 설정
function isScrolledTo(elem) {
	var docViewTop = $(window).scrollTop(); 
	var docViewBottom = docViewTop + $(window).height();
	var elemTop = $(elem).offset().top; 
	var elemBottom = elemTop + $(elem).height();

	return ((elemTop <= docViewTop || elemTop >= docViewTop));
}


$(function(){//jquery준비



//header.asp 에 중복방지를 위한 재정의
//	$("#searchBar #category_list").hide();
//	$("#searchBar #category a").toggle(function(){
//		$("#searchBar #category_list").show();
//		},function(){
//			$("#searchBar #category_list").hide();
//		});	

//nav
//	$(".mainNav .secDepth,#nav_cont .bar").hide();
	$("#main_bar").hide();

	$("#nav_cont > ul > li").mouseover(function(){
		$(this).addClass("current");
		$(".secDepth").eq($(this).index()).show();
		$("#nav_cont #main_bar").show();
	}).mouseout(function(){
		$(this).removeClass("current");
		$(".secDepth").eq($(this).index()).hide();
		$("#nav_cont #main_bar").hide();
	});
	
	$(".secDepth > ul > li a").mouseover(function(){
		$(this).addClass("current");
	}).mouseout(function(){
		$(this).removeClass("current");
	});

//사이트맵 보기
	$("#sitemap #map").hide();
	$("#sitemap > a").toggle(function(){
			$("#sitemap #map").show();
			$("#sitemap > a").addClass("selected");
		},function(){
			$("#sitemap #map").hide();
			$("#sitemap > a").removeClass("selected");
		});	
	
//모양으로 약찾기 색상선택 
//	$("#search_shape #color ul li").toggle(function(){
//			$(this).addClass("selected");
//		},function(){
//			$(this).removeClass("selected");
//		});	
$('#search_shape #color li').click(function(){
	if ($(this).hasClass('selected')) {
		$(this).removeClass('selected');
		$(this).find('input[type="checkbox"]').prop("checked",false);
	} else {
		$(this).addClass('selected');
	}
});
//모양으로 약찾기 모양선택
$('#search_shape #shape li').click(function(){
		$('#search_shape #shape li').removeClass('selected');
		$(this).addClass('selected');
		$('#search_shape #shape li').find('input[type="checkbox"]').prop("checked",false);
		$(this).find('input[type="checkbox"]').prop("checked",true);
});
//모양으로 약찾기 제형선택 
$('#search_shape #type li').click(function(){
		$('#search_shape #type li').removeClass('selected');
		$(this).addClass('selected');
		$('#search_shape #type li').find('input[type="checkbox"]').prop("checked",false);
		$(this).find('input[type="checkbox"]').prop("checked",true);
});
//모양으로 약찾기 분할선 
$('#search_shape #line li').click(function(){
		$('#search_shape #line li').removeClass('selected');
		$(this).addClass('selected');
		$('#search_shape #line li').find('input[type="checkbox"]').prop("checked",false);
		$(this).find('input[type="checkbox"]').prop("checked",true);
});

	
//모양으로 약찾기 모양,제형,분할선 선택 
	$("#form > div").css("display","none");
	//클릭시 해당 내용 보여줌
	$("#form ul.tab li").click(function(){
		$("#form ul.tab li").removeClass("selected");
		$(this).addClass("selected");
		$("#form > div").hide();
		$("#form > div").eq($(this).index()).show();
		return false;		
	});
	//클릭시 해당 내용 닫기
	$("#form > div > a.close,#form > div ul li").click(function(){
		$("#form ul.tab li").removeClass("selected");
		$("#form > div").hide();
		return false;
	});
	
//게시판	
	$(".board > div").css("display","none");
	//상단 게시판_마우스오버시 해당 내용 보여줌
	$("#board_top ul.tab li").eq(0).addClass("selected");
	$("#board_top > div").eq(0).show();	
	$("#board_top ul.tab li").mouseover(function(){
		$("#board_top ul.tab li").removeClass("selected");
		$(this).addClass("selected");
		$("#board_top > div").hide();
		$("#board_top > div").eq($(this).index()).show();
		return false;		
	});
	
	//하단 게시판_마우스오버시 해당 내용 보여줌
	$("#board_bottom ul.tab li").eq(0).addClass("selected");
	$("#board_bottom > div").eq(0).show();
	$("#board_bottom ul.tab li").mouseover(function(){
		$("#board_bottom ul.tab li").removeClass("selected");
		$(this).addClass("selected");
		$("#board_bottom > div").hide();
		$("#board_bottom > div").eq($(this).index()).show();
		return false;		
	});
	
	//허가리뷰 내 탭3개 분리_20200508
	$(".review > div").css("display","none");
	$(".review ul.tab02 li").eq(0).addClass("selected");
	$(".review > div").eq(0).show();
	$(".review ul.tab02 li").mouseover(function(){
		$(".review ul.tab02 li").removeClass("selected");
		$(this).addClass("selected");
		$(".review > div").hide();
		$(".review > div").eq($(this).index()).show();
		return false;		
	});
	
//go_top
	//화면이 200px 이동시 go top버튼 보임
		var offset=200;
		$(window).scroll(function(){
			if($(this).scrollTop()>offset){
				$("a.go_top").fadeIn(500);
			}else {
				$("a.go_top").fadeOut(500);
			};
		});

		//맨 위로 화면 스크롤
		$("a.go_top").click(function(){
			$("html,body").animate({
				scrollTop:0
			},500);
			return false;
		});
	
//관련사이트 슬라이딩		
$(document).ready(function(){
	if(ieVerChk() == "ok"){
		/*
		 $('.bxslider').bxSlider({
		  mode: 'vertical',
		  slideMargin: 5,
		  auto: true,
		  autoControls: true
		});	
		*/
	}
});
	
	
function ieVerChk(){
	var trident = navigator.userAgent.match(/Trident\/(\d)/i);
	//console.log('connect browser info');
	//console.log(trident);
	if((trident != null) && (trident[1] == 7)){
		return "ok";		
	} else{
		return "no";
	}
}
	
	
	
	
});//jquery종료

function view_loadingimage(idvalue,width){
	//테이블의 id값을 받아온다.
	$("#"+idvalue+"").css('display','');
	$("#"+idvalue+"").css("text-align","center");
	$("#"+idvalue+"").html("<img id='view_loading' src='/images/view_loading.gif' style='width:"+width+"px' />");
}


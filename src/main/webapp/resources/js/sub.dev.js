$.fn.toggle = function(a, b) {
    return this.each(function() {
        var clicked = false;
        $(this).click(function() {
            if (clicked) {
                clicked = false;
                return b.apply(this, arguments);
            }
            clicked = true;
            return a.apply(this, arguments);
        });
    });
};

$(function(){//jquery준비

	
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
	
//식별 상세이미지 클릭시 적용시킴(임시)
	$(".infoOver > div").hide();
	$(".infoOver").click(function(){
		$(".infoOver > div").hide();
		$(this).parent().find("div").show();
		return false;
	});

	$(".popupbx a.close").click(function(){
		$(".popupbx").hide();
		return false;
	});
		
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
	
	
//의약품식별검색 - 모양,색깔, 분할선 선택하기
//	$("#search_identity ul.idty > li").toggle(function(){
//			$(this).addClass("selected");
//		},function(){
//			$(this).removeClass("selected");
//		});	
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
	
	
	

	
});//jquery종료


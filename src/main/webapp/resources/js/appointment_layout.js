(function($) {
    $.fn.clickToggle = function(func1, func2) {
        var funcs = [func1, func2];
        this.data('toggleclicked', 0);
        this.click(function() {
            var data = $(this).data();
            var tc = data.toggleclicked;
            $.proxy(funcs[tc], this)();
            data.toggleclicked = (tc + 1) % 2;
        });
        return this;
    };
}(jQuery));


// 	$(function() {
// 		//게시판 첨부파일

// 		$(window).resize(function(event) {
// 			// var a = 0;
// 			// var x = 0;
// 			// $('#gnb>ul>li').each(function(index, el) {
// 			// 	$(this).width('auto')
// 			// })
// 			// $('#gnb>ul>li>a').each(function(index, el) {
// 			// 	a+=$(this).width()
// 			// });

// 			// x = Math.floor(($('#gnb>ul').width()-a)/5)
// 			// // console.log(x)
// 			// $('#gnb>ul>li').each(function(index, el) {
// 			// 	$(this).width($(this).width()+x);
// 			// });


// 			if (767<$(window).width()) {
// 				$('#gnb>.pcweb').show();
// 				$('#gnb>.mobileGnb').hide();
// 				$('.navOpen').click(function() {
// 					$(this).hide();
// 					$('.navClose').show();
// 					$('#gnb').addClass('viewAll');
// 					$(".gnbBg").addClass('db');
// 					$('#gnb>ul.pcweb').css({'display':'block'})
// 					$('#gnb>ul.mobileGnb').css({'display':'none'})
// 				});
// 				$('.navClose').click(function() {
// 					$(this).hide();
// 					$('.navOpen').show();
// 					$('#gnb').addClass('subClose');
// 					$('#gnb').removeClass('viewAll subOpen');
// 					$(".gnbBg").removeClass('db');
// 				});
// 				return false;

// 			}else{
// 				$('#gnb>.pcweb').hide();
// 				$('#gnb>.mobileGnb').show();
// 				$('.navOpen').click(function() {
// 					$(this).hide();
// 					$('.navClose').show();
// 					$(".gnbBg").removeClass('db');
// 					$('#gnb').removeClass('viewAll subClose');
// 					$('#gnb').addClass('subOpen');
// 					$('#gnb>ul.mobileGnb').css({'display':'block'})
// 					$('#gnb>ul.pcweb').css({'display':'none'})
// 				});
// 				$('.navClose').click(function() {
// 					$(this).hide();
// 					$('.navOpen').show();
// 					$('#gnb').addClass('subClose');
// 					$('#gnb').removeClass('subOpen');
// 					//setTimeout(function(){$('#gnb>ul.mobileGnb').css({'display':'none'})},500)

// 				});
// 				return false;
// 			}
// 		}).trigger('resize');

// });




		// gnb
	$(function() {

	        var menuover = false; //current menu
	        var subMnenuover = false;
	        var clearenter;
	        var gnb = jQuery('#gnb');
	        if (!gnb.length) gnb = jQuery('.gnb');
	        var gnb_link_depth1 = jQuery(gnb).find(">ul>li"); // 1depth
	        if (!gnb_link_depth1.length) gnb_link_depth1 = jQuery(gnb).find(">ul>li"); // 1depth
	        gnb_link_depth1=gnb_link_depth1.filter(':not(".NS")');
	        var gnb_link_depth2 = jQuery(gnb_link_depth1).find('>ul>li'); // 2depth
	        var d_time = 0;
	        var depth1_d_time = 500;
	        var current_menu;
	        for (var i = 0; i < gnb_link_depth1.length; i++) {
	            if (jQuery(gnb_link_depth1[i]).hasClass('on')) {
	                current_menu = i
	            }
	        }


	            gnb_link_depth1.each(function (index) {//1depth action
	                //if ($(this).has('ul').length==0) {$(this).addClass('noSub')};
	                //add mouseOver
	                // jQuery(this).bind('mouseover focusin', function () {
	                //     menuover = true;
	                //     $(this).addClass('hover');
	                // });


	                jQuery(this).bind('mouseenter keyup', function () {
	                    clearTimeout(clearenter);
	                    menuover = true;
	                    jQuery(this).addClass("hover").siblings().removeClass("hover");
	                    //var gnbH = $("#gnb>ul>li>ul").height();
	                    // if (767<$(window).width()) {
	                    // $('#gnb').addClass('subOpen');
	                    // $('#gnb').removeClass('subClose');
	                    // }
	                    //$(".bbsSch select").addClass('hidden');
	                    //$('.gnbBg').height(gnbH + 4);
	                });

	                jQuery("#gnb").bind('mouseleave', function () {
	                    menuover = false;
	                    clearTimeout(clearenter);
	                    clearenter = setTimeout(menuclear, depth1_d_time);
	                });

	            });
	            function menuclear() {//first seting
	                if (!menuover) {
		                $(gnb_link_depth1).removeClass('hover');
	                    if (767<$(window).width()) {
		                    $('#gnb').addClass('subClose');
		                    $('#gnb').removeClass('subOpen');
	                    }
	                    //$(".bbsSch select").removeClass('hidden');
	                    //$('.navClose').hide();
	                }

	            }
	            gnb_link_depth1.find('li:last-child').addClass('last')
	            gnb_link_depth2.each(function () {//2depth action
	                //add mouseOver
	                jQuery(this).bind('mouseover keyup', function () {
	                    clearTimeout(clearenter);
	                    menuover = true;
	                    //jQuery(this).addClass("on").siblings().removeClass("on");
	                });
	                //add mouseOut
	                jQuery(this).bind('mouseout blur', function () {
	                    clearenter = setTimeout(menuclear, d_time);
	                    //jQuery(this).removeClass("on");
	                    menuover = false;
	                });
	            });

	            jQuery("#gnb>ul>li:last-child>ul>li:last-child").bind('focusout', function () {
	                    menuover = false;
	                    clearTimeout(clearenter);
	                    clearenter = setTimeout(menuclear, depth1_d_time);
	                });

   	 });


$(function(){

    //tabnavi size
    var tabsize = $(".tabnavi li").size();
	//if ($(".tabnavi").hasClass("tab("+tabsize+")")== false )
	if (tabsize < 7 ){
		$(".tabnavi").addClass("tab"+tabsize+"");
	}

	//radio, checkbox
	//$('input[type="checkbox"], input[type="radio"]').focusin(function(event) {
	$('input[type="checkbox"]').focusin(function(event) {
		$(".radioboxW .radiobox label").removeClass('on');
		$(".radioboxW .radiobox label").removeClass('active');
		$(this).next().addClass('on');
	})
	//$('input[type="checkbox"], input[type="radio"]').focusout(function(event) {
	$('input[type="checkbox"]').focusout(function(event) {
		$(this).next().removeClass('on');
	})
	//$('input[type="checkbox"], input[type="radio"]').click(function(event) {
	$('input[type="checkbox"]').click(function(event) {
		if ($(this).prop('checked')) {
			$(this).next().addClass('active');
			$(this).parents('li:first').addClass('active');

		}else{
			$(this).next().removeClass('active');
			$(this).parents('li:first').removeClass('active');
		}
	});


	//faq
	var article = $('.faq>ul>.article');
	//article.addClass('hid');
	//article.find('.a').hid();
	article.eq(0).removeClass('hid');
	article.eq(0).addClass('show');
	article.eq(0).find('.a').show();
	$('.faq>ul>.article>.q>a').click(function(){
		var myArticle = $(this).parents('.article:first');
		if(myArticle.hasClass('hid')){
			article.addClass('hid').removeClass('show');
			//article.find('.a').slideUp(100);
			article.find('.a').hide();
			myArticle.removeClass('hid').addClass('show');
			myArticle.find('.a').show();
			//myArticle.find('.a').slideDown(100);
		} else {
			myArticle.removeClass('show').addClass('hid');
			myArticle.find('.a').hide();
		}
		return false;
	});

	function layoutResize(argument) {
		//회원가입 인증 높이
		// console.log('layoutResize?')
		var memHig = $(".memberBox2>.mem>dl").outerHeight() + $(".memberBox2>.mem>p").outerHeight() + 80;
		$(".memberBox2>div").css({'height':memHig+'px'});
		if (768 > $(window).width()) {
			$("#gnb").removeClass('subClose');
			//$("#gnb").addClass('subClose')
			var tabarr = ($("#contents").width() - $(".stepTab ul").width()) /2 -15;
			$(".stepTab").css({'margin-left':tabarr+'px'});
		}else{
			//console.log('else?')
			$("#gnb").addClass('subClose');
			// var tabarr = ($("#contents").width() - $(".stepTab ul").width()) /2;
			$(".stepTab").css({'margin-left':0+'px'});
			// $("#gnb").removeClass('subClose');
		}
		// if (640 < $(window).width()) {
		// 	var imgL = $(".disease_info .imgCon .img").width()+20;
		// 	$(".disease_info .imgConR").css({'margin-left':imgL+'px'});
		// }return false;
	}
	layoutResize()
	$(window).resize(function(event) {
		layoutResize()
	}).trigger('resize');


	//게시판 첨부파일
	$(".fileW>.file>a").bind('mouseenter focusin', function () {
		$(".fileW>.fileList").addClass('hover');
		return false;
	});
	$(".fileW").bind('mouseleave', function () {
		$(".fileW>.fileList").removeClass('hover');
		return false;
	});
	$(".fileW .fileList>a:last-child").bind('focusout', function () {
		$(".fileW>.fileList").removeClass('hover');
		return false;
	});

	$(".fileW1>.file1>a").bind('mouseenter focusin', function () {
		$(".fileW1>.fileList").addClass('hover');
		return false;
	});
	$(".fileW1").bind('mouseleave', function () {
		$(".fileW1>.fileList").removeClass('hover');
		return false;
	});
	$(".fileW1 .fileList>a:last-child").bind('focusout', function () {
		$(".fileW1>.fileList").removeClass('hover');
		return false;
	});

	//탭메뉴레이어
	// $("div.Tab:first").show();
	// $("div.Tab.hid:first").hide();
	// $(".tabnaviDept2").find("li a").bind("click", function(e) {
	// 	var tabId = $(this).parent().attr("id");
	// 	var tabIndex = tabId.substring(tabId.length - 2);
	// 	$(".tabnaviDept2").find("li").each(function() {
	// 		if (tabId == $(this).attr("id")) {
	// 			$(this).addClass("on");
	// 		} else {
	// 			$(this).removeClass("on");
	// 		}
	// 	});
	// 	$(".Tab").each(function() {
	// 		var TabId = $(this).attr("id");
	// 		var TabIndex = TabId.substring(TabId.length - 2);
	// 		if (tabIndex == TabIndex) {
	// 			$(this).show();
	// 		} else {
	// 			$(this).hide();
	// 		}
	// 	});

	// 	return false;
	// });

	//popup
     $(".imgDetail>a, .layerView").bind('click', function () {
         layerPopupOpen(this);
         return false;
    });
     $(".popupW").delegate("a.pClose","click", function () {
    	 layerPopupClose();
         return false;
    });

	$(window).resize(function(event) {

	      $(".layerView2").bind('click', function () {
	      	$(".layerW").hide();
	      	$('.layerW').css({"right": "auto"});
			$('.layerW').css({"left": "auto"});

	      	var r_posx = $(this).width()+$(this).offset().left - $(this).parent().find(".layerW").width() -10;
	      	var l_posx =$(".tbCalen").offset().left - $(this).parent().find(".layerW").width()
	      	var layerR_posx = $(this).parent().find(".layerW").width() + $(this).offset().left;
	      	var calR_posx = $(".tbCalen").width()+ $(".tbCalen").offset().left;
	      	var layerL_posx = $(this).parent().find(".layerW").offset().left;
	      	var calL_posx = $(".tbCalen").offset().left;

			if($(window).width() > 640){
				if(calR_posx < layerR_posx){
					$('.layerW').css({"right": + 0 +"px"});
				}else if(calL_posx < layerL_posx){
					$('.layerW').css({"left": + 0 +"px"});
				}else{
					$('.layerW').css({"left":0});
				}
			}else{
				$('.layerW').css({"right": + r_posx +"px"});

			}
	         $(this).parent().find(".layerW").show();
	         return false;
	    });
	}).trigger('resize');

	$(".layerClose .pClose").bind("click", function () {
	    	$(".layerW").hide();
	    	$('.layerW').css({"right": "auto"});
		$('.layerW').css({"left": "auto"});
	         return false;
	});

	//layer3
	 $(window).resize(function(event) {
		$(".layerView3").bind('click', function () {
		$(".layerW").hide();
		$(this).next().show();
			var pw = ($(".floorBox").width() - $(".layerW").width()) /2
			var ph = ($(".floorBox").height() - $(".layerW").height()) /2
			$('.layerW').css({left: pw, top:ph});
		$(this).focus();
		return false;
		});
	}).trigger('resize');

	$(".layerClose1 .pClose").bind("click", function () {
		//alert(11);
		$(".layerW").hide();
		$(this).parent().parent().parent().prev().focus();

		return false;
	 });

	$(window).resize(function(event) {
			
		var layerC;
		$("#Map1>area").each(function(){
			$(this).bind('click' , function(event)	{
				$(".layerW").hide();
				layerC = $(this)
				var cur = $("#Map1>area").index($(this)) + 1;
				$(".layer-txt>div:nth-child("+cur+")").show();
				$(".layer-txt>div:nth-child("+cur+") a").focus();
				event.preventDefault();
			})
		});
		
		$("#Map>area").each(function(){
			$(this).bind('click' , function(event)	{
				$(".layerW").hide();
				layerC = $(this)
				var cur = $("#Map>area").index($(this)) + 1;
				$(".layer-txt>div:nth-child("+cur+")").show();
				$(".layer-txt>div:nth-child("+cur+") a").focus();
				event.preventDefault();
			})
		});

		$(".layerClose2 .pClose").bind("click", function (event) {	
			$(".layerW").hide();
			layerC.focus()
			//$(".layer-txt>div:nth-child("+cur+") ").focus();
				event.preventDefault();
		 });

		if($(window).width() > 640){
			var pw = ($(".imgP").width() - $(".layerW").width()) /2;
			var ph = ($(".imgP").height() - $(".layerW").height()) /2;
			$('.layerW').css({left: pw, top:ph});
		}else{
			var pw = ($(window).width() - $(".layerW").width()) /2;
			//var ph = ($(".mobile2 .imgP img").height() - $(".layerW").height()) /2;
			$('.layerW').css({left: pw, top:45});
		}	
	}).trigger('resize');

	//layer4
	//  $(window).resize(function(event) {
	// 	$(".layerView4").bind('click', function () {
	// 		$(".layerW").hide();
	// 		$(this).next().show();
	// 		$(this).next().focus();
	// 		$(".layerView4").removeAttr("tabindex");
	// 		$(this).next().find(".layerClose2>a").focus();
	// 		//$(this).next().attr("tabindex","0").focus();
	// 		if($(window).width() > 640){
	// 			var pw = ($(".imgP").width() - $(".layerW").width()) /2;
	// 			var ph = ($(".imgP").height() - $(".layerW").height()) /2;
	// 			$('.layerW').css({left: pw, top:ph});
	// 		}else{
	// 			var pw = ($(window).width() - $(".layerW").width()) /2;
	// 			//var ph = ($(".mobile2 .imgP img").height() - $(".layerW").height()) /2;
	// 			$('.layerW').css({left: pw, top:45});
	// 		}	
	// 	return false;
	// 	});
	// }).trigger('resize');

	// $(".layerClose2 .pClose").bind("click", function () {	
	// 	$(".layerW").hide();
	// 	//$(this).parent().parent().parent().prev().attr("tabindex","0").focus();
	// 	$(this).parent().parent().parent().prev().attr("tabindex","0").focus();
	// 	return false;
	//  });

});





 var $returnObj = null;
   function layerPopupOpen(obj) {

	  // console.log("tt");
   	 $returnObj = $(obj);
	var popupSeClss = $(obj).attr("data-class");

    $("#bgW").css("display","block");
    var $popupW = $(".popupW");

    if(typeof popupSeClss != "undefined") {
    		$popupW = $popupW.filter("."+popupSeClss);
	}
    $popupW.css({"display":"block","width":"100%"});
	$('.popupWrap img:first').on("load", function() {
		$(window).trigger('resize')
		//console.log('로드완료q12')
	}).each(function() {
		if(this.complete) $(this).load();
	});

    popupStart(popupSeClss);
    if (popupSeClss == "authr") {
	    	$popup = $(".popup").filter("."+popupSeClss);
	    	$popup.css("height","100%");
    }
    $popupW.find(".popup").attr("tabindex","0").focus();
}


function layerPopupClose() {
	$("#bgW").css("display","none");
    var popupSeClss = $returnObj.attr("data-class");
    var $popupW = $(".popupW");
    // if(typeof popupSeClss != "undefined") {
   	//  $popupW = $popupW.filter("."+popupSeClss);
    // }
    $(".popupW").css("display","none");
    $("body").css("overflow","visible");
    $(".popupW").removeClass("mobile");
    $(".popup").css({"height":"auto"});
    $returnObj.focus();
}

function popupStart(popupSeClss){
    function throttle(method, scope) {
        //console.log(method,scope)
          clearTimeout(method.tId);
          method.call(scope);
          // method.tId= setTimeout(function(){
          //     method.call(scope);
          // }, 100); //
    }

    //
    function resizePopDiv(event){
		var $popupW = $(".popupW");
		var $popPhoto = $(".popPhoto");
		var $popup = $(".popup");
		var $popupH = $(".popupH");

		var tx = ($(window).width() - $popup.width()) / 2;
		//console.log($popupW.find('img:first').height())
		var ty = (($(window).height()) - $popupW.height()) / 2;
		// var ty = (($(window).height()) - $popupW.find('img:first').height()) / 2;
		var popW = $popup.width();
		//var popH = $popup.height();

		var popH = $(".popup h1").height() +$(".popup .popArea").height() +$(".popClose").height();
		var popH2 = $popupH.height();
		// var popH = $(".popup>.popup_photo").outerHeight();

		//console.log("pop" + popH)
		var winW = $(window).width();
		var winH = $(window).height();
		var bodyoh = $("body").css("overflow", "hidden");



		if ((767 >=winW)) {
			$popup.css({
				height : popH + "px"
			});
			$popupW.css({
				left : 0 + "px",
				top : 0 + "px"
			});
			$popupH.css({
				//height :  (popH ) + "px",
				"height" :"auto",
				"overflow" : "auto"
			});
			$popupW.addClass("mobile");
		} else {
			//console.log('실행1')
			$popupW.css({
				left : tx + "px",
				top : ty + "px"
			});
			$popup.css({
				height : popH + "px"
			});
			$popupH.css({
				//height :  (popH2 ) + "px",
				"height" :"auto",
				"overflow" : "auto"
			});
			$popupW.removeClass("mobile");
		 };

		 if  (((popH+40) >=winH) &&(winW >=767) ) {
			$popupW.css({
				left : tx + "px",
				top : 0 + "px"
			});
			$popupH.css({
				height :  (winH -50) + "px",
				"overflow" : "auto"
			});
		}else if ((popH >=winH)) {
			$popupW.css({
					left : 0 + "px",
					top : 0 + "px"
				});
			$popupH.css({
				height :  (winH -50) + "px",
				"overflow" : "auto"
			});
		}else{
			$popupH.css({
				//height :  (popH ) + "px",
				"overflow" : ""
			});
		}
        return false;

    }//resizePopDiv

    throttle(resizePopDiv);

    window.onresize = function(){
    	 if ($(".popupW").css("display") != "none") {
    		 throttle(resizePopDiv);
    	 }
    }
}




//layer2
 $(window).resize(function(event) {
	 $(".layerPhoto").bind('click', function () {
	 	 $("#bgW").css("display","block");

        	var $popupW = $(".popPhoto");
		var $popup = $(".popup");
		var $popupH = $(".popupH");

		var tx = ($(window).width() - $popup.width()) / 2;
		//console.log($popupW.find('img:first').height())
		var ty = (($(window).height()) - $popupW.height()) / 2;
		// var ty = (($(window).height()) - $popupW.find('img:first').height()) / 2;
		var popW = $popup.width();
		//var popH = $popup.height();

		var popH = $(".popup h1").height() +$(".popup .popArea").height() +$(".popClose").height();
		var popH2 = $popupH.height();
		// var popH = $(".popup>.popup_photo").outerHeight();

		//console.log("pop" + popH)
		var winW = $(window).width();
		var winH = $(window).height();
		var bodyoh = $("body").css("overflow", "hidden");



		
			$popupW.css({
				left : tx + "px",
				top : 0 + "px"
			});
			$popupH.css({
				height :  (winH -50) + "px",
				"overflow" : "auto"
			});

    });
}).trigger('resize');

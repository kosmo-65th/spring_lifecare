<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
	<meta charset="utf-8">
	<title>Doctor Template</title>
	
	<!-- jQuery 추가 -->
	<script src="${path_resources}js/jquery-3.5.1.min.js"></script>
	
	
	<!-- 프로필 css -->
	<style type="text/css">
	.card{
	    -moz-border-radius: 2%;
	    -webkit-border-radius: 2%;
	    border-radius: 2%;
	    box-shadow: 5px 5px 0 rgba(0,0,0,0.08);
	}
	
	.profile .profile-body {
	    padding: 20px;
	    background: #f7f7f7;
	    width: 1440px;
	}
	
	.profile .profile-bio {
	    background: #fff;
	    position: relative;
	    padding: 15px 10px 5px 15px;
	}
	
	.profile .profile-bio a {
	    left: 50%;
	    bottom: 20px;
	    margin: -62px;
	    text-align: center;
	    position: absolute;
	}
	
	.profile .profile-bio h2 {
	    margin-top: 0;
	    font-weight: 200;
	}
	
	.css3-tab {
	  list-style: none;
	  position: relative;
	  width: 100%;
	}
	.css3-tab input[type='radio'] {
	  display: none;
	}
	.css3-tab .css3-tab-nav {
	  display: table;
	  table-layout: fixed;
	  width: 100%;
	}
	.css3-tab .css3-tab-nav label {
	  display: table-cell;
	  background-color: #666666;
	  color: #FFFFFF;
	  padding: 15px;
	  text-align: center;
	  transition: all .3s ease 0s;
	}
	.css3-tab .css3-tab-nav label:hover {
	  cursor: pointer;
	  background: white;
	  color: #666666;
	  transition: all .3s ease 0s;
	}
	@media (max-width: 692px) {
	  .css3-tab .css3-tab-nav {
	    display: block;
	    margin: 0 0 20px;
	  }
	  .css3-tab .css3-tab-nav label {
	    display: block;
	    box-sizing: border-box;
	    width: 100%;
	    padding: 20px;
	  }
	}
	.css3-tab .css3-tab-content {
	  overflow: hidden;
	  padding: 25px;
	  display: none;
	  background: #FFF;
	  clear: left;
	  box-sizing: border-box;
	}
	.css3-tab input[id='tabOne']:checked ~ .css3-tab-nav label[for='tabOne'] {
	  background: #35cebe;
	  color: white;
	  cursor: default;
	}
	.css3-tab input[id='tabOne']:checked ~ div.tab-one {
	  display: block;
	  border-top: solid 3px #35cebe;
	}
	.css3-tab input[id='tabTwo']:checked ~ .css3-tab-nav label[for='tabTwo'] {
	  background: #35cebe;
	  color: white;
	  cursor: default;
	}
	.css3-tab input[id='tabTwo']:checked ~ div.tab-two {
	  display: block;
	  border-top: solid 3px #35cebe;
	}
	.css3-tab input[id='addNew']:checked ~ .css3-tab-nav label[for='addNew'] {
	  background: #35cebe;
	  color: white;
	  cursor: default;
	}
	.css3-tab input[id='addNew']:checked ~ div.add-new {
	  display: block;
	  border-top: solid 3px #35cebe;
	}
	
	/*  bmi  */
	.skyblue{
		color:#1E96FF;	
		font-size:24px;
	}
	.green{
		color:#64CD3C;	
		font-size:24px;
	}
	.yellow{
		color:#FFB400;	
		font-size:22px;
	}
	.orange{
		color:#FF8200;
		font-size:23px;	
	}
	.red{
		color:#EB0000;	
		font-size:24px;
	}
	
	.greens{
		color:#64CD3C;	
	}
	
	.oranges{
		color:#FF8200;
	    font-style: italic
	}
	.reds{
		color:#EB0000;	
		font-weight:bold;
		font-style: italic
	}
	
	#label {
		text-align: center !important;
	}
	

	</style>
	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700" rel="stylesheet">
	
	<!-- Template Styles -->
	<link rel="stylesheet" href="${path_resources}css/doctorfont-awesome.min.css">
	
	<!-- CSS Reset -->
	<link rel="stylesheet" href="${path_resources}css/doctornormalize.css">
	
	<!-- Milligram CSS minified -->
	<link rel="stylesheet" href="${path_resources}css/doctormilligram.min.css">
	
	<!-- loading -->
	<link rel="stylesheet" href="${path_resources}css/loading.css">
	
	<!-- Main Styles -->
	<link rel="stylesheet" href="${path_resources}css/doctorStyles.css">
	
	<link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.min.css" rel="stylesheet">
	
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
</head>
<script type="text/javascript">

function logout() {
	var chk = confirm("로그아웃 하시겠습니까?");
	
	if(chk){
		document.getElementById('logout-form').submit();
	} else {
			alert("로그아웃 취소 되었습니다.")
			return false;
	}
}

//환자조회진료 클릭시 발생 이벤트
function resReset(){
	$('#keyword').focus();
}


	


//딥러닝 - 코로나
$(function() {
    //이미지 클릭시 업로드창 실행
    $('#CoronaStart').click(function() {
        console.log('코로나 딥러닝 시작');
        
        var CoronaForm = new FormData(document.getElementById('CoronaForm'));
    	
    	$.ajax({
            type: "post",
            enctype: 'multipart/form-data',
            url: "${path}/doctor/DeepLearningCorona?${_csrf.parameterName}=${_csrf.token}",
            data: CoronaForm,
            // processData: true=> get방식, false => post방식
            // contentType: true => application/x-www-form-urlencoded, 
            //                false => multipart/form-data
            processData: false,
            contentType: false,
            beforeSend: function() {
                //통신을 시작할때 처리되는 함수 
                $('html').css("cursor","wait");   // 현재 html 문서위에 있는 마우스 커서를 로딩 중 커서로 변경
                $('.wrap-loading').removeClass('display-none');
                
       		},
       		complete: function() {
                //통신이 완료된 후 처리되는 함수
                $('html').css("cursor","auto"); // 통신이 완료 된 후 다시 일반적인 커서 모양으로 변경
                $('.wrap-loading').addClass('display-none');
            },
            success: function(data){
            	console.log("data : " + JSON.stringify(data));
            	
            	var data_JSON_String = JSON.stringify(data);
            	var data_parse = JSON.parse(data_JSON_String);
            	
            	
                $("#normal").text(data_parse.normal+"%");
                $("#corona").text(data_parse.corona+"%");
                $("#pneumonia").text(data_parse.pneumonia+"%");
                
                document.asdf.normal_percentage.value = data_parse.normal+"%";
                document.asdf.corona_percentage.value = data_parse.corona+"%";
                document.asdf.pneumonia_percentage.value = data_parse.pneumonia+"%";
                alert("딥러닝 완료");
            }
       		
        });
    });
    //업로드 파일체인지가 됬을경우 실행되는 이벤트  form태그에 fileProfile은 hidden으로 넣어줌
});


//딥러닝 - 유방암
$(function() {
    //이미지 클릭시 업로드창 실행
    $('#CancerStart').click(function() {
        console.log('암검사 딥러닝 시작');        
        
       // var CancerForm = new FormData(document.getElementById('CancerForm'));
    	var CanerForm = $("#CancerForm").serialize();
       /*  var radius = document.qwer.radius.value;
        var texture = document.qwer.texture.value;
        var perimeter = document.qwer.perimeter.value;
        var area = document.qwer.area.value;        
        var smoothness = document.qwer.smoothness.value;
        var compactness = document.qwer.compactness.value;        
        var concavity = document.qwer.concavity.value;
        var symmetry = document.qwer.symmetry.value;
        var fractal_dimension = document.qwer.fractal_dimension.value;
        var age = document.qwer.age.value;
        	 */
    	$.ajax({
            type: "post",
            url: "${path}/doctor/DeepLearningCancer?${_csrf.parameterName}=${_csrf.token}",
            data: CanerForm,
            beforeSend: function() {
                //통신을 시작할때 처리되는 함수 
                $('html').css("cursor","wait");   // 현재 html 문서위에 있는 마우스 커서를 로딩 중 커서로 변경
                $('.wrap-loading').removeClass('display-none');
                
       		},
       		complete: function() {
                //통신이 완료된 후 처리되는 함수
                $('html').css("cursor","auto"); // 통신이 완료 된 후 다시 일반적인 커서 모양으로 변경
                $('.wrap-loading').addClass('display-none');
            },
            success: function(data){
            	console.log("data : " + JSON.stringify(data));
            	
            	var data_JSON_String = JSON.stringify(data);
            	var data_parse = JSON.parse(data_JSON_String);
            	           	
                $("#resultCancer").text(data_parse.result);
                $("#resultPercent").text(data_parse.percent);
                document.qwer.percentage.value = data_parse.result + " " + data_parse.percent;
                alert("딥러닝 완료");
            }
        });
    });
    //업로드 파일체인지가 됬을경우 실행되는 이벤트  form태그에 fileProfile은 hidden으로 넣어줌
});

// 환자조회 keyup
$(function() {
	$('#keyword').keyup(function() {
		var keyword = $('#keyword').val();  // input 태그에서 입력한 키워드
		
		if(keyword.length == 0) {        // 검색글자수가 0인 경우
			$('#searchDisplay').css("display", "none");       // 숨김
		} else {
			$('#searchDisplay').css("visibility", "visible");      // 표시
			$('#searchDisplay').css("display", "flex");
			$('#searchDisplay').css("align-items", "center");
			$('#searchDisplay').css("min-width", "0");
			$('#searchDisplay').css("max-height", "none");
			$('#searchDisplay').css("background", "#f9f9f9");
			$('#searchDisplay').css("border-radius", "499rem");			
		}
		
		// keyword -> search_next.ja(search_next.jsp) -> result -> 콜백함수 -> display에 출력
		$.ajax({
			url : '${pageContext.request.contextPath}/search_next?${_csrf.parameterName}=${_csrf.token}',
			type : 'POST',
			data : 'keyword=' + keyword,
			success : function(result) { // 콜백함수 호출
				$('#searchDisplay').html(result);   // 결과  출력
			},
			error : function() {
				alert("오류");
			}
		});
	});
	
	// 질병조회 keyup
	$('#disease_code').keyup(function() {
		var disease = $('#disease_code').val();  // input 태그에서 입력한 키워드
		
		if(disease.length == 0) {        // 검색글자수가 0인 경우
			$('#diseaseList').css("display", "none");       // 숨김
		} else {
			$('#diseaseList').css("visibility", "visible");      // 표시
			$('#diseaseList').css("display", "flex");
			$('#diseaseList').css("align-items", "center");
			$('#diseaseList').css("min-width", "0");
			$('#diseaseList').css("max-height", "none");
			$('#diseaseList').css("background", "#f9f9f9");
			$('#diseaseList').css("border-radius", "499rem");	
		}
		
		$.ajax({
			url : '${pageContext.request.contextPath}/diseaseList?${_csrf.parameterName}=${_csrf.token}',
			type : 'POST',
			data : 'disease_code=' + disease,
			success : function(result) { // 콜백함수 호출
				$('#diseaseList').html(result);   // 결과  출력
			},
			error : function() {
				alert("오류");
			}
		});
	});
	
	// 약 조회 1번 keyup
	$('#drug1').keyup(function() {
		var drug = $('#drug1').val();  // input 태그에서 입력한 키워드
		
		if(drug.length == 0) {        // 검색글자수가 0인 경우
			$('#drugList1').css("display", "none");       // 숨김
		} else {
			$('#drugList1').css("visibility", "visible");      // 표시
			$('#drugList1').css("display", "flex");
			$('#drugList1').css("align-items", "center");
			$('#drugList1').css("min-width", "0");
			$('#drugList1').css("max-height", "none");
			$('#drugList1').css("background", "#f9f9f9");
			$('#drugList1').css("border-radius", "499rem");	
		}
		
		$.ajax({
			url : '${pageContext.request.contextPath}/drugList1?${_csrf.parameterName}=${_csrf.token}',
			type : 'POST',
			data : 'drug=' + drug,
			success : function(result) { // 콜백함수 호출
				$('#drugList1').html(result);   // 결과  출력
			},
			error : function() {
				alert("오류");
			}
		});
	});
	
	// 약 조회 2번 keyup
	$('#drug2').keyup(function() {
		var drug = $('#drug2').val();  // input 태그에서 입력한 키워드
		
		if(drug.length == 0) {        // 검색글자수가 0인 경우
			$('#drugList2').css("display", "none");       // 숨김
		} else {
			$('#drugList2').css("visibility", "visible");      // 표시
			$('#drugList2').css("display", "flex");
			$('#drugList2').css("align-items", "center");
			$('#drugList2').css("min-width", "0");
			$('#drugList2').css("max-height", "none");
			$('#drugList2').css("background", "#f9f9f9");
			$('#drugList2').css("border-radius", "499rem");	
		}
		
		$.ajax({
			url : '${pageContext.request.contextPath}/drugList2?${_csrf.parameterName}=${_csrf.token}',
			type : 'POST',
			data : 'drug=' + drug,
			success : function(result) { // 콜백함수 호출
				$('#drugList2').html(result);   // 결과  출력
			},
			error : function() {
				alert("오류");
			}
		});
	});
	
	// 약 조회 3번 keyup
	$('#drug3').keyup(function() {
		var drug = $('#drug3').val();  // input 태그에서 입력한 키워드
		
		if(drug.length == 0) {        // 검색글자수가 0인 경우
			$('#drugList3').css("display", "none");       // 숨김
		} else {
			$('#drugList3').css("visibility", "visible");      // 표시
			$('#drugList3').css("display", "flex");
			$('#drugList3').css("align-items", "center");
			$('#drugList3').css("min-width", "0");
			$('#drugList3').css("max-height", "none");
			$('#drugList3').css("background", "#f9f9f9");
			$('#drugList3').css("border-radius", "499rem");	
		}
		
		$.ajax({
			url : '${pageContext.request.contextPath}/drugList3?${_csrf.parameterName}=${_csrf.token}',
			type : 'POST',
			data : 'drug=' + drug,
			success : function(result) { // 콜백함수 호출
				$('#drugList3').html(result);   // 결과  출력
			},
			error : function() {
				alert("오류");
			}
		});
	});
	
	// 약 조회 4번 keyup
	$('#drug4').keyup(function() {
		var drug = $('#drug4').val();  // input 태그에서 입력한 키워드
		
		if(drug.length == 0) {        // 검색글자수가 0인 경우
			$('#drugList4').css("display", "none");       // 숨김
		} else {
			$('#drugList4').css("visibility", "visible");      // 표시
			$('#drugList4').css("display", "flex");
			$('#drugList4').css("align-items", "center");
			$('#drugList4').css("min-width", "0");
			$('#drugList4').css("max-height", "none");
			$('#drugList4').css("background", "#f9f9f9");
			$('#drugList4').css("border-radius", "499rem");	
		}
		
		$.ajax({
			url : '${pageContext.request.contextPath}/drugList4?${_csrf.parameterName}=${_csrf.token}',
			type : 'POST',
			data : 'drug=' + drug,
			success : function(result) { // 콜백함수 호출
				$('#drugList4').html(result);   // 결과  출력
			},
			error : function() {
				alert("오류");
			}
		});
	});
	
	// 약 조회 5번 keyup
	$('#drug5').keyup(function() {
		var drug = $('#drug5').val();  // input 태그에서 입력한 키워드
		
		if(drug.length == 0) {        // 검색글자수가 0인 경우
			$('#drugList5').css("display", "none");       // 숨김
		} else {
			$('#drugList5').css("visibility", "visible");      // 표시
			$('#drugList5').css("display", "flex");
			$('#drugList5').css("align-items", "center");
			$('#drugList5').css("min-width", "0");
			$('#drugList5').css("max-height", "none");
			$('#drugList5').css("background", "#f9f9f9");
			$('#drugList5').css("border-radius", "499rem");	
		}
		
		$.ajax({
			url : '${pageContext.request.contextPath}/drugList5?${_csrf.parameterName}=${_csrf.token}',
			type : 'POST',
			data : 'drug=' + drug,
			success : function(result) { // 콜백함수 호출
				$('#drugList5').html(result);   // 결과  출력
			},
			error : function() {
				alert("오류");
			}
		});
	});
});

function click(disease_code){
	document.medicalForm.disease_code.value = disease_code;
	$('#diseaseList').css("display", "none");
}

function drug1(drug_number){
	document.medicalForm.drug1.value = drug_number;
	$('#drugList1').css("display", "none");
}

function drug2(drug_number){
	document.medicalForm.drug2.value = drug_number;
	$('#drugList2').css("display", "none");
}

function drug3(drug_number){
	document.medicalForm.drug3.value = drug_number;
	$('#drugList3').css("display", "none");
}

function drug4(drug_number){
	document.medicalForm.drug4.value = drug_number;
	$('#drugList4').css("display", "none");
}

function drug5(drug_number){
	document.medicalForm.drug5.value = drug_number;
	$('#drugList5').css("display", "none");
}

window.onload = function(){
	//파일을 선택할 때
	document.getElementById('file').onchange = function(){
		readImage();
	};
};

function readImage() {
	var file = document.getElementById('file');
	if(file.files && file.files[0]) {
		var reader = new FileReader();
		
		//이미지 읽기
		reader.readAsDataURL(file.files[0]);
		
		//이미지 전부 읽어들였으면 호출
		reader.onload = function(){
			var image = document.getElementById('img');
			image.src = reader.result;
			//img 태그 노출
			image.style.display = '';
		};
	}
};
</script>

<script> 
//bmi
$(function() {
		$('#bmi_result_div').hide();
			
		$('#weight').on('focusout', function() {
			if($("#height").val() != "" && $("#weight").val() != ""){
				$('#bmi_result_div').show();
			}
			
			if($("#height").val() == "" && $("#weight").val() == "") {
				$('#bmi_result_div').hide();
			}	
		});
		
		$('#height').on('focusout', function() {
			if($("#height").val() != "" && $("#weight").val() != ""){
				$('#bmi_result_div').show();
			}
			
			if($("#height").val() == "" && $("#weight").val() == "") {
				$('#bmi_result_div').hide();
			}	
		});
		
		let bmi_range = [
			 { id : 'low_weight',
					 min_val : 0 ,
					 max_val : 18.5 , 
					 msg : '<font class="skyblue">저체중</font>' } ,
			 { id : 'standard_weight', 
					 min_val : 18.5, 
					 max_val : 23, 
					 msg : '<font class="green">정상</font>' },
			 { id : 'over_weight', 
				 	min_val : 23, 
				 	max_val : 25, 
				 	msg : '<font class="yellow">과체중</font>' },
		 	 { id : 'Mild_obesity', 
			 		min_val : 25,
			 		max_val : 30, 
			 		msg : '<font class="orange">비만</font>' },
	 		{ id : 'Moderate_obesity', 
		 			min_val : 30,
		 			max_val : 99999, 
		 			msg : '<font class="red">고도비만</font>' }
			 		
			 		] 
		
		$("#height").on('change keyup paste',function(){
			
			setBmiResult(); 
			}); 
		$("#weight").on('change keyup paste',function(){ 
			setBmiResult(); 
			}); 
		
		setBmiResult = () => { 
			
			let height = $("#height").val(); 
			let weight = $("#weight").val(); 
		
		
		height = height / 100; 
		let bmi_result = (weight / ( height * height ));
		
		let bmi_msg; 
		
		for( let bm of bmi_range ){ 
			if( bmi_result >= bm.min_val && bmi_result < bm.max_val ){
				bmi_msg = bm.msg; 
				}
			} 
		
		$(".bmi_result").html(parseFloat(bmi_result).toFixed(2) + "  " + bmi_msg + " 입니다."); 
		
		return; 
		
		} 
	}
);
//blood
	$(function() {
			$('#blood_result_div').hide();
				
			$('#blood1').on('focusout', function() {
				if($("#blood1").val() != "" && $("#blood2").val() != ""){
					$('#blood_result_div').show();
				}
				
				if($("#blood1").val() == "" && $("#blood2").val() == "") {
					$('#blood_result_div').hide();
				}	
			});
			
			$('#blood2').on('focusout', function() {
				if($("#blood2").val() != "" && $("#blood1").val() != ""){
					$('#blood_result_div').show();
				}
				
				if($("#blood2").val() == "" && $("#blood1").val() == "") {
					$('#blood_result_div').hide();
				}	
			});
			
			
			let blood_range  = [
				
				 { id : 'low',
						 min_val : 0 ,
						 max_val : 89 , 
						 msg : '<font class="skyblue">저혈압 </font>' } ,
				 { id : 'standard', 
						 min_val : 90, 
						 max_val : 120, 
						 msg : '<font class="green">정상</font>' },
		 		{ id : 'Moderate', 
			 			min_val : 121,
			 			max_val : 99999, 
			 			msg : '<font class="red">고혈압</font>' }
				 		
				 		] 

			$("#blood2").on('change keyup paste',function(){
				setbloodResult(); 
				}); 
		
			setbloodResult = () => { 
				
				let blood1 = $("#blood1").val(); 
		
			let blood_msg; 
			
			for( let b of blood_range ){ 
				if( blood1 >= b.min_val && blood1 <= b.max_val ){
					blood_msg = b.msg; 
					}
				} 
			
			$(".blood_result").html("이완기 혈압 " + parseFloat(blood1).toFixed(2)+ " mmHg /dL " + " "+ blood_msg + "입니다."); 
			
			return; 
			
			} 
		}
	);
		
//bloodSugar
$(function() {
	
	$('#bloodSugar_result_div').hide();
		
	$('#bloodSugar').on('focusout', function() {
		if($("#bloodSugar").val() != "" ){
			$('#bloodSugar_result_div').show();
		}
		
		if($("#bloodSugar").val() == "") {
			$('#bloodSugar_result_div').hide();
		}	
	});
	
		let bloodSugar_range = [
			
			 { id : 'low',
					 min_val : 0 ,
					 max_val : 80 , 
					 msg : '<font class="skyblue">다소 낮음 </font>' } ,
			 { id : 'standard', 
					 min_val : 80, 
					 max_val : 100, 
					 msg : '<font class="green">정상</font>' },
		 	 { id : 'Mild', 
			 		min_val : 100,
			 		max_val : 126, 
			 		msg : '<font class="orange">다소 높음</font>' },
	 		{ id : 'Moderate_obesity', 
		 			min_val : 126,
		 			max_val : 99999, 
		 			msg : '<font class="red">당뇨병</font> 의심' }
			 		
			 		] 
		
		$("#bloodSugar").on('change keyup paste',function(){
			setbloodSugarResult(); 
			}); 
	
		setbloodSugarResult = () => { 
			
			let bloodSugar = $("#bloodSugar").val(); 
	
		let bloodSugar_msg; 
		
		for( let bs of bloodSugar_range ){ 
			if( bloodSugar >= bs.min_val && bloodSugar < bs.max_val ){
				bloodSugar_msg = bs.msg; 
				}
			} 
		
		$(".bloodSugar_result").html(parseFloat(bloodSugar).toFixed(2)+ " mg/dL " + " "+ bloodSugar_msg + "입니다."); 
		
		return; 
		
		} 
	}
);
//이상지질혈증
//tc
$(function(){
	$('#tc').on('input',function(){
		var value = $('#tc').val(); 
		
		if (value <= 200){
	        $("#tc").addClass('greens');
	        $("#tc").removeClass('reds');
			 $("#tc").removeClass('oranges');
	    }
	    if(value > 200 && value <= 240){
	        $("#tc").addClass('oranges');
	        $("#tc").removeClass('reds');
	        $("#tc").removeClass('greens');
	    }
	    if(value >240){
	        $("#tc").addClass('reds');
	        $("#tc").removeClass('oranges');
			$("#tc").removeClass('greens');
 		 }
		if(value == ""){
			$("#tc").removeClass('reds');
			$("#tc").removeClass('oranges');
			$("#tc").removeClass('greens');
		}
	})
});  
//tg
$(function(){
	$('#tg').on('input',function(){
	var value = $('#tg').val();  
		if (value <= 200){
	        $("#tg").addClass('greens');
			 $("#tg").removeClass('reds');
		}
	    else{
	        $("#tg").addClass('reds');
			 $("#tg").removeClass('greens');
	    }
		if(value == ""){
			 $("#tg").removeClass('reds');
			 $("#tg").removeClass('greens');
		}
	})
});  
//ldl
$(function(){
	$('#ldl').on('input',function(){
	var value = $('#ldl').val();  
	if (value <= 130){
      $("#ldl").addClass('greens');
      $("#ldl").removeClass('reds');
		$("#ldl").removeClass('oranges');
  }
  if(value > 130 && value <= 160){
      $("#ldl").addClass('oranges');
      $("#ldl").removeClass('reds');
      $("#ldl").removeClass('greens');
  }
  if(value >160){
      $("#ldl").addClass('reds');
      $("#ldl").removeClass('oranges');
		$("#ldl").removeClass('greens');
	 }
	if(value == ""){
		 $("#ldl").removeClass('reds');
		 $("#ldl").removeClass('oranges');
		 $("#ldl").removeClass('greens');
	}
	})
});  

//tg
$(function(){
	$('#hdl').on('input',function(){
	var value = $('#hdl').val();  
	    if(value >= 60){
	    	$("#hdl").addClass('greens');
			 $("#hdl").removeClass('reds');
	    }
	    else{
	    	$("#hdl").addClass('reds');
			 $("#hdl").removeClass('greens');
	    }
		if(value == ""){
			 $("#hdl").removeClass('reds');
			 $("#hdl").removeClass('greens');
		}
	})
});  
//백혈구
$(function(){
	$('#white').on('input',function(){
	var value = $('#white').val();  
	    if(value >= 4000 && value <=10000){
	    	$("#white").addClass('greens');
			 $("#white").removeClass('reds');
	    }else{
	    	$("#white").addClass('reds');
			 $("#white").removeClass('greens');
	    }
		if(value == ""){
			 $("#white").removeClass('reds');
			 $("#white").removeClass('greens');
		}
	})
});  
//혈소판
$(function(){
	$('#platelet').on('input',function(){
	var value = $('#platelet').val();  
	    if(value >= 12 && value <=16.5){
	    	$("#platelet").addClass('greens');
			 $("#platelet").removeClass('reds');
	    }else{
	    	$("#platelet").addClass('reds');
			 $("#platelet").removeClass('greens');
	    }
		if(value == ""){
			 $("#platelet").removeClass('reds');
			 $("#platelet").removeClass('greens');
		}
	})
});  
//AST
$(function(){
	$('#ast').on('input',function(){
	var value = $('#ast').val();  
	    if(value >= 13 && value <= 40){
	    	$("#ast").addClass('greens');
			 $("#ast").removeClass('reds');
	    }else{
	    	$("#ast").addClass('reds');
			 $("#ast").removeClass('greens');
	    }
		if(value == ""){
			 $("#ast").removeClass('reds');
			 $("#ast").removeClass('greens');
		}
	})
});  
//ALT
$(function(){
	$('#alt').on('input',function(){
	var value = $('#alt').val();  
	    if(value >= 7 && value <= 40){
	    	$("#alt").addClass('greens');
			 $("#alt").removeClass('reds');
	    }else{
	    	$("#alt").addClass('reds');
			 $("#alt").removeClass('greens');
	    }
		if(value == ""){
			 $("#alt").removeClass('reds');
			 $("#alt").removeClass('greens');
		}
	})
});  
//gtp
$(function(){
	$('#gtp').on('input',function(){
	var value = $('#gtp').val();  
	    if(value >= 8 && value <= 63){
	    	$("#gtp").addClass('greens');
			 $("#gtp").removeClass('reds');
	    }else{
	    	$("#gtp").addClass('reds');
			 $("#gtp").removeClass('greens');
	    }
		if(value == ""){
			 $("#gtp").removeClass('reds');
			 $("#gtp").removeClass('greens');
		}
	})
});  
//요단백
$(function(){
	$('#kidney1').on('input',function(){
	var value = $('#kidney1').val();  
	    if(value == "음성"){
	    	$("#kidney1").addClass('greens');
			 $("#kidney1").removeClass('reds');
	    }
	    if(value == "양성"){
	    	$("#kidney1").addClass('reds');
			 $("#kidney1").removeClass('greens');
	    }
		if(value == ""){
			 $("#kidney1").removeClass('reds');
			 $("#kidney1").removeClass('greens');
		}
	})
});  
//요소질소
$(function(){
	$('#kidney2').on('input',function(){
	var value = $('#kidney2').val();  
	    if(value >=6 && value <=20){
	    	$("#kidney2").addClass('greens');
			 $("#kidney2").removeClass('reds');
	    }else{
	    	$("#kidney2").addClass('reds');
			 $("#kidney2").removeClass('greens');
	    }
		if(value == ""){
			 $("#kidney2").removeClass('reds');
			 $("#kidney2").removeClass('greens');
		}
	})
});  
//혈창크레아티닌
$(function(){
	$('#kidney3').on('input',function(){
	var value = $('#kidney3').val();  
	    if(value <=1.5){
	    	$("#kidney3").addClass('greens');
			 $("#kidney3").removeClass('reds');
	    }else{
	    	$("#kidney3").addClass('reds');
			 $("#kidney3").removeClass('greens');
	    }
		if(value == ""){
			 $("#kidney3").removeClass('reds');
			 $("#kidney3").removeClass('greens');
		}
	})
});  
//사구체여과율
$(function(){
	$('#kidney4').on('input',function(){
	var value = $('#kidney4').val();  
	    if(value >=60){
	    	$("#kidney4").addClass('greens');
			 $("#kidney4").removeClass('reds');
	    }else{
	    	$("#kidney4").addClass('reds');
			 $("#kidney4").removeClass('greens');
	    }
		if(value == ""){
			 $("#kidney4").removeClass('reds');
			 $("#kidney4").removeClass('greens');
		}
	})
});  

</script>
				
<body>

	<div class="navbar">
		<div class="row">
			<div class="column column-30 col-site-title"><a href="${path}/doctor/doctor_main" class="site-title float-left">Lifecare</a></div>
			<div class="column column-40 col-search"><a href="#" class="search-btn fa fa-search"></a>
				<input type="text" id="keyword" name="" value="" placeholder="Search..." style="margin-bottom: 0;" autocomplete="off" >
					<div id="searchDisplay" class="col">
					<!-- 결과 출력 위치 -->
					</div>
			</div>
			<div class="column column-30">
				<div class="user-section"><a href="javascript:void(0)"  onclick="logout();">
					<img src="${path_resources}img/${doctor.getDoctor_faceimg()}" alt="profile photo" class="circle float-left profile-photo" width="50" height="auto">
					<div class="username">
						<h4>${doctor.getDoctor_name()}</h4>
						<p>${doctor.getDoctor_major()}</p>
					</div>
				</a></div>
			</div>
		</div>
	</div>
	<form id="logout-form" action="${path}/logout" method="POST">
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
	</form>
	<div class="row">
		<div id="sidebar" class="column">
			<h5>Navigation</h5>
			<jsp:include page="./doctor_nav.jsp"></jsp:include>
		</div>
		<section id="main-content" class="column column-offset-20">
			
			<!-- 프로필 -->
			 <div class="container bootstrap snippets bootdey" style="float:left; padding: 0 0;">
			    <div class="profile card" style="float:left;">
			        <div class="profile-body">
			            <div class="profile-bio">
			                <div class="row">
			                    <div class="col-md-5 text-center">
			                    	<c:if test="${vo.getCustomer_gender() == '남자'}"> 
			                        	<img style="max-width:300px;" class="img-thumbnail md-margin-bottom-10" src="${path_resources}images/남자.png" alt="">
			                        </c:if>
			                    	<c:if test="${vo.getCustomer_gender() == '여자'}"> 
			                        	<img style="max-width:300px;" class="img-thumbnail md-margin-bottom-10" src="${path_resources}images/여자.png" alt="">
			                        </c:if>			                        
			                    </div>
			                    <div class="col-md-7">
			                        <h2>${vo.getCustomer_name()} (${vo.getCustomer_id()})</h2>
			                        <span><strong>나이:</strong> <fmt:formatNumber value="${2020 - vo.getCustomer_year()}" pattern="#,###"/>세</span> &nbsp;&nbsp;&nbsp;&nbsp;
			                        <span><strong>성별:</strong> ${vo.getCustomer_gender()}</span>
			                        <hr>
			                        <c:if test="${vo2.getDiagnosis_time() != null}">
			                        <span><strong>최근내원일:</strong> ${vo2.getDiagnosis_time()}</span> &nbsp;&nbsp;&nbsp;&nbsp;
			                        <span><strong>진단:</strong> ${vo2.getDisease_code()}</span>
			                        <br><br>
			                        <p><strong>병력:</strong> ${vo2.getDiagnosis_pi()}</p>
			                        </c:if>
			                        <c:if test="${vo2.getDiagnosis_time() == null}">
			                        <span><strong>최근내원일:</strong> 최근기록없음</span> &nbsp;&nbsp;&nbsp;&nbsp;
			                        <span><strong>진단:</strong> 최근기록없음</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                        <br><br>
			                        <p><strong>병력:</strong> 최근기록없음 &nbsp;&nbsp;&nbsp;&nbsp;</p>
			                        </c:if>
			                    </div>
			                </div>    
			            </div>
			    	</div>
			    </div>
			</div>                              
								
			<!--Forms-->
			<div class="row grid-responsive">
				<div class="column ">
					<div class="card">
						<div class='css3-tab'>
						
							<input type='radio' name='a' id='tabOne' tabindex="1" checked>
							<input type='radio' name='a' id='tabTwo' tabindex="2">
			
							<div class="css3-tab-nav">
								<label for='tabOne'>진료기록작성</label>
								<label for='tabTwo'>검사결과작성</label>
							</div>
							<div class='css3-tab-content tab-one'>														
						<div class="card-block">
							<form action="${path}/doctor/diagnosisPro" method="post" name="medicalForm">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<input type="hidden" name="customer_id" value="${vo.getCustomer_id()}">
								<fieldset>
									<input type="text" placeholder="(*)질병코드" id="disease_code" name="disease_code">
									<input type="text" placeholder="(*)주증상(C.C)" id="nameField" name="cc">
									<div id="diseaseList"></div>
									<input type="text" placeholder="혈압(BP)" id="nameField" name="bp">
									<input type="text" placeholder="호흡(RR)" id="nameField" name="rr">
									<input type="text" placeholder="맥박(PR)" id="nameField" name="pr">
									<input type="text" placeholder="체온(BT)" id="nameField" name="bt">

			<div class="row grid-responsive">
				<div class="column column-50">
					<div class="card">
						<div class="card-title">
							<h2>과거력</h2>
						</div>
						<div class="card-block">
							<div class="canvas-wrapper">
								<textarea style="height:130px; resize: none;" name="phx"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="column column-50">
					<div class="card">
						<div class="card-title">
							<h2>가족력</h2>
						</div>
						<div class="card-block">
							<div class="canvas-wrapper">
								<textarea style="height:130px; resize: none;" name="fhx"></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row grid-responsive">
				<div class="column column-33">
					<div class="card">
						<div class="card-title">
							<h2>*현병력</h2>
						</div>
						<div class="card-block">
							<div class="canvas-wrapper">
								<textarea style="height:130px; resize: none;" name="pi"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="column column-33">
					<div class="card">
						<div class="card-title">
							<h2>*증세</h2>
						</div>
						<div class="card-block">
							<div class="canvas-wrapper">
								<textarea style="height:130px; resize: none;" name="ros"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="column column-33">
					<div class="card">
						<div class="card-title">
							<h2>검사</h2>
						</div>
						<div class="card-block">
							<div class="canvas-wrapper">
								<textarea style="height:130px; resize: none;" name="pex"></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>	
									<label for="commentField">처방약</label>									
									<input type="text" placeholder="처방약1" id="drug1" name="drug1">
									<input type="text" placeholder="처방약2" id="drug2" name="drug2">
									<div id="drugList1"></div>
									<div id="drugList2"></div>
									<input type="text" placeholder="처방약3" id="drug3" name="drug3">
									<input type="text" placeholder="처방약4" id="drug4" name="drug4">
									<div id="drugList3"></div>
									<div id="drugList4"></div>
									<input type="text" placeholder="처방약5" id="drug5" name="drug5">
									<input type="text" placeholder="진료금액" name="customer_amount">
									<div id="drugList5"></div>									
									<br>
									<input style="float:left;" class="button-primary" type="submit" value="진료기록저장">
								</fieldset>
							</form>
						</div>
					</div>
					<div class='css3-tab-content tab-two'>
						<div class="card">
							<div class="card-title">
								<h2>기초검사결과 작성</h2>
							</div>
						<form action="${path}/doctor/basicExPro" method="post" name="fda" id="fda">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<input type="hidden" name="customer_id" value="${vo.getCustomer_id()}">
																
							<input type="text" value="신장(cm)" style="width:100px" id="label" disabled>
							<input type="text" placeholder="" style="width:500px" name="height" id="height">
							<input type="text" value="체중(kg)" style="width:100px" id="label" disabled>
							<input type="text" placeholder="" style="width:500px" name="weight" id="weight">
							
							<div style="font-weight: bold;" class="bmi_result_div" id ="bmi_result_div"> BMI 결과 :&nbsp;<span style="text-align: center;" class="bmi_result" id=""></span></div> <p>&nbsp;</p>

						<label for="commentField">이상지질혈증</label>
							<input type="text" value="TC(Total Cholesterole)" id="label" style="width:200px" disabled>
							<input type="text" placeholder="총콜레스테롤(200mg/dl이하)" style="width:450px" name="tc" id="tc" class="tc" >
							
							
							<input type="text" value="TG(Triglyceride)" id="label" style="width:200px" disabled>
							<input type="text" placeholder="중성지방(200mg/dl이하)" style="width:450px" name="tg"id="tg" class="tg" >
							
							<input type="text" value="LDL(LEL Cholesterole)" id="label" style="width:200px" disabled>
							<input type="text" placeholder="저밀도지단백 콜레스테롤(130mg/dl이하)" style="width:450px" name="ldl" id="ldl" class="ldl">
							
							<input type="text" value="HDL(HDL Cholesterole)" id="label" style="width:200px" disabled>
							<input type="text" placeholder="고밀도지단백 콜레스테롤(60mg/dl이상)" style="width:450px" name="hdl" id="hdl" class="hdl">

							
						<label for="commentField">혈압</label>
							<input type="text" value="수축기혈압" id="label" style="width:200px" disabled>	
							<input type="text" placeholder="120mmHg미만" name="blood1" style="width:450px" id="blood1">
							<input type="text" value="이완기혈압" id="label" style="width:200px" disabled>	
							<input type="text" placeholder="80mmHg미만" name="blood2" style="width:450px" id="blood2">	
							<div style="font-weight: bold;" class="blood_result_div" id ="blood_result_div"> 혈압 결과 :&nbsp;<span style="text-align: center;" class="blood_result" id=""></span></div> <p>&nbsp;</p>
						
							
						<label for="commentField">당뇨</label>
							<div>
								<input type="text" placeholder="공복혈당" id="label" name="bloodSugar" style="width:200px" style="float:left;" disabled>
								<input type="text" placeholder="80mg/dL ~ 100mg/dL" name="bloodSugar" id="bloodSugar" style="width:450px">
								<div style="font-weight: bold;" class="bloodSugar_result_div" id="bloodSugar_result_div"> &nbsp;&nbsp;&nbsp;혈당 수치 :&nbsp;<span style="text-align: center;" class="bloodSugar_result"></span></div> <p>&nbsp;</p>
							</div>
							
						<label for="commentField">혈액</label>					
							<input type="text" value="백혈구" id="label" style="width:200px" disabled>					
							<input type="text" placeholder="4천~1만개" name="white" style="width:450px" id="white" class="white">
							<input type="text" value="혈소판" id="label" style="width:200px" disabled>					
							<input type="text" placeholder="12~16.5g/dL" name="platelet"  style="width:450px" id="platelet" class="platelet">
							<input type="text" value="혈색소" id="label" style="width:200px" disabled>					
							<input type="text" placeholder="남성 13.0~17.0g/dL , 여성 12.0~16.0g/dL" name="hb"  style="width:450px">
						
						
						<label for="commentField">간질환</label>					
							<input type="text" value="AST(GOT)" id="label" style="width:200px" disabled>						
							<input type="text" placeholder="아스파르테이트 아미노전이효소(13~40IU/L이하)" name="ast" style="width:450px" id="ast" class="ast">
							<input type="text" value="ALT(GPT)" id="label" style="width:200px" disabled>						
							<input type="text" placeholder="알라닌 아미노전이효소(7~40IU/L이하)" name="alt" style="width:450px" id="alt" class="alt">
							<input type="text" value="r-GTP" id="label" style="width:200px" disabled>						
							<input type="text" placeholder="감마 지티피(8~63IU/L)" name="gtp" style="width:450px" id="gtp" class="gtp">
							
		
					
					
						<label for="commentField">신장질환</label>
							<input type="text" value="요단백" id="label" style="width:200px" disabled>	
							<input type="text" placeholder="음성/양성" name="kidney1" style="width:450px" id="kidney1" class="kidney1">
							<input type="text" value="요소질소" id="label" style="width:200px" disabled>	
							<input type="text" placeholder="6~20mg/dL" name="kidney2" style="width:450px" id="kidney2" class="kidney2">
							<input type="text" value="혈창크레아티닌" id="label" style="width:200px" disabled>	
							<input type="text" placeholder="1.5mg/dL이하" name="kidney3" style="width:450px" id="kidney3" class="kidney3">
							<input type="text" value="사구체여과율" id="label" style="width:200px" disabled>	
							<input type="text" placeholder="60ml/min이상" name="kidney4" style="width:450px" id="kidney4" class="kidney4">
							<input type="hidden" name="customer_id" value="${vo.getCustomer_id()}">																
							
							<input type="text" value="신장(cm)" id="label" style="width:200px" disabled>	
							<input type="text" placeholder="" name="height" style="width:450px" id="height" class="height">
							<input type="text" value="체중(kg)" id="label" style="width:200px" disabled>	
							<input type="text" placeholder="" name="weight" style="width:450px" id="weight" class="weight">
						
						
						<label for="commentField">Comment</label>
							<textarea style="resize: none;" placeholder="소견 작성" id="commentField" name="ex_result"></textarea>
							<input class="button-primary" type="submit" value="Send">
						</form>
					</div>
						<hr>	
						<div class="row grid-responsive">
							<div class="column column-50">
								<div class="card">
									<div class="card-title">
										<span style="font-size: 1.8em; font-weight:500;">X-RAY 검사</span>
										<div style="width:50px; height:50px; float:right;">
											<a href="javascript:void(0)" id="CoronaStart"><img src="${path_resources}images/ai.png"></a>
										</div>	
									</div>								
									<div class="card-block">
									<div class="wrap-loading display-none">
								    <div><img src="${path_resources }img/deepLearning2_edit.gif" /></div>
								</div>  	
										<div class="canvas-wrapper">
											<form action="${path}/doctor/xrayExPro?${_csrf.parameterName}=${_csrf.token}" method="post" name="asdf" id="CoronaForm" enctype="multipart/form-data">
											<input type="file" name="xray_img" id="file">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
											<input type="hidden" name="customer_id" value="${vo.getCustomer_id()}">
											<input type="hidden" name="normal_percentage" value="">
											<input type="hidden" name="corona_percentage" value="">
											<input type="hidden" name="pneumonia_percentage" value="">
											<table>
												<thead>
												<tr>
													<th style="width:70%;">이미지</th>
													<th style="width:30%;" colspan="2">결과</th>
												</tr>
												</thead>
												<tbody style="height:600px;">										    
												<tr>												
													<td rowspan="3"><img style="height:350px;" id="img"></td>
													<td>정상확률</td>
													<td id ="normal"></td>
												</tr>
												<tr class='even'>
													<td>폐렴확률</td>
													<td id ="pneumonia"></td>
												</tr>
												<tr>
													<td>코로나확률</td>
													<td id="corona"></td>
												</tr>
												</tbody>	
											</table>
											<label for="commentField">Comment</label>
											<textarea style="resize: none;" placeholder="소견 작성" id="commentField" name="xray_result"></textarea>
											<input class="button-primary" type="submit" value="Send">
										</form>
										</div>
									</div>
								</div>
							</div>
							<div class="column column-50">
								<div class="card">
									<div class="card-title">
										<span style="font-size: 1.8em; font-weight:500;">암(유방)검사</span>
										<div style="width:50px; height:50px; float:right;">
											<a href="javascript:void(0)" id="CancerStart"><img src="${path_resources}images/ai.png"></a>
										</div>	
									</div>
									<div class="card-block">
										<div class="canvas-wrapper">
											<form action="${path}/doctor/cancerExPro" method="post" name="qwer" id="CancerForm">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
											<input type="hidden" name="customer_id" value="${vo.getCustomer_id()}">
											<input type="hidden" name="age" value="${2020 - vo.getCustomer_year()}">
											<input type="hidden" name="percentage" value="">
											<label for="commentField">검사정보입력</label>
												<input type="text" placeholder="radius" name="radius">
												<input type="text" placeholder="texture" name="texture">
												<input type="text" placeholder="perimeter" name="perimeter">
												<input type="text" placeholder="area" name="area">
												<input type="text" placeholder="smoothness" name="smoothness">
												<input type="text" placeholder="compactness" name="compactness">
												<input type="text" placeholder="concavity" name="concavity">
												<input type="text" placeholder="symmetry" name="symmetry">
												<input type="text" placeholder="fractal_dimension" name="fractal_dimension">																																			
											<table cellspacing='0'>
												<tr>
													<th colspan="2">결과</th>
												</tr>											    
												<tr class='even'>
													<td id="resultCancer"></td>
													<td id="resultPercent"></td>
												</tr>											
											</table>
											<label for="commentField">Comment</label>
											<textarea style="resize: none;" placeholder="의사소견" id="commentField" name="cancer_result"></textarea>
											<input class="button-primary" type="submit" value="Send">
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>						
		<p class="credit">HTML5 Admin Template by <a href="https://www.medialoot.com">Medialoot</a></p>
		</section>
	</div>
	  
</body>
</html>
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
	
	</style>
	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700" rel="stylesheet">
	
	<!-- Template Styles -->
	<link rel="stylesheet" href="${path_resources}css/doctorfont-awesome.min.css">
	
	<!-- CSS Reset -->
	<link rel="stylesheet" href="${path_resources}css/doctornormalize.css">
	
	<!-- Milligram CSS minified -->
	<link rel="stylesheet" href="${path_resources}css/doctormilligram.min.css">
	
	<!-- Main Styles -->
	<link rel="stylesheet" href="${path_resources}css/doctorStyles.css">
	
	<link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.min.css" rel="stylesheet">
	
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
</head>
<script type="text/javascript">

//환자조회/진료 클릭시 발생 이벤트
function resReset(){
	$('#keyword').focus();
}

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
</script>
<body>
	<div class="navbar">
		<div class="row">
			<div class="column column-30 col-site-title"><a href="${path}/doctor/doctor_main" class="site-title float-left">Lifecare</a></div>
			<div class="column column-40 col-search"><a href="#" class="search-btn fa fa-search"></a>
				<input type="text" id="keyword" name="" value="" placeholder="Search..." style="margin-bottom: 0;">
					<div id="searchDisplay" class="col">
					<!-- 결과 출력 위치 -->
					</div>
			</div>
			<div class="column column-30">
				<div class="user-section"><a href="#">
					<img src="${path_resources}img/${doctor.getDoctor_faceimg()}" alt="profile photo" class="circle float-left profile-photo" width="50" height="auto">
					<div class="username">
						<h4>${doctor.getDoctor_name()}</h4>
						<p>${doctor.getDoctor_major()}</p>
					</div>
				</a></div>
			</div>
		</div>
	</div>
	<div class="row">
		<div id="sidebar" class="column">
			<h5>Navigation</h5>
			<ul>
				<li><a href="${path}/doctor/doctor_main"><em class="fa fa-home"></em> Home</a></li>
				<li><a href="${path}/doctor/doctor_schedule"><em class="fa fa-table"></em> 스케쥴관리</a></li>
				<li><a href="javascript:void(0);" onclick="resReset();"><em class="fa fa-pencil-square-o"></em> 환자조회/진료</a></li>
				<li><a href="#alerts"><em class="fa fa-hand-o-up"></em> 진료도우미</a></li>
			</ul>
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
			                        	<img class="img-thumbnail md-margin-bottom-10" src="${path_resources}images/남자.png" alt="">
			                        </c:if>
			                    	<c:if test="${vo.getCustomer_gender() == '여자'}"> 
			                        	<img class="img-thumbnail md-margin-bottom-10" src="${path_resources}images/여자.png" alt="">
			                        </c:if>			                        
			                    </div>
			                    <div class="col-md-7">
			                        <h2>${vo.getCustomer_name()} (${vo.getCustomer_id()})</h2>
			                        <span><strong>나이:</strong> <fmt:formatNumber value="${2020 - vo.getCustomer_year()}" pattern="#,###"/>세</span> &nbsp;&nbsp;&nbsp;&nbsp;
			                        <span><strong>성별:</strong> ${vo.getCustomer_gender()}</span>
			                        <hr>
			                        <span><strong>최근내원일:</strong> 2020-09-11</span> &nbsp;&nbsp;&nbsp;&nbsp;
			                        <span><strong>진단명:</strong> 당뇨</span>
			                        <p>(최근내원일 현병력 기재)Proin mauris odio, pharetra quis ligula non, vulputate vehicula quam. Nunc in libero vitae nunc ultricies tincidunt ut sed leo. Sed luctus dui ut congue consequat. Cras consequat nisl ante, nec malesuada velit pellentesque ac. Pellentesque nec arcu in ipsum iaculis convallis.</p>
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
						<div class="card-title">
							<h3>진료기록작성</h3>
						</div>
						<div class="card-block">
							<form action="${path}/doctor/diagnosisPro" method="post" name="medicalForm">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<input type="hidden" name="customer_id" value="${vo.getCustomer_id()}">
								<fieldset>
									<input type="text" placeholder="질병코드" id="disease_code" name="disease_code">
									<input type="text" placeholder="주증상(C.C)" id="nameField" name="cc">
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
								<textarea style="height:130px" name="phx"></textarea>
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
								<textarea style="height:130px" name="fhx"></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row grid-responsive">
				<div class="column column-33">
					<div class="card">
						<div class="card-title">
							<h2>현병력</h2>
						</div>
						<div class="card-block">
							<div class="canvas-wrapper">
								<textarea style="height:130px" name="pi"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="column column-33">
					<div class="card">
						<div class="card-title">
							<h2>증세</h2>
						</div>
						<div class="card-block">
							<div class="canvas-wrapper">
								<textarea style="height:130px" name="ros"></textarea>
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
								<textarea style="height:130px" name="pex"></textarea>
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
				</div>
			</div>			
	
			<!--Tables-->
			<div class="row grid-responsive">
				<div class="column ">
					<div class="card">
						<div class="card-title">
							<h3>최근 진료 내역</h3>
						</div>
						<div class="card-block">
							<table>
								<thead>
									<tr>
										<th style="background:#35cebe; color:white;">No</th>
										<th style="background:#35cebe; color:white;">Diagnosis</th>
										<th style="background:#35cebe; color:white;">Age</th>
										<th style="background:#35cebe; color:white;">Sex</th>
										<th style="background:#35cebe; color:white;">Date</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>UI Developer</td>
										<td>23</td>
										<td>남자</td>
										<td>2020-00-00</td>
									</tr>
									<tr>
										<td>2</td>
										<td>Designer</td>
										<td>30</td>
										<td>남자</td>
										<td>2020-00-00</td>
									</tr>
									<tr>
										<td>3</td>
										<td>UX Developer</td>
										<td>25</td>
										<td>남자</td>
										<td>2020-00-00</td>
									</tr>
									<tr>
										<td>4</td>
										<td>Programmer</td>
										<td>28</td>
										<td>남자</td>
										<td>2020-00-00</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			
			<p class="credit">HTML5 Admin Template by <a href="https://www.medialoot.com">Medialoot</a></p>
		</section>
	</div>		
</body>
</html>
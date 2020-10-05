<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
	<meta charset="utf-8">
	<title>Doctor Template</title>
	
	<!-- jQuery 추가 -->
	<script src="${path_resources}js/jquery-3.5.1.min.js"></script>
	
	<!-- css -->
	<style type="text/css">
	<!-- 프로필 css -->
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

function logout() {
	var chk = confirm("로그아웃 하시겠습니까?");
	
	if(chk){
		document.getElementById('logout-form').submit();
	} else {
			alert("로그아웃 취소 되었습니다.")
			return false;
	}
}

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
	
});

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
			<ul>
				<li><a href="${path}/doctor/doctor_main"><em class="fa fa-home"></em> Home</a></li>
				<li><a href="${path}/doctor/doctor_schedule"><em class="fa fa-table"></em> 스케쥴관리</a></li>
				<li><a href="javascript:void(0);" onclick="resReset();"><em class="fa fa-pencil-square-o"></em> 환자조회/진료</a></li>
				<li><a href="${path}/doctor/doctor_assist"><em class="fa fa-hand-o-up"></em> 진료도우미</a></li>
			</ul>
		</div>
		<section id="main-content" class="column column-offset-20">
					
			<!-- Pure CSS Menu -->
			<div class="row grid-responsive mt-1">
				<div class="column">
					<div class="card">
						<div class="card-block">
							<table>
								<thead>
									<tr>
										<th>Name</th>
										<th>Role</th>
										<th>Age</th>
										<th>Location</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Jane Donovan</td>
										<td>UI Developer</td>
										<td>23</td>
										<td>Philadelphia, PA</td>
									</tr>
									<tr>
										<td>Jonathan Smith</td>
										<td>Designer</td>
										<td>30</td>
										<td>London, UK</td>
									</tr>
									<tr>
										<td>Kelly Johnson</td>
										<td>UX Developer</td>
										<td>25</td>
										<td>Los Angeles, CA</td>
									</tr>
									<tr>
										<td>Sam Davidson</td>
										<td>Programmer</td>
										<td>28</td>
										<td>Philadelphia, PA</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="column">
				<div class='css3-tab'>
					<input type='radio' name='a' id='tabOne' tabindex="1" checked>
					<input type='radio' name='a' id='tabTwo' tabindex="2">
					<input type='radio' name='a' id='addNew' tabindex="3">
			
					<div class="css3-tab-nav">
							<label for='tabOne'>기초검사</label>
							<label for='tabTwo'>X-Ray검사</label>
							<label for='addNew'>암(유방)검사</label>
					</div>
			
					<div class='css3-tab-content tab-one'>
							<!-- start slipsum code -->
							<h1>Tab One</h1> In facilisis scelerisque dui vel dignissim. Sed nunc orci, ultricies congue vehicula quis, facilisis a orci. In aliquet facilisis condimentum. Donec at orci orci, a dictum justo. Sed a nunc non lectus fringilla suscipit. Vivamus pretium sapien sit
							amet mauris aliquet eleifend vel vitae arcu. Fusce pharetra dignissim nisl egestas pretium.
			
							<h2>Nullam commodo neque</h2> Etiam aliquam sem ac velit feugiat elementum. Nunc eu elit velit, nec vestibulum nibh. Curabitur ultrices, diam non ullamcorper blandit, nunc lacus ornare nisi, egestas rutrum magna est id nunc. Pellentesque imperdiet malesuada quam, et rhoncus eros
							auctor eu. Nullam vehicula metus ac lacus rutrum nec fermentum urna congue. Vestibulum et risus at mi ultricies sagittis quis nec ligula. Suspendisse dignissim dignissim luctus. Duis ac dictum nibh. Etiam id massa magna. Morbi molestie posuere posuere.
			
							<h2>Maecenas eu placerat</h2> Integer elementum massa at nulla placerat varius. Suspendisse in libero risus, in interdum massa. Vestibulum ac leo vitae metus faucibus gravida ac in neque. Nullam est eros, suscipit sed dictum quis, accumsan a ligula. In sit amet justo lectus.
							Etiam feugiat dolor ac elit suscipit in elementum orci fringilla. Aliquam in felis eros. Praesent hendrerit lectus sit amet turpis tempus hendrerit. Donec laoreet volutpat molestie. Praesent tempus dictum nibh ac ullamcorper. Sed eu consequat nisi.
							Quisque ligula metus, tristique eget euismod at, ullamcorper et nibh. Duis ultricies quam egestas nibh mollis in ultrices turpis pharetra. Vivamus et volutpat mi. Donec nec est eget dolor laoreet iaculis a sit amet diam.
					</div>
			
					<div class='css3-tab-content tab-two'>
							<!-- start slipsum code -->
							<h1>Tab Two will be shown by default via the checked attr on the corresponding input</h1> Integer elementum massa at nulla placerat varius. Suspendisse in libero risus, in interdum massa. Vestibulum ac leo vitae metus faucibus gravida ac in neque. Nullam est eros, suscipit sed dictum quis, accumsan a ligula. In sit amet justo lectus.
							Etiam feugiat dolor ac elit suscipit in elementum orci fringilla. Aliquam in felis eros. Praesent hendrerit lectus sit amet turpis tempus hendrerit. Donec laoreet volutpat molestie. Praesent tempus dictum nibh ac ullamcorper. Sed eu consequat nisi.
							Quisque ligula metus, tristique eget euismod at, ullamcorper et nibh. Duis ultricies quam egestas nibh mollis in ultrices turpis pharetra. Vivamus et volutpat mi. Donec nec est eget dolor laoreet iaculis a sit amet diam.
			
							<h2>Donec malesuada vehicula</h2> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ac magna non augue porttitor scelerisque ac id diam. Mauris elit velit, lobortis sed interdum at, vestibulum vitae libero. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Quisque iaculis ligula ut ipsum mattis viverra. Nulla a libero metus. Integer gravida tempor metus eget condimentum. Integer eget iaculis tortor. Nunc sed ligula sed augue rutrum ultrices eget nec odio. Morbi rhoncus, sem laoreet tempus pulvinar,
							leo diam varius nisi, sed accumsan ligula urna sed felis. Mauris molestie augue sed nunc adipiscing et pharetra ligula suscipit. In euismod lectus ac sapien fringilla ut eleifend lacus venenatis.
			
							<h2>Nullam eros mi</h2> Nullam eros mi, mollis in sollicitudin non, tincidunt sed enim. Sed et felis metus, rhoncus ornare nibh. Ut at magna leo. Suspendisse egestas est ac dolor imperdiet pretium. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam porttitor,
							erat sit amet venenatis luctus, augue libero ultrices quam, ut congue nisi risus eu purus. Cras semper consectetur elementum. Nulla vel aliquet libero. Vestibulum eget felis nec purus commodo convallis. Aliquam erat volutpat.
					</div>
			
					<div class='css3-tab-content add-new'>
							<!-- start slipsum code -->
							<h1>Add New</h1> Integer elementum massa at nulla placerat varius. Suspendisse in libero risus, in interdum massa. Vestibulum ac leo vitae metus faucibus gravida ac in neque. Nullam est eros, suscipit sed dictum quis, accumsan a ligula. In sit amet justo lectus.
							Etiam feugiat dolor ac elit suscipit in elementum orci fringilla. Aliquam in felis eros. Praesent hendrerit lectus sit amet turpis tempus hendrerit. Donec laoreet volutpat molestie. Praesent tempus dictum nibh ac ullamcorper. Sed eu consequat nisi.
							Quisque ligula metus, tristique eget euismod at, ullamcorper et nibh. Duis ultricies quam egestas nibh mollis in ultrices turpis pharetra. Vivamus et volutpat mi. Donec nec est eget dolor laoreet iaculis a sit amet diam.
			
							<h2>Donec malesuada vehicula</h2> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ac magna non augue porttitor scelerisque ac id diam. Mauris elit velit, lobortis sed interdum at, vestibulum vitae libero. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Quisque iaculis ligula ut ipsum mattis viverra. Nulla a libero metus. Integer gravida tempor metus eget condimentum. Integer eget iaculis tortor. Nunc sed ligula sed augue rutrum ultrices eget nec odio. Morbi rhoncus, sem laoreet tempus pulvinar,
							leo diam varius nisi, sed accumsan ligula urna sed felis. Mauris molestie augue sed nunc adipiscing et pharetra ligula suscipit. In euismod lectus ac sapien fringilla ut eleifend lacus venenatis.
			
							<h2>Nullam eros mi</h2> Nullam eros mi, mollis in sollicitudin non, tincidunt sed enim. Sed et felis metus, rhoncus ornare nibh. Ut at magna leo. Suspendisse egestas est ac dolor imperdiet pretium. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam porttitor,
							erat sit amet venenatis luctus, augue libero ultrices quam, ut congue nisi risus eu purus. Cras semper consectetur elementum. Nulla vel aliquet libero. Vestibulum eget felis nec purus commodo convallis. Aliquam erat volutpat.
					</div>
				</div>
			</div>
		</div>
			<p class="credit">HTML5 Admin Template by <a href="https://www.medialoot.com">Medialoot</a></p>
		</section>
	</div>		
</body>
</html>
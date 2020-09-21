<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %> 
<!DOCTYPE html>
<html>
<style>
	.mun1{
		border:0px;
		width:152px;
		height:41px;
		background-color:#F2F2F2;
		border-radius:10px;
		border:1px solid #BDBDBD;
		font-size:22px;
		margin:10px;
	}
	
	.mun2{
		text-align:left;
		font-size:24px; 
		color:black; 
		vertical-align:middle; 
		border:1px solid #cccccc; 
		border-radius:15px;
		padding:15px 0 18px 85px;
		margin-top:25px; background-color:#f2f2f2;
		background-image:url("/lifecare/resources/images/checkbox.png");
		background-repeat:no-repeat; 
		background-position:30px center; 
		background-size:35px; 
		width:97.5%;
	}
				
	.munjintbl1{
		width:800px;
		vertical-align:middle !important;
		border-spacing:0;
		text-align:center;
	}
	.munjintbl1 tr{
		border-bottom:1px solid #BDBDBD;
	}
	.munjintbl1 td{
		width:1px;
		font-size:22px;
	}
	
	.tit1{
		font-size:20px;
		color:#009AFF;
		text-align:left;
	}
	
	.tit2{
		font-size:35px;
		text-align:left;
		font-weight:bold;
	}
	
	.tit3{
		font-size:24px;
		text-align:left;
	}
	
	.red{
		color:red;	
	}
	
	.divclass{
		width:800px;	
	}
	
	.bottombuttondiv{
		margin-top:30px;	
	}
	.back{
		border:0px;
		width:270px;
		height:120px;
		background-color:#A4A4A4;
		font-size:30px;
		color:#ffffff;
	}
	
	.next{
		border:0px;	
		width:630px;
		height:120px;
		background-color:#58D3F7;
		color:#ffffff;
		font-size:30px;
		background-image:url("/lifecare/resources/images/next2.png"); 
		background-repeat:no-repeat; 
		background-position:400px center; 
		background-size:35px; 
	}
	
	.selecttabl{
		width:600px;
		margin-top:20px;
		line-height:3;
		border:1px;
	}
	
	.radiotbl{
		text-align:center;
		
	}
	
	.smokeyn{
		text-align:center;
		border:1px solid #F2F2F2;
		margin-top:50px;
		margin-bottom:20px;
	}
	
	.labelcss{
		color:black;
		font-size:20px;
	}
	
	.radiocss {
		width:15px;
		height:15px;
		margin-left:30px;
	}
	
	.drinktbl{
		margin-top:30px;
		text-align:center;
		border:1px solid #f0f0f0;
	}
	
	.drinktext{
		border-top:0px !important;
		border-left:0px !important;
		border-right:0px !important;
	}
	
	.helthtext{
		border-top:0px !important;
		border-left:0px !important;
		border-right:0px !important;
	}
	
	.helthtbl{
		border:1px solid #E6E6E6;
		height:200px;
	}
	
	.helthtbl1{
		border:1px solid #E6E6E6;
		height:100px;
	}
	
	.helthtbl td{
		
	}
	
	.helthtbl tr{
	
	}
	
</style>
<script type="text/javascript">
	
	var num = /^[0-9]*$/;
	
		
	
	/* 색상변경 값변경 */
	function setColor(btn) {
	    var property = document.getElementById(btn);
		var test = property.style.backgroundColor;
	    if (test == "rgb(0, 154, 255)") {
	        property.style.backgroundColor = "#F2F2F2"
	        document.getElementById(btn).value = 0;
	        console.log(document.getElementById(btn).value);
	    }else {
	        property.style.backgroundColor = "#009aff"
	        document.getElementById(btn).value = 1;
	        console.log(document.getElementById(btn).value);
	    }
	}
	
	$(function() {
		
		/* 화면 숨김처리 */
		$('#no2').hide();
		$('#no3').hide();
		$('#no4').hide();
		$('#no5').hide();
		$('#no6').hide();
		
		/* 흡연유무 */
		$('#smokeyes1').hide();
		$('#smokeyes2').hide();
		
		/* 전자담배 여부 */
		$('#radiodiv').hide();	
		
		/* 음주 여부 */
		$('#drinkdiv').hide();	
		
		/* 흡연안함 */
		$('#no4button0').click(function() {
			$('#smokeyes1').hide();
			$('#smokeyes2').hide();
			
			$("#smokeyear2 option:eq(0)").prop("selected", true);
			$("#smokeyear1 option:eq(0)").prop("selected", true);
		});
		/* 지금은 끊었음 */
		$('#no4button1').click(function() {
			$('#smokeyes1').show();
			$('#smokeyes2').hide();
			$("#smokeyear2 option:eq(0)").prop("selected", true);
		});	
		/* 현재 흡연중 */
		$('#no4button2').click(function() {
			$('#smokeyes2').show();
			$('#smokeyes1').hide();
			$("#smokeyear1 option:eq(0)").prop("selected", true);
		});	
		
		/* 전자담배사용경험 */
		$('#no4button3').click(function() {
			if(document.getElementById('no4button3').value == 1){
				$('#radiodiv').show();	
			}else{
				/* 전자담배 있음후 취소시 값 초기화 */
				$('#radiodiv').hide();
				$("#contactChoice1").prop("checked",false);
				$("#contactChoice2").prop("checked",false);
				$("#contactChoice3").prop("checked",false);
				$("#contactChoice4").prop("checked",false);
				$("#contactChoice5").prop("checked",false);
				document.getElementsByName('healthcheck_esmoke_year').value = 0;
			}
		});	
		
		/* 음주여부 (예) */
		$('#no5button1').click(function() {
			$('#drinkdiv').show();
		});	
		
		/* 음주여부 (아니오) */
		$('#no5button0').click(function() {
			$('#drinkdiv').hide();	
			$(".drinktext").val('');
		});	
		
		$(".drinktext").blur(function() {
			  if (num.test($(this).val())) {
			} else {
				alert('숫자만 입력해주세요');
				$(".drinktext").val('');
			}
		});
		
		
		$(".helthtext").blur(function() {
			  if (num.test($(this).val())) {
			} else {
				alert('숫자만 입력해주세요');
				$(".helthtext").val('');
			}
		});
	})
	
	/* 이전으로 */
	function back(NowNo,BackNo){
		$('#' + NowNo).hide();
		$('#' + BackNo).show();
	}
	
	/* 다음 */
	function next(NowNo,NextNo){
		console.log(document.getElementById('no3num').value);
		if(NowNo == "no3"){
			if(document.getElementById('no3num').value == ""){
				alert("문진답변을 한가지 선택하여주십시오");	
			}else{
				$('#' + NowNo).hide();
				$('#' + NextNo).show();	
			}
		}else{
			$('#' + NowNo).hide();
			$('#' + NextNo).show();	
		}
	}
	
	/* 해당하는 버튼만 색변경 값변경 */
   	function clickcolor(id1,id2,id3,num){
   		
   		var property1 = document.getElementById(id1);
   		var property2 = document.getElementById(id2);
   		var property3 = document.getElementById(id3);
   		
   		var value = document.getElementById(id1).value;
   		
   		var test = property1.style.backgroundColor;
   		
   		if (test != "rgb(0, 154, 255)") {
   			property1.style.backgroundColor = "#009aff"
  			property2.style.backgroundColor = "#F2F2F2"
			property3.style.backgroundColor = "#F2F2F2"
  		    document.getElementById(num).value = value;
  		}
   	}
	
	/* 해당하는 버튼만 색변경 값변경 */
   	function clickcolor2(id1,id2,num){
   		
   		var property1 = document.getElementById(id1);
   		var property2 = document.getElementById(id2);
   		
   		var value = document.getElementById(id1).value;
   		console.log(value);
   		var test = property1.style.backgroundColor;
   		
   		if (test != "rgb(0, 154, 255)") {
   			property1.style.backgroundColor = "#009aff"
  			property2.style.backgroundColor = "#F2F2F2"
  		    document.getElementById(num).value = value;
  		}
   	}
</script>
<head>
<meta charset="UTF-8">
<title>문진표</title>
</head>
<body>
<%@include file="../../common/header.jsp" %>
<form action="${path}/index2" name="index1form" method="post">
<input type ="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

		<!-- 문진표 1번 -->
		<div id="no1">
			<div align="center">
				<div class="divclass" >
					<p class="tit1">질환력(과거력 ,가족력)</p>
					<p class="tit2">진단/약물 치료</p>
					<p class="tit3">음과 같은 질병으로 진단을 받았거나 ,<font class="red">현재 약물 치료</font> 중 이십니까?<font class="red">(본인)</font></p>
					<table class="munjintbl1">
						<tr>
							<td colspan="2">뇌졸증(중풍)</td>
							<td><button type="button" class="mun1" name="check_pstroke_diagnosis" id="no1button1" value="0"  onclick="setColor('no1button1')" >진단</button></td>
							<td><button type="button" class="mun1" name="check_pstroke_medication" id="no1button2" value="0"  onclick="setColor('no1button2')" >약물 치료</button></td>
						</tr>
						<tr>
							<td colspan="2">심장병(심근경색/협심증)</td>
							<td><button type="button" class="mun1" name="check_pmyocardial_diagnosis" id="no1button3" value="0"  onclick="setColor('no1button3')" >진단</button></td>
							<td><button type="button" class="mun1" name="check_pmyocardial_medication" id="no1button4" value="0"  onclick="setColor('no1button4')" >약물 치료</button></td>		
						</tr>
						<tr>
							<td colspan="2">고혈압</td>
							<td><button type="button" class="mun1" name="check_pbp_diagnosis" id="no1button5" value="0"  onclick="setColor('no1button5')" >진단</button></td>
							<td><button type="button" class="mun1" name="check_pbp_medication" id="no1button6" value="0"  onclick="setColor('no1button6')" >약물 치료</button></td>
						</tr>
						<tr>
							<td colspan="2">당뇨병</td>
							<td><button type="button" class="mun1" name="check_pdiabetes_diagnosis" id="no1button7" value="0"  onclick="setColor('no1button7')" >진단</button></td>
							<td><button type="button" class="mun1" name="check_pdiabetes_medication" id="no1button8" value="0"  onclick="setColor('no1button8')" >약물 치료</button></td>		
						</tr>
						<tr>
							<td colspan="2">이상지질혈증</td>
							<td><button type="button" class="mun1" name="check_pdyslipidemia_diagnosis" id="no1button9" value="0"  onclick="setColor('no1button9')" >진단</button></td>
							<td><button type="button" class="mun1" name="check_pdyslipidemia_medication" id="no1button10" value="0"  onclick="setColor('no1button10')" >약물 치료</button></td>
						</tr>
						<tr>
							<td colspan="2">폐결핵</td>
							<td><button type="button" class="mun1" name="check_ptuberculosis_diagnosis" id="no1button11" value="0"  onclick="setColor('no1button11')" >진단</button></td>
							<td><button type="button" class="mun1" name="check_ptuberculosis_medication" id="no1button12" value="0"  onclick="setColor('no1button12')" >약물 치료</button></td>		
						</tr>
						<tr>
							<td colspan="2">기타(암포함)</td>
							<td><button type="button" class="mun1" name="check_petc_diagnosis" id="no1button13" value="0"  onclick="setColor('no1button13')" >진단</button></td>
							<td><button type="button" class="mun1" name="check_petc_medication" id="no1button14" value="0"  onclick="setColor('no1button14')" >약물 치료</button></td>
						</tr>
					</table>
				</div>
				<div class="bottombuttondiv">
					<input type="button" id="no1back" class="back" value="뒤로가기">
					<input type="button" id="no1next" class="next" value="다음으로" onclick="next('no1','no2')">
				</div>
			</div>
		</div>
		<!-- 문진표 1번 -->
		
		<!-- 문진표 2번 -->
		<div id="no2">
			<div align="center">
				<div class="divclass" >
					<p class="tit1">질환력(과거력 ,가족력)</p>
					<p class="tit2">진단/약물 치료</p>
					<p class="tit3"><font class="red">부모, 형제, 자매</font>중에 다음 질환을 앓았거나 해당 질환으로 사망한 경우가 있으십니까?</p>
					<table class="munjintbl1">
						<tr>
							<td colspan="2">뇌졸증(중풍)</td>
							<td><button type="button" class="mun1" name="check_fstroke_diagnosis" id="no2button1" value="0"  onclick="setColor('no2button1')" >있음</button></td>
						</tr>
						<tr>
							<td colspan="2">심장병(심근경색/협심증)</td>
							<td><button type="button" class="mun1" name="check_fmyocardial_diagnosis" id="no2button2" value="0"  onclick="setColor('no2button2')" >있음</button></td>
						</tr>
						<tr>
							<td colspan="2">고혈압</td>
							<td><button type="button" class="mun1" name="check_fbp_diagnosis" id="no2button3" value="0"  onclick="setColor('no2button3')" >있음</button></td>
						</tr>
						<tr>
							<td colspan="2">당뇨병</td>
							<td><button type="button" class="mun1" name="check_fdiabetes_diagnosis" id="no2button4" value="0"  onclick="setColor('no2button4')" >있음</button></td>
						</tr>
						<tr>
							<td colspan="2">기타(암포함)</td>
							<td><button type="button" class="mun1" name="check_fetc_diagnosis" id="no2button5" value="0"  onclick="setColor('no2button5')" >있음</button></td>
						</tr>
					</table>
				</div>
				<div class="bottombuttondiv">
					<input type="button" id="no2back" class="back" value="뒤로가기" onclick="back('no2','no1')">
					<input type="button" id="no2next" class="next" value="다음으로" onclick="next('no2','no3')">
				</div>
			</div>
		</div>
		<!-- 문진표 2번 -->
		
		<!-- 문진표 3번 -->
		<div id="no3">
			<input type='hidden' name="check_hepatitis_diagnosis" id="no3num">
			<div align="center">
				<div class="divclass" >
					<p class="tit1">질환력(과거력 ,가족력)</p>
					<p class="tit2">B형간염</p>
					<p class="tit3"><font class="red">B형간염</font> 바이러스 보유자입니까?</p>
					<table class="munjintbl1">
						<tr style="border:0px;">
							<td colspan="4"><button type="button" class="mun2" id="no3button0" value="0" onclick="clickcolor('no3button0','no3button1','no3button2','no3num')">아니오</button></td>
						</tr>
						<tr style="border:0px;">
							<td colspan="4"><button type="button" class="mun2" id="no3button1" value="1" onclick="clickcolor('no3button1','no3button0','no3button2','no3num')">예</button></td>
						</tr>
						<tr style="border:0px;">
							<td colspan="4"><button type="button" class="mun2" id="no3button2" value="2" onclick="clickcolor('no3button2','no3button0','no3button1','no3num')">모름</button></td>
						</tr>
					</table>
				</div>
				<div class="bottombuttondiv">
					<input type="button" id="no3back" class="back" value="뒤로가기" onclick="back('no3','no2')">
					<input type="button" id="no3next" class="next" value="다음으로" onclick="next('no3','no4')">
				</div>
			</div>
		</div>
		<!-- 문진표 3번 -->
		
		<!-- 문진표 4번 -->
		<div id="no4">
			<input type='hidden' name="healthcheck_smoke_diagnosis" id="no4num">
			<div align="center">
				<div class="divclass" >
					<p class="tit1">담배</p>
					<p class="tit2">흡연 및 전자담배</p>
					<p class="tit3">지금까지 평생 총 5갑(<font class="red">100개비</font>)이상의 일반담배(<font class="red">궐련</font>)를 피운적이 있습니까?</p>
					<table class="munjintbl1">
						<tr style="border:0px;">
							<td colspan="4"><button type="button" class="mun2" value="0" id="no4button0" onclick="clickcolor('no4button0','no4button1','no4button2','no4num')">아니오</button></td>
						</tr>
						<tr style="border:0px;">
							<td colspan="4">
								<button type="button" class="mun2" value="1" id="no4button1" onclick="clickcolor('no4button1','no4button0','no4button2','no4num')">지금은 끊었음</button>
								<div id="smokeyes1" align="center">
									<table class="selecttabl">
										<tr>
											<td>
												(과거)총
											</td>
											<td>
												<select name="healthcheck_smoke_ayear" class="" id="smokeyear1">
													<c:forEach var="year" begin="0" end="100">
														<option id="smokeyear1" value='${year}'>${year}</option>										
													</c:forEach>
												</select>
											</td>
											<td>
												년
											</td>
										</tr>
										<tr>
											<td>	
												(과거)하루평균
											</td>
											<td>
												<select name="healthcheck_smoke_acount" class="" id="smokeyear1">
													<c:forEach var="count" begin="0" end="999">
														<option id="smokeyear1" value='${count}'>${count}</option>										
													</c:forEach>
												</select>
											</td>
											<td>
												개비
											</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
						<tr style="border:0px;">
							<td colspan="4">
								<button type="button" class="mun2" value="2" id="no4button2" onclick="clickcolor('no4button2','no4button0','no4button1','no4num')">현재 흡연중</button>
								<div id="smokeyes2" align="center">
									<table class="selecttabl">
										<tr>
											<td>
												총
											</td>
											<td>
												<select name="healthcheck_smoke_nyear" class="" id="smokeyear2">
													<c:forEach var="year" begin="0" end="100">
														<option id="smokeyear2" value='${year}'>${year}</option>										
													</c:forEach>
												</select>
											</td>
											<td>
												년
											</td>
										</tr>
										<tr>
											<td>	
												하루평균
											</td>
											<td>
												<select name="healthcheck_smoke_ncount" class="" id="smokeyear2">
													<c:forEach var="count" begin="0" end="999">
														<option id="smokeyear2" value='${count}'>${count}</option>										
													</c:forEach>
												</select>
											</td>
											<td>
												개비
											</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
					</table>
					<table class="smokeyn">
						<tr>
							<td colspan="2">전자담배를 <font class="red">사용한 경험</font>이 있습니까?</td>
							<td><button type="button" class="mun1" name="healthcheck_esmoke_use" id="no4button3" value="0"  onclick="setColor('no4button3')" >있음</button></td>
						</tr>					
					</table>
					<div id="radiodiv">
						<table class="radiotbl">
							<tr>
								<td>
									<input type="radio" class="radiocss"id="contactChoice1" name="healthcheck_esmoke_year" value="0">
								    <label class="labelcss" for="contactChoice1">아니오</label>
								
								    <input type="radio" class="radiocss"id="contactChoice2" name="healthcheck_esmoke_year" value="1">
								    <label class="labelcss" for="contactChoice2">월 1~2일</label>
								
								    <input type="radio" class="radiocss"id="contactChoice3" name="healthcheck_esmoke_year" value="2">
								    <label class="labelcss" for="contactChoice3">월 3~9일</label>
								    
								    <input type="radio" class="radiocss"id="contactChoice4" name="healthcheck_esmoke_year" value="3">
								    <label class="labelcss" for="contactChoice4">월 10~~29일</label>
								    
								    <input type="radio" class="radiocss"id="contactChoice5" name="healthcheck_esmoke_year" value="4">
								    <label class="labelcss" for="contactChoice5">매일</label>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="bottombuttondiv">
					<input type="button" id="no4back" class="back" value="뒤로가기" onclick="back('no4','no3')">
					<input type="button" id="no4next" class="next" value="다음으로" onclick="next('no4','no5')">
				</div>
			</div>
		</div>
		<!-- 문진표 4번 -->
		
		<!-- 문진표 5번 -->
		<div id="no5">
			<input type='hidden' name="healthcheck_drink_check" id="no5num">
			<div align="center">
				<div class="divclass" >
					<p class="tit1">음주</p>
					<p class="tit2">음주</p>
					<p class="tit3"><font class="red">최근</font>에 음주를 하셨습니까?(1주 내)</p>
					<table class="munjintbl1">
						<tr style="border:0px;">
							<td colspan="4"><button type="button" class="mun2" id="no5button0" value="0" onclick="clickcolor2('no5button0','no5button1','no5num')">아니오</button></td>
						</tr>
						<tr style="border:0px;">
							<td colspan="4"><button type="button" class="mun2" id="no5button1" value="1" onclick="clickcolor2('no5button1','no5button0','no5num')">예</button></td>
						</tr>
					</table>
					<div id="drinkdiv">
						<table class="drinktbl">
							<tr>
								<th>종류(병)</th>
								<th>평소주량</th>
								<th>최대주량</th>
							</tr>
							<tr>
								<th>소주</th>
								<td><input type="text" class="drinktext" name="healthcheck_drink_sdcount" id="soju">병</td>
								<td><input type="text" class="drinktext" name="healthcheck_drink_smcount" id="soju">병</td>
							</tr>
							<tr>
								<th>맥주</th>
								<td><input type="text" class="drinktext" name="healthcheck_drink_brdcount" id="soju">병</td>
								<td><input type="text" class="drinktext" name="healthcheck_drink_brmcount" id="soju">병</td>
							</tr>
							<tr>
								<th>양주</th>
								<td><input type="text" class="drinktext" name="healthcheck_drink_bdcount" id="soju">병</td>
								<td><input type="text" class="drinktext" name="healthcheck_drink_bmcount" id="soju">병</td>
							</tr>
							<tr>
								<th>막걸리</th>
								<td><input type="text" class="drinktext" name="healthcheck_drink_mdcount" id="soju">병</td>
								<td><input type="text" class="drinktext" name="healthcheck_drink_mmcount" id="soju">병</td>
							</tr>
							<tr>
								<th>와인</th>
								<td><input type="text" class="drinktext" name="healthcheck_drink_wdcount" id="soju">병</td>
								<td><input type="text" class="drinktext" name="healthcheck_drink_wmcount" id="soju">병</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="bottombuttondiv">
					<input type="button" id="no5back" class="back" value="뒤로가기" onclick="back('no5','no4')">
					<input type="button" id="no5next" class="next" value="다음으로" onclick="next('no5','no6')">
				</div>
			</div>
		</div>
		<!-- 문진표 5번 -->
		
		<!-- 문진표 6번 -->
		<div id="no6">
			<input type='hidden' name="healthcheck_drink_check" id="no6num">
			<div align="center">
				<div class="divclass" >
					<p class="tit1">신체활동</p>
					<p class="tit2">운동</p>
					<p class="tit3">평소 <font class="red">고강도 또는 중강도</font> 로 운동을 얼마나 하십니까?(1주 내)</p>
					<table class="helthtbl">
						<tr>
							<th>운동량</th>
							<th>일</th>
							<th>시간</th>
							<th>분</th>
						</tr>
						<tr>
							<th>고강도</th>
							<td><input type="text" class="helthtext" id="helth" name="healthcheck_hexercise_day"></td>
							<td><input type="text" class="helthtext" id="helth"name="healthcheck_hexercise_hour"></td>
							<td><input type="text" class="helthtext" id="helth"name="healthcheck_hexercise_min"></td>
						</tr>
						<tr>
							<th>중강도</th>
							<td><input type="text" class="helthtext" id="helth"name="healthcheck_mexercise_day"></td>
							<td><input type="text" class="helthtext" id="helth"name="healthcheck_mexercise_hour"></td>
							<td><input type="text" class="helthtext" id="helth"name="healthcheck_mexercise_min"></td>
						</tr>
					</table>
					<table class="helthtbl1">
						<tr>
							<td>팔굽혀펴기, 윗몸일으키기, 아령, 역기, 철봉 등 근력 운동을 한 날은 얼마입니까?</td>
							<td><input type="text" class="helthtext" id="helth"name="healthcheck_strengthtraining"></td>
						</tr>	
					</table>
				</div>
				<div class="bottombuttondiv">
					<input type="button" id="no6back" class="back" value="뒤로가기" onclick="back('no6','no5')">
					<input type="submit" id="no6next" class="next" value="작성완료">
				</div>
			</div>
		</div>
		<!-- 문진표 6번 -->
		
</form>
<%@include file="../../common/footer.jsp" %>
</body>
</html>
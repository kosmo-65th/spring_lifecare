<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<link type="text/css" rel="stylesheet" href="${path_resources}css/kakao.css">
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
$(document).ready(function(){
	var diagnosis_num = $('input[name=diagnosis_num]').val();
	
	var obj = new Object();
	var customer_payment;
	var customer_amount;
	var diagnosis_time;
	var pay;
	
	$.ajax({
		url : '${pageContext.request.contextPath}/customer/paymentInfo?diagnosis_num=' + diagnosis_num,
		type : 'GET',   // 전송방식
		dataType : 'json', // 요청한 데이터 형식 ("html", "xml", "json", "text")
		success : function(obj) { // 콜백함수 - 전송에 성공했을 때의 결과가 data에 전달된다.
			for(var i=0; i<obj.length; i++) {
				customer_payment = obj[i].customer_payment; 
				customer_amount = obj[i].customer_amount;
				diagnosis_time = obj[i].diagnosis_time;
			}
			var today = new Date(diagnosis_time);
			var year = today.getFullYear(); // 년도
			var month = today.getMonth() + 1;  // 월
			var date = today.getDate();
			var day = String(year) + "년 " + String(month) + "월 " + String(date) + "일";
			
			var amount7 = customer_amount * 0.7; // 공단부담금
			var amount3 = customer_amount * 0.3; // 본인부담금			
			$('#date').html(day); // 날짜 뿌리기
			$('#total').html(customer_amount.toLocaleString());
			$('#amount7').html("-" + Math.round(amount7).toLocaleString());
			$('#amount3').html(Math.round(amount3).toLocaleString());
			$('#amount').val(Math.round(amount3));
		},
		error : function() {
			alert('오류');
		}
	});
});
</script>
</head>
<body onresize="parent.resizeTo(870,550)" onload="parent.resizeTo(870,550)">	
<article id="container" class="mnPayment pgPayment">
	<section class="productName">
		<div class="innerContent">
	  <p><strong>결제하기</strong></p>
		</div>
	</section>

	<section class="sectionDivider paymentMethod">
		<header class="sectionHeader">
			<h1 class="sectionTitle">결제방법</h1>
		</header>

		<div class="selectMethod">
		<div class="smPayco">
			<input type="radio" checked id="payco" name="payment" class="radio selected" >
			<label for="KAKAO"><img src="${path_resources}img/kakaopay.png">간편결제</label>
			<input type="hidden" id="pgMethod" value="PA">
			<input type="hidden" id="pgId" value="PG039">

			<div class="paycoServiceGuide" style="display: block;">
			  <a href="https://www.kakaopay.com/terms/detail?code=KAKAOPAY" target="_blank">KAKAO 이용약관 안내</a>
			</div>
		</div>
	</div>
  </section>

	<section class="sectionDivider email" style="display: none;">
		<header class="sectionHeader">
			<h1 class="sectionTitle">이메일 결제 알림(선택)</h1>
		</header>
		<div class="inputEmail">
			<input type="text" id="inputEmailId"> @ <input type="text" id="inputEmailDomain">
			<span class="selectbox" id="selectEmailDomain">
				<select id="emailSelect"><option value="" selected="">도메인선택</option><option value="naver.com">naver.com</option><option value="hanmail.net">hanmail.net</option><option value="daum.net">daum.net</option><option value="nate.com">nate.com</option><option value="gmail.com">gmail.com</option><option value="hotmail.com">hotmail.com</option><option value="lycos.co.kr">lycos.co.kr</option><option value="empal.com">empal.com</option><option value="cyworld.com">cyworld.com</option><option value="yahoo.com">yahoo.com</option><option value="paran.com">paran.com</option><option value="dreamwiz.com">dreamwiz.com</option><option value="self">직접입력</option></select>
			</span>
		</div>
	</section>

	<section class="paymentInfo">
    <ul class="productPriceInfo">
      <li>
        <strong class="title">기간</strong>
        <span id="date">0000년 00월 00일</span>
      </li>
      <li>
        <strong class="title">총 진료비</strong>
        <span id="total">0원</span>
      </li>
      <li id="productDiscountSummary"><strong class="title">공단부담금</strong><span id="amount7">0원</span></li>
      <li id="cashDiscount"></li>
      <li class="result">
        <strong class="title">본인부담금액 <span>(VAT 별도)</span></strong>
        <span><strong id="amount3">0원</strong></span>
      </li>
      <li class="cardPoint" style="display:none">
        <strong class="title">포인트 사용 시</strong>
        <span id="pointDiscount"><em>0원</em></span>
      </li>
    </ul>
<form action="${path}/customer/kakaoPayGo" method="post" name="pay">
<input type = "hidden" name="${_csrf.parameterName}" value = "${_csrf.token}">
<input type="hidden" name="diagnosis_num" id="diagnosis_num" value="${diagnosis_num}">
<input type="hidden" name="amount" id="amount" value="">
	<div class="btns">
	  <button class="btnAccent--l" id="btnBuy" onClick="javascript:document.pay.submit()">결제하기</button>
	</div>
</form>
  <div class="cardPointUsed" style="display:none">
    <input type="checkbox" id="pointUsed" class="checkbox">
    <label for="pointUsed" id="cardPointUseGuide">마이신한포인트 100% 사용합니다.</label>
    <ul id="cardPointUseDetailGuide">
    </ul>
  </div>

	</section>

	<section class="sectionDivider caution">
		<header class="sectionHeader">
			<h1 class="sectionTitle">이용안내</h1>
		</header>
<ul>					
<li>카카오톡에서 신용/체크카드 연결하고, 결제도 지문으로 쉽고 편리하게 이용하세요!</li>
<li>본인명의 스마트폰에서 본인명의 카드 등록 후 사용 가능</li>
<li>(카드등록 : 카카오톡 > 더보기 > 카카오페이 > 카드)</li>
<li>이용가능 카드사 : 모든 국내 신용/체크카드</li>
<li>카카오페이는 무이자할부 및 제휴카드 혜택 내용과 관계가 없으며, 자세한 사항은 카카오페이 공지사항에서 확인하실 수 있습니다.</li></ul>
	</section>
</article>

</body>
</html>
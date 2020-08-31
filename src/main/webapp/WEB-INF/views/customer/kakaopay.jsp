<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<link type="text/css" rel="stylesheet" href="${path_resources}css/kakao.css">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onresize="parent.resizeTo(870,550)" onload="parent.resizeTo(870,550)">

<article id="container" class="mnPayment pgPayment">
	<section class="productName">
		<div class="innerContent">
	  <p><strong>결제하기</strong></p>
	  <span>(0000년 00월 00일 00시 00분)</span>
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
        <span>0000년 00월 00일</span>
      </li>
      <li>
        <strong class="title">총 진료비</strong>
        <span>7,900원</span>
      </li>
      <li id="productDiscountSummary"><strong class="title">공단부담금</strong><span>-3,950원</span></li>
      <li id="cashDiscount"></li>
      <li class="result">
        <strong class="title">본인부담금액 <span>(VAT 별도)</span></strong>
        <span><strong id="payPrice">3,950원</strong></span>
      </li>
      <li class="cardPoint" style="display:none">
        <strong class="title">포인트 사용 시</strong>
        <span id="pointDiscount"><em>0원</em></span>
      </li>
    </ul>
<form action="${path}/kakaoPayGo" method="post" name="pay">
<input type = "hidden" name="${_csrf.parameterName}" value = "${_csrf.token}">
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
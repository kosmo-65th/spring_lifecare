<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<link type="text/css" rel="stylesheet" href="${path_resources}css/payment.css">
<html>
<body>

<%@include file="../common/header.jsp" %>

<div class="body">
<br><br>
<fieldset class="payment">
<h3>정덴트님의 수납내역</h3>
<div class="tablePay">    
    <div class="row1 header blue">
      <div class="cell1">
          	구 분
      </div>
      <div class="cell1">
        	진료날짜
      </div>
      <div class="cell1">
        	수납자
      </div>
      <div class="cell1">
        	총진료비
      </div>
      <div class="cell1">
        	공단부담금
      </div>
      <div class="cell1">
        	환자부담금
      </div>
      <div class="cell1">
        	총수납액
      </div>
      <div class="cell1">
        	미수금
      </div>
    </div>
    
    <div class="row1">
      <div class="cell1">
        	건강보험
      </div>
      <div class="cell1">
        2020-08-27
      </div>
      <div class="cell1">
        	정덴트
      </div>
      <div class="cell1">
        10,000
      </div>
      <div class="cell1">
        6,000
      </div>
      <div class="cell1">
        4,000
      </div>
      <div class="cell1">
        0
      </div>
      <div class="cell1">
        <a style="color:red;" onclick="window.open('${path}/kakaopay', 'kakaopay', 'resizable=no width=850, height=550'); return false;">4,000</a>
      </div>
    </div>
    
    <div class="row1">
      <div class="cell1">
        	건강보험
      </div>
      <div class="cell1">
        2020-08-26
      </div>
      <div class="cell1">
        	정덴트
      </div>
      <div class="cell1">
        10,000
      </div>
      <div class="cell1">
        6,000
      </div>
      <div class="cell1">
        4,000
      </div>
      <div class="cell1">
        4,000
      </div>
      <div class="cell1">
        0
      </div>
    </div>
    
    <div class="row1">
      <div class="cell1">
        	건강보험
      </div>
      <div class="cell1">
        2020-08-25
      </div>
      <div class="cell1">
        	정덴트
      </div>
      <div class="cell1">
        15,000
      </div>
      <div class="cell1">
        9,000
      </div>
      <div class="cell1">
        6,000
      </div>
      <div class="cell1">
        6,000
      </div>
      <div class="cell1">
        0
      </div>
    </div>
    
    <div class="row1">
      <div class="cell1">
        	건강보험
      </div>
      <div class="cell1">
        2020-08-24
      </div>
      <div class="cell1">
        	정덴트
      </div>
      <div class="cell1">
        20,000
      </div>
      <div class="cell1">
        13,000
      </div>
      <div class="cell1">
        7,000
      </div>
      <div class="cell1">
        7,000
      </div>
      <div class="cell1">
        0
      </div>
   </div>
   
   <div class="row1">
      <div class="cell1">
        	<b>합계</b>
      </div>
      <div class="cell1">
        
      </div>
      <div class="cell1">
        	
      </div>
      <div class="cell1">
        <b>45,000</b>
      </div>
      <div class="cell1">
        <b>34,000</b>
      </div>
      <div class="cell1">
        <b>21,000</b>
      </div>
      <div class="cell1">
        <b>17,000</b>
      </div>
      <div class="cell1">
        <b><a style="color:red;" onclick="window.open('${path}/kakaopay', 'kakaopay', 'resizable=no width=850, height=550'); return false;">4,000</a></b>
      </div>
    </div>
</div>
<p class="tail">* 미수금을 클릭하면 결제페이지로 이동하여 결제가 가능합니다.</p>
</fieldset>

<br><br>

<fieldset class="payment">
<h3>2020년 08월 27일 진료비 내역</h3>
<div class="tablePay">    
    <div class="row1 header green">
      <div class="cell1">
          	총진료비
      </div>
      <div class="cell1">
          	공단부담금
      </div>
      <div class="cell1">
          	보험본인부담금
      </div>
      <div class="cell1">
          	공제금제외
      </div>
    </div>
    <div class="row1">
      <div class="cell1">
        	10,000
      </div>
      <div class="cell1">
        	6,000
      </div>
      <div class="cell1">
        	4,000
      </div>
      <div class="cell1">
        	0
      </div>          
    </div>
    
    <div class="row1 header green">
      <div class="cell1">
          	비급여
      </div>
      <div class="cell1">
          	부가가치세
      </div>
      <div class="cell1">
          	미수금
      </div>
      <div class="cell1">
          	할인금액
      </div>
    </div>
    <div class="row1">
      <div class="cell1">
        	0
      </div>
      <div class="cell1">
        	0
      </div>
      <div class="cell1">
        	<a style="color:red;" onclick="window.open('${path}/kakaopay', 'kakaopay', 'resizable=no width=850, height=550'); return false;">4,000</a>
      </div>
      <div class="cell1">
        	0
      </div>          
    </div>    
</div>
<div class="light">	  		
		<ul>
       		<li><a class="large button green" onclick="window.open('${path}/diagnosis', '진단서발급', 'resizable=no width=750, height=600'); return false;">진단서 발급</a></li>
       		<li><a class="large button green" onclick="window.open('${path}/medicalNote', '진료기록부발급', 'resizable=no width=750, height=600'); return false;">진료기록부 발급</a></li>
       		<li><a class="large button green" onclick="window.open('${path}/prescription', '처방전발급', 'resizable=no width=750, height=600'); return false;">처방전 발급</a></li>
		</ul>
		<p class="tail">* 미수금을 클릭하면 결제페이지로 이동하여 결제가 가능합니다.</p>
</div>
</fieldset>
</div>
<%@include file="../common/footer.jsp" %>
</body>
</html>
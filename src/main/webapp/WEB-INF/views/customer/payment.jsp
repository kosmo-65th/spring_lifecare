<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<link type="text/css" rel="stylesheet" href="${path_resources}css/payment.css">
<html>
<script type="text/javascript">
$(document).ready(function(){
	
	$('input:radio[name=select]').click(function(){
		
		var diagnosis_num = $('input:radio[name=select]:checked').val();
		document.getElementById('diagnosis_num').value = diagnosis_num;
		
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
				var day = String(year) + "년 " + String(month) + "월 " + String(date) + "일 진료비 내역";
				
				var amount7 = customer_amount * 0.7; // 공단부담금
				var amount3 = customer_amount * 0.3; // 본인부담금
				
				// customer_payment가 0이면 미수금 출력 1이면 미수금 출력x
				if(customer_payment == 0) {
					pay = "<a href=\"javascript:void(0);\" style=\"color:red;\" onclick=\"window.open('${path}/customer/kakaopay?diagnosis_num=" + diagnosis_num + "', 'kakaopay', 'resizable=no width=850, height=550'); return false;\">" + Math.round(amount3).toLocaleString() + "</a>";
				} else {
					pay = 0;
				}
				
				$('#date').html(day); // 날짜 뿌리기
				$('#total').html(customer_amount.toLocaleString());
				$('#amount7').html(Math.round(amount7).toLocaleString());
				$('#amount3').html(Math.round(amount3).toLocaleString());
				$('#pay').html(pay);
				
			},
			error : function() {
				alert('오류');
			}
		});
		
	});
	
	$('#diagnosisform').click(function(){
		
		var diagnosis_num = $('input:radio[name=select]:checked').val();
		var pay = $('#pay').text();
		
		if(pay != "0"){
			alert("미결제 진료분은 조회하실수 없습니다.");
		}else{
			window.open('${pageContext.request.contextPath}/Medicalrecords/diagnosisprint?diagnosis_num=' + diagnosis_num , '진단서 발급', 'resizable=no width=750, height=600');
		}
		
	});
	
	$('#medishow').click(function(){
		
		var diagnosis_num = $('input:radio[name=select]:checked').val();
		var pay = $('#pay').text();
		
		if(pay != "0"){
			alert("미결제 진료분은 조회하실수 없습니다.");
		}else{
			window.open('${pageContext.request.contextPath}/Medicalrecords/medicalPrint?diagnosis_num=' + diagnosis_num , '진료기록부 발급', 'resizable=no width=750, height=600');
		}
		
	});
	
	$('#showpres').click(function(){
		
		var diagnosis_num = $('input:radio[name=select]:checked').val();
		var pay = $('#pay').text(); 
		
		if(pay != "0"){
			alert("미결제 진료분은 조회하실수 없습니다.");
		}else{
			window.open('${pageContext.request.contextPath}/Medicalrecords/prescriptionprint?diagnosis_num=' + diagnosis_num , '처방전 발급', 'resizable=no width=750, height=600');
		}
		
	});
});
</script>
<body>

<%@include file="../common/header.jsp" %>

<div class="body">
<br><br>
<fieldset class="payment">
<h3 style = "font-size:30px">수납내역 조회 결과</h3>
<div class="tablePay">    
    <div class="row1 header blue">
      <div class="cell1">
          	&nbsp;
      </div>
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
    <c:forEach var="j" items="${list}">
    <input type = "hidden" id="diagnosis_num" value="">
    <div class="row1">           
      <div class="cell1">
        	<input type="radio" name="select" value="${j.getDiagnosis_num()}">
      </div>
      <div class="cell1">
        	건강보험
      </div>
      <div class="cell1">
        	${j.getDiagnosis_time()}
      </div>
      <div class="cell1">
        	${j.getCustomer_id()}
      </div>
      <div class="cell1">
       	    <fmt:formatNumber value="${j.getCustomer_amount()}" pattern="#,###"/>
      </div>
      <div class="cell1">
        	<fmt:formatNumber value="${j.getCustomer_amount() * 0.7}" pattern="#,###"/>
      </div>
      <div class="cell1">
        	<fmt:formatNumber value="${j.getCustomer_amount() * 0.3}" pattern="#,###"/>
      </div>
      <c:if test="${j.getCustomer_payment() == 0}">
      <div class="cell1">
        	0
      </div>
      <div class="cell1">
        <a href="javascript:void(0)" style="color:red;" onclick="window.open('${path}/customer/kakaopay?diagnosis_num=${j.getDiagnosis_num()}', 'kakaopay', 'resizable=no width=850, height=550'); return false;"><fmt:formatNumber value="${j.getCustomer_amount() * 0.3}" pattern="#,###"/></a>
      </div>
      </c:if>
      <c:if test="${j.getCustomer_payment() == 1}">
      <div class="cell1">
        	<fmt:formatNumber value="${j.getCustomer_amount() * 0.3}" pattern="#,###"/>
      </div>
      <div class="cell1">
        	0
      </div>
      </c:if>
     </div> 
      </c:forEach>        
</div>
<p class="tail">* 미수금을 클릭하면 결제페이지로 이동하여 결제가 가능합니다.</p>
<!-- 페이지 컨트롤 -->
<table style="width:1000px; text-align:center;">
	<tr>
		<th align="center">
			<!-- 게시글이 있는 경우 -->
			<c:if test="${cnt > 0}">
				
				<!-- 처음[◀◀] / 이전블록[◀] -->
				<c:if test="${startPage > pageBlock}">
					<a href="${path}/customer/payment"> [◀◀] </a>
					<a href="${path}/customer/payment?pageNum=${startPage - pageBlock}"> [◀] </a>
				</c:if>
				
				<!-- 블록내의 페이지 번호 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
					<span><b>[${i}]</b></span>
					</c:if>
					<c:if test="${i != currentPage}">
					<a href="${path}/customer/payment?pageNum=${i}">[${i}]</a>
					</c:if>
				</c:forEach>
				<!-- 다음블록[▶] / 마지막[▶▶] -->
				<c:if test="${pageCount > endPage}">
					<a href="${path}/customer/payment?pageNum=${startPage + pageBlock}"> [▶] </a>
					<a href="${path}/customer/payment?pageNum=${pageCount}"> [▶▶] </a>
				</c:if>
			</c:if>
		</th>
	</tr>
</table>
</fieldset>

<br><br>

<fieldset class="payment">
<h3 id="date" style = "font-size:30px">0000년 00월 00일 진료비 내역</h3>
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
      <div class="cell1" id="total">
        	0
      </div>
      <div class="cell1" id="amount7">
        	0
      </div>
      <div class="cell1" id="amount3">
        	0
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
      <div class="cell1" id="pay">
        	0
      </div>
      <div class="cell1">
        	0
      </div>          
    </div>    
</div>
<div class="light">	  			
		<ul style="float: right;">
       		<li style="display:inline;"><a class="large button green" href="javascript:void(1)" id = "diagnosisform" style="margin-left:572px">진단서 발급</a></li>
       		<li style="display:inline;"><a class="large button green" href="javascript:void(1)" id = "medishow">진료기록부 발급</a></li>
       		<li style="display:inline;"><a class="large button green" href="javascript:void(1)" id = "showpres">처방전 발급</a></li>
		</ul>
		<p class="tail">* 미수금을 클릭하면 결제페이지로 이동하여 결제가 가능합니다.</p>
</div>
</fieldset>
</div>
<%@include file="../common/footer.jsp" %>
</body>
</html>
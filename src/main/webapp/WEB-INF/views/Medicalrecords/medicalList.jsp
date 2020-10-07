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

<h3 style = "font-size:30px">진료 기록부 조회 결과</h3>

<form name="form" method="post">
	
	<div class="tablePay" style = "display:grid">    
	    <div class="row1 header blue">
	      <div class="cell1" style = "width : 250px">
	          	진료번호
	      </div>
	      <div class="cell1" style = "width : 21%">
	        	진료날짜
	      </div>
	      <div class="cell1" style = "width : 16%">
	        	환자명
	      </div>
	      <div class="cell1" style = "width : 16%">
	        	주치의
	      </div>
	      <div class="cell1" style = "width : 21%">
	        	내방과
	      </div>
	      <div class="cell1" style = "width : 16%">
	        	진료비
	      </div>
	    </div>
	
		<c:if test="${cnt > 0}">
		
			<c:forEach var = "dto" items = "${dtos}">    
			
				<div class="row1" id = "frame">	
					<input type="hidden" id="hidden${dto.diagnosis_num}" value="0">
				      <div class="cell1" id ="load" onClick="show(${dto.diagnosis_num})" style = "width : 250px">
				        	${dto.diagnosis_num}
				      </div>
				      <div class="cell1" onClick="show(${dto.diagnosis_num})" style = "width : 21%">
				        	<fmt:formatDate type = "both" pattern = "yyyy-MM-dd" value = "${dto.diagnosis_time}"/>      	
				      </div>
				      <div class="cell1" onClick="show(${dto.diagnosis_num})"style = "width : 16%">
				        	${dto.customer_name}
				      </div>
				      <div class="cell1" onClick="show(${dto.diagnosis_num})"style = "width : 16%">
				        	${dto.doctor_name}
				      </div>
				      <div class="cell1" onClick="show(${dto.diagnosis_num})"style = "width : 21%">
				        	${dto.doctor_major}
				      </div>
				      <div class="cell1" onClick="show(${dto.diagnosis_num})"style = "width : 16%">
				        	${dto.customer_amount}
				      </div>      
				</div> 
				
				<br>
				
				<div id= "content${dto.diagnosis_num}" style = "display:none" ></div> 
			
			</c:forEach>
		</c:if>
	</div>
</form>
</fieldset>
</div>
<%@include file="../common/footer.jsp" %>
<script type="text/javascript">
	function show(num){		
		var chk = document.getElementById('hidden'+num).value;	
		if(chk == 0) {			
			document.getElementById('hidden'+num).value = 1;
			$.ajax({
				url: '${pageContext.request.contextPath}/Medicalrecords/medicalNote?${_csrf.parameterName}=${_csrf.token}',
				type: 'POST',
				data: 'diagnosis_num='+num,
				success: function (result) {
					$('#content'+num).css('display','block');					
		        	$('#content'+num).html(result);		        	
		        },
		        error : function(){
		        	alert("조회 과정중 에러 발생");
		        }
			});			
		} else {			
			$('#content'+num).css('display','none');
			document.getElementById('hidden'+num).value = 0;
		}			
	}
</script>
</body>
</html>
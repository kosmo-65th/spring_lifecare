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
</style>
<script type="text/javascript">

	/* 한가지만 선택 할수있도록 */
    $(function(){
    	
    	$("#button0").click(function(){
			$("#button0").css('background-color','#009aff');
			$("#button1").css('background-color','#F2F2F2');
			$("#button0").val(1);
			$("#button1").val(0);
			
			console.log("button0 val");
			console.log(document.getElementById("button0").value);
			console.log("button1 val");
			console.log(document.getElementById("button1").value);
		});
    	
    	$("#button1").click(function(){
			$("#button1").css('background-color','#009aff');
			$("#button0").css('background-color','#F2F2F2');
			$("#button0").val(0);
			$("#button1").val(1);
			
			console.log("button0 val");
			console.log(document.getElementById("button0").value);
			console.log("button1 val");
			console.log(document.getElementById("button1").value);
		});
    })
    
</script>
<head>
<meta charset="UTF-8">
<title>문진표</title>
</head>
<body>
<%@include file="../../common/header.jsp" %>
<form action="${path}/index4" name="index3form" method="post">
<input type ="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<div align="center">
		<div class="divclass" >
			<p class="tit1">흡연 및 전자담배</p>
			<p class="tit2">일반담배(궐련)</p>
			<p class="tit3">지금까지 평생 총 5갑(100개비)이상의 일반담배(궐련)를 피운적이 있습니까?</p>
			<table class="munjintbl1">
				<tr style="border:0px;">
					<td colspan="4"><button type="button" class="mun2" name="" id="button0" value="0"  onclick="setColor('button0')" >아니오</button></td>
				</tr>
				<tr style="border:0px;">
					<td colspan="4"><button type="button" class="mun2" name="" id="button1" value="0"  onclick="setColor('button1')" >예</button></td>
				</tr>
			</table>
		</div>
		<div class="bottombuttondiv">
			<input type="button" class="back" value="뒤로가기" onclick="history.back()">
			<input type="submit" class="next" value="다음으로">
		</div>
	</div>
</form>
<%@include file="../../common/footer.jsp" %>
</body>
</html>
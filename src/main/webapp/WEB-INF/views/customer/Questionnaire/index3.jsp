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
			<p class="tit1">질환력(과거력 ,가족력)</p>
			<p class="tit2">B형간염</p>
			<p class="tit3">B형간염 바이러스 보유자입니까?</p>
			<table class="munjintbl1">
				<tr style="border:0px;">
					<td colspan="4"><button type="button" class="mun2" name="" id="button0" value="0"  onclick="setColor('button0')" >예</button></td>
				</tr>
				<tr style="border:0px;">
					<td colspan="4"><button type="button" class="mun2" name="" id="button1" value="0"  onclick="setColor('button1')" >아니오</button></td>
				</tr>
				<tr style="border:0px;">
					<td colspan="4"><button type="button" class="mun2" name="" id="button2" value="0"  onclick="setColor('button2')" >모름</button></td>
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
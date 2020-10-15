<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
/* UI Object */
.tbl_type {
	margin-left: 120px;
	margin-top: 40px;
}

.tbl_type, .tbl_type th, .tbl_type td {
	border: 1px solid #000;
	text-align: center;
}

.tbl_type {
	width: 750px;
	font-family: '돋움', dotum;
	font-size: 12px;
	text-align: center;
	border-collapse: collapse
}

.tbl_type caption {
	display: none
}

.tbl_type tfoot {
	background-color: #f5f7f9;
	font-weight: bold
}

.tbl_type th {
	padding: 15px 0.5 20px;
	background-color: #4c4c4c1a;
	color: #000;
	font-family: '돋움', dotum;
	font-size: 15px;
	font-weight: 700;
}

.tbl_type td {
	padding: 6px 0 4px;
	color: #4c4c4c;
	font-size: 15px;
}

.tbl_type td.ranking {
	font-weight: bold
}
/* //UI Object */
.button-primary {
	margin-top: 20px;
	margin-left: 420px;
	background-color: #35cebe;
	border: 0.1rem solid #35cebe;
	border-radius: 499rem;
	font-size: 1rem;
	color: #fff;
	cursor: pointer;
	display: inline-block;
	font-weight: 700;
	width: 160px;
	height: 2.8rem;
	line-height: 2.8rem;
	text-align: center;
	text-decoration: none;
	text-transform: uppercase;
	white-space: nowrap;
}

.pT  {
	font-size: 7px;
	color: grey;
}
.greens{
	color:#64CD3C;
	font-size:16px;	
}

.oranges{
	color:#FF8200;
    font-style: italic;
    font-size:18px;
}
.reds{
	color:#EB0000;	
	font-weight:bold;
	font-style: italic;
	font-size:20px;
}
</style>
<script type="text/javascript">
// 기초검사 결과 수정
$(function() {
    $('#updateEx_result').click(function() {
    	var ex_result = $("#ex_result").val();
		var ex_num = $("#ex_num").val();
		
		window.location = "${path}/doctor/basic_exPro?ex_num="+ex_num+"&ex_result="+ex_result;
    });
});

</script>



<title>기초검사결과</title>
</head><br><br>
<img  style="margin-left:350; height:50px;" src="/lifecare/resources/img/logo.png">
<body onresize="parent.resizeTo(1000,1000)" onload="parent.resizeTo(1000,1000)">
<!--ui object -->

<table class="tbl_type" border="1">
<tr>
<th colspan="4" style="font-size:25px; font-family:'돋움',dotum; font-weight: bold;">기초검사결과</th>
</tr>
<tr>
<th>이름</th>
<td>${vo.getCustomer_name()}</td>
<th>성별</th>
<td>${vo.getCustomer_gender()}</td>
</tr>
<tr>
<th>키</th>
<td>${vo.getHeight()}</td>
<th>몸무게</th>
<td>${vo.getWeight()}</td>
</tr>
<tr>
<script type="text/javascript">
//tc
$(function(){
	var val  = document.getElementById("tc").innerText;
	var value = parseInt(val);
		if (value <= 200){
	        $("#tc").addClass('greens');
	    }
	    if(value > 200 && value <= 240){
	        $("#tc").addClass('oranges');
	    }
	    if(value >240){
	        $("#tc").addClass('reds');
 		}
});  

//tg
$(function(){
	var val  = document.getElementById("tg").innerText;
	var value = parseInt(val);
	if (value <= 200){
        $("#tg").addClass('greens');
		 $("#tg").removeClass('reds');
	}
    else{
        $("#tg").addClass('reds');
		 $("#tg").removeClass('greens');
    }
	if(value == ""){
		 $("#tg").removeClass('reds');
		 $("#tg").removeClass('greens');
	}
});
//ldl
$(function(){
	var val  = document.getElementById("ldl").innerText;
	var value = parseInt(val);
	if (value <= 130){
	      $("#ldl").addClass('greens');
	  }
	  if(value > 130 && value <= 160){
	      $("#ldl").addClass('oranges');
	  }
	  if(value >160){
	      $("#ldl").addClass('reds');
	 }
});
//hdl
$(function(){
	var val  = document.getElementById("hdl").innerText;
	var value = parseInt(val);
	 if(value >= 60){
    	$("#hdl").addClass('greens');
    }	
    else{
    	$("#hdl").addClass('reds');
    }
});
//b1
$(function(){
	var val  = document.getElementById("b1").innerText;
	var value = parseInt(val);
	 if(value < 120){
	    	$("#b1").addClass('greens');
	    }
    else{
    	$("#b1").addClass('reds');
    }
});

//b2
$(function(){
	var val  = document.getElementById("b2").innerText;
	var value = parseInt(val);
	 if(value < 80){
	    	$("#b2").addClass('greens');
	    }
    else{
    	$("#b2").addClass('reds');
    }
});
//bs
$(function(){
	var val  = document.getElementById("bs").innerText;
	var value = parseInt(val);
	  if (value < 80){
	      $("#bs").addClass('oranges');
	  }
	  if(value >= 80 && value <= 100){
	      $("#bs").addClass('greens');
	  }
	  if(value >100){
	      $("#bs").addClass('reds');
	 }
});
//백혈구
$(function(){
	var val  = document.getElementById("white").innerText;
	var value = parseInt(val);
	 if(value >= 4000 && value <=10000){
	    	$("#white").addClass('greens');
	  }else{
	    	$("#white").addClass('reds');
	  }
});
//혈색소
$(function(){
	var val  = document.getElementById("platelet").innerText;
	var value = parseInt(val);
	if(value >= 12 && value <=16.5){
    	$("#platelet").addClass('greens');
    }else{
    	$("#platelet").addClass('reds');
    }
});
//AST
$(function(){
	var val  = document.getElementById("ast").innerText;
	var value = parseInt(val);
	 if(value >= 13 && value <= 40){
	    	$("#ast").addClass('greens');
    }else{
    	$("#ast").addClass('reds');
    }
});
//ALT
$(function(){
	var val  = document.getElementById("alt").innerText;
	var value = parseInt(val);
	  if(value >= 7 && value <= 40){
    	$("#alt").addClass('greens');
    }else{
    	$("#alt").addClass('reds');
    }
});
//gtp
$(function(){
	var val  = document.getElementById("gtp").innerText;
	var value = parseInt(val);
	 if(value >= 8 && value <= 63){
    	$("#gtp").addClass('greens');
    }else{
    	$("#gtp").addClass('reds');
    }
});
//요단백
$(function(){
	var value  = document.getElementById("kidney1").innerText;
	if(value == "음성"){
    	$("#kidney1").addClass('greens');
    }
    if(value == "양성"){
    	$("#kidney1").addClass('reds');
    }
});
//요소질소
$(function(){
	var val  = document.getElementById("kidney2").innerText;
	var value = parseInt(val);
	 if(value >=6 && value <=20){
    	$("#kidney2").addClass('greens');
    }else{
    	$("#kidney2").addClass('reds');
    }
});
//혈창크레아티닌
$(function(){
	var val  = document.getElementById("kidney3").innerText;
	var value = parseInt(val);
	if(value <=1.5){
    	$("#kidney3").addClass('greens');
    }else{
    	$("#kidney3").addClass('reds');
    }
});

//사구체여과율
$(function(){
	var val  = document.getElementById("kidney4").innerText;
	var value = parseInt(val);
	if(value >=60){
    	$("#kidney4").addClass('greens');
    }else{
    	$("#kidney4").addClass('reds');
    }
});
</script>
<th>총콜레스테롤<p class ="pT">(200mg/dl이하)</p></th>
<td ><span id="tc">${vo.getTc()}</span>mg/dl</td>
<th>중성지방<p class ="pT">(200mg/dl이하)</p></th>
<td ><span id="tg">${vo.getTg()}</span>mg/dl</td>
</tr>
<tr>
<th>저밀도지단백 콜레스테롤<p class ="pT">(130mg/dl이하)</p></th>
<td><span id=ldl>${vo.getLdl()}</span>mg/dl</td>
<th>고밀도지단백 콜레스테롤<p class ="pT">(60mg/dl이상)</p></th>
<td><span id=hdl>${vo.getHdl()}</span>mg/dl</td>
</tr>
<tr>
<th>수축기혈압<p class ="pT">(120mmHg미만)</p></th>
<td><span id=b1>${vo.getBlood1()}</span>mm/Hg</td>
<th>이완기혈압<p class ="pT">(80mmHg미만)</p></th>
<td><span id=b2>${vo.getBlood2()}</span>mm/Hg</td>
</tr>
<tr>
<th colspan="2">공복혈당<p class ="pT">(80mg/dL~100mg/dL)</p></th>
<td colspan="2"><span id="bs">${vo.getBloodSugar()}</span>mm/Hg</td>
</tr>
<tr>
<th>백혈구<p class ="pT">(4천~1만개)</p></th>
<td><span id="white">${vo.getWhite()}</span>개</td>
<th>혈색소<p class ="pT">(12~16.5g/dL)</p></th>
<td><span id="platelet">${vo.getHb()}</span>g/dL</td>
</tr>
<tr>
<th>AST<p class ="pT">(13~40IU/L이하)</p></th>
<td><span id="ast">${vo.getAst()}</span>IU/L</td>
<th>ALT<p class ="pT">(7~40IU/L이하)</p></th>
<td><span id="alt">${vo.getAlt()}</span>IU/L</td>
</tr>
<tr>
<th colspan="2">r-GTP<p class ="pT">(8~63IU/L)</p></th>
<td colspan="2"><span id="gtp">${vo.getGtp()}</span>IU/L</td>
</tr>
<tr>
<th>요단백</th>
<td><span id="kidney1">${vo.getKidney1()}</span></td>
<th>요소질소<p class ="pT">(6~20mg/dL)</p></th>
<td><span id="kidney2">${vo.getKidney2()}</span>mg/dL</td>
</tr>
<tr>
<th>혈창크레아티닌<p class ="pT">(1.5mg/dL이하)</p></th>
<td><span id="kidney3">${vo.getKidney3()}</span>mg/dL</td>
<th>사구체여과율<p class ="pT">(60ml/min이상)</p></th>
<td><span id="kidney4">${vo.getKidney4()}</span>mg/min</td>
</tr>
<tr>
<th colspan="4" style="font-size:15px;">의사소견</th>
</tr>
<tr style="height:100px;">
<td colspan="4" style="padding:0px 0px 0px;"><textarea id="ex_result" style="text-align:center; resize: none; font-size: 20px; font-weight: 500; width:100%; height:110px; vertical-align:middle;">${vo.getEx_result()}</textarea></td>
</tr>
</table>
<input type="button" class="button-primary" value="검사기록저장" id="updateEx_result">
<input type="hidden" id="ex_num" value="${vo.getEx_num()}">
<!--//ui object -->
</body>
</html>
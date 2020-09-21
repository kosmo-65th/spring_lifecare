<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %> 
<!DOCTYPE html>
<html>
<style>
	.slt1{
		opacity:1 !important;
		height:30px !important;
		width:80px !important;
	}
	
	.slt2{
		opacity:1 !important;
		height:30px !important;
		width:57px !important;
	}
	
	.slt3{
		opacity:1 !important;
		height:30px !important;
		width:57px !important;
	}
	
	.feForm.feFoSelect{
		height:35px !important; 	
	}
</style>
<head>
	<meta charset="utf-8" />
	<meta name="author" content="www.eo-m.com" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">
    <meta name="format-detection" content="telephone=no" />
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" /> 
	<meta http-equiv="Pragma" content="no-cache" />

	<title>문진표</title>

	<script type="text/javascript" src="${path_resources}js/Questionnaire.js"></script>
	<script type="text/javascript" src="${path_resources}js/func.js"></script>

	<link rel="stylesheet" type="text/css" href="${path_resources}css/Questionnaire.css" />

</head>

<body>
	<%@include file="../../common/header.jsp" %>
<div id="info" class="main_bg_bottom">

	<div class="title">정보 입력 화면</div>

	<div class="sub_Main">

		<div class="exp"> 문진표 작성을 위해<br>필요한 정보를 입력해주세요.</div>

		<form  action="${path}/index1" name="frm" method="post">
		<input type ="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden" name="part" value="login">
		<input type="hidden" name="mehId" value="GV3517">
		<input type="hidden" name="mtype" value="1">

		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="inputInfo" align="center">
			<tr>
				<TD class="td_T">이름</TD>
				<TD class="td_C"><input type="text" name="memName" maxlength="20" style="width:80%;" class="mm_input_select" placeholder="Name"></TD>
			</tr>
			<tr>
				<TD class="td_T">생년월일</TD>
				<TD  class="td_C">
					<select name="memReg1" class="slt1">
						<c:forEach var="year" begin="1900" end="2020">
							<option value="${year}">${year}</option>						
						</c:forEach> 
					</select>
					<select name="memReg2" class="slt2"style="opacity:1;">
						<c:forEach var="month" begin="1" end="12">
							<option value="${month}">${month}</option>						
						</c:forEach> 
					</select>
					<select name="memReg3" class="slt3"style="opacity:1;">
						<c:forEach var="day" begin="1" end="31">
							<option value="${day}">${day}</option>						
						</c:forEach> 
					</select>
				</TD>
			</tr>
			<tr>
				<TD class="td_T">성별</TD>
				<TD class="td_C">
					<label><input type="radio" name="memSex" value="1" class="input_radio"> 남 (Male)</label>&nbsp;&nbsp;
					<label><input type="radio" name="memSex" value="2" class="input_radio"> 여 (Female)</label>
				</TD>
			</tr>
			<tr>
				<TD class="td_T">휴대전화</TD>
				<TD class="td_C">
					<input type="tel" name="memMobile" size="14" maxlength="13" class="mm_input_select" style="width:80%;" value="" onkeydown="MaskPhon(this);" onkeyup="MaskPhon(this);" placeholder="Phone number">
				</TD>
			</tr>
			
			<tr>
				<TD class="td_T"><span class="txt_mobileView">개인정보<br>취급방침</span><span class="txt_pcView">개인정보취급방침</span></TD>
				<TD class="td_C">
					<table>
						<tr>
							<td><span onclick="javascript:view_agree();" class="agree_viewBtn_2">[개인정보취급방침 전문확인] 〉</span></td>
						</tr>
						<tr>
							<td>
								<label><input type="radio" name="memAgree" value="Y"> 동의</label>&nbsp;
								<label><input type="radio" name="memAgree" value="N"> 동의하지 않음</label>
							</td>
						</tr>
					</table>
				</TD>
			</tr>
			
			<tr>
				<td class="td_bLine" colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2" height="80" align="center">
					<a href="javascript:;" class="startBtn" onClick="javascript:info_ok();">입력하기</a>
				</td>
			</tr>
		</table>
		</form>
	</div>
	<%@include file="../../common/footer.jsp" %>
</div>
<script>
function info_ok()
{
	var f=document.frm;

	if(f.memName.value=="")
	{
		alert("이름을 입력하세요.");
		f.memName.focus();
		return false;
	}

	if($("input:radio[name='memSex']").is(':checked')==false)
	{
		alert("성별을 선택하세요.");
		f.memSex.focus();
		return false;
	}

	if(!WEBF_chkCphone(f.memMobile.value))
	{
		alert("휴대전화를 입력하세요.");
		f.memMobile.focus();
		return false;
	}

	
	var memAgreeVal = $(":radio[name='memAgree']:checked").val();

	if(memAgreeVal!="Y")
	{
		alert("개인정보취급방침에 동의하셔야 서비스를 이용하실 수 있습니다.");
		f.memAgree.focus();
		return false;
	}
	

	f.submit();
}

function view_agree()
{
	$("#main_wrap").show();
	$("#commentDiv").show();
}

function close_agree()
{
	$("#main_wrap").hide();
	$("#commentDiv").hide();
}
</script>
<style>
.main_pop { position:absolute; top:0px; left:0px; width:100%; height:100%; z-index:1000; }
.main_wrap { position:fixed; top:0px; left:0px; width:100%; height:100%; z-index:900; background-color:#000; opacity:0.7;}
</style>

<div id="main_wrap" class="main_wrap" style="display:none;"><!-- 배경 흐리게 --></div>

<div id="loadingDiv" class="main_pop" style="display:none;">
	<div style="position:relative; top:50%; width:100%; text-align:center;  margin:-25px 0 0 0;">
		<img src="/images/loading.gif">
	</div>
</div>
<script>
//해설서 보기
function loading()
{
	$("#main_wrap").show();
	$("#loadingDiv").show();
}
</script>

<div id="commentDiv" style="display:none;"><style>
.agreeInputBox { position:absolute; top:10%; left:50%; margin-left:-350px; width:700px; background-color:white; border:2px solid #165c82; border-radius:20px; text-align:center; font-size:14px; line-height:220%; }

.innerBox { padding:15px 7%; }

.agree_title { font-size:26px; font-weight:700; color:black; border-bottom:2px solid #009aff; padding:12px 0 16px; text-align:center; }

.agreeCloseBtn { width:35px; height:35px; background:#000; border-radius:18px; border:0; padding:6px 5px 5px 5px; margin:5px; color:#fff; font-size:18px; position:absolute; right:2%; top:2%; text-align:center; }

.agree_tbl { width:100%; border-collapse:collapse; text-align:center; margin-top:5px; font-size:22px; color:#111; }
.agree_tbl .txt { padding:5px 5px 8px 5px; text-align:left; line-height:160%; }
.agree_tbl .sel { border:1px solid #4d4d4d; padding:10px 5px; text-align:center; font-size:20px; }
.agree_tbl .td1 { border:1px solid #4d4d4d; }
.agree_tbl .td2 { border-left:0; }
.agree_tbl input[type=radio] { width:20px; height:20px; }

.agree_viewBtn { font-size:18px; background-color:#000; color:#fff; padding:3px 10px 5px; }
.agree_input { border:1px solid #000; height:45px; padding:0 10px; width:95%; font-size:18px; }
.agree_btn { width:100%; color:white; background-color:#54b9de; vertical-align:middle; font-size:22px; font-weight:bold; bottom:0px; padding:15px 0; border-radius:0 0 18px 18px; text-align:center; }

.agreeInputBox2 { position:absolute; top:15%; left:50%; margin-left:-510px; width:970px; overflow: auto; font-size:16px; text-align:left; background-color:white; 
				z-index:1100; border:1px solid #000; border-radius:20px; padding-bottom:20px; }
.agreeTxtBox { padding:20px 0; }

.text1 ul li{ 
	padding-left: 15px;
	text-indent: -17px;
	padding-top:10px;
}
.text2 ul li{ 
	padding-left: 18px;
	text-indent: -15px;
	padding-top:5px;
}


@media only screen and (max-width: 900px) {
.agreeInputBox { position:absolute; top:10%; left:5%; margin-left:0; width:90%; background-color:white; border:1px solid #000; border-radius:4vw; text-align:center; line-height:5.5vw; }

.innerBox { padding:3vw 7%; }

.agree_title { font-size:5.5vw; font-weight:700; color:black; border-bottom:2px solid #009aff; padding:2vw 0 4vw; text-align:center; }

.agreeCloseBtn { width:7vw; height:7vw; background:#000; border-radius:3.5vw; border:0; padding:1vw; margin:1vw; color:#fff; font-size:4vw; position:absolute; right:2%; top:2%; text-align:center; }

.agree_tbl { width:100%; border-collapse:collapse; text-align:center; margin-top:1vw; font-size:4.5vw; color:#111; }
.agree_tbl .txt { padding:1vw 1vw 1.5vw 1vw; text-align:left; line-height:160%; }
.agree_tbl .sel { border:1px solid #4d4d4d; padding:2vw 1vw; text-align:center; font-size:4vw; }
.agree_tbl .td1 { border:1px solid #4d4d4d; }
.agree_tbl .td2 { border-left:0; }
.agree_tbl input[type=radio] { width:4vw; height:4vw; }

.agree_viewBtn { font-size:3.5vw; background-color:#000; color:#fff; padding:0.5vw 2.5vw 1vw; }
.agree_input { border:1px solid #000; height:8vw; padding:0 2vw; width:95%; font-size:3.5vw; }
.agree_btn { width:100%; color:white; background-color:#54b9de; vertical-align:middle; font-size:5vw; font-weight:bold; bottom:0px; padding:4vw 0; border-radius:0 0 3.8vw 3.8vw; text-align:center; }

.agreeInputBox2 { position:absolute; top:15%; left:5%; margin-left:0; width:90%; overflow: auto; font-size:3vw; text-align:left; background-color:white; 
				z-index:1100; border:1px solid #000; border-radius:4vw; padding-bottom:4vw; }
.agreeTxtBox { padding:4vw 0; }
}

input::-webkit-input-placeholder { color:#b0b0b0; } /*크롬, 사파리 브라우저*/
input::-moz-placeholder { color:#b0b0b0; } /*파이어폭스 브라우저*/
input::-ms-input-placeholder { color:#b0b0b0; } /*ie 브라우저*/
</style>

<div class="agreeInputBox2">

	<div class="innerBox">

		<p><input type="button" class="agreeCloseBtn" onclick="javascript:close_agree();" value="X"></p>

		<div class="agree_title">개인정보취급방침안내</div>

		
		<p style="padding-top:20px;">귀하의 개인정보를 보호하기 위하여 ‘개인정보보호법’등 관련 법규를 준수하고 있으며, 본 건강검진과 관련하여 귀하로부터 수집한 개인정보는 다음의 목적으로만 이용됩니다.</p>
		<div class="text1">
			<ul>
				<li>○ 이용목적 : 이용자 식별</li>
				<li>○ 수집항목 : 이름, 생년월일, 성별, 휴대폰번호, 이메일</li>
				<li>○ 보유기간 : 본인 동의 철회 시 또는 일시적인 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 삭제 합니다. (최소 3개월에서 최대 4개월까지 보관 후 삭제)<br>(단, 의료법 등 타 법령의 규정에 의해 보유하도록 한 기간 동안 보관 할 수 있습니다.)</li>
			</ul>
		</div>
	</div>
</div>
</div>
</body>
</html>
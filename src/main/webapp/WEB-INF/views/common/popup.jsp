<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<link type="text/css" rel="stylesheet" href="${path_resources}css/popup.css">
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script type="text/javascript">
//창닫기  
function setCookie(name, value, expiredays) {
    var date = new Date();
    date.setDate(date.getDate() + expiredays);
    document.cookie = escape(name) + "=" + escape(value) + "; path=/; expires=" + date.toUTCString();
}

function closePopup(day) {
    if (document.getElementById("check").value) {
        setCookie("popupYN", "N", day);
        self.close();
    }
}

function closePopup2() {
    self.close();
}
</script>
</head>
<body>
<div id="popup">
	<div class="head_box">
		<p>코로나바이러스감염증-19 예방행동 수칙</p>
	</div>
		    <div>
		        <div class="content_01">
		            <ul>
		                <li><a href="https://www.youtube.com/watch?v=tDJF0cdJWHo" target="_blank" title="새창열기" tabindex="0"><span>1</span><span>상황별 행동수칙 (동영상 보기 클릭)</span><img src="${path_resources}img/popup/ico_play.png" alt="재생버튼"></a></li>
		                <li><a href="https://www.youtube.com/watch?v=qhO_oyWod5A&amp;list=PL_-Emxqwow0B_ShiQiMP-qptrre2RWxBk" target="_blank" title="새창열기" tabindex="0"><span>2</span><span>안전하고 올바른 마스크 착용법  (동영상 보기 클릭)</span><img src="${path_resources}img/popup/ico_play.png" alt="재생버튼"></a></li>
		                <li><a href="https://www.youtube.com/watch?v=24jc8mnov9k&amp;list=PL_-Emxqwow0B_ShiQiMP-qptrre2RWxBk&amp;index=6" target="_blank" title="새창열기" tabindex="0"><span>3</span><span>코로나바이러스감염증-19 바로알기  (동영상 보기 클릭)</span><img src="${path_resources}img/popup/ico_play.png" alt="재생버튼"></a></li>
		            </ul>
		        </div>

		        <div class="content_02">
		            <ul>
		                <li><a href="http://ncov.mohw.go.kr/" target="_blank" title="질병관리본부 신종코로나바이러스감염증-19 현황 안내사이트 새창열기" tabindex="0"><img src="${path_resources}img/popup/ico_corona.png" alt="">
		                        <p>코로나바이러스감염증-19</p>
		                        <p>페이지 바로가기<img src="${path_resources}img/popup/ico_arrow.png" alt=""></p>
		                    </a>
						</li>
		                <li><a href="https://www.safekorea.go.kr/idsiSFK/neo/sfk/cs/csc/bbs_conf.jsp?menuSeq=593&amp;bbs_no=9&amp;bbs_ordr=2589&amp;viewtype=read" title="신종코로나바이러스감염증-19 예방수칙 다운로드 페이지로 이동" tabindex="0"><img src="${path_resources}img/popup/ico_check.png" alt="">
		                        <p>예방수칙</p>
		                        <p>다운로드 바로가기<img src="${path_resources}img/popup/ico_arrow.png" alt=""></p>
		                    </a>
						</li>
						<li><a href="http://www.safekorea.go.kr/idsiSFK/neo/sfk/cs/sfc/emd/covid19ClnicCenter.html?menuSeq=822" title="신종코로나바이러스감염증-19 선별진료소 안내페이지로 이동" tabindex="0"><img src="${path_resources}img/popup/careCenter.png" alt="">
		                        <p>선별진료소</p>
		                        <p>페이지 바로가기<img src="${path_resources}img/popup/ico_arrow.png" alt=""></p>
		                    </a>
						</li>
		            </ul>
		        </div>
		    </div>
		    <a id="close_popup1" tabindex="0" onclick="closePopup(1);">하루 닫기</a>
		    <a id="close_popup2" tabindex="0" onclick="closePopup2();">닫기</a>
</div>
</body>
</html>
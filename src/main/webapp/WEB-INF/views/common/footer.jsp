<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>
<!-- css 적용 -->
<link rel="stylesheet" href="${path_resources_asset}base.min.css">
<link rel="stylesheet" href="${path_resources_asset}common.min.css">
<!-- css 적용 -->
<footer id="footer">
	<ul class="innerWrap footerLink2">
		<li><a href="${path}/guest/nonpayment" class="colorPoint04">비급여진료비용</a></li>
		<li><a href="${path}/guest/pbor" >환자권리장전</a></li>
		<li><a href="${path}/guest/conditions" >이용약관</a></li>
		<li><a href="${path}/guest/PI" class="colorPoint04" >개인정보 처리방침</a></li>
		<li><a href="${path}/guest/OI">정보공개</a></li>
		<li><a href="/" data-layer="layerEmail" class="layerBtn">정보무단수집거부공개</a></li>
		<!-- <li><a href="/" data-layer="layerDown" class="layerBtn">뷰어다운로드</a></li> -->
		<!-- <li><a href="//nrefer.snuh.org" target="_blank">진료협력센터</a></li> -->
	</ul>
	<div class="footerInfo">
		<div class="innerWrap">
			<address class="clearFix">
				<p>주소 : 03080 서울특별시 종로구 대학로 101(연건동 28)</p>
				<p>
					대표전화 : <a href="tel:1588-5700">1588-5700</a>
				</p>
				<p>

					<a href="/login.do?retUrl=/join/client.do">홈페이지
						의견접수</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"><img src="${path_resources}img/인증1.png"
							width="30" height="30">Spring Security</a>

				</p>
				<ul>
					<li></li>
				</ul>
			</address>
			<ul>
				<li><p class="copyright">COPYRIGHT 2010 SEOUL NATIONAL
						UNIVERSITY HOSPITAL. ALL RIGHTS RESERVED</p></li>
			</ul>
		</div>
	</div>
</footer>
<script src="${path_resources_asset}feSeries.min.js"></script>
<script src="${path_resources_asset}feCommon.min.js"></script> 

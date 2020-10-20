<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="${path_resources_customcss}findWay.css">
<style>
   .select {
   
   
   
   }

</style>
<title>찾아 오시는 길</title>
</head>
<%@include file="../common/header.jsp" %>
 		 
<body>
    
    
    <br>
    <div class="title">찾아오시는 길</div>
    
    <div class="findId_area">
         <p>HOW CAN YOU GET TO THE LIFECARE?</p>
            you can find the way to come to the Lifecare using the map and information as below. 
                        아래의 정보와 지도를 통해서 라이프케어를 찾아오실 수 있습니다.                                                                                             
    </div>      
  
    <div id="map" style="width:30%;height:300px; margin:0 auto;" ></div> <!-- 지도를 표시할 div 입니다 -->
    <div id="roadview" style="width:30%;height:300px; margin:0 auto; "></div> <!-- 로드뷰를 표시할 div 입니다 -->
    <div class= "press" align="center">                      
	    <button type="submit" class="btn-type btn2 blue mr_2"><a href="https://map.kakao.com/link/to/월드메르디앙벤처센터2차,37.478845,126.878594">길찾기</a></button>&nbsp;&nbsp;
		<button type="submit" class="btn-type btn2 blue mr_3"><a href="https://map.kakao.com/link/map/37.478845,126.878594">지도 크게보기</a></button>&nbsp;&nbsp;
		<button type="submit" class="btn-type btn2 blue mr_3"><a href="https://map.kakao.com/link/roadview/37.478845,126.878594">로드뷰</a></button>&nbsp;&nbsp;
 	</div>
	<div style="width:46%; margin:0 auto; margin-top:15px;"> 
        <img src="${path_resources}img/maein.PNG" > 
  		 </div> 
    
    
</body>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a4dcbf8bd992d42aecc63827327a181&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapCenter = new kakao.maps.LatLng(37.478845,126.878594), // 지도의 중심 좌표
	mapOption = {
	    center: mapCenter, // 지도의 중심 좌표
	    level: 4 // 지도의 확대 레벨
	};

	//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	var myPosition = new kakao.maps.LatLng(37.478845,126.878594);

	//지도에 올릴 마커를 생성합니다.
	var mMarker = new kakao.maps.Marker({
	position: myPosition, // 지도의 중심좌표에 올립니다.
	map: map // 생성하면서 지도에 올립니다.
	});

	//지도에 올릴 장소명 인포윈도우 입니다.
	var mLabel = new kakao.maps.InfoWindow({
		position: myPosition, // 지도의 중심좌표에 올립니다.
		content:"<div style='padding:5px; align:center;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LifeCare병원   </div>",
		removable : true
	});
	mLabel.open(map, mMarker); // 지도에 올리면서, 두번째 인자로 들어간 마커 위에 올라가도록 설정합니다.

	var rvContainer = document.getElementById('roadview'); // 로드뷰를 표시할 div
	
	var rv = new kakao.maps.Roadview(rvContainer); // 로드뷰 객체 생성
	var rc = new kakao.maps.RoadviewClient(); // 좌표를 통한 로드뷰의 panoid를 추출하기 위한 로드뷰 help객체 생성 
	var rvPosition = new kakao.maps.LatLng(37.478845,126.878594);

	rc.getNearestPanoId(rvPosition, 50, function(panoid) {
	rv.setPanoId(panoid, rvPosition);//좌표에 근접한 panoId를 통해 로드뷰를 실행합니다.
	});

	//로드뷰 초기화 이벤트
	kakao.maps.event.addListener(rv, 'init', function() {
	
	// 로드뷰에 올릴 마커를 생성합니다.
	var rMarker = new kakao.maps.Marker({
	    position: myPosition,
	    map: rv //map 대신 rv(로드뷰 객체)로 설정하면 로드뷰에 올라갑니다.
	});
	rMarker.setAltitude(6); //마커의 높이를 설정합니다. (단위는 m입니다.)
	rMarker.setRange(100); //마커가 보일 수 있는 범위를 설정합니다. (단위는 m입니다.)

	// 로드뷰에 올릴 장소명 인포윈도우를 생성합니다.
	var rLabel = new kakao.maps.InfoWindow({
		position: myPosition,
		content: "<div style='padding:5px; align:center;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LifeCare병원</div>" ,
		removable : true
	});
	rLabel.setRange(100); //마커가 보일 수 있는 범위를 설정합니다. (단위는 m입니다.)
	rLabel.open(rv, rMarker); // open시 마커를 넣어주면, 마커의 altitude와 position값을 모두 따라 갑니다.
	
	// 로드뷰 마커가 중앙에 오도록 로드뷰의 viewpoint 조정합니다.
	var projection = rv.getProjection(); // viewpoint(화면좌표)값을 추출할 수 있는 projection 객체를 가져옵니다.
	
	// 마커의 position과 altitude값을 통해 viewpoint값(화면좌표)를 추출합니다.
	var viewpoint = projection.viewpointFromCoords(rMarker.getPosition(), rMarker.getAltitude());
	rv.setViewpoint(viewpoint); //로드뷰에 뷰포인트를 설정합니다.
	});

</script>
<%@include file="../common/footer.jsp" %>
</html>
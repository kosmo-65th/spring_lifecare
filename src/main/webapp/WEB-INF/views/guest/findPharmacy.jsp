<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    
 <script>
      L_NO_TOUCH = false;
      L_DISABLE_3D = false;
</script>
<script src="https://cdn.jsdelivr.net/npm/leaflet@1.6.0/dist/leaflet.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Leaflet.awesome-markers/2.0.2/leaflet.awesome-markers.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/leaflet@1.6.0/dist/leaflet.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Leaflet.awesome-markers/2.0.2/leaflet.awesome-markers.css"/>
    <link rel="stylesheet" href="https://rawcdn.githack.com/python-visualization/folium/master/folium/templates/leaflet.awesome.rotate.css"/>
    <style>html, body {width: 100%;height: 100%;margin: 0;padding: 0;}</style>
    <style>#map {position:absolute;top:0;bottom:0;right:0;left:0;}</style>
    
            <meta name="viewport" content="width=device-width,
                initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
            <style>
                #map_57f14b1804cd4bc2983000c7473a4ccb {
                    position: relative;
                    width: 47.8%;
                    height: 60%;
                    left: 26.3%;
                    top: 0.0%;
                    z-index: 0;
                }
            </style>
        
    <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet-minimap/3.6.1/Control.MiniMap.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet-minimap/3.6.1/Control.MiniMap.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet.markercluster/1.1.0/leaflet.markercluster.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet.markercluster/1.1.0/MarkerCluster.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet.markercluster/1.1.0/MarkerCluster.Default.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet-minimap/3.6.1/Control.MiniMap.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet-minimap/3.6.1/Control.MiniMap.css"/>
</head>
<link type="text/css" rel="stylesheet" href="${path_resources_customcss}findWay.css">
<title>주변 약국 결과</title>
</head>
<%@include file="../common/header.jsp" %>
 		 
<body>
    
    
    <br>
    <div class="title">주변 약국 검색</div>
    
    <div class="findId_area">
         <p>HOW CAN YOU GET TO PHARMACIES NEARBY LIFECARE </p>
            you can find pharmacies <span style="color: red;"> focusing on red mark</span> and <span style="color: blue;">clicking on blue marks</span> using the map as below.<br> 
                        아래의 지도를 통해서 <span style="color: red;"> 빨간색 마커표시를 중심 </span>으로 <span style="color: blue;"> 파란색 마커를 클릭</span>하시면 주변 약국을 쉽게 찾으실 수 있습니다.                                                                                            
    </div>      
     
     <div class="folium-map" id="map_57f14b1804cd4bc2983000c7473a4ccb" ></div>
     <script>    
    
            var map_57f14b1804cd4bc2983000c7473a4ccb = L.map(
                "map_57f14b1804cd4bc2983000c7473a4ccb",
                {
                    center: [37.478674, 126.878659],
                    crs: L.CRS.EPSG3857,
                    zoom: 17,
                    zoomControl: true,
                    preferCanvas: false,
                }
            );

            

        
    
            var tile_layer_e097b1d5a55040e29377246da53f7700 = L.tileLayer(
                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                {"attribution": "Data by \u0026copy; \u003ca href=\"http://openstreetmap.org\"\u003eOpenStreetMap\u003c/a\u003e, under \u003ca href=\"http://www.openstreetmap.org/copyright\"\u003eODbL\u003c/a\u003e.", "detectRetina": false, "maxNativeZoom": 18, "maxZoom": 18, "minZoom": 0, "noWrap": false, "opacity": 1, "subdomains": "abc", "tms": false}
            ).addTo(map_57f14b1804cd4bc2983000c7473a4ccb);
        
    
            var tile_layer_3c9c95bef9214630b27606b98364accc = L.tileLayer(
                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                {"attribution": "Data by \u0026copy; \u003ca href=\"http://openstreetmap.org\"\u003eOpenStreetMap\u003c/a\u003e, under \u003ca href=\"http://www.openstreetmap.org/copyright\"\u003eODbL\u003c/a\u003e.", "detectRetina": false, "maxNativeZoom": 18, "maxZoom": 18, "minZoom": 0, "noWrap": false, "opacity": 1, "subdomains": "abc", "tms": false}
            );
            var mini_map_bdab7b127eb741cb93a16e7ea9f8f2cb = new L.Control.MiniMap(
                tile_layer_3c9c95bef9214630b27606b98364accc,
                {"autoToggleDisplay": false, "centerFixed": false, "collapsedHeight": 25, "collapsedWidth": 25, "height": 150, "minimized": false, "position": "bottomright", "toggleDisplay": false, "width": 150, "zoomAnimation": false, "zoomLevelOffset": -5}
            );
            map_57f14b1804cd4bc2983000c7473a4ccb.addControl(mini_map_bdab7b127eb741cb93a16e7ea9f8f2cb);
        
    
            var marker_cluster_d453e052adba4d3db0c902693c4623cd = L.markerClusterGroup(
                {}
            );
            map_57f14b1804cd4bc2983000c7473a4ccb.addLayer(marker_cluster_d453e052adba4d3db0c902693c4623cd);
        
    
            var marker_2725358146ea4c2ea791a273b82eebc8 = L.marker(
                [37.478674, 126.878659],
                {}
            ).addTo(marker_cluster_d453e052adba4d3db0c902693c4623cd);
        
    
            var icon_ffce1c7f5497445693b98c974e43c1f0 = L.AwesomeMarkers.icon(
                {"extraClasses": "fa-rotate-0", "icon": "info-sign", "iconColor": "white", "markerColor": "red", "prefix": "glyphicon"}
            );
            marker_2725358146ea4c2ea791a273b82eebc8.setIcon(icon_ffce1c7f5497445693b98c974e43c1f0);
        
    
        var popup_9d737dd2f5e842088e18dfa8e86211e0 = L.popup({"maxWidth": "100%"});

        
            var html_44e6bca93d7349edbde24b192209f8aa = $(`<div id="html_44e6bca93d7349edbde24b192209f8aa" style="width: 100.0%; height: 100.0%;">라이프케어(월드메르디앙 벤처센터 2차)</div>`)[0];
            popup_9d737dd2f5e842088e18dfa8e86211e0.setContent(html_44e6bca93d7349edbde24b192209f8aa);
        

        marker_2725358146ea4c2ea791a273b82eebc8.bindPopup(popup_9d737dd2f5e842088e18dfa8e86211e0)
        ;

        
    
    
            var marker_3b5649b13e164904b42d7b2e30fa3ee3 = L.marker(
                [37.474981, 126.900943],
                {}
            ).addTo(marker_cluster_d453e052adba4d3db0c902693c4623cd);
        
    
        var popup_1b41789266ee4abbae1b6f317bd0b971 = L.popup({"maxWidth": "100%"});

        
            var html_cfa20dbd341d4401bb070abda234d2be = $(`<div id="html_cfa20dbd341d4401bb070abda234d2be" style="width: 100.0%; height: 100.0%;"><a href="https://goo.gl/maps/pppN5JkmAEygF5qa8">신보생약국</a></div>`)[0];
            popup_1b41789266ee4abbae1b6f317bd0b971.setContent(html_cfa20dbd341d4401bb070abda234d2be);
        

        marker_3b5649b13e164904b42d7b2e30fa3ee3.bindPopup(popup_1b41789266ee4abbae1b6f317bd0b971)
        ;

        
    
    
            var marker_b7f4b27719464a29ad9bf4938b61b998 = L.marker(
                [37.467988, 126.899055],
                {}
            ).addTo(marker_cluster_d453e052adba4d3db0c902693c4623cd);
        
    
        var popup_73e939d0c14c463e95af6a37bf112ea7 = L.popup({"maxWidth": "100%"});

        
            var html_f5e18b698d434c29b670525e0cc39e86 = $(`<div id="html_f5e18b698d434c29b670525e0cc39e86" style="width: 100.0%; height: 100.0%;"><a href="https://goo.gl/maps/nENAGNPranvLysMR6">토마스약국</a></div>`)[0];
            popup_73e939d0c14c463e95af6a37bf112ea7.setContent(html_f5e18b698d434c29b670525e0cc39e86);
        

        marker_b7f4b27719464a29ad9bf4938b61b998.bindPopup(popup_73e939d0c14c463e95af6a37bf112ea7)
        ;

        
    
    
            var marker_3a57a00b93aa4e7788593e6c9334ba5c = L.marker(
                [37.460204, 126.905267],
                {}
            ).addTo(marker_cluster_d453e052adba4d3db0c902693c4623cd);
        
    
        var popup_7d3250dea1cf4cf39bcb7e40693e1d81 = L.popup({"maxWidth": "100%"});

        
            var html_90584af8374a4f5c9bfe060cd5cab6ba = $(`<div id="html_90584af8374a4f5c9bfe060cd5cab6ba" style="width: 100.0%; height: 100.0%;"><a href="https://goo.gl/maps/szbnKW2sYUaEP1mt6">한중약국</a></div>`)[0];
            popup_7d3250dea1cf4cf39bcb7e40693e1d81.setContent(html_90584af8374a4f5c9bfe060cd5cab6ba);
        

        marker_3a57a00b93aa4e7788593e6c9334ba5c.bindPopup(popup_7d3250dea1cf4cf39bcb7e40693e1d81)
        ;

        
    
    
            var marker_fe73cf778ede4eabb011118476387d64 = L.marker(
                [37.45391, 126.901525],
                {}
            ).addTo(marker_cluster_d453e052adba4d3db0c902693c4623cd);
        
    
        var popup_457a5b5da2ed46a481196a468bdde372 = L.popup({"maxWidth": "100%"});

        
            var html_dccb5e368f3e49899eb5c4d4ac82566c = $(`<div id="html_dccb5e368f3e49899eb5c4d4ac82566c" style="width: 100.0%; height: 100.0%;"><a href="https://goo.gl/maps/oZ5aAyVXGLMhBXgo7">세명당약국</a></div>`)[0];
            popup_457a5b5da2ed46a481196a468bdde372.setContent(html_dccb5e368f3e49899eb5c4d4ac82566c);
        

        marker_fe73cf778ede4eabb011118476387d64.bindPopup(popup_457a5b5da2ed46a481196a468bdde372)
        ;

        
    
    
            var marker_8714313ea1e942c09f697b22d5542104 = L.marker(
                [37.450241, 126.90393300000001],
                {}
            ).addTo(marker_cluster_d453e052adba4d3db0c902693c4623cd);
        
    
        var popup_f37a49e64e51493dbfac01f67a7ccb1b = L.popup({"maxWidth": "100%"});

        
            var html_586da00fc0704635bfe92c59e8335b58 = $(`<div id="html_586da00fc0704635bfe92c59e8335b58" style="width: 100.0%; height: 100.0%;"><a href="https://goo.gl/maps/wRbSZ4BnznShpVHK6">삼화약국</a></div>`)[0];
            popup_f37a49e64e51493dbfac01f67a7ccb1b.setContent(html_586da00fc0704635bfe92c59e8335b58);
        

        marker_8714313ea1e942c09f697b22d5542104.bindPopup(popup_f37a49e64e51493dbfac01f67a7ccb1b)
        ;

        
    
    
            var marker_31df643bb26b49098e04665eec70f27d = L.marker(
                [37.479915000000005, 126.87699599999999],
                {}
            ).addTo(marker_cluster_d453e052adba4d3db0c902693c4623cd);
        
    
        var popup_1fb198d6ba7c4998b0c1ac4c8f769ed5 = L.popup({"maxWidth": "100%"});

        
            var html_ceef96ab138d45b48d9ba41dc8dac08d = $(`<div id="html_ceef96ab138d45b48d9ba41dc8dac08d" style="width: 100.0%; height: 100.0%;"><a href="https://goo.gl/maps/uG4hXxBnyPWPVe4E6">이든약국</a></div>`)[0];
            popup_1fb198d6ba7c4998b0c1ac4c8f769ed5.setContent(html_ceef96ab138d45b48d9ba41dc8dac08d);
        

        marker_31df643bb26b49098e04665eec70f27d.bindPopup(popup_1fb198d6ba7c4998b0c1ac4c8f769ed5)
        ;

        
    
    
            var marker_ea463fc47b024ceca12307675bcf9002 = L.marker(
                [37.465855600000005, 126.90234640000001],
                {}
            ).addTo(marker_cluster_d453e052adba4d3db0c902693c4623cd);
        
    
        var popup_d4b7a70870a64ce8bc0018a8590d8f0f = L.popup({"maxWidth": "100%"});

        
            var html_9453aafb41c949d5ad42e1b9e10ab5db = $(`<div id="html_9453aafb41c949d5ad42e1b9e10ab5db" style="width: 100.0%; height: 100.0%;"><a href="https://goo.gl/maps/ArwSbe8CUHXeLVxB8">문성당약국</a></div>`)[0];
            popup_d4b7a70870a64ce8bc0018a8590d8f0f.setContent(html_9453aafb41c949d5ad42e1b9e10ab5db);
        

        marker_ea463fc47b024ceca12307675bcf9002.bindPopup(popup_d4b7a70870a64ce8bc0018a8590d8f0f)
        ;

        
    
    
            var marker_5f37db40260a4c55bb040ba7e24fb324 = L.marker(
                [37.46499, 126.89795],
                {}
            ).addTo(marker_cluster_d453e052adba4d3db0c902693c4623cd);
        
    
        var popup_4b2edb2e1bfa4dd495fbcd82e41d1241 = L.popup({"maxWidth": "100%"});

        
            var html_05ed7a08c27942b793d0a44e42ed03b4 = $(`<div id="html_05ed7a08c27942b793d0a44e42ed03b4" style="width: 100.0%; height: 100.0%;"><a href="https://goo.gl/maps/MuutfvgH669AZezi6">메디팜대안약국</a></div>`)[0];
            popup_4b2edb2e1bfa4dd495fbcd82e41d1241.setContent(html_05ed7a08c27942b793d0a44e42ed03b4);
        

        marker_5f37db40260a4c55bb040ba7e24fb324.bindPopup(popup_4b2edb2e1bfa4dd495fbcd82e41d1241)
        ;

        
    
    
            var marker_52432d75079e4be686fdf14a03780470 = L.marker(
                [37.464835799999996, 126.8804513],
                {}
            ).addTo(marker_cluster_d453e052adba4d3db0c902693c4623cd);
        
    
        var popup_236642478a604c2f938fd0ddb6525675 = L.popup({"maxWidth": "100%"});

        
            var html_39179ff2b56a4bc5b32b0f3c6c1368fd = $(`<div id="html_39179ff2b56a4bc5b32b0f3c6c1368fd" style="width: 100.0%; height: 100.0%;"><a href="https://goo.gl/maps/4NjnigUHp2fRwjL7A">비타민약국</a></div>`)[0];
            popup_236642478a604c2f938fd0ddb6525675.setContent(html_39179ff2b56a4bc5b32b0f3c6c1368fd);
        

        marker_52432d75079e4be686fdf14a03780470.bindPopup(popup_236642478a604c2f938fd0ddb6525675)
        ;

        
    
    
            var marker_412c9637b2c540798bd16b0314612131 = L.marker(
                [37.4649669, 126.8804513],
                {}
            ).addTo(marker_cluster_d453e052adba4d3db0c902693c4623cd);
        
    
        var popup_6d8949bb4dbd42b0b6c5e66a12f3ea94 = L.popup({"maxWidth": "100%"});

        
            var html_d4e891d73e9a4ea8b969c9396c7546c1 = $(`<div id="html_d4e891d73e9a4ea8b969c9396c7546c1" style="width: 100.0%; height: 100.0%;"><a href="https://goo.gl/maps/cPzfTJDi9SruHiqd6">현대약국</a></div>`)[0];
            popup_6d8949bb4dbd42b0b6c5e66a12f3ea94.setContent(html_d4e891d73e9a4ea8b969c9396c7546c1);
        

        marker_412c9637b2c540798bd16b0314612131.bindPopup(popup_6d8949bb4dbd42b0b6c5e66a12f3ea94)
        ;

        
    
    
            var marker_211ea9eb30564356817da1c0f21c3f2c = L.marker(
                [37.450893, 126.906057],
                {}
            ).addTo(marker_cluster_d453e052adba4d3db0c902693c4623cd);
        
    
        var popup_217cd32b052d4df3bd3ca75c3fb0d5ba = L.popup({"maxWidth": "100%"});

        
            var html_4d6518e7c8d64b12a012586fba17a3e2 = $(`<div id="html_4d6518e7c8d64b12a012586fba17a3e2" style="width: 100.0%; height: 100.0%;"><a href="https://goo.gl/maps/a4auJuWvCqxjepYf8">대우당약국</a></div>`)[0];
            popup_217cd32b052d4df3bd3ca75c3fb0d5ba.setContent(html_4d6518e7c8d64b12a012586fba17a3e2);
        

        marker_211ea9eb30564356817da1c0f21c3f2c.bindPopup(popup_217cd32b052d4df3bd3ca75c3fb0d5ba)
        ;

        
    
    
            var marker_7698b94d93ba478788a6f8255b89387d = L.marker(
                [37.472434, 126.902372],
                {}
            ).addTo(marker_cluster_d453e052adba4d3db0c902693c4623cd);
        
    
        var popup_8869ebf7010c4e28abf7c973a29c91c7 = L.popup({"maxWidth": "100%"});

        
            var html_59d353cd93ad441bb188bcdac94b0ea3 = $(`<div id="html_59d353cd93ad441bb188bcdac94b0ea3" style="width: 100.0%; height: 100.0%;"><a href="https://goo.gl/maps/HFTbV88bv37wQkF66">대제일약국</a></div>`)[0];
            popup_8869ebf7010c4e28abf7c973a29c91c7.setContent(html_59d353cd93ad441bb188bcdac94b0ea3);
        

        marker_7698b94d93ba478788a6f8255b89387d.bindPopup(popup_8869ebf7010c4e28abf7c973a29c91c7)
        ;

        
    
    
            var marker_5671583e08954b7096d9386f7cea56c0 = L.marker(
                [37.45042479999999, 126.8744045],
                {}
            ).addTo(marker_cluster_d453e052adba4d3db0c902693c4623cd);
        
    
        var popup_c9280b7447ed4542be19d3d730a0c7b6 = L.popup({"maxWidth": "100%"});

        
            var html_cf87b1b50b46477dad58eaca00c71005 = $(`<div id="html_cf87b1b50b46477dad58eaca00c71005" style="width: 100.0%; height: 100.0%;"><a href="https://goo.gl/maps/a5aT7xfjPETTmEwG7">태평양 약국</a></div>`)[0];
            popup_c9280b7447ed4542be19d3d730a0c7b6.setContent(html_cf87b1b50b46477dad58eaca00c71005);
        

        marker_5671583e08954b7096d9386f7cea56c0.bindPopup(popup_c9280b7447ed4542be19d3d730a0c7b6)
        ;

        
    
    
            var marker_4c9eb38fae2c47b6aae31e3d5a8521f0 = L.marker(
                [37.50520220000001, 126.8306156],
                {}
            ).addTo(marker_cluster_d453e052adba4d3db0c902693c4623cd);
        
    
        var popup_cbf514c686d2485ca41f366e343e0578 = L.popup({"maxWidth": "100%"});

        
            var html_85131728a625420ba394411a2d9c46c1 = $(`<div id="html_85131728a625420ba394411a2d9c46c1" style="width: 100.0%; height: 100.0%;"><a href="https://goo.gl/maps/ZUxbC2ySPDUprFZX8">봄빛약국</a></div>`)[0];
            popup_cbf514c686d2485ca41f366e343e0578.setContent(html_85131728a625420ba394411a2d9c46c1);
        

        marker_4c9eb38fae2c47b6aae31e3d5a8521f0.bindPopup(popup_cbf514c686d2485ca41f366e343e0578)
        ;

        
    
    
            var marker_c6111d381ab34c069ee9220a51b52b60 = L.marker(
                [37.480819, 126.880592],
                {}
            ).addTo(marker_cluster_d453e052adba4d3db0c902693c4623cd);
        
    
        var popup_43fc5718919547b08575f39ae36b5f28 = L.popup({"maxWidth": "100%"});

        
            var html_0d6e841cec0e452e8970bbd0885945e6 = $(`<div id="html_0d6e841cec0e452e8970bbd0885945e6" style="width: 100.0%; height: 100.0%;"><a href="https://goo.gl/maps/wCo7TPXjjCzoDHoR6">가디온누리약국</a></div>`)[0];
            popup_43fc5718919547b08575f39ae36b5f28.setContent(html_0d6e841cec0e452e8970bbd0885945e6);
        

        marker_c6111d381ab34c069ee9220a51b52b60.bindPopup(popup_43fc5718919547b08575f39ae36b5f28)
        ;

        
    
    
            var marker_f2fcfa3f199047bb8b6b9ac87a8c228c = L.marker(
                [37.482154, 126.881445],
                {}
            ).addTo(marker_cluster_d453e052adba4d3db0c902693c4623cd);
        
    
        var popup_3a65be666dcb494885f6064f39466224 = L.popup({"maxWidth": "100%"});

        
            var html_32a656c5e7c342e0bcf3c0e995c35b7a = $(`<div id="html_32a656c5e7c342e0bcf3c0e995c35b7a" style="width: 100.0%; height: 100.0%;"><a href="https://goo.gl/maps/8ey38gPe6qcbhjK19">중앙메디칼약국</a></div>`)[0];
            popup_3a65be666dcb494885f6064f39466224.setContent(html_32a656c5e7c342e0bcf3c0e995c35b7a);
        

        marker_f2fcfa3f199047bb8b6b9ac87a8c228c.bindPopup(popup_3a65be666dcb494885f6064f39466224)
        ;

        
    
    
            var marker_e389be0738df4090b067d284f105c67c = L.marker(
                [37.452092, 126.90198000000001],
                {}
            ).addTo(marker_cluster_d453e052adba4d3db0c902693c4623cd);
        
    
        var popup_b801cfd7ac5f4f3e8ac6d80e3d17f162 = L.popup({"maxWidth": "100%"});

        
            var html_c039502794494d62af6e7a4a5822671e = $(`<div id="html_c039502794494d62af6e7a4a5822671e" style="width: 100.0%; height: 100.0%;"><a href="https://goo.gl/maps/8ey38gPe6qcbhjK19">중앙사약국</a></div>`)[0];
            popup_b801cfd7ac5f4f3e8ac6d80e3d17f162.setContent(html_c039502794494d62af6e7a4a5822671e);
        

        marker_e389be0738df4090b067d284f105c67c.bindPopup(popup_b801cfd7ac5f4f3e8ac6d80e3d17f162)
        ;

        
    
    
            var marker_a10b5cd6fb374d689ec37477ed797057 = L.marker(
                [37.480222, 126.887024],
                {}
            ).addTo(marker_cluster_d453e052adba4d3db0c902693c4623cd);
        
    
        var popup_5e57e5aa601342a5b572672c8226fcbe = L.popup({"maxWidth": "100%"});

        
            var html_17043eedafcd4f33aa659f6724550f80 = $(`<div id="html_17043eedafcd4f33aa659f6724550f80" style="width: 100.0%; height: 100.0%;"><a href="https://goo.gl/maps/xA9bQ62LngJ59BE76">드림플러스약국</a></div>`)[0];
            popup_5e57e5aa601342a5b572672c8226fcbe.setContent(html_17043eedafcd4f33aa659f6724550f80);
        

        marker_a10b5cd6fb374d689ec37477ed797057.bindPopup(popup_5e57e5aa601342a5b572672c8226fcbe)
        ;

        
    
    
            var marker_799687b2a433435891f278e288c0417f = L.marker(
                [37.4800329, 126.8695035],
                {}
            ).addTo(marker_cluster_d453e052adba4d3db0c902693c4623cd);
        
    
        var popup_6559d3ed120944638076e2ca7d16d9e1 = L.popup({"maxWidth": "100%"});

        
            var html_ffb4e7b023a74d55bd72f3f772cdd6c6 = $(`<div id="html_ffb4e7b023a74d55bd72f3f772cdd6c6" style="width: 100.0%; height: 100.0%;"><a href="https://goo.gl/maps/e64vfaDCAp1uuQCD7">라임약국</a></div>`)[0];
            popup_6559d3ed120944638076e2ca7d16d9e1.setContent(html_ffb4e7b023a74d55bd72f3f772cdd6c6);
        

        marker_799687b2a433435891f278e288c0417f.bindPopup(popup_6559d3ed120944638076e2ca7d16d9e1)
        ;

        
    
</script>
    
<%@include file="../common/footer.jsp" %>
</html>
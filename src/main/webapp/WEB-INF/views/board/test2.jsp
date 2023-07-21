<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>지도 API</title>
<style type="text/css">
#map{
padding: 10px;
margin: 0 auto;
}
.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
.wrap * {padding: 0;margin: 0;}
.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
.info .close:hover {cursor: pointer;}
.info .body {position: relative;overflow: hidden;}
.info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.info .link {color: #5085BB;}
</style>

</head>
<body>

	<div>
		<h1>당구장 검색</h1>
		<input id="DanguName" value="" type="text">
		<button id="search">검색</button>
		<div id="map" style="width: 600px; height: 350px;"></div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=043f21ecd3eda29d22f3eafff557eb9e"></script>
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>

	<script>
		var result = [];
		$(document).ready(function() {
	        function searchDangu() {
	        	
	        	var query = $("#DanguName").val(); // 검색어를 가져옵니다
	            if (query.trim() === "") {
	                // 검색어가 빈 문자열인 경우 아무런 동작을 하지 않고 함수를 종료합니다
	                return;
	            }
	        	
				$.ajax({
					method : "GET",
					url : "https://dapi.kakao.com/v2/local/search/keyword.JSON",	// 데이터 검색 요청 키워드 반환 방식(JSON)
					data : {
						query : $("#DanguName").val()	// 검색한 요청 값
					},
					headers : {Authorization : "KakaoAK 9859b14ff95c951c63db390e8b634873"}	// 카카오 인증키
				}).done(function(msg) {
					result = msg.documents;
					showCustomOverlay();
					console.log(msg);
				});
	        }
	        // 검색 클릭, 및 엔터로 요청하게 하는 함수
	        $("#search, #DanguName").on("click keypress", function(e) {
	            if (e.which === 13 || e.type === "click") {
	                searchDangu();
	            }
           	});
        
		})
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		
		mapOption = {
			center : new kakao.maps.LatLng(37.56577, 126.97972), // 지도의 중심좌표
			level : 3, // 지도의 확대 레벨
			mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		};

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마우스 휠과 모바일 터치를 이용한 지도 확대, 축소를 막는다
		map.setZoomable(false);

		// 지도에 마커를 생성하고 표시한다
		var marker = new kakao.maps.Marker({
			position : new kakao.maps.LatLng(37.56589, 126.98006), // 마커의 좌표
			map : map	// 마커를 표시할 지도 객체
		});
		
		
		function showCustomOverlay() {
            // 검색 결과가 없는 경우 커스텀 오버레이를 표시하지 않습니다
            if (result.length === 0) {
                return;
            }
			console.log(result[0]);
            var content = '<div class="wrap">' + 
			              '    <div class="info">' + 
			           	  '        <div class="title">' + 
				            '            '+result[0].place_name + 
				            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
				            '        </div>' + 
				            '        <div class="body">' + 
				            '            <div class="img">' +
				            '                <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">' +
				            '           </div>' + 
				            '            <div class="desc">' + 
				            '                <div class="ellipsis">'+result[0].road_address_name+'</div>' + 
				            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
				            '                <div><a href="'+result[0].place_url+'" target="_blank" class="link">카카오 맵</a></div>' + 
				            '            </div>' + 
				            '        </div>' + 
				            '    </div>' +    
				            '</div>';

            // 마커를 중심으로 커스텀 오버레이를 표시하기 위해 위치를 설정합니다
            var markerPosition = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 마커 위치를 기준으로 커스텀 오버레이를 생성합니다
            var overlay = new kakao.maps.CustomOverlay({
                content: content,
                map: map,
                position: markerPosition
            });

            // 커스텀 오버레이를 표시합니다
            overlay.setMap(map);
        }

		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay() {
		    overlay.setMap(null);     
		}
		

		// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
		kakao.maps.event.addListener(marker, 'click', function() {
			alert('마커를 클릭했습니다!');
		});

		// 마커에 mouseover 이벤트를 등록한다
		kakao.maps.event.addListener(marker, 'mouseover', function() {
			console.log('마커에 mouseover 이벤트가 발생했습니다!');
		});

		// 마커에 mouseout 이벤트 등록
		kakao.maps.event.addListener(marker, 'mouseout', function() {
			console.log('마커에 mouseout 이벤트가 발생했습니다!');
		});
		

	</script>
</body>
</html>
</html>
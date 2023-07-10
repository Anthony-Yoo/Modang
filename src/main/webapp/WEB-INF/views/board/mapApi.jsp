<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 맵 예제</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=043f21ecd3eda29d22f3eafff557eb9e"></script>
<style>
    #map {
        width: 500px;
        height: 500px;
    }
</style>
</head>
<body>
    <div id="map"></div>
    <script>
        // 중심 좌표 설정
        var latitude = 37.5665;
        var longitude = 126.9780;

        // 맵 생성
        var container = document.getElementById('map');
        var options = {
            center: new kakao.maps.LatLng(latitude, longitude),
            level: 3
        };
        var map = new kakao.maps.Map(container, options);
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no,maximum-scale=1.0, minimum-scale=1.0">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />	
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
		<title>모두의 당구장</title>
		<link href="${pageContext.request.contextPath}/assets/css/tablet.css" rel="stylesheet" type="text/css">
		<style>
			#container {background:#094e94;border-radius:10px; z-index: 1;	border: 1px;width: 1200px;height: 768px;position: absolute;left: 50%;	top: 50%;transform: translate(-50%, -50%);}
			#blankbox {	border : 0px;width : 100%;height: 200px;}	
			.imagebox {margin-left : 10%;margin-top : 10%;display : inline-block;width:35%;height :350px;background-color: #f1bb2e;border-radius: 10px;}			
			#logtitle {	margin-top: 10%;font-size: 80px;color: white;text-align: center;}
			.float-r {float: right; }
			.float-l {float: left; }
			.clear{clear: both; }


		</style>
	</head>
	<body>
		<c:import url="/WEB-INF/views/include/tabletHeader.jsp"></c:import>
		<div id="container">				
			<h2 id="logtitle">볼을 선택하세요</h2>
			<div class="content">	
				<div class="imagebox">			
					<a href="${pageContext.request.contextPath}/tablet/${tableNo}/memberForm?ball=0">3구</a>
				</div>
				<div class="imagebox">
					<a href="${pageContext.request.contextPath}/tablet/${tableNo}/memberForm?ball=1">4구</a>
				</div>			
			</div>
		</div>
	</body>
	<script type="text/javascript">
	var docV = document.documentElement;
	//전체화면 설정
	function openFullScreenMode() {
	 if (docV.requestFullscreen)
	     docV.requestFullscreen();
	 else if (docV.webkitRequestFullscreen) // Chrome, Safari (webkit)
	     docV.webkitRequestFullscreen();
	 else if (docV.mozRequestFullScreen) // Firefox
	     docV.mozRequestFullScreen();
	 else if (docV.msRequestFullscreen) // IE or Edge
	     docV.msRequestFullscreen();
	}

	//전체화면 해제
	function closeFullScreenMode() {
	 if (document.exitFullscreen)
	     document.exitFullscreen();
	 else if (document.webkitExitFullscreen) // Chrome, Safari (webkit)
	     document.webkitExitFullscreen();
	 else if (document.mozCancelFullScreen) // Firefox
	     document.mozCancelFullScreen();
	 else if (document.msExitFullscreen) // IE or Edge
	     document.msExitFullscreen();
	}

	$("#open").on('click',function(){
		openFullScreenMode()
	});

	$("#close").on('click',function(){
		closeFullScreenMode()
	});
	/* -------------------------------------------------------------------- */
	
	</script>
</html>
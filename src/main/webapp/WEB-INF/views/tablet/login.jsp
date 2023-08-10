<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
		<link href="${pageContext.request.contextPath}/assets/css/tablet.css" rel="stylesheet" type="text/css">
		<title>휴대폰인증창</title>
		<style>
		/*reset*/
			#logtitle {margin-top: 10%;color : white;text-align: center;height: 100px;font-size: 60px;}
			#container {background:#094e94;border-radius:10px; z-index: 1;	border: 1px;width: 1200px;height: 768px;position: absolute;left: 50%;	top: 50%;transform: translate(-50%, -50%);}
			#imagebox {display : inline-block;border : 0px;width : 350px;height :350px;}		
			
			.box {margin-top : 50px;margin-left : 130px;border: 1px solid #404040;background-color: #DDDDDD; border-radius: 5px;width : 400px;height : 400px;}
			.box1 {margin-top: 200px;margin-left: 80px;width: 450px;height: 200px;}
			#qrbox img {border : 0px;display : inline-block;width : 400px;height : 400px;}			
			#logbox img {margin-left : 50px;margin-top : 30px;border : 0px;display : inline-block;	width : 300px;height : 300px;}
			.float-r {float: right; }
			.float-l {float: left; }
			.clear{clear: both; }
		</style>
	</head>
	<body>
		<c:import url="/WEB-INF/views/include/tabletHeader.jsp"></c:import>
		<div id="container">
			<h2 id="logtitle">휴대폰을 인증해주세요</h2>			
			<div class="content">	
				<div class="box float-l" id="qrbox">
					<img src="${pageContext.request.contextPath}/assets/images/modang_qr.png"/>
				</div>
				<div class="box1 float-l" id="logbox">
					<div id="idbox">
						<form action="${pageContext.request.contextPath}/tablet/${tableNo}/keyLogin" method="get">
							<input type="number" name="keyNum" id="keyNum">
							<button type="submit" id="keyin">키입력</button>
						</form>
						<c:if test="${param.result eq 'fail'}">
							<span class="failmsg">인증키를 다시 입력해주세요</span>
						</c:if>
					</div>
				</div>			 
			</div>
		</div>
	</body>
	<script type="text/javascript">
	/* 전체화면 이벤트-------------------------------------------------------------- */
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
	//클릭 자동실행
	function clickStart() {
	    var startBtn = document.getElementById('open');
	    if (startBtn) {
	    	startBtn.click(); // 버튼 클릭
	    }
	}

	window.onload = clickStartButton;
	/* -------------------------------------------------------------------- */
	
	</script>
</html>
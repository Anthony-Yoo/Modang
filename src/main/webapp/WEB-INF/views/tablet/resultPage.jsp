<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script src="https://tistory4.daumcdn.net/tistory/3134841/skin/images/confetti_v2.js"></script>
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/tablet.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
}

#container {background:#094e94;border-radius:10px; z-index: 1;	border: 1px;width: 1024px;height: 768px;position: absolute;left: 50%;	top: 50%;transform: translate(-50%, -50%);}

.rtop {
	width: 1020px;
	height: 150px;
}
.rboard {
	width: 200px;
	height: 150px;

}

.float-r {float: right;}
.float-l {float: left;}
.clear {clear: both;}
canvas{z-index:10;pointer-events: none;position: fixed;top: 0;transform: scale(1.1);}
</style>
</head>
<body>
	<div id="container">
		<!-- Top Info -->
		<div class="rtop" id="top-container">			
			<div class="timerBox float-l" id='timerBox'>
				<label for="" class="d-inline-block white">사용시간</label>
				<div id="time" class="time">00:00:00</div>
			</div>
			<div class="timerBox2 float-r" id="top-fee">
				<label for="usingfee" class="d-inline-block whitetext">결제요금</label> <input class="d-inline-block usingfee1" type="text" id="usingfee" value="${tableGameVo.payMoney}" readonly>
			</div>
		</div>
		<!-- Mid Info -->
		<div class="row1">
			<div class="mid1" id="mid-scores">
				<div class="listbox">
					<c:forEach var="playUser" items="${tableGameVo.playUserList}">
						<div class="rboard float-l" id="rboardno-${playUser.record}">					
							
							<div class="Record float-l">
							<c:choose> 
								<c:when test="${playUser.record == 1}">
									<p class="recordText" id="winText">Win</p><br>
								</c:when> 
								<c:when test="${playUser.record == tableGameVo.memberNum}">
									<p class="recordText" id="loseText">Lose</p>
								</c:when> 
								<c:otherwise>
									<p class="recordText" id="recordText">${playUser.record}등</p>
								</c:otherwise> 
							</c:choose> 					
							</div>
							<div class="profileImg float-l">						
								<img class="float-l imgbox1" src="${pageContext.request.contextPath}/assets/images/modang_img.png">						
							</div>
							<div class="playTime float-l">
								<%-- <p id="playname">${playUser.nick}님</p>	 --%>				
							</div>

						</div>	
					</c:forEach>
				</div>
				<!-- 순위박스 -->
				<div class="rangkbox1 float-l">
					<p id="name1">김우빈</p><img src="${pageContext.request.contextPath}/assets/images/crown.png" id="crown"></div>
				<div class="rangkbox2 float-l">
					<p id="name2">김연아</p>
				</div>
				<div class="rangkbox3 float-l">
					<p id="name2">이도단</p>
				</div>
				<div class="rangkbox4 float-l">
					<p id="name2">박유준</p>
				</div>
			</div>
		</div>
	</div>
<div class="buttonContainer">
	<button class="canvasBtn" id="stopButton">Stop Confetti</button>
	<button class="canvasBtn" id="startButton">Drop Confetti</button>	
</div>
<canvas id="canvas"></canvas>
</body>
<script>
/* 게임정보 저장 */
var tableNo = ${tableGameVo.tableNo};
var gameNo = ${tableGameVo.gameNo};
var memberNum = ${tableGameVo.memberNum};

var currentTime; // 현재시간


/* 전역변수 정의*/

var playerTime;

var hour = 0;
var min = 0;
var sec = 0;
var th = hour;
var tm = min;
var ts = sec;

/* 로딩 시작할때(다시켜질때) */
$(document).ready(function(){	

	 timeStamper();
	 
	 var tableGameVo = {
				tableNo : tableNo,
				gameNo : gameNo
		}
	 $.ajax({			
			url : "${pageContext.request.contextPath}/tablet/resultdata",		
			type : "post",
			/* contentType : "application/json", */
			data : tableGameVo,
			
			dataType : "json",
			success : function(action){						
				console.log(action);	
				if(action.result == 'success') {//처리성공	
					console.log("성공");						
					renderEach(action.data.playUserList);					
					
				}else {//오류처리
					var msg = action.failMsg;
						alert(msg);				
				}				
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}		
			
		});		
});
/* 기능 메인시간그리기*/
function timeStamper(){	
	let time = ${tableGameVo.gameTime};
	min = Math.floor(time/60);
	hour = Math.floor(min/60);
	sec = time%60;
	min = min%60;
	
	th = hour;
	tm = min;
	ts = sec;
	
	if(th < 10 ){
		th = "0" + hour;
	}			
	if(tm < 10){
		tm = "0" + min;
	}			
	if(ts < 10){
		ts = "0" + sec;
	}
	$("#time").html(th + "시" + tm + "간" + ts +"초");		
	
	
}
/* 기능 유져시간그리기*/
function playTimeStamper(time){	
	min = Math.floor(time/60);
	hour = Math.floor(min/60);
	sec = time%60;
	min = min%60;
	
	var th = hour;
	var tm = min;
	var ts = sec;
	
	if(th < 10 ){
		th = "0" + hour;
	}			
	if(tm < 10){
		tm = "0" + min;
	}			
	if(ts < 10){
		ts = "0" + sec;
	}
	
	let returnTime ={}
	returnTime.th = th;
	returnTime.tm = tm;
	returnTime.ts = ts;
	
	return returnTime;
					
}
/* 렌더링 */
function renderEach(playerList) {	  	
	$.each(playerList,function(key,value){
		console.log(value);
		
		var time = value.playTime;
		console.log("유져시간:"+time);
		
		let timeVo = playTimeStamper(time);
		console.log(timeVo);
		
		$("#playTime-"+value.record).html(timeVo.th + ":" + timeVo.tm);
	});
	 
	 
	 
}

</script>
</html>
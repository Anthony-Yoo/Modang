<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/tablet.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
}

#container {
	z-index: 1;
	border: 1px;
	outline: dashed 1px black;
	width: 1024px;
	height: 768px;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}
.rtop {
	width: 1020px;
	height: 150px;
}
.rboard {
	width: 1020px;
	height: 150px;
	outline: 2px solde black;
}

.float-r {
	float: right;
}

.float-l {
	float: left;
}

.clear {
	clear: both;
}
</style>
</head>
<body>
	<div id="container">
		<!-- Top Info -->
		<div class="rtop" id="top-container">			
			<div class="timerBox float-l" id='timerBox'>
				<div id="time" class="time">00:00:00</div>
			</div>
			<div class="timerBox float-l" id="top-fee">
				<label for="usingfee">사용요금</label> <input type="text" id="usingfee" value="${tableGameVo.payMoney}">
			</div>
		</div>
		<!-- Mid Info -->
		<div class="mid" id="mid-scores">
			<c:forEach var="playUser" items="${tableGameVo.playUserList}">
				<div class="rboard" id="rboardno-${playUser.record}">					
					<div class="profileImg float-l">						
						<img class="float-l" src="${pageContext.request.contextPath}/assets/images/modang.png" width="50" height="50">						
					</div>
					<div class="Record float-l">
					<c:choose> 
						<c:when test="${playUser.record == 1}">
							<p class="recordText" id="winText">WIN</p>
						</c:when> 
						<c:when test="${playUser.record == tableGameVo.memberNum}">
							<p class="recordText" id="loseText">LOSE</p>
						</c:when> 
						<c:otherwise>
							<p class="recordText" id="recordText">${playUser.record}등</p>
						</c:otherwise> 
					</c:choose> 					
					</div>
					<div class="playTime float-l">
						<p>${playUser.nick}님</p>
						<p id="playTime-${playUser.record}"></p>
					</div>
					<div class="average clear">						
						<p>${playUser.currentAverage}타</p>
					</div>
				</div>	
			</c:forEach>
		</div>
	</div>
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
	$("#time").html(th + ":" + tm + ":" + ts);		
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
		
		$("#playTime-"+value.record).html(timeVo.th + ":" + timeVo.tm + ":" + timeVo.ts);
	});
	 
	 
	 
}

</script>
</html>
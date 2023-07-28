<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
		<title>Insert title here</title>
		<style>
		/*reset*/
			html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video { margin: 0; padding: 0; border: 0; vertical-align: baseline; }
			article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section { display: block; }
			body { line-height: 1; }
			ol, ul { list-style: none; }
			blockquote, q { quotes: none; }
			blockquote:before, blockquote:after, q:before, q:after { content: ''; content: none; }
			table { border-collapse: collapse; border-spacing: 0; }
			body { -webkit-text-size-adjust: none; }
			mark { background-color: transparent; color: inherit; }
			input::-moz-focus-inner { border: 0; padding: 0; }
			input, select, qktextarea { -moz-appearance: none; -webkit-appearance: none; -ms-appearance: none; appearance: none; }
			small {font-size:.75em;}			
			#container {
				border : 1px;
				outline: dashed 1px black;
				width : 1024px;
				height : 768px;
				position : absolute;
				left : 50%;
				top : 50%;
				transform : translate(-50%,-50%);						  	
			}
			input:focus {outline: 2px solid #d50000;} /* outline 테두리 속성 수정 */
			input:focus {outline: none;} /* outline 테두리 없애기 */
			.top {
				height: 150px;
			}
			.mid {
				height: 615px;
			}
			.board {
				width: 500px;
				height: 300px;
				outline: 2px solid black;
			}
			.bdtop {
				width : 500px;
				height: 50px;
				outline: 1px solid black;
			}
			.panel {
				width : 160px;
				height: 250px;
				outline: 1px solid black;
				font: 20px bold;
			}
			
			img {
				display: inline-block;
			}
			p {
				display: inline-block;
			}
			.box{
				width: 200px;
				height: 150px;
			}
			.timerBox{
				width: 200px;
				height : 100px;
				outline: 2px solid black;
				margin-left: 200px;
			}
			.timerBox .time{
				font-size: 30pt;
				color: #4C4C4C;
				text-align: center;
				font-family: sans-serif;
			}
			.btnBox{
				margin: 20px auto;
				text-align: center;
			}
			.btnBox .fa{
				margin: 0px 5px;
				font-size: 10pt;
				color: #000000;
				cursor: pointer;
			}		
			.btnBox input {
				width: 50px;			
			}
			
			.float-r {float: right; }
			.float-l {float: left; }
			.clear{clear: both; }	
		
		</style>
	</head>
	<body>
		<div id="container">			
			<!-- Top Info -->
			<div class="top" id="top-container">
				<div class="btnBox float-l">
					<button id="startbtn" class="fa fa-play" aria-hidden="true">시작</button> 					
					<button id="stopbtn" class="fa fa-stop" aria-hidden="true">종료</button> 
				</div>			    
				<div class="timerBox float-l" id='timerBox'>
					<div id="time" class="time">00:00:00</div>
				</div>
				<div class="timerBox float-l" id="top-fee">
					<label for="usingfee">사용요금</label>
					<input type="text" id="usingfee" value="">
				</div>       
			</div>	
			<!-- Mid Info -->		
			<div class="mid" id="mid-scores">
				<c:forEach var="playUser" items="${tableGameVo.playUserList}">
					<div class="board float-l" id="boardno${playUser.orderNo}">
						<div class="bdtop">
							<div class="userinfo">
								<img class="float-l" src="${pageContext.request.contextPath}/assets/images/modang.png" width="36" height="36">
								<div class="float-l">
									다마수 : <p id="orgscore">${playUser.currentAverage}</p> <br>
									 ${playUser.nick}
								</div>							                        
							</div>
							<div class="act-average float-r">총갯수 : <p id="endscore">${playUser.currentAverage}</p>
							</div>
						</div>
						<div class="bdmid">
							<div class="panel panalty float-l">
							 마이너스
							</div>
							<div class="panel marks float-l">
							 	<p id="crtscore">${playUser.currentAverage}</p>
							</div>
							<div class="panel score float-l">
							 플러스
							</div>
						</div>		
					</div> 
				</c:forEach>				
			</div>
		</div>
	</body>
<script>
/* 게임정보 저장 */
var tableNo = ${tableNo};
var gameNo = ${tableGameVo.gameNo};
var tableFee = ${tableGameVo.tableFee};
var minFee = ${tableGameVo.minFee};	
var pauseTime = 0;
var currentTime; // 현재시간
var startTime; // 시작시간
var pauseStart; //일시정지 시작시간
var pauseEnd; //일시정지 종료시간
var secondsToTime; // (현재시간 - 시작시간) - 일시정지누적시간 :(초)

/* 전역변수 정의*/
var starFlag = true;
var tableStatus;
var timer;
var time = 0;
var hour = 0;
var min = 0;
var sec = 0;



/* 로딩 시작할때(다시켜질때) */
$(document).ready(function(){
	  //buttonEvt(); 
	  //테이블상태값 가져오기 
	  //case 0. 테이블상태가 0(대기) 일때
	  //case 1. 테이블상태가 1(사용중) 일때
	  //case 2. 테이블상태가 2(일시정지) 일때
});

/* 화면1. 시간타임값이 변할때(1초) */ 	
$("#time").on('DOMSubtreeModified', function(){
	
	//---------------------------------------------------------------------
	console.log("시간변화감지");
	var $time = $("#time").text();
	var splitTime = $time.split(":");
  	var sumMin =  splitTime[0]*60 + splitTime[1]*1;	  	
  	var ceilMin =  Math.ceil(sumMin/10)*10;

  	//-실제경기시간
  	//-올림한경기시간* 
  	//---------------------------------------------------------------------	
  	//30분 이하일때
  	//    기본요금적용
  	//30분 초과일때
  	//    기본요금+ ((올림한경기시간-30)/10)*10분당 요금	  	
  	var useFee = 0;
  	
  	if (ceilMin <= 30 ) {//올림한경기시간이 30분 이하일때
  		useFee = tableFee;	  	
  	}else{//올림한경기시간이 30분 초과일때	  		
  		useFee = tableFee + ((ceilMin-30)/10) * minFee;	 		
  	}  
	$('#usingfee').val(useFee);
 });

/* 동작1. 시작버튼 클릭했을때 */
$("#startbtn").on("click", function(){
	console.log("시작버튼 클릭!")
	gameStart();
});

/* 동작2. 일시정지버튼 클릭했을때 */
$('.btnBox').on("click","#pausebtn",function(){
	console.log("일시정지버튼 클릭!")
	gamePause()
});  

/* 동작3. 시작2버튼 클릭했을때 */
$('.btnBox').on("click","#restartbtn", function(){
	console.log("재시작버튼 클릭!")
	gameReStart();
});

/* 동작4. 종료버튼 클릭했을때 */
$("#stopbtn").on("click",function(){
	console.log("종료버튼 클릭!")
	gameStop();
});

/* 기능1. 게임시작 */
function gameStart(){
	//1.테이블 게임번호 전송-->게임정보 받음
	var tableGameVo = {
			tableNo : tableNo,
			gameNo : gameNo
	}
	console.log(tableGameVo);
	$.ajax({			
		url : "${pageContext.request.contextPath}/tablet/playstart",		
		type : "post",
		/* contentType : "application/json", */
		data : tableGameVo,
		
		dataType : "json",
		success : function(action){						
			console.log(action);	
			if(action.result == 'success') {//처리성공	
				console.log("성공");
				console.log(action.data);
				
				/* 리다이렉트 */					
				//let url = '/modang/tablet/${tableNo}/scoreboard';
				//window.location.replace(url);			
				
				//2.버튼출력변경()
				 $('button').remove('#startbtn');
				 $('.btnBox').prepend('<button id="pausebtn" class="fa fa-pause" aria-hidden="true">일시정지</button>');
				 
				//3.타이머 기본값 결정
				time = 0;
				//4.타이머 시작(출력)  //요금계산은 자동
				timer = setInterval(function(){
					time++;
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

					$("#time").html(th + ":" + tm + ":" + ts);		
				}, 1000);	
				console.log("타이머 작동!")
			
			}else {//오류처리
				var msg = action.failMsg;
					alert(msg);				
			}					
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}		
		
	});	
}

/* 기능2. 게임일시정지 */
function gamePause(){	
	//1.테이블 게임번호 전송-->게임정보 받음
	var tableGameVo = {
			tableNo : tableNo,
			gameNo : gameNo
	}
	console.log(tableGameVo);
	$.ajax({			
		url : "${pageContext.request.contextPath}/tablet/playpause",		
		type : "post",
		/* contentType : "application/json", */
		data : tableGameVo,
		
		dataType : "json",
		success : function(action){						
			console.log(action);	
			if(action.result == 'success') {//처리성공	
				console.log("성공");
				console.log(action.data);
				
				/* 리다이렉트 */					
				//let url = '/modang/tablet/${tableNo}/scoreboard';
				//window.location.replace(url);			
				
				//2.버튼출력변경()
				 $('button').remove('#pausebtn');
				 $('.btnBox').prepend('<button id="restartbtn" class="fa fa-pause" aria-hidden="true">시작</button>');
				 
				//3.타이머 기본값 스탑 //요금계산은 자동		
				if(time != 0){
					clearInterval(timer);
					starFlag = true;
				}							
				console.log("타이머 일시정지!")
			
			}else {//오류처리
				var msg = action.failMsg;
					alert(msg);				
			}					
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}		
		
	});	
}

/* 기능3. 게임재시작 */
function gameReStart(){
	//1.테이블 게임번호 전송-->게임정보 받음
	var tableGameVo = {
			tableNo : tableNo,
			gameNo : gameNo
	}
	console.log(tableGameVo);
	$.ajax({			
		url : "${pageContext.request.contextPath}/tablet/playrestart",		
		type : "post",
		/* contentType : "application/json", */
		data : tableGameVo,
		
		dataType : "json",
		success : function(action){						
			console.log(action);	
			if(action.result == 'success') {//처리성공	
				console.log("성공");
				console.log(action.data);
				
				/* 리다이렉트 */					
				//let url = '/modang/tablet/${tableNo}/scoreboard';
				//window.location.replace(url);			
				
				//2.버튼출력변경()
				 $('.btnBox > button').remove('#restartbtn');
				 $('.btnBox').prepend('<button id="pausebtn" class="fa fa-pause" aria-hidden="true">일시정지</button>');
				 
				//3.타이머 기본값 결정
					console.log(action.data.secondsToTime);
					time = action.data.secondsToTime;
					//4.타이머 시작(출력)  //요금계산은 자동
					timer = setInterval(function(){
						time++;
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

						$("#time").html(th + ":" + tm + ":" + ts);		
					}, 1000);	
					console.log("타이머 작동!")
			
			}else {//오류처리
				var msg = action.failMsg;
					alert(msg);				
			}					
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}		
	});		
}
/* 기능4. 게임종료 */
function gameStop(){
	//1.테이블 게임번호 전송-->게임정보 받음
	var tableGameVo = {
			tableNo : tableNo,
			gameNo : gameNo
	}
	console.log(tableGameVo);
	$.ajax({			
		url : "${pageContext.request.contextPath}/tablet/playend",		
		type : "post",
		/* contentType : "application/json", */
		data : tableGameVo,
		
		dataType : "json",
		success : function(action){						
			console.log(action);	
			if(action.result == 'success') {//처리성공	
				console.log("성공");
				console.log(action.data);
				
				/* 리다이렉트 */					
				//let url = '/modang/tablet/${tableNo}/scoreboard';
				//window.location.replace(url);			
				
				console.log("결제액 : "+action.data.payMoney);
				//2.버튼출력변경()
				 $('.btnBox > button').attr("disabled", true);			 
				 
				//3.타이머 기본값 스탑 //요금계산은 자동		
				 if(time != 0){
						clearInterval(timer);
						starFlag = true;						
				}						
				console.log("타이머 정지!")
			
			}else {//오류처리
				var msg = action.failMsg;
					alert(msg);				
			}					
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}		
		
	});						
	
}

/* 기능5. 타이머(시간작동) 기능변수 */


/* 기능6. 시간그리기 */
function init(){
	$("#time").html("00:00:00");
}


</script>
</html>
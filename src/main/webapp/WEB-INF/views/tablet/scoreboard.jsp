<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no,maximum-scale=1.0, minimum-scale=1.0">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<title>스코어점수판</title>
<link href="${pageContext.request.contextPath}/assets/css/tablet.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
}

#container {background:#094e94;border-radius:10px; z-index: 1;	border: 1px;width: 1024px;height: 768px;position: absolute;left: 50%;	top: 50%;transform: translate(-50%, -50%);}
.float-r {float: right;}
.float-l {float: left;}
.clear {clear: both;}

</style>
</head>
<body>
	<div id="container">
		<!-- Top Info -->
		<div class="top" id="top-container">
			<div class="btnBox float-l"></div>
			<div class="timerBox float-l" id='timerBox'>
				<div id="time" class="time">00:00:00</div>
			</div>
			<div class="timerBox1 float-l" id="top-fee">
				<label for="usingfee" class="d-inline-block payMoney">사용요금</label><input class="d-inline-block usingfee" type="text" id="usingfee" value="" readonly>
			</div>
		</div>
		<!-- Mid Info -->
		<div class="row">
			<div class="mid" id="mid-scores">
				<c:forEach var="playUser" items="${tableGameVo.playUserList}">
					<div class="board float-l" id="boardno${playUser.orderNo}">
						<div class="bdtop">
							<div class="userinfo">
								<img class="float-l imgbox" src="${pageContext.request.contextPath }/upload/${playUser.proFileImage}" alt="유저 프로필 이미지">
								<div class="usertext float-l">
									 <br> ${playUser.nick} [다마수: ${playUser.currentAverage} ]
								</div>
							</div>
							<div class="act-average float-r">
								<p id="total">Total</p>
								<p id="act-average">${playUser.currentAverage}</p>
							</div>
						</div>
						<div class="bdmid">
							<div class="panel panalty float-l">								
								<p class="touch1" id="panalty"><strong>-</strong></p>
							</div>
							<div class="panel1 marks float-l" data-playno="${playUser.playNo}" data-record="0">
								<p class="currentbd" id="marks">${playUser.currentAverage}</p>
							</div>
							<div class="panel2 score float-l">
								<p class="touch1" id="score"><strong>+</strong></p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
<script>
/* 게임정보 저장 */
var tableNo = ${tableGameVo.tableNo};
var gameNo = ${tableGameVo.gameNo};
var tableStatus = ${tableGameVo.tableInfo.tableStatus}
var memberNum = ${tableGameVo.memberNum}
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
var timer;
var time = 0;
var hour = 0;
var min = 0;
var sec = 0;

/* 로딩 시작할때(다시켜질때) */
$(document).ready(function(){		
	 
	$('.btnBox > button').remove('#pausebtn');
	$('.btnBox > button').remove('#startbtn');
	$('.btnBox > button').remove('#restartbtn');
	$('.btnBox > button').remove('#stopbtn');
	$('.btnBox').prepend('<button id="stopbtn" class="fa fa-stop" aria-hidden="true">강제종료</button> ');
	
	//스코어필드 대기상태
	
	//테이블상태값 가져오기
	console.log("테이블상태 :"+tableStatus);
	switch(tableStatus) {
		case 0 : //case 0. 테이블상태가 0(대기) 일때
			$('.btnBox').prepend('<button id="startbtn" class="fa fa-pause" aria-hidden="true">시작</button>');
			
			break;
		case 1 : //case 1. 테이블상태가 1(사용중) 일때
			$('.btnBox').prepend('<button id="pausebtn" class="fa fa-pause" aria-hidden="true">일시정지</button>');
			statusReStart();
			break;
		case 2 : //case 2. 테이블상태가 2(일시정지) 일때
			$('.btnBox').prepend('<button id="restartbtn" class="fa fa-pause" aria-hidden="true">재시작</button>');

			statusPause();
			break;
		default : 
			$('.btnBox').prepend('<button id="startbtn" class="fa fa-pause" aria-hidden="true">시작</button>');

			break;			
	}

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
  		useFee = minFee;	  	
  	}else{//올림한경기시간이 30분 초과일때	  		
  		useFee = minFee + ((ceilMin-30)/10) * tableFee;	 		
  	}  
	$('#usingfee').val(useFee);
 });
 
/* 화면2. 마이너스 클릭할때 */
 
const ten = 10;
let record = 0;
$(".panalty").on("click",function(){
	console.log("마이너스 터치!")
	var $this = $(this).siblings(".marks").children("#marks");
	var score = $this.text(); //현재점수
	$this.text(Number(score)-ten);
	console.log(score);
	if (score == 10) {
		$this.text("쿠션");
		$(this).off('click');
		$(this).siblings(".score").off('click');		
		$this.parent(".marks").css({"background-color" : "#379c23",
									"color" : "white",
									"font" : "30px bold",
									"text-align" : "center"});
		$($this.parent(".marks")).on("click",function(){
			console.log("게임종료!!");			
			$(this).children("#marks").text(++record);	
			$(this).attr("data-record",record);
			var playNo = $(this).data("playno");
			console.log("등수번호 :"+$(this).data("record"));
			console.log("부꼴지플레이번호 :"+playNo);
			var activeAverage = $(this).parent().siblings(".bdtop").find("#act-average").text();
			console.log("총친다마 : "+activeAverage);
			var playUserVo = {
					playNo : playNo,
					record : record,
					gameNo : gameNo,					
					activeAverage : activeAverage					
			}
			var thisForm = this;
			$.ajax({			
				url : "${pageContext.request.contextPath}/tablet/saveplay",		
				type : "post",
				/* contentType : "application/json", */
				data : playUserVo,
				
				dataType : "json",
				success : function(action){						
					console.log(action);	
					if(action.result == 'success') {//처리성공	
						console.log("성공");
						console.log(action.data);
						
						/* 리다이렉트 */					
						//let url = '/modang/tablet/${tableNo}/scoreboard';
						//window.location.replace(url);							
						
						console.log("플레이정보 입력완료");
						time = action.data.playTime;
						timeStamper = function(){	
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
							$(thisForm).append(th + ":" + tm + ":" + ts);						
					}
						timeStamper();
						
					}else {//오류처리
						var msg = action.failMsg;
							alert(msg);				
					}					
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}		
				
			});	
			$(thisForm).off('click');
			if(memberNum - 1 == $(thisForm).data('record')) {//멤버숫자 - 1 = 현재 등수 와 같으면 -> 꼴지와 꼴지-1등같이 처리	
				console.log("멤버숫자 :" + memberNum);
				record++;
				$(this).off('click');
				$(this).attr("data-record",record);
				var lastMemeber = $("div[data-record=0]");
				var lastPlayNo = lastMemeber.data('playno');					
				console.log("꼴지플레이번호 :"+lastPlayNo);
				lastMemeber.css({
								"background-color" : "#379c23",
								"color" : "white",
								"font" : "30px bold",
								"text-align" : "center"
								});
				lastMemeber.siblings().off('click');
				var lastActiveAverage = lastMemeber.parent().siblings(".bdtop").find("#act-average").text();				
				console.log("꼴지 총친타수 : "+lastActiveAverage);
				
				var lastPlayUserVo = {
						playNo : lastPlayNo,
						record : memberNum,
						gameNo : gameNo,					
						activeAverage : lastActiveAverage

				}
				console.log(lastPlayUserVo);
			
				$.ajax({			
					url : "${pageContext.request.contextPath}/tablet/saveplay",		
					type : "post",
					/* contentType : "application/json", */
					data : lastPlayUserVo,
					
					dataType : "json",
					success : function(action){						
						console.log(action);	
						if(action.result == 'success') {//처리성공	
							console.log("성공");
							console.log(action.data);							
													
							console.log("플레이정보 입력완료");
							time = action.data.playTime;
							timeStamper = function(){	
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
								lastMemeber.append(th + ":" + tm + ":" + ts);						
						}
							timeStamper();
							gameStop();							
							
						}else {//오류처리
							var msg = action.failMsg;
								alert(msg);				
						}					
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}		
					
				});	
				$("div[data-record=0]").off('click');
			 }
		});
		
	}
	
});

/* 화면3. 플러스 클릭할때 */ 

$(".score").on("click",function(){
	console.log("플러스 터치!")
	var $this = $(this).siblings(".marks").children("#marks");
	var score = $this.text(); //현재점수
	var $actThis = $(this).parent().siblings(".bdtop").find("#act-average")
	var	actscore = $actThis.text();
	//var actscore = $("#act-average").val();	
	$this.text(Number(score)+Number(ten));
	$actThis.text(Number(actscore)+Number(ten));
	console.log(score);	
});

/* 동작1. 시작버튼 클릭했을때(1번만실행) */
$(".btnBox").one("click","#startbtn", function(){
	console.log("시작버튼 클릭!")
	gameStart();
});

/* 동작2. 일시정지버튼 클릭했을때 */
$('.btnBox').on("click","#pausebtn",function(){
	console.log("일시정지버튼 클릭!")
	gamePause();
});  

/* 동작3. 시작2버튼 클릭했을때 */
$('.btnBox').on("click","#restartbtn", function(){
	console.log("재시작버튼 클릭!")
	gameReStart();
});

/* 동작4. 종료버튼 클릭했을때 */
$(".btnBox").on("click","#stopbtn",function(){
	console.log("종료버튼 클릭!");
	$('.bdmid > div').off('click');		
	 if(confirm("강제종료시 일시정지시간은 초기화됩니다.") == true){
		 	gameQuit();
	        alert("강제종료되었습니다");	       
	    }
	    else{
	        return ;
	    }
	
});
/* 동작5. 결과보기 버튼 클릭했을때 */
$(".btnBox").on("click","#resultbtn", function(){
	console.log("결과보기버튼 클릭!");
	$('.bdmid > div').off('click');		
	var returnValue = confirm("결과확인하러 가기");

	if (returnValue == true) {		
		let url = '/modang/tablet/${tableNo}/resultPage?gameNo='+gameNo;
		window.location.replace(url);
	}else {
		return ;
	}					

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
				 $('.btnBox > button').remove('#pausebtn');	
				 $('.btnBox > button').remove('#startbtn');
				 $('.btnBox > button').remove('#restartbtn');
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
				 $('.btnBox > button').remove('#pausebtn');
				 $('.btnBox > button').remove('#startbtn');
				 $('.btnBox > button').remove('#restartbtn');
				 $('.btnBox').prepend('<button id="restartbtn" class="fa fa-pause" aria-hidden="true">재시작</button>');
				//3.타이머 기본값 결정
				console.log(action.data.secondsToTime);
				time = action.data.secondsToTime;				
				clearInterval(timer);				
				console.log("타이머 일시정지!");
				//4.사용시간 (출력)  //요금계산은 자동	
				console.log("타임출력 실행!");
				timeStamper = function(){	
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
				}
				timeStamper();
				console.log("일시정지시간 출력!");
					
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
				 $('.btnBox > button').remove('#pausebtn');
				 $('.btnBox > button').remove('#startbtn');
				 $('.btnBox').prepend('<button id="pausebtn" class="fa fa-pause" aria-hidden="true">일시정지</button>');
				 
				//3.타이머 기본값 결정
					console.log(action.data.secondsToTime);
					time = action.data.secondsToTime;
					//4.타이머 시작(출력)  //요금계산은 자동
					timer = setInterval(function(){						
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
						time++;
					}, 1000);	
					console.log("타이머 작동!");
			
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
/* 기능4. 게임정상종료 */
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
				 $('.btnBox > button').remove();
				 $('.btnBox').html('<button id="resultbtn" class="fa fa-stop" aria-hidden="true">결과보기</button>')				 
				 
						
				 
				//3.타이머 기본값 결정
					console.log(action.data.secondsToTime);
					time = action.data.secondsToTime;
					clearInterval(timer);
	
					console.log("타이머 정지!")
					//4.사용시간 (출력)  //요금계산은 자동				 
					timeStamper = function(){
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
						};	
						timeStamper();
						console.log("사용시간 출력!")				
			
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
/* 기능5. 게임 강제종료 */
function gameQuit() {
	//1.테이블 게임번호 전송-->게임정보 받음
	var tableGameVo = {
			tableNo : tableNo,
			gameNo : gameNo
	}
	console.log(tableGameVo);
	$.ajax({			
		url : "${pageContext.request.contextPath}/tablet/playquit",		
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
				//2.버튼출력변경() 및 이벤트 종료
				
				$('.btnBox > button').remove();
				$('.btnBox').html('<button id="resultbtn" class="fa fa-stop" aria-hidden="true">결과보기</button>')				 
				 
				//3.타이머 기본값 결정
					console.log(action.data.secondsToTime);
					time = action.data.secondsToTime;
					if(time != 0){
						clearInterval(timer);
					}	
					console.log("타이머 정지!")
					//4.사용시간 (출력)  //요금계산은 자동				 
					timeStamper = function(){
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
						};	
						timeStamper();
						console.log("사용시간 출력!")				
			
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

/* 기능6. 시간그리기 */
function init(){
	$("#time").html("00:00:00");
}
/* 기능7. 포즈상태 */
function statusPause(){	
	//1.테이블 게임번호 전송-->게임정보 받음
	var tableGameVo = {
			tableNo : tableNo,
			gameNo : gameNo
	}
	console.log(tableGameVo);
	$.ajax({			
		url : "${pageContext.request.contextPath}/tablet/pausestatus",		
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
				 $('.btnBox > button').remove('#pausebtn');
				 $('.btnBox > button').remove('#startbtn');
				 $('.btnBox > button').remove('#restartbtn');
				 $('.btnBox').prepend('<button id="restartbtn" class="fa fa-pause" aria-hidden="true">재시작</button>');
				//3.타이머 기본값 결정
				console.log(action.data.secondsToTime);
				time = action.data.secondsToTime;				
				clearInterval(timer);				
				console.log("타이머 일시정지!");
				//4.사용시간 (출력)  //요금계산은 자동	
				console.log("타임출력 실행!");
				timeStamper = function(){	
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
				}
				timeStamper();
				console.log("사용시간 출력!");
					
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
/* 기능8. 재시작상태 */
function statusReStart(){
	//1.테이블 게임번호 전송-->게임정보 받음
	var tableGameVo = {
			tableNo : tableNo,
			gameNo : gameNo
	}
	console.log(tableGameVo);
	$.ajax({			
		url : "${pageContext.request.contextPath}/tablet/playstatus",		
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
				 $('.btnBox > button').remove('#pausebtn');
				 $('.btnBox > button').remove('#startbtn');
				 $('.btnBox').prepend('<button id="pausebtn" class="fa fa-pause" aria-hidden="true">일시정지</button>');
				 
				//3.타이머 기본값 결정
					console.log(action.data.secondsToTime);
					time = action.data.secondsToTime;
					//4.타이머 시작(출력)  //요금계산은 자동
					timer = setInterval(function(){						
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
						time++;
					}, 1000);	
					console.log("타이머 작동!");
			
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
</script>
</html>
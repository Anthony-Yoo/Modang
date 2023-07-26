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
					<input id="startbtn" class="fa fa-play" aria-hidden="true" value="시작">
					<input id="pausebtn" class="fa fa-pause" aria-hidden="true" value="일시정지">
					<input id="stopbtn" class="fa fa-stop" aria-hidden="true" value="종료">
				</div>			    
				<div class="timerBox float-l" id='timerBox'>
					<div id="time" class="time">00:00:00</div>
				</div>
				<div class="timerBox float-l" id="top-fee">
					<label for="btn-fee">결제요금</label>
					<input type="button" id="btn-fee">
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
							 점수판<p id="crtscore">${playUser.currentAverage}</p>
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
var tableNo = ${param.tableNo};
var gameNo = ${param.gameNo};
var tableFee = ${tableGameVo.tableFee};
var minFee = ${tableGameVo.minFee};	

/* 타이머 기술 */
var time = 0;
var starFlag = true;
$(document).ready(function(){
  buttonEvt();
});

function init(){
  document.getElementById("time").innerHTML = "00:00:00";
}

function buttonEvt(){
  var hour = 0;
  var min = 0;
  var sec = 0;
  var timer;

  // start btn
  $("#startbtn").on("click", function(){

    if(starFlag){    
      starFlag = false;

      if(time == 0){
        init();
      }

      timer = setInterval(function(){
        time++;

        min = Math.floor(time/60);
        hour = Math.floor(min/60);
        sec = time%60;
        min = min%60;

        var th = hour;
        var tm = min;
        var ts = sec;
        if(th<10){
        th = "0" + hour;
        }
        if(tm < 10){
        tm = "0" + min;
        }
        if(ts < 10){
        ts = "0" + sec;
        }

        document.getElementById("time").innerHTML = th + ":" + tm + ":" + ts;
      }, 1000);
    }
  });

  // pause btn
  $("#pausebtn").click(function(){
    if(time != 0){
      clearInterval(timer);
      starFlag = true;
    }
  });  
	
  // stop btn
  $("#stopbtn").click(function(){
    if(time != 0){
      clearInterval(timer);
      starFlag = true;
      time = 0;
      init();      
    }
  });
  

  /* 요금 산출 */
  $('#time').txt().on("propertychange change keyup paste input", function(){ 
	  console.log("시간변화감지");
	  var $time = $(this).html();
	  console.log($time);
	  var splitTime = $time.split(":");	  
	  var sumMin =  splitTime.eq(0)*60+splitTime.eq(1);
	  var ceilMin10 =  Math.ceil(sumMin/10);
	  var useMin10 = ceilMin-3;
	  if (useMin10<=3) {
		  useMin10 = 0;
	  }else {
		  useMin10 = useMin10;
	  }
	  console.log(useMin10);
	  var useFee = tableFee + (minFee*useMin10);
	  
	  $('#btn-fee').val(useFee);	  
  });
}

</script>
</html>
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
			#logtitle {
				color : #404040;
				text-align: center;
				
			}
			.box{
				width: 200px;
				height: 200px;
			}
			.timerBox{
				width: 200px;
				outline: 2px solid black;
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
				font-size: 30pt;
				color: #FAED7D;
				cursor: pointer;
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
				<div class="btnBox">
					<i id="startbtn" class="fa fa-play" aria-hidden="true"></i>
					<i id="pausebtn" class="fa fa-pause" aria-hidden="true"></i>
					<i id="stopbtn" class="fa fa-stop" aria-hidden="true"></i>
				</div>			    
				<div id='timerBox' class="timerBox">
					<div id="time" class="time">00:00:00</div>
				</div>
				<div class="float-l" id="top-fee">
					<label for="btn-fee">결제요금</label>
					<input type="button" id="btn-fee">
				</div>       
			</div>
		</div>
	</body>
<script>
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
  $("#startbtn").click(function(){

    if(starFlag){
      $(".fa").css("color","#FAED7D")
      this.style.color = "#4C4C4C";
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
      $(".fa").css("color","#FAED7D")
      this.style.color = "#4C4C4C";
      clearInterval(timer);
      starFlag = true;
    }
  });

  // stop btn
  $("#stopbtn").click(function(){
    if(time != 0){
      $(".fa").css("color","#FAED7D")
      this.style.color = "#4C4C4C";
      clearInterval(timer);
      starFlag = true;
      time = 0;
      init();
    }
  });
}

</script>
</html>
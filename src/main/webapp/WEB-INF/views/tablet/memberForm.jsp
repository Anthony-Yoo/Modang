<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			#logtitle {
				color : #404040;
				text-align: center;
				
			}
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
			#blankbox {		
				border : 0px;
				width : 100%;		
  				height: 200px;

			}
			#tab {
				margin-top : 30px;
				border-radius :5px;
				width : 150px;
				height : 40px;
				background-color: #00498c;		
				text-align: center;
			}	
			#tab p {
				color : white;
				font : 20px bold;
				line-height : 2;
			}
			#cardlist {
				width : 200px;  				
			}
			.imagebox {	
				margin-left : 105px;
				margin-top : 150px;			
				display : inline-block;
				outline : solid 2px black;
				width : 350px;
				height :350px;				
			}			
			
			.float-r {float: right; }
			.float-l {float: left; }
			.clear{clear: both; }	
			dt, dd {
		  		padding: 10px;
			}
			
			dt {
		  		border: 1px solid #eeeeee;
		  		margin-bottom: 5px;
			}
			
			dt span {
			  	display: inline-block;
		  		width: 5px;
		  		height: 5px;
		  		background-color: black;
		  		vertical-align: middle;
		  		margin-right: 10px;
			}
			
			dd {
		  		background-color: #eeeeee;;
	  			margin-bottom: 5px;
		  		display: none;
			}
			
			dd:hover{
		  		background-color: black;
		  		color:white;
			}	
		</style>
	</head>
	<body>
		<div id="container">				
			<h2 id="logtitle">Modang</h2>
			<h4>게임형식 : ${param.ball}구</h4>
			<!-- 카드리스트 -->
			<div class="left" id="cardlist">
				<div id="tab"><p>카드리스트</p></div>			
				<div>				
					<dl>
	                  <dt>
	                     <span></span>23년 7월
	                  </dt>
		                  <dd>- 어푸어푸 수영대회</dd>
		                  <dd>- 어푸어푸 수영대회</dd>
		                  <dd>- 어푸어푸 수영대회</dd>
	                  <dt>
	                     <span></span>23년 6월
	                  </dt>
		                  <dd>- 어푸어푸 수영대회</dd>
		                  <dd>- 어푸어푸 수영대회</dd>
		                  <dd>- 어푸어푸 수영대회</dd>
	                  <dt>
	                     <span></span>23년 5월
	                  </dt>
		                  <dd>- 어푸어푸 수영대회</dd>
		                  <dd>- 어푸어푸 수영대회</dd>
		                  <dd>- 어푸어푸 수영대회</dd>
	                  <dt>
	                     <span></span>23년 4월
	                  </dt>
		                  <dd>- 어푸어푸 수영대회</dd>
		                  <dd>- 어푸어푸 수영대회</dd>
		                  <dd>- 어푸어푸 수영대회</dd>                 
	               </dl>					
				</div>
			</div>
			<!-- 검색존 -->
			<div class="cent" id="cardlist">
		</div>
	</body>
<script>
   var $target = $("dt"), isClass = null;

   $target.on("click", function() {
      var _$self = $(this), isActive = _$self.hasClass("active");

      _$self.toggleClass("active");
      _$self.nextUntil("dt").slideToggle(!isActive);
   });
</script>
</html>
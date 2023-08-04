<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
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
			#logtitle {color : #404040;	text-align: center;height: 200px;}
			#container {background:#094e94;border-radius:10px; z-index: 1;	border: 1px;width: 1200px;height: 768px;position: absolute;left: 50%;	top: 50%;transform: translate(-50%, -50%);}
			#imagebox {
				display : inline-block;
				border : 0px;
				width : 350px;
				height :350px;
				
			}		
			#idbox {
				border : 0px;		
				margin-left : 50px;	
			}
			.box {
				margin-top : 150px;
				margin-left : 74px;
				border: 1px solid #404040; 
				background-color: #DDDDDD; 
				border-radius: 5px;
				width : 400px;
				height : 400px;		
			}
			#qrbox img {
				border : 0px;
				display : inline-block;
				width : 400px;
				height : 400px;				
			}			
			#logbox img {
				margin-left : 50px;
				margin-top : 30px;
				border : 0px;
				display : inline-block;
				width : 300px;
				height : 300px;				
			}
			.float-r {float: right; }
			.float-l {float: left; }
			.clear{clear: both; }
		</style>
	</head>
	<body>
		<div id="container">
			<h2 id="logtitle">휴대폰을 인증해주세요</h2>			
			<div class="content">	
				<div class="box float-l" id="qrbox">
					<img src="${pageContext.request.contextPath}/assets/images/qrcode_modang2.png"/>
				</div>
				<div class="box float-l" id="logbox">
					<img src="${pageContext.request.contextPath}/assets/images/photo.jpg"/>
					<div id="idbox">
						<form action="${pageContext.request.contextPath}/tablet/${tableNo}/keyLogin" method="get">
							<input type="text" name="keyNum">
							<button type="submit" id="keyin">키입력</button>
						</form>
						<c:if test="${param.result eq 'fail'}">
							<span>인증키를 다시 입력해주세요</span>
						</c:if>
					</div>
				</div>			 
			</div>
		</div>
	</body>
</html>
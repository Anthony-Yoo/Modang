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
		</style>
	</head>
	<body>
		<div id="container">				
			<h2 id="logtitle">Modang</h2>
			<div class="content">				
				<a href="${pageContext.request.contextPath}/tablet/memberForm?ball=3">
					<img src="${pageContext.request.contextPath}/assets/images/3ball.jpg" class="imagebox"/>
				</a>
				<a href="${pageContext.request.contextPath}/tablet/memberForm?ball=4">			
					<img src="${pageContext.request.contextPath}/assets/images/4ball.jpg" class="imagebox"/>
				</a>			
			</div>
		</div>
	</body>
</html>
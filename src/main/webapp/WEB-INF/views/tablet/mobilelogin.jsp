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
			#container {
				border : 1px;
				outline: dashed 1px black;
				width : 360px;
				height : 640px;
				position : absolute;
				left : 50%;
				top : 50%;
				transform : translate(-50%,-50%);						  	
			}
			#logtitle {
				color : #404040;
				text-align: center;				
			}		
			#content {
				margin-top: 30px;
			}	
			#logbox {
				margin-left : 30px;
				border: 0px; 
				background-color: #DDDDDD; 
				border-radius: 5px;
				width : 300px;
				height : 500px;		
			}
			#logbox img {	
				border : 0px;
				display : inline-block;
				width : 300px;
				height : 131px;				
			}			
			#idbox {
				border : 0px;				
				width : 300px;
				height : 80px;	
			}	
			#messagebox {
				width : 300px;
				height : 50px;
				border : 0px;
/* 				outline : 1px solid #404040;	 */		
			}		
			#keybox {
				border : 0px;
/* 				outline: dashed 1px black; */
				width : 300px;
				height : 200px;
			}
			#keybox dt {
				font-size: 14px;
				font-weight: bold;
			}
			#keybox dd {
				margin-left : 0px;
				text-align : center;
				font-size: 100px;
				font-weight: bold;
			}				
			.float-r {float: right; }
			.float-l {float: left; }
			.clear{clear: both; }
		</style>
	</head>
	<body>	
		<div id="container">			
			<h2 id="logtitle"><br>Modang</h2>
			<div id="content">	
				<div id="logbox">
					<img src="${pageContext.request.contextPath}/assets/images/logo.png"/>					
					<div id="idbox">				
						<form action="${pageContext.request.contextPath}/mobile/login" method="get">
							<label for="id">아이디 :&nbsp;&nbsp;&nbsp;</label>
							<input type="text" name="id" placeholder="아이디 입력" style="width:100px"><br>
							<label for="passwd">비밀번호 : </label>
							<input type="password" name="passwd" placeholder="패스워드 입력" style="width:100px"><br>
							<button type="submit" id="loginBtn">Login</button>
						</form>
					</div>	
					<div id="messagebox">	
						<c:if test="${param.result eq 'fail'}">						
		      			<span>아이디 또는 비번을 확인해 주세요.</span>
		      			</c:if>					
					</div>			
					<div id="keybox">
						<dl>
							<dt>※Check Your KeyNumber</dt><br><br>
							<dd></dd>
						</dl>
					</div>
				</div>			 
			</div>
		</div>
	</body>
</html>
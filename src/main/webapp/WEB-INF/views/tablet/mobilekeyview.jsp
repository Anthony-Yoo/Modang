<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		 <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no,maximum-scale=1.0, minimum-scale=1.0">
		<title>※모두의 당구※</title>
		<link href="${pageContext.request.contextPath}/assets/css/mobile.css" rel="stylesheet" type="text/css">	
		<style>
		.container {
				border : solid 1px black;
				outline: dashed 1px black;
				width : 410px;
				height : 730px;
				position : absolute;
				left : 50%;
				top : 50%;
				transform : translate(-50%,-50%);						  	
		}
		#usernic {
			font-weight: bold;
			font-size: 30px;
		}	
		#title-desc {
			font-size: 13px;
		}
		</style>
	</head>
	<body>	
		<div class="container">			
			<h1 class="logo"><img src="${pageContext.request.contextPath}/assets/images/logo.png"/></h1>
			<div class="content2">
				<h3 id="title">■ ${keyUser.id}<span id="title-desc">의 모두의당구</span></h3>
				<ul>
					<li>
						<p><span id="usernic">${keyUser.nick}</span>님 환영합니다.</p>
					</li>
					<li>
						<p>${keyUser.createDate} <br>키를 생성하셨습니다.</p>
					</li>
				</ul>					
			</div>				
			<div class="login-key-box">	
				${keyUser.keyNum}						      							
			</div>			
			<div class="footer2">
				<div class="ft-bts">
					<a href="${pageContext.request.contextPath}/">modang &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; </a>
					<a href="${pageContext.request.contextPath}/mobile">로그인</a>
				</div>
				<div class="ft-util">
					<p class="cpt">Copyright ⓒ 2023 modang. All rights reserved.</p>			
				</div>
			</div>			
		</div>					
	</body>	
</html>
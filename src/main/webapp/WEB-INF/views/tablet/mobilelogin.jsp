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
		</style>
	</head>
	<body>	
		<div class="container">			
			<h1 class="logo"><img src="${pageContext.request.contextPath}/assets/images/logo.png"/></h1>
			<div class="content">
				<form method="get" id="loginProcess" action="${pageContext.request.contextPath}/mobile/login">
					<fieldset class="login-form3">
						<legend class="blind">로그인</legend>
						<div class="login-ipt-box">
							<label for="Id" class="blind">아이디</label>
							<input type="text" placeholder="아이디" id="code" name="id" class="ipt">
						<!-- <button class="btn-ico-del"></button> -->
						</div>
						<div class="login-ipt-box">
							<label for="Pwd" class="blind">비밀번호</label>
							<input type="password" placeholder="비밀번호" id="password" name="passwd" class="ipt">
						<!-- <button class="btn-ico-del"></button> -->
						</div>						
						<button class="btn login" type="submit" id="loginAction">로그인</button><br>
						<button class="btn signup" type="button" onclick="location.href='${pageContext.request.contextPath}/user/joinForm'" id="signupAction">회원가입</button>								
					</fieldset>					
				</form>
			</div>				
			<div class="login-message-box">	
				모당서비스 당구장에 오신것을 환영합니다...로그인하여 Key생성하십시오.
				<c:if test="${param.result eq 'fail'}">						
      			<span>아이디 또는 비번을 확인해 주세요.</span>
      			</c:if>			      							
			</div>			
			<div class="footer">
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
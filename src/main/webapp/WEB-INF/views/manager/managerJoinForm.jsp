<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b-join</title>
<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
<link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet"
	type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/manager.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<!-- 헤더 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
	<!-- 헤더 끝 -->
	<div id="main-content">
		<div class="container">
			<h2>환영합니당</h2>
			<h3>관리자 정보</h3>
			<form action="${pageContext.request.contextPath}/manager/join" id="" method="post">
				<div class="">
						<div class="join-wrap">
							<div class="con">
								<span class="inp-txt">
									<img src="${pageContext.request.contextPath}/assets/images/id.png" alt="아이디ㄲ"> 
									<input type="text" id="id" name="id" placeholder="아이디">
									<a href="" class="chck">중복체크</a>
								</span>
								<p class="error-msg">이미 사용중인 아이디 입니당</p>
							</div>
							<div class="con">
								<span class="inp-txt"> 
									<img src="${pageContext.request.contextPath}/assets/images/settings.png" alt="비밀번호">
									<input type="password" id="passwd" name="passwd" placeholder="비밀번호">
								</span>
							</div>
							<div class="con">
								<span class="inp-txt">
									<img src="${pageContext.request.contextPath}/assets/images/file.png" alt="사업자 등록번호"> 
									<input type="text" id="companyNo" name="companyNo" placeholder="사업자 등록번호">
								</span>
							</div>														
							<div class="con">
								<span class="inp-txt">
									<img src="${pageContext.request.contextPath}/assets/images/user.png" alt="이름">
									<input type="text" id="repName" name="repName" placeholder="이름">
								</span>
							</div>
							<div class="con">
								<span class="inp-txt"> 
									<img src="${pageContext.request.contextPath}/assets/images/home.png" alt="매장 이름"> 
									<input type="text" id="billardName" name="billardName" placeholder="매장 이름">
								</span>
							</div>
							<div class="con">
								<span class="inp-txt"> 
									<img src="${pageContext.request.contextPath}/assets/images/map.png" alt="매장 주소"> 
									<input type="text" id="billardName" name="billardName" placeholder="매장 주소">
								</span>
							</div>							
							<div class="con">
								<span class="inp-txt">
									<img src="${pageContext.request.contextPath}/assets/images/phone.png" alt="매장 번호"> 
									<input type="text" id="billardPhone" name="billardPhone" placeholder="매장 번호">
								</span>
							</div>
							<div class="con">
								<div class="inp-txt">
	
								</div>
							</div>
						</div><!-- join-wrap -->
			</div>
			<h3>매장 정보</h3>
			<div>
				<div class="join-wrap">
					<div class="con">
						<ul>
							<li class="image">
								<img src="${pageContext.request.contextPath}/assets/images/poketball.jpg" alt="포켓볼">
							</li>
							<li class="image">
								<img src="${pageContext.request.contextPath}/assets/images/4gu.jpg" alt="4구">
							</li>
							<li class="image">
								<img src="${pageContext.request.contextPath}/assets/images/smoking.jpg" alt="흡연구역">
							</li>
						</ul>
					</div>
					<div class="con">
						<span class="inp-txt"> 
							<img src="${pageContext.request.contextPath}/assets/images/clock.png" alt="이용시간"> 
							<input type="time" class="input" name="time1">
							 ~ 
							<input type="time" class="input" name="time2">
						</span>
					</div>
					<div class="con">
						<span class="inp-txt">
							<img src="${pageContext.request.contextPath}/assets/images/parking.png" alt="주차 여부">
							<input type="radio" id="parking" name="parking">
						</span>
					</div>
					<div class="con">
						<span class="inp-txt">
							<img src="${pageContext.request.contextPath}/assets/images/file.png" alt="추가 내용">
							<input type="text" id="bdComment" name="bdComment" placeholder="추기 정보">
						</span>
					</div>					
				</div><!-- join-wrap -->
			</div>
				<a href="${pageContext.request.contextPath}/" class="button">회원가입할거당</a>
			</form>
		</div><!-- container -->
	</div><!-- main-content -->
	<!-- 푸터 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
	<!-- 푸터 끝 -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="header-container">
    <div id="header">
        <div id="header-user" class="clearfix">
	        <c:choose>
	        	<c:when test="${sessionScope.authUser == null}">
	            <!-- 로그인실패시, 로그인전 -->
	            <ul>
	                <li class="user btn-flat btn-ss"><a href="${pageContext.request.contextPath}/user/loginForm">로그인</a></li>
	                <li class="user btn-flat btn-ss"><a href="${pageContext.request.contextPath}/user/userJoinForm">회원가입</a></li>
	            </ul>
	            </c:when>
	            <c:otherwise>
	            <!-- 로그인성공시, 로그인후 -->
	            <ul>
	                <li class="hello"><strong><a href="${pageContext.request.contextPath}">${sessionScope.authUser.nick}님</a></strong></li>
	                
	                <li class="btn-flat btn-ss"><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
	                <li class="btn-flat btn-ss"><a href="${pageContext.request.contextPath}/user/userPage">마이페이지</a></li>
	            </ul> 
	            </c:otherwise>
	        </c:choose>
        </div>
        
        <div id="header-logo_menu" class="clearfix">
	        <div id="logo">
	            <h1>
	            	<a href="${pageContext.request.contextPath}/">
	            		<img id="logo-img" src="${pageContext.request.contextPath}/assets/images/a-modang.png">
	            	</a>
	            </h1> <!-- 헤더 로고 이미지 -->
	        </div>
	        
	        <!-- 사이트 메뉴 카테고리(?) -->
	        <div id="header-menu">
	            <ul class="clearfix">
	                <li><a href="${pageContext.request.contextPath}/">모당이란?</a></li>
	                <li><a href="${pageContext.request.contextPath}/manager/modangFind">당구장 찾기</a></li>
	                <li><a href="${pageContext.request.contextPath}/board/list?crtPage=1">매칭 게시판</a></li>
	            </ul>
	        </div>
	        <!-- 사이트 메뉴 카테고리(?) 끝 -->
		</div>
    </div>
    <!-- //header -->
</div>
<!-- //header-container -->
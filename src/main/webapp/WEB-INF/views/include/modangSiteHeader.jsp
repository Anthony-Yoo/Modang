<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>
    <div id="header">
        <div id="logo">
            <h1><a href="${pageContext.request.contextPath}/"><img id="logo-img" src="${pageContext.request.contextPath}/assets/images/modang.png"></a></h1> <!-- 헤더 로고 이미지 -->
        </div>
        <div id="header-user">
        <c:choose>
        	<c:when test="${sessionScope.authUser == null}">
            <!-- 로그인실패시, 로그인전 -->
            <ul>
                <li class="user"><a href="${pageContext.request.contextPath}/user/loginForm">로그인</a></li>
                <li class="user"><a href="${pageContext.request.contextPath}/user/joinForm">회원가입</a></li>
            </ul>
            </c:when>
            <c:otherwise>
            <!-- 로그인성공시, 로그인후 -->
            <!----> <ul>
            		
                <li><strong><a href="${pageContext.request.contextPath}">${sessionScope.authUser.nick}님 안녕하세요 ^^</a></strong></li>
                
                <li><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
                <li><a href="${pageContext.request.contextPath}/user/userPage">마이페이지</a></li>
            </ul> 
            </c:otherwise>
        </c:choose>
        </div>
        <!-- 사이트 메뉴 카테고리(?) -->
        <div id="header-menu">
            <ul>
                <li><a href="${pageContext.request.contextPath}/">모당이란?</a></li>
                <li><a href="${pageContext.request.contextPath}/modangFind">당구장 찾기</a></li>
                <li><a href="${pageContext.request.contextPath}/board/list">매칭 게시판</a></li>
            </ul>
        </div>
        <!-- 사이트 메뉴 카테고리(?) 끝 -->
    </div>
</body>
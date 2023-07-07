<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>
    <div id="header">
        <div id="logo">
            <h1><a href=""><img id="logo-img" src="${pageContext.request.contextPath}/assets/image/modang.png"></a></h1> <!-- 헤더 로고 이미지 -->
        </div>
        <div id="header-user">
            <!-- 로그인실패시, 로그인전 -->
            <ul>
                <li class="user"><a href="">로그인</a></li>
                <li class="user"><a href="">회원가입</a></li>
            </ul>
            <!-- 로그인성공시, 로그인후 -->
            <!-- <ul>
                <li>000님 안녕하세요</li>
                <li><a href="">로그아웃</a></li>
                <li><a href="">회원정보수정</a></li>
            </ul> -->
        </div>
        <!-- 사이트 메뉴 카테고리(?) -->
        <div id="header-menu">
            <ul>
                <li><a href="">모당이란?</a></li>
                <li><a href="">당구장 찾기</a></li>
                <li><a href="">매칭 게시판</a></li>
            </ul>
        </div>
        <!-- 사이트 메뉴 카테고리(?) 끝 -->
    </div>
</body>
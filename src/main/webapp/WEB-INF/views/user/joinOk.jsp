<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 완료!</title>
    <link href="${pageContext.request.contextPath}/assets/css/board.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
     <!-- 헤더 시작 -->
     <div id="header">
        <div id ="logo">
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
    <!-- 헤더 끝 -->

    <br>
    <br>
    
    <div id="user">
		
		<div id="joinOK">

    <div class="container">
        <div class="jumbotron">
            <br>
            <br>
            <h1>회원가입을 축하합니다.</h1>
            <br>      
            <p><strong>modang! modang! 즐거운 modang!</strong></p>
        </div>
    
    </div>
    	</div>
           
    </div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modang</title>
	<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
	<link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/manager.css" rel="stylesheet" type="text/css">
</head>
<body>
    <!-- 헤더 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
    <!-- 헤더 끝 -->
    <div  id="main-content">
        <div class="container">
            <div class="main">
                <img src="${pageContext.request.contextPath}/assets/images/modang_logo.png" alt="">
            </div>
            <div class="intro">
                <h2 style="padding:0 0 0 25px;">모당이란?</h2>
                <div class="modang_tip">
                    <ul class="user_tip">
                        <li class="tip">
                            <a href="${pageContext.request.contextPath}/">
                                <em>모당 서비스란?</em>
                                <p><b>전 지역 어디서든,</b></p>
                                <p><b>당구를 사랑하는 분들에 도전을 위한,</b></p>
                                <p><b>매칭 기록 서비스!</b></p>
                                   
                            </a>
                        </li>
                        <li class="tip">
                            <a href="${pageContext.request.contextPath}/">
                                <em>모당 서비스 이용방법</em>
                                <p><b>회원가입</b></p>
                                <p><b>지역별 당구장 검색을 통한 매칭 게시판 회원매칭,</b></p>
                                <p><b>친구목록 유저 불러오기로 간편 팀 만들기</b></p>
                                
                            </a>
                        </li>
                        <li class="tip">
                            <a href="${pageContext.request.contextPath}/board/list">
                                <em>매칭 서비스</em>
                                <p><b>원하는 지역 검색,</b></p>
                                <p><b>매칭 게시판에 매칭 글 게시,</b></p>
                                <p><b>게시된 글에 댓글 달기</b></p>
                                  
                            </a>
                        </li>
                    </ul>
                    <ul class="manager_tip">
                     <!-- 로그인실패시, 로그인전 -->
                        <li class="tip">
                            <a href="${pageContext.request.contextPath}/manager/loginForm">
                                <em>당구장 관리 서비스</em>
                                <p><b>기존 당구장 관리 시스템을 기본으로 업그레이드 완료!</b></p>
                                <p><b>처음 사용자도 간편하게 사용 가능,</b></p>
                                <p><b>신세대 디자인으로 멋지고 고급스러운 당구장 어필!</b></p>
                                 
                            </a>
                        </li>
                        <li class="tip">
                            <a href="${pageContext.request.contextPath}/manager/loginForm">당구장 관리하러 가기</a>
                        </li>
                        <!-- 로그인성공시, 로그인후 -->
                        <!-- 
                        <li class="tip">
                            <a href="${pageContext.request.contextPath}/manager/settings">
                                <em>당구장 관리 서비스</em>
                                <p>
                                    기본 당구장 관리시스템과 비슷해<br>
                                    처음 사용시 어려움이 없지 않을까?<br>
                                    본인 매장 어필 가능?어캐?
                                </p>
                            </a>
                        </li>
                        <li class="tip">
                            <a href="${pageContext.request.contextPath}/manager/index">당구장 관리하러 가기</a>
                        </li>
                         -->
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- 푸터 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
    <!-- 푸터 끝 -->
</body>
</html>
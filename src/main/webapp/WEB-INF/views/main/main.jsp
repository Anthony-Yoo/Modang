<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modang</title>
	<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
	<link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
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
                <h2>&nbsp&nbsp모당이란?</h2>
                <div class="modang_tip">
                    <ul class="user_tip">
                        <li class="tip">
                            <a href="${pageContext.request.contextPath}/">
                                <em>모당 서비스란?</em>
                                <p>
                                    본인 전적 저장가능<br>
                                    지역별 당구장 검색<br>
                                    모르는사람과 당구칠수잇는<br>
                                    뭐다냐 제공해주는 사이트
                                </p>
                            </a>
                        </li>
                        <li class="tip">
                            <a href="${pageContext.request.contextPath}/">
                                <em>모당 서비스란 이용방법</em>
                                <p>
                                회원가입-<br>
                                -주 기능 회원매칭 서비스<br>
                                -친구 목록에서 간편 팀 만들기
                                </p>
                            </a>
                        </li>
                        <li class="tip">
                            <a href="${pageContext.request.contextPath}/board/list">
                                <em>매칭 서비스</em>
                                <p>
                                    게시글에 글 올리거나 댓글<br>
                                    - 수락 되면 놀자 키킥
                                </p>
                            </a>
                        </li>
                    </ul>
                    <ul class="manager_tip">
                     <!-- 로그인실패시, 로그인전 -->
                        <li class="tip">
                            <a href="${pageContext.request.contextPath}/manager/loginForm">
                                <em>당구장 관리 서비스</em>
                                <p>
                                    기본 당구장 관리시스템과 비슷해<br>
                                    처음 사용시 어려움이 없지 않을까?<br>
                                    본인 매장 어필 가능?어캐?
                                </p>
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
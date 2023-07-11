<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b-login</title>
    <link href="${pageContext.request.contextPath}/assets/css/manager.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
</head>
<body>
    <!-- 헤더 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
    <!-- 헤더 끝 -->
    <div id="main-content">
        <div class="container">
            <h2>로그인</h2>
            <div class="">
                <form action="" id="" name="" method="">
                    <fieldset>
                        <div class="login-wrap">
                            <div class="con">
                                <span class="inp-txt">
                                    <img src="${pageContext.request.contextPath}/assets/image/user.png" alt="">
                                    <input type="text" id="bID" name="bID" placeholder="아이디">
                                </span>
                                <p class="error-msg">아이디가 틀렸습니다</p>
                            </div>
                            <div class="con">
                                <span class="inp-txt">
                                    <img src="${pageContext.request.contextPath}/assets/image/settings.png" alt="">
                                    <input type="password" id="bPW" name="bPW" placeholder="비밀번호">
                                </span>
                                <p class="error-msg">비밀번호가 틀렸습니다.</p>
                            </div>
                            <div class="con">
                                <span class="inp-txt">
                                    <input type="checkbox" id="cb1">
                                    <label for="cb1">아이디 저장하기</label>
                                    <div class="addition">
                                        <a href="">아이디 찾기</a>
                                        <a href="">비밀번호 찾기</a>
                                    </div>
                                </span>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
            <a href="" class="button">로그인할거당</a>
        </div>
    </div>
    <!-- 푸터 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
    <!-- 푸터 끝 -->
</body>
</html>
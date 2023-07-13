<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b-join</title>
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
            <h2>환영합니당</h2>
            <h3>관리자 정보</h3>
            <div class="">
                <form action="" id="" name="" method="">
                    <fieldset>
                        <div class="join-wrap">
                            <div class="con">
                                <span class="inp-txt">
                                    <img src="${pageContext.request.contextPath}/assets/images/id.png" alt="">
                                    <input type="text" id="bID" name="bID" placeholder="아이디">
                                    <a href="" class="chck">중복체크</a>
                                </span>
                                <p class="error-msg">이미 사용중인 아이디 입니당</p>
                            </div>
                            <div class="con">
                                <span class="inp-txt">
                                    <img src="${pageContext.request.contextPath}/assets/images/user.png" alt="">
                                    <input type="text" id="bName" name="bName" placeholder="이름">
                                </span>
                            </div>
                            <div class="con">
                                <span class="inp-txt">
                                    <img src="${pageContext.request.contextPath}/assets/images/settings.png" alt="">
                                    <input type="password" id="bPW" name="bPW" placeholder="비밀번호">
                                </span>
                                <p></p>
                            </div>
                            <div class="con">
                                <span class="inp-txt">
                                    <img src="${pageContext.request.contextPath}/assets/images/settings.png" alt="">
                                    <input type="password" id="bPW-ch" name="bPW-ch" placeholder="비밀번호 확인">
                                </span>
                                <p class="error-msg">비밀번호를 다시 한번 입력해 주세요</p>
                            </div>
                            <div class="con">
                                <span class="inp-txt">
                                    <img src="${pageContext.request.contextPath}/assets/images/home.png" alt="">
                                    <input type="text" id="bStore" name="bStore" placeholder="매장 이름">
                                </span>
                            </div>
                            <div class="con">
                                <span class="inp-txt">
                                    <img src="${pageContext.request.contextPath}/assets/images/file.png" alt="">
                                    <input type="text" id="bCRN" name="bCRN" placeholder="사업자 등록번호">
                                </span>
                            </div>
                            <div class="con">
                                <span class="inp-txt">
                                    <img src="${pageContext.request.contextPath}/assets/images/phone.png" alt="">
                                    <input type="text" id="bNum" name="bNum" placeholder="매장 번호">
                                </span>
                            </div>
                            <div class="con">
                                <div class="inp-txt">
                                    <span class="sel-box">
                                        <img src="${pageContext.request.contextPath}/assets/images/map.png" alt="">
                                        <select name="" id="" >
                                            <option value="">시/도</option>
                                            <option value="">서울시</option>
                                            <option value="">경기도 고양시</option>
                                            <option value="">경기도 과천시</option>
                                            <option value="">경기도 광명시</option>
                                            <option value="">경기도 광명시</option>
                                        </select>
                                        <select name="" id="">
                                            <option value="">구/군</option>
                                            <option value="">강동구</option>
                                            <option value="">송파구</option>
                                            <option value="">광진구</option>
                                            <option value="">강남구</option>
                                        </select>
                                    </span>
                                    <input type="text" placeholder="상세주소">
                                    <button type="button" class="chck">주소 찾기</button>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
            <h3>매장 정보</h3>
            <div>
                <form action="" id="" name="" method="">
                    <fieldset>
                        <div class="join-wrap">
                            <div class="con">
                                <ul>
                                    <li class="image"><img src="${pageContext.request.contextPath}/assets/images/poketball.jpg" alt="포켓볼"></li>
                                    <li class="image"><img src="${pageContext.request.contextPath}/assets/images/4gu.jpg" alt="4구"></li>
                                    <li class="image"><img src="${pageContext.request.contextPath}/assets/images/smoking.jpg" alt="흡연구역"></li>
                                    <li class="image"><img src="${pageContext.request.contextPath}/assets/images/price.jpg" alt="가격표"></li>
                                    <li class="image"><img src="${pageContext.request.contextPath}/assets/images/room.jpg" alt="룸"></li>
                                </ul>
                            </div>
                            <div class="con">
                                <span class="inp-txt">
                                    <img src="${pageContext.request.contextPath}/assets/images/clock.png" alt="">
                                    <input type="text" class="input" placeholder="이용시간 입력">
                                    ~
                                    <input type="text" class="input" placeholder="이용시간 입력">
                                </span>
                            </div>
                            <div class="con">
                                <span class="inp-txt">
                                    <img src="${pageContext.request.contextPath}/assets/images/parking.png" alt="">
                                    <input type="text" id="bNum" name="bNum" placeholder="주차 여부">
                                </span>
                            </div>
                        </div>
                </form>
            </div>
            <a href="${pageContext.request.contextPath}/" class="button">회원가입할거당</a>
        </div>
    </div>
    <!-- 푸터 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
    <!-- 푸터 끝 -->
</body>
</html>
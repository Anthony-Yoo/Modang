<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modang 당구장 찾기</title>
	<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
    <link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/manager.css" rel="stylesheet" type="text/css">
</head>
<body>
    <!-- 헤더 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
    <!-- 헤더 끝 -->
    <div class="main-con">
        <div class="BCon">
            <h2>모당 찾기</h2>
            <div class="con">
                <div class="search">
                    <div class="search-map">
                        <p>주변당구장</p>
                        <select name="" id="do" class="search-add">
                            <option value="시/도">시/도</option>
                            <option value="서울시">서울시</option>
                            <option value="경기도">경기도</option>
                        </select>
                        <select name="" id="gu" class="search-add">
                            <option value="구">구</option>
                            <option value="강동구">강동구</option>
                            <option value="강남구">강남구</option>
                            <option value="송파구">송파구</option>
                            <option value="어쩌구">어쩌구</option>
                                <option value="저쩌구">저쩌구</option>
                        </select>
                        <select name="" id="dong" class="search-add">
                            <option value="동">동</option>
                            <option value="천호동">천호동</option>
                            <option value="풍납동">풍납동</option>
                            <option value="성내동">성내동</option>
                        </select>
                        <button type="button">검색</button>
                    </div>
                    <div class="search-list">
                        <input type="text" id="" name="" placeholder="당구장 이름으로 검색">
                        <button type="button">검색</button>
                    </div>
                </div>
                <div class="map">
                    <div class="mapImg">
                        <img src="${pageContext.request.contextPath}/assets/images/map1.png" alt="지도">
                    </div>
                </div>
                <div class="modang_list">
                    <ul>
                        <li>
                            <div class="txt">
                                <p class="repname">☆☆당구장</p>
                                <p class="addr">서울시 강동구 천호대로 1027 5층에서 썩어가는</p>
                            </div>
                            <img src="${pageContext.request.contextPath}/assets/images/room.jpg" alt="오리">
                        </li>
                        <li>
                            <div class="txt">
                                <p class="repname">내가짱당구장</p>
                                <p class="addr">서울시 강동구 천호대로 1027 5층 하이미디어 학원 너무 춥다</p>
                            </div>
                            <img src="${pageContext.request.contextPath}/assets/images/ori.png" alt="모당">
                        </li>
                        <li>
                            <div class="txt">
                                <p class="repname">개똥당구장</p>
                                <p class="addr">서울 강동구 진황도로 5</p>
                            </div>
                            <img src="${pageContext.request.contextPath}/assets/images/smoking.jpg" alt="오리">
                        </li>
                        <li>
                            <div class="txt">
                                <p class="repname">위아일랜드당구장</p>
                                <p class="addr">서울 강동구 천호대로157길 18</p>
                            </div>
                            <img src="${pageContext.request.contextPath}/assets/images/modang_logo.png" alt="오리">
                        </li>
                        <li>
                            <div class="txt">
                                <p class="repname">키키당구장</p>
                                <p class="addr">서울시 강동구 천호동 453-8</p>
                            </div>
                            <img src="${pageContext.request.contextPath}/assets/images/ori.png" alt="오리">
                        </li>
                        <li>
                            <div class="txt">
                                <p class="repname">라인당구장</p>
                                <p class="addr">서울 강동구 천호옛길 82</p>
                            </div>
                            <img src="${pageContext.request.contextPath}/assets/images/room.jpg" alt="오리">
                        </li>
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
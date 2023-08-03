<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modang 마이페이지 친구목록</title>
	<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
    <link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/manager.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- 헤더 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
    <!-- 헤더 끝 -->
        <div class="mainCon">
        <h2>친구 검색</h2>
        <div class="friendSearch">
            <label for="seardid">회원 아이디 검색</label>
            <input type="search" id="seardid" placeholder="회원 아이디 입력">
            <button type="button" class="search">검색</button>
            
            <div class="searchList">
                <!--검색한 아이디가 있는 경우 나오는 리스트-->
                <ul>
                    <li>
                        <span>ababab</span>
                        <button type="button" class="add">추가</button>
                    </li>
                    <li>
                        <span>abc111</span>
                        <button type="button" class="add">추가</button>
                    </li>
                    <li>
                        <span>abcdef</span>
                        <button type="button" class="add">추가</button>
                    </li>
                    <li>
                        <span>ab123123</span>
                        <button type="button" class="add">추가</button>
                    </li>
                    <li>
                        <span>abc987</span>
                        <button type="button" class="add">추가</button>
                    </li>
                </ul>
                <!--검색한 아이디가 없는 경우 나오는 멘트-->
                <!--<p>등록되어 있는 회원 아이디가 아닙니당</p>-->
            </div>
        </div>
        <h2>친구 목록</h2>
        <div class="friendList">
            <table>
                <thead>
                    <tr>
                        <th>친구 닉네임</th>
                        <th>Avg.</th>
                        <th>권장 다마</th>
                        <th>승수 (최근 3개월)</th>
                        <th>최근 로그인</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>강동구일짱</td>
                        <td>100</td>
                        <td>120</td>
                        <td><strong>3</strong>승<strong>2</strong>패</td>
                        <td><strong>48</strong>일전</td>
                        <td><button type="button" class="del">삭제</button></td>
                    </tr>
                    <tr>
                        <td>김개똥</td>
                        <td>120</td>
                        <td>120</td>
                        <td><strong>7</strong>승<strong>5</strong>패</td>
                        <td><strong>1</strong>일전</td>
                        <td><button type="button" class="del">삭제</button></td>
                    </tr>
                    <tr>
                        <td>피주먹</td>
                        <td>80</td>
                        <td>90</td>
                        <td><strong>3</strong>승<strong>2</strong>패</td>
                        <td><strong>3</strong>일전</td>
                        <td><button type="button" class="del">삭제</button></td>
                    </tr>
                    <tr>
                        <td>qwerqwer</td>
                        <td>300</td>
                        <td>320</td>
                        <td><strong>37</strong>승<strong>4</strong>패</td>
                        <td><strong>11</strong>일전</td>
                        <td><button type="button" class="del">삭제</button></td>
                    </tr>
                    <tr>
                        <td>44444444</td>
                        <td>240</td>
                        <td>200</td>
                        <td><strong>11</strong>승<strong>20</strong>패</td>
                        <td><strong>13</strong>일전</td>
                        <td><button type="button" class="del">삭제</button></td>
                    </tr>
                    <tr>
                        <td>123456789</td>
                        <td>170</td>
                        <td>160</td>
                        <td><strong>46</strong>승<strong>30</strong>패</td>
                        <td><strong>2</strong>일전</td>
                        <td><button type="button" class="del">삭제</button></td>
                    </tr>
                    <tr>
                        <td>Sososososososo</td>
                        <td>160</td>
                        <td>180</td>
                        <td><strong>71</strong>승<strong>50</strong>패</td>
                        <td><strong>6</strong>일전</td>
                        <td><button type="button" class="del">삭제</button></td>
                    </tr>
                    <tr>
                        <td>Sososososososo</td>
                        <td>160</td>
                        <td>180</td>
                        <td><strong>71</strong>승<strong>50</strong>패</td>
                        <td><strong>6</strong>일전</td>
                        <td><button type="button" class="del">삭제</button></td>
                    </tr>
                    <tr>
                        <td>Sososososososo</td>
                        <td>160</td>
                        <td>180</td>
                        <td><strong>71</strong>승<strong>50</strong>패</td>
                        <td><strong>6</strong>일전</td>
                        <td><button type="button" class="del">삭제</button></td>
                    </tr>
                    <tr>
                        <td>Sososososososo</td>
                        <td>160</td>
                        <td>180</td>
                        <td><strong>71</strong>승<strong>50</strong>패</td>
                        <td><strong>6</strong>일전</td>
                        <td><button type="button" class="del">삭제</button></td>
                    </tr>
                </tbody>
            </table>
            <div class="pasing">
                <span><</span>
                <span>1</span>
                <span>2</span>
                <span>3</span>
                <span>4</span>
                <span>5</span>
                <span>></span>
            </div>
        </div>
    </div>
    <!-- 푸터 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
    <!-- 푸터 끝 -->
</body>
</html>
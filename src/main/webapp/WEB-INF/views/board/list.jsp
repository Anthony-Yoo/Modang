<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="${pageContext.request.contextPath}/assets/css/board.css" rel="stylesheet" type="text/css">
    <style>
    </style>
</head>


<body>
    <!-- 헤더 시작 -->
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
    <!-- 헤더 끝 -->

    <div id="content">
        <div id="content-header">
            <h2><a>매칭 게시판</a></h2>
        </div>
        <div id="write">
            <a class="btn" href="">글쓰기</a>
        </div>
    </div>
    <div id="board">
        <div id="list">
            <table>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>종류</th>
                        <th>지역</th>
                        <th>제목</th>
                        <th>구인 현황</th>
                        <th>작성자</th>
                        <th>게임 희망일자</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>3구</td>
                        <td>강동구</td>
                        <td class="text-left"><a href="">안녕하세요</a></td>
                        <td>1/2</td>
                        <td>박유준</td>
                        <td>23.07.07</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>3구</td>
                        <td>강동구</td>
                        <td class="text-left"><a href="">안녕하세요</a></td>
                        <td>1/2</td>
                        <td>박유준</td>
                        <td>23.07.07</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>3구</td>
                        <td>강동구</td>
                        <td class="text-left"><a href="">안녕하세요</a></td>
                        <td>1/2</td>
                        <td>박유준</td>
                        <td>23.07.07</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>3구</td>
                        <td>강동구</td>
                        <td class="text-left"><a href="">안녕하세요</a></td>
                        <td>1/2</td>
                        <td>박유준</td>
                        <td>23.07.07</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>3구</td>
                        <td>강동구</td>
                        <td class="text-left"><a href="">안녕하세요</a></td>
                        <td>1/2</td>
                        <td>박유준</td>
                        <td>23.07.07</td>
                    </tr>
                </tbody>
            </table>
            <div id="write">
                <a class="btn" href="">글쓰기</a>
            </div>
            <div id="paging">
                <ul>
                    <li><a href="">◀</a></li>
                    <li><a href="">1</a></li>
                    <li><a href="">2</a></li>
                    <li><a href="">3</a></li>
                    <li><a href="">4</a></li>
                    <li class="active"><a href="">5</a></li>
                    <li><a href="">6</a></li>
                    <li><a href="">7</a></li>
                    <li><a href="">8</a></li>
                    <li><a href="">9</a></li>
                    <li><a href="">10</a></li>
                    <li><a href="">▶</a></li>
                </ul>
                <div class="clear"></div>
            </div>
            <form action="" method="">
                <div class="form-group text-center">
                    <input type="text" name="keyword" value="">
                    <button type="submit" id=btn_search>검색</button>
                </div>
            </form>
        </div>
        <!-- //list -->
    </div>

</body>

</html>
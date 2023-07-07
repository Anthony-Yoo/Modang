<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="${pageContext.request.contextPath}/assets/css/board.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
    <style>
    </style>
</head>


<body>
    <!-- 헤더 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
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
                        <th>게임종류</th>
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
                        <td>2</td>
                        <td>3구</td>
                        <td>강동구</td>
                        <td class="text-left"><a href="">안녕하세요</a></td>
                        <td>1/2</td>
                        <td>박유준</td>
                        <td>23.07.07</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>3구</td>
                        <td>강동구</td>
                        <td class="text-left"><a href="">안녕하세요</a></td>
                        <td>1/2</td>
                        <td>박유준</td>
                        <td>23.07.07</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>3구</td>
                        <td>강동구</td>
                        <td class="text-left"><a href="">안녕하세요</a></td>
                        <td>1/2</td>
                        <td>박유준</td>
                        <td>23.07.07</td>
                    </tr>
                    <tr>
                        <td>5</td>
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
                    <select>
                        <option>선택</option>
                        <option>제목</option>
                        <option>지역</option>
                        <option>작성자</option>
                        <option>게임종류</option>
                        <option>내용</option>
                    </select>
                    <input type="text" name="keyword" value="">
                    <button type="submit" id=btn_search>검색</button>
                </div>
            </form>
        </div>
        <!-- //list -->
    </div>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>modang 유저 전적보기</title>
	<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
    <link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/manager.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/user.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="main-content">
        <div class="record-view">
            <div class="left">
                <div class="userImg">
                    <img src="${pageContext.request.contextPath}/assets/images/ori.png" alt="유저 프로필 이미지">
                </div>
                <div class="town">
                    <span>닉네임 : <strong>내가짱임</strong></span>
                    <br>
                    <span>아이디 : <strong>qwer12</strong></span>
                </div>
            </div>
            <div class="userRecent center">
                <div class="recentAver">
                    <p>최근10 경기 평균 등수</p>
                    <ul>
                        <li class="win">W</li>
                        <li class="win">W</li>
                        <li>2</li>
                        <li>2</li>
                        <li class="win">W</li>
                        <li class="win">W</li>
                        <li class="win">W</li>
                        <li>9</li>
                        <li class="win">W</li>
                        <li>2</li>
                    </ul>
                </div>
                <div class="recentGame">
                    <p>최근 10경기 게임 스탯</p>
                    <table>
                        <thead>
                            <tr>
                                <th>승률</th>
                                <th>최근다마</th>
                                <th>평균시간</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>0.72</td>
                                <td>100</td>
                                <td>42:11</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="recentPlayer">
                    <p>최근 같이한 유저</p>
                    <ul>
                        <li>엄마몰래</li>
                        <li>아빠몰래</li>
                        <li>마세이킹</li>
                        <li>밥대신당구</li>
                        <li>너만오면고</li>
                        <li>사장님나샷</li>
                    </ul>
                </div>
            </div>
            <div class="userPlay right">
                <ul>
                    <li>
                        <p>권장다마</p>
                        <span>120</span>
                    </li>
                    <li>
                        <p>누적승률</p>
                        <span>0.56</span>
                    </li>
                    <li>
                        <p>누적시간</p>
                        <span>1056:25:24</span>
                    </li>
                    <li class="per">
                        <p>EXP</p>
                        <span>100%</span>
                    </li>
                    <li>
                        <p>총 경기</p>
                        <span>112</span>
                    </li>
                    <li>
                        <p>이긴 경기</p>
                        <span>45</span>
                    </li>
                    <li>
                        <p>패한 경기</p>
                        <span>1</span>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 리스트시작-상세보기 모달창 만들어애함 -->
        <div class="record-list">
            <table>
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>지역</th>
                        <th>당구장</th>
                        <th>Table</th>
                        <th>Type</th>
                        <th>인원</th>
                        <th>Date</th>
                        <th>GameTime</th>
                        <th>Record</th>
                        <th>GameFee</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>서울 강서구</td>
                        <td>목동 신호등</td>
                        <td>중대</td>
                        <td>3구</td>
                        <td>3/3</td>
                        <td>23/08/23</td>
                        <td>1:04:11</td>
                        <td>2</td>
                        <td>12,000</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>서울 강동구</td>
                        <td>천호동 큐로</td>
                        <td>중대</td>
                        <td>4구</td>
                        <td>2/2</td>
                        <td>23/08/17</td>
                        <td>55:25</td>
                        <td>W</td>
                        <td>10,000</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>서울 송파구</td>
                        <td>잠실 휘발유</td>
                        <td>대대</td>
                        <td>4구</td>
                        <td>3/4</td>
                        <td>23/07/06</td>
                        <td>1:04:11</td>
                        <td>3</td>
                        <td>20,000</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>서울 관악구</td>
                        <td>신림 아싸리</td>
                        <td>대대</td>
                        <td>4구</td>
                        <td>2/2</td>
                        <td>23/07/06</td>
                        <td>1:04:11</td>
                        <td>L</td>
                        <td>18,000</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 리스트 끝-상세보기 모달창 만들어애함 -->
    </div>
</body>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modang 카드추가</title>
	<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
    <link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/manager.css" rel="stylesheet" type="text/css">
</head>
<body>
	    <div class="main-Con">
        <div class="cardAdd left">
            <h2>카드 추가</h2>
            <div class="searhId">
                <input type="search" class="insertId" placeholder="아이디 입력">
                <button type="button" class="del">검색</button>
                <!--아이디검색- 하단 토글 리스트 팝업이든뭐든 공간 추가-->                <ul>
                    <li>
                        <span>oaaaaaa</span>
                        <button type="button" class="del">추가</button>
                    </li>
                    <li>
                        <span>ohYeah1111</span>
                        <button type="button" class="del">추가</button>
                    </li>
                    <li>
                        <span>orange</span>
                        <button type="button" class="del">추가</button>
                    </li>
                    <li>
                        <span>obbaYaSalido</span>
                        <button type="button" class="del">추가</button>
                    </li>
                    <li>
                        <span>ooooooooh</span>
                        <button type="button" class="del">추가</button>
                    </li>
                </ul>
            </div>
            <div class="callFriend">
                <button type="button" class="call">친구목록 부르기</button>
                <!--친구목록 부르기- 하단 토글 리스트 팝업으로 추가-->
                <ul>
                    <li>
                        <img src="${pageContext.request.contextPath}/assets/images/ori.png" alt="">
                        <span>강동구일짱</span>
                        <button type="button" class="del">추가</button>                        </li>
                    <li>
                        <img src="${pageContext.request.contextPath}/assets/images/modang_logo.png"" alt="">
                        <span>김개똥</span>
                        <button type="button" class="del">추가</button>
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath}/assets/images/insta.png" alt="">
                        <span>피주먹</span>
                        <button type="button" class="del">추가</button>                        
                   </li>
                    <li>
                        <img src="${pageContext.request.contextPath}/assets/images/room.jpg" alt="">
                        <span>qwerqwer</span>
                        <button type="button" class="del">추가</button>
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath}/assets/images/ori.png" alt="">
                        <span>44444444</span>
                        <button type="button" class="del">추가</button>
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath}/assets/images/ori.png" alt="">
                        <span>123456789</span>
                        <button type="button" class="del">추가</button>
                    </li>
                </ul>
            </div>
            <div class="List">
                <form action="" method="">
                    <p>멤버 카드</p>
                    <label for="cardName">그룹명</label>
                    <input type="text" id="cardName" class="cardName" placeholder="그룹명 입력">
                    <ul><!--당구멤버 리스트는 최대 4명 // 
                        4명이상 추가 시 "멤버는 4명까지 선택 가능합니당!" 팝업?-->
                        <li>
                            <span>당구의신</span>
                            <button type="button" class="del">삭제</button>
                        </li>
                        <li>
                            <span>천호동불주먹</span>
                            <button type="button" class="del">삭제</button>
                        </li>
                        <li>
                            <span>라면이먹고싶</span>
                            <button type="button" class="del">삭제</button>
                        </li>
                        <li>
                            <span>당구의신</span>
                            <button type="button" class="del">삭제</button>
                        </li>
                    </ul>
                    <button type="submit" class="call">멤버 확정하기</button>
                </form>
            </div>
        </div>
        <div class="border"></div>
        <div class="cardList right">
            <h2>카드 리스트</h2>
            <ul>
                <li>
                    <h4>우리가대마왕</h4>
                    <ul class="nick">
                        <li>내가짱</li>
                        <li>qwer1234</li>
                        <li>김개똥</li>
                        <li>당신바규준</li>
                    </ul>
                    <span>23.06.17</span>
                    <button type="button">×</button><!--삭제버튼-->
                </li>
                <li>
                    <h4>우리가다발라줌</h4>
                    <ul class="nick">
                        <li>1등임</li>
                        <li>너찌질</li>
                        <li>눈깔아</li>
                        <li>큐대로맞고싶</li>
                    </ul>
                    <span>23.06.17</span>
                    <button type="button">×</button>
                </li>
                <li>
                    <h4>지구온나나</h4>
                    <ul class="nick">
                        <li>나나짱</li>
                        <li>보라돌이</li>
                        <li>뚜비</li>
                        <li>뽀옹방귀</li>
                    </ul>
                    <span>23.06.17</span>
                    <button type="button">×</button>
                </li>
                <li>
                    <h4>엘지는살아있다</h4>
                    <ul class="nick">
                        <li>난삼성</li>
                        <li>아이폰이최고</li>
                        <li>갤럭시</li>
                    </ul>
                    <span>23.06.17</span>
                    <button type="button">×</button>
                </li>
                <li>
                    <h4>다덤벼</h4>
                    <ul class="nick">
                        <li>가나다</li>
                        <li>다나가</li>
                        <li>abc</li>
                        <li>xyz</li>
                    </ul>
                    <span>23.06.17</span>
                    <button type="button">×</button>
                </li>
                <li>
                    <h4>다덤벼</h4>
                    <ul class="nick">
                        <li>가나다</li>
                        <li>다나가</li>
                        <li>abc</li>
                        <li>xyz</li>
                    </ul>
                    <span>23.06.17</span>
                    <button type="button">×</button>
                </li>
                <li>
                    <h4>다덤벼</h4>
                    <ul class="nick">
                        <li>가나다</li>
                        <li>다나가</li>
                        <li>abc</li>
                        <li>xyz</li>
                    </ul>
                    <span>23.06.17</span>
                    <button type="button">×</button>
                </li>
                <li>
                    <h4>다덤벼</h4>
                    <ul class="nick">
                        <li>가나다</li>
                        <li>다나가</li>
                        <li>abc</li>
                        <li>xyz</li>
                    </ul>
                    <span>23.06.17</span>
                    <button type="button">×</button>
                </li>
            </ul>
        </div>
    </div>
</body>
</html>
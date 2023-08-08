<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>나의 모당!</title>

<!-- icon -->
<link rel="icon" sizes="any"
	href="${pageContext.request.contextPath}/assets/images/favicon.ico" />

<!-- css -->
<link href="${pageContext.request.contextPath}/assets/css/board.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/modang.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/mypage.css" rel="stylesheet" type="text/css">
<!-- js -->



</head>
<script type="text/javascript">
//JavaScript
function adjustHeight() {
    const applyMenu = document.getElementById('applyMenu');
    const children = applyMenu.children;

    let totalHeight = 0;
    for (let i = 0; i < children.length; i++) {
        totalHeight += children[i].offsetHeight;
    }

    // 자식 요소의 높이의 합이 기본값인 300px보다 크면 해당 값으로 높이 조절
    applyMenu.style.height = Math.max(totalHeight, 300) + 'px';
}

// 페이지 로드 후 자동으로 높이 조절 함수 호출
window.addEventListener('load', adjustHeight);

// 만약 동적으로 자식 요소들이 추가되거나 변경될 때 높이를 조절하려면 해당 이벤트에도 adjustHeight 함수를 호출해야 합니다.


</script>
<body>
	<!-- 헤더 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
	<!-- 헤더 끝 -->
	<div id="applyMenu">
		<ul class="sidebar">
			<li><a href="${pageContext.request.contextPath}/user/userPage">회원정보</a> </li>
			<li><a href="${pageContext.request.contextPath }/mypage/friendlist">친구목록</a></li>
			<li><a href="${pageContext.request.contextPath }/mypage/FCardList">그룹친구</a> </li>
			<li><a class="active"  href="${pageContext.request.contextPath }/attendUsers/myPage/myBoardList">게시판매칭</a></li>
			<li><a href="${pageContext.request.contextPath }/mypage/${sessionScope.authUser.userNo}/record" target="_blank">전적보기</a></li>
		</ul>

		<div id="apply" >
			<div class="apply_btn">
				<a id="myList" href="${pageContext.request.contextPath}/attendUsers/myPage/myBoardList">내 게시글 목록</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a id="myList" class="active" href="${pageContext.request.contextPath}/attendUsers/myPage/myApplyList">내 신청글 목록</a>
			</div>
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
							<th>신청 현황</th>
						</tr>
					</thead>

					<c:forEach items="${mAList}" var="boardVo">
						<tbody>
							<tr>
								<td>${boardVo.boardNo}</td>
								<!-- 게시판 번호 -->
								<!-- 게임타입 번호에 따른 게임 종류 출력 -->
								<c:choose>
									<c:when test="${boardVo.matchGameType == '0'}">
										<td>3구</td>
									</c:when>
									<c:when test="${boardVo.matchGameType == '1'}">
										<td>4구</td>
									</c:when>
									<c:when test="${boardVo.matchGameType == '2'}">
										<td>포켓볼</td>
									</c:when>
								</c:choose>
								<td>${boardVo.matchRegion}</td>
								<!-- 경기 지역 -->
								<td class="text-left"><a
									href="${pageContext.request.contextPath}/board/hitCount?boardNo=${boardVo.boardNo}">${boardVo.title}</a></td>
								<!-- 제목 -->
								<td>${boardVo.agreeCount+1}/${boardVo.membernum}</td>
								<!-- 멤버 구인현황 현재 인원/ 총 모집인원 -->
								<td>${boardVo.nick}</td>
								<!-- 글쓴이 닉네임 -->
								<td>${boardVo.matchDate}</td>
								<!-- 개임 날짜 -->
								<td>${boardVo.aStatus}</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<!-- //user -->
	<!-- //container -->

	<!-- 푸터 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
	<!-- 푸터 끝 -->
</body>
</html>
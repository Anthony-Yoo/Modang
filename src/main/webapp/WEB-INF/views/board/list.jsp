<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>매칭 게시판</title>
<link rel="icon" sizes="any"
	href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
<!-- 게시판 css -->
<link href="${pageContext.request.contextPath}/assets/css/board.css"
	rel="stylesheet" type="text/css">
<!-- 사이트 전체 css -->
<link href="${pageContext.request.contextPath}/assets/css/modang.css"
	rel="stylesheet" type="text/css">
<style>
</style>
</head>

<body>
	<!-- 헤더 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
	<!-- 헤더 끝 -->

	<div id="content">
		<div id="content-header">
			<h2>
				<a>매칭 게시판</a>
			</h2>
		</div>
		<div id="write">
			<a class="btn"
				href="${pageContext.request.contextPath}/board/writeForm">글쓰기</a>
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
				<!-- 게시판 리스트 출력 반복문 -->
				<c:forEach items="${pMap.bList}" var="boardVo">
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
							<td class="result">${boardVo.agreeCount+1}/${boardVo.membernum}</td>
							<!-- 멤버 구인현황 현재 인원/ 총 모집인원 -->
							<td>${boardVo.nick}</td>
							<!-- 글쓴이 닉네임 -->
							<td>${boardVo.matchDate}</td>
							<!-- 개임 날짜 -->
						</tr>
					</tbody>
				</c:forEach>
				<!-- 게시판 리스트 출력문 끝 -->
			</table>
			<div id="paging">
				<ul>
					<c:if test="${pMap.prev == true}">
						<li><a
							href="${pageContext.request.contextPath}/board/list?crtPage=${pMap.startPageBtnNo-1}&keyword=${pMap.keyword}">◀</a></li>
					</c:if>
					<c:forEach begin="${pMap.startPageBtnNo}"
						end="${pMap.endPageBtnNo}" step="1" var="page">
						<c:set var="currentPage" value="${pageContext.request.getParameter('crtPage')}" />
						<li <c:if test="${currentPage == page}">
								class="active"
							</c:if>>
								<a href="${pageContext.request.contextPath}/board/list?crtPage=${page}&keyword=${pMap.keyword}">
									${page}
								</a>
						</li>
					</c:forEach>
					<c:if test="${pMap.next == true}">
						<li><a
							href="${pageContext.request.contextPath}/board/list?crtPage=${pMap.endPageBtnNo+1}&keyword=${pMap.keyword}">▶</a></li>
					</c:if>
				</ul>
				<div class="clear"></div>
			</div>
			<form action="${pageContext.request.contextPath}/board/list"
				method="get">
				<div class="form-group text-center">
					<select name="category">
						<option>선택</option>
						<option value="title">제목</option>
						<option value="matchregion">지역</option>
						<option value="nick">작성자</option>
						<option value="matchgametype">게임종류</option>
						<option value="content">내용</option>
					</select> <input type="text" name="keyword" value="">
					<button type="submit" id=btn_search>검색</button>
				</div>
			</form>
		</div>
		<!-- //list -->
	</div>
	<!-- footer -->
	<c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
</body>
<script>
	// 신청 현황에서 상태값에 따라 글씨 색깔 변경
	var elements = document.querySelectorAll('.result'); // 모든 결과 요소 선택

	elements.forEach(function(element) {
		var text = element.textContent; // 요소의 내부 텍스트 가져오기

		// 정규식을 사용하여 텍스트에서 숫자 값을 추출
		var values = text.match(/\d+/g);
		var agreeCount = parseInt(values[0]); // 첫 번째 숫자는 agreeCount 값
		var membernum = parseInt(values[1]); // 두 번째 숫자는 membernum 값

		if (agreeCount >= membernum) {
			element.classList.add('red');
		}
	});
</script>

</html>
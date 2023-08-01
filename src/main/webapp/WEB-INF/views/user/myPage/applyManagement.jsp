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
<link href="${pageContext.request.contextPath}/assets/css/user.css"
	rel="stylesheet" type="text/css">

<!-- js -->

<style type="text/css">



</style>


</head>
<body>
	<!-- 헤더 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
	<!-- 헤더 끝 -->

	<div id="main-content">
		<div class="container text-center">
			<div id="userPage">
				<div id="main">
					<div class="sidebar">
						<a href="userPage">&nbsp;&nbsp;회원정보</a> <a href="userPage">&nbsp;&nbsp;친구목록</a>
						<a href="userPage">&nbsp;&nbsp;그룹친구</a> <a class="active"
							href="${pageContext.request.contextPath }/attendUsers/myPage/applyMenu">&nbsp;게시판매칭</a> <a href="userPage">&nbsp;&nbsp;전적보기</a>
					</div>
					<div id="apply" style="margin-right: -9px; width: 1030px;">
						<div class="apply_btn" >
							<a id="myList" class="active" href="">내 게시글 목록</a>&nbsp;&nbsp;&nbsp;&nbsp;<a id="myList" href="">내 신청글 목록</a>
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
										<th>승인 관리</th>
									</tr>
								</thead>

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
											<td>1/${boardVo.membernum}</td>
											<!-- 멤버 구인현황 현재 인원/ 총 모집인원 -->
											<td>${boardVo.nick}</td>
											<!-- 글쓴이 닉네임 -->
											<td>${boardVo.matchDate}</td>
											<!-- 개임 날짜 -->
											<td>${boardVo.status}</td>
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- //user -->
		</div>
		<!-- //container -->
	</div>
	<!-- //main-content -->

	<!-- 푸터 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
	<!-- 푸터 끝 -->
</body>
</html>
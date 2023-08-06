<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 쓰기</title>
<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
<!-- 사이트 전체 css -->
<link href="${pageContext.request.contextPath}/assets/css/a-modang.css" rel="stylesheet" type="text/css">
<!-- 게시판 css -->
<link href="${pageContext.request.contextPath}/assets/css/a-board.css" rel="stylesheet" type="text/css">

<!-- jquery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
</head>


<body>
	<!-- 헤더 시작 -->
	<c:import url="/WEB-INF/views/include/a-modangSiteHeader.jsp"></c:import>
	<!-- 헤더 끝 -->

	<!-- 메인 컨텐츠-->
	<div id="content">
		<div id="content-header">
			<h2>매칭 게시판</h2>
		</div>
		<!-- //content-heade -->
		<div id="board">
			<div id="list">
				<div class="btnWrap txt-right">
					<a class="btn-main"  href="${pageContext.request.contextPath}/board/writeForm">글쓰기</a>
				</div>
				
				<table class="el-matchTable txt-ceter" >
					<colgroup>
							<col style="width: 5%;" />
							<col style="width: 7%;" />
							<col style="width: 7%;" />
							<col  />
							<col style="width: 10%;" />
							<col style="width: 10%;" />
							<col style="width: 15%;" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>게임종류</th>
							<th>지역</th>
							<th>제목</th>
							<th>구인현황</th>
							<th>작성자</th>
							<th>게임희망일자</th>
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
								<td class="txt-left title" ><a href="${pageContext.request.contextPath}/board/hitCount?boardNo=${boardVo.boardNo}">${boardVo.title}</a></td>
								<!-- 제목 -->
								<td>1/${boardVo.membernum}</td>
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

				<!-- 페이징 -->
				<div id="paging">
					<ul>
						<c:if test="${pMap.prev == true}">
							<li><a href="${pageContext.request.contextPath}/board/list?crtPage=${pMap.startPageBtnNo-1}&keyword=${pMap.keyword}">◀</a></li>
						</c:if>
						<c:forEach begin="${pMap.startPageBtnNo}" end="${pMap.endPageBtnNo}" step="1" var="page">
							<li ><a class="active" href="${pageContext.request.contextPath}/board/list?crtPage=${page}&keyword=${pMap.keyword}">${page}</a></li>
						</c:forEach>
						<c:if test="${pMap.next == true}">
							<li><a href="${pageContext.request.contextPath}/board/list?crtPage=${pMap.endPageBtnNo+1}&keyword=${pMap.keyword}">▶</a></li>
						</c:if>
					</ul>
					<div class="clear"></div>
				</div>
				<!-- //페이징 -->

				<!-- 검색폼 -->
				<form action="${pageContext.request.contextPath}/board/list" method="get">
					<div class="form-group text-center searchForm" >
						<select name="category">
							<option>선택</option>
							<option value="title">제목</option>
							<option value="matchregion">지역</option>
							<option value="nick">작성자</option>
							<option value="matchgametype">게임종류</option>
							<option value="content">내용</option>
						</select> 
						<input type="text" name="keyword" value="">
						<button type="submit" id="btn_search"  class="btn-normal btn-s">검색</button>
					</div>
				</form>
				<!-- //검색 form -->
			</div>
			<!-- //list -->
		</div>
		<!-- //board -->
	</div>
	<!-- //content -->
	
	
	
	<button type="button"  class="btn-flat btn-ss">버튼</button>
	<button type="button"  class="btn-main btn-ss">버튼</button>
	<button type="button"  class="btn-normal btn-ss">버튼</button>
	<button type="button"  class="btn-danger btn-ss">버튼</button>
	<br>
	<a href="#" class="btn-flat btn-ss">버튼</a>
	<a href="#"  class="btn-main btn-ss">버튼</a>
	<a href="#"  class="btn-normal btn-ss">버튼</a>
	<a href="#"  class="btn-danger btn-ss">버튼</a>
	<br><br>
	
		
	<button type="button"  class="btn-flat btn-s">버튼</button>
	<button type="button"  class="btn-main btn-s">버튼</button>
	<button type="button"  class="btn-normal btn-s">버튼</button>
	<button type="button"  class="btn-danger btn-s">버튼</button>
	<br>
	<a href="#" class="btn-flat btn-s">버튼</a>
	<a href="#"  class="btn-main btn-s">버튼</a>
	<a href="#"  class="btn-normal btn-s">버튼</a>
	<a href="#"  class="btn-danger btn-s">버튼</a>
	<br><br>
	
	
	<button type="button"  class="btn-flat">버튼</button>
	<button type="button"  class="btn-main">버튼</button>
	<button type="button"  class="btn-normal">버튼</button>
	<button type="button"  class="btn-danger">버튼</button>
	<br>
	<a href="#" class="btn-flat">버튼</a>
	<a href="#"  class="btn-main">버튼</a>
	<a href="#"  class="btn-normal">버튼</a>
	<a href="#"  class="btn-danger">버튼</a>
	<br><br>
	
	
	
	<br><br>
	<button type="button"  class="btn-flat btn-l">버튼</button>
	<button type="button"  class="btn-main btn-l">버튼</button>
	<button type="button"  class="btn-normal btn-l">버튼</button>
	<button type="button"  class="btn-danger btn-l">버튼</button><br>
	
	<a href="#" class="btn-flat btn-l">버튼</a>
	<a href="#"  class="btn-main btn-l">버튼</a>
	<a href="#"  class="btn-normal btn-l">버튼</a>
	<a href="#"  class="btn-danger btn-l">버튼</a>
	
	
	
	<!-- footer -->
	<c:import url="/WEB-INF/views/include/a-modangSiteFooter.jsp"></c:import>
</body>

</html>
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
		<!-- 부트스트랩 css -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<!-- css -->
<link href="${pageContext.request.contextPath}/assets/css/board.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/modang.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/user.css"
	rel="stylesheet" type="text/css">

<!-- 부트스트랩 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<!-- jquery -->	
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>

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
		<div id="sideNav">
			<div class="sidebar" style="margin:0px 0px 0px 0px;">
				<a href="${pageContext.request.contextPath}/user/userPage">회원정보</a>
				<a href="userPage">친구목록</a> <a href="userPage">그룹친구</a> <a
					class="active"
					href="${pageContext.request.contextPath }/attendUsers/myPage/myApplyList">게시판매칭</a>
				<a href="userPage">전적보기</a>
			</div>
		</div>

		<div id="apply" style="margin-right: 0px; width: 1030px;">
			<div class="apply_btn">
				<a id="myList" class="active"
					href="${pageContext.request.contextPath}/attendUsers/myPage/myBoardList">내
					게시글 목록</a>&nbsp;&nbsp;&nbsp;&nbsp;<a id="myList"
					href="${pageContext.request.contextPath}/attendUsers/myPage/myApplyList">내
					신청글 목록</a>
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

					<c:forEach items="${mBList}" var="boardVo">
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
								<td class="text-left"><ax`
									href="${pageContext.request.contextPath}/board/hitCount?boardNo=${boardVo.boardNo}">${boardVo.title}</a></td>
								<!-- 제목 -->
								<td>1/${boardVo.membernum}</td>
								<!-- 멤버 구인현황 현재 인원/ 총 모집인원 -->
								<td>${boardVo.nick}</td>
								<!-- 글쓴이 닉네임 -->
								<td>${boardVo.matchDate}</td>
								<!-- 개임 날짜 -->
								<c:choose>
									<c:when test="${boardVo.status == 0}">
										<td id="applyList">
											<button type="button" class="btnModal" data-delno="">관리</button>
										</td>
									</c:when>
									<c:otherwise>
										<td>
											<button type="button" class="btnModal1" data-delno="">삭제</button>
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<!-- //user -->

	<!-- 푸터 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
	<!-- 푸터 끝 -->
	
	<!-- 삭제폼 모달창 -->
	<!-- Button trigger modal -->
	<!-- Modal -->
	<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">삭제 모달창</h4>
					<p class="mb-0"> 라이라이 라이스 </p>
				</div>
				<div class="modal-body">
					<input id="modalPassword" type ="password" name="password"><br>
					<input id="modalNo" type ="text" name="no" value=""> 
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫긔</button>
					<button id="btnDel" type="button" class="btn btn-danger" >삭졔</button>
				</div>
			</div>
		</div>
	</div>
 -->
 
 <!-- Scrollable modal -->
<div class="modal-dialog modal-dialog-scrollable">
  ...
</div>
<!-- 삭제폼 모달창 -->
</body>
<script type="text/javascript">

const myModal = document.getElementById('myModal')
const myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', () => {
  myInput.focus()
})

//삭제 모달창 호출 버튼 --> 모달창  뜸
$("#list").on("click", ".btnModal" , function(){
	console.log("모달창 호출버튼 클릭");
	
	/* // 삭제버튼 태그에서 no값 가져오기
	var no = $(this).data("delno");
	console.log(no);
	
	// 모달창 input태그에 no값 넣기
	$('#modalNo').val(no); */
	
	//모달창 호출
	$('.modal-dialog-scrollable').modal('show');
});


</script>
</html>
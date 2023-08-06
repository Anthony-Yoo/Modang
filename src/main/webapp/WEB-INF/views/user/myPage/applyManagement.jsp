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
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<!-- css -->
<link href="${pageContext.request.contextPath}/assets/css/board.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/modang.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/user.css"
	rel="stylesheet" type="text/css">

<!-- jquery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<!-- 부트스트랩 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>


<style type="text/css">


.modal-content #applyList table {
    width: 580px;
    margin: auto;
    text-align: center;
    font: 15px "맑은 고딕", 돋움, 굴림;
    border: 1px soild blue;
}
.modal-content #applyList table>thead>tr {
    font-size: 15px;
    border-top: 1px solid #2E419A;
    border-bottom: 1px solid #2E419A;
    background-color: #ecdfdf;
    padding: 0px;
    
}
.modal-content #applyList table>thead>tr>th{
	text-align: center;
}

.modal-content #applyList table>thead>tr>th:nth-child(1) {
    width: 10%;
}
.modal-content #applyList table>thead>tr>th:nth-child(2) {
    width: 22.5%;
}
.modal-content #applyList table>thead>tr>th:nth-child(3) {
    width: 22.5%;
}
.modal-content #applyList table>thead>tr>th:nth-child(4) {
    width: 22.5%;
}
.modal-content #applyList table>thead>tr>th:nth-child(5) {
    width: 22.5%;
}

.modal-content #applyList table>tbody>tr {
    font-size: 15px;
    border-bottom: 1px solid black;
}

.modal-content #applyList table>tbody>tr>td {
    padding: 10px 10px 10px 10px;
    white-space: nowrap;
}
.modal-content #applyList table>tbody>tr>td {
    padding: 10px 10px 10px 10px;
    white-space: nowrap;
}

.modal-content #applyList #decide {
	margin: 0 auto;
	text-align: center;
}

.modal-content #applyList #decide #confirmation {
   	background: linear-gradient(to bottom right, rgb(9, 32, 80), rgb(81, 117, 164));
}
.modal-content #applyList #decide #dismiss {
    background: linear-gradient(to bottom right, rgb(247 17 17), rgb(185 114 121));
}
.modal-content #applyList #decide button {
	width: 73px;
    margin: 12px auto;
    height: 32px;
    color: white;
   	border-radius: 2px;
}

.newApList .applyCheck button{
    width: 57px;
    margin: 0 auto;
    height: 24px;
    color: white;
   	border-radius: 2px;
}

.newApList .confirmed button{
    width: 57px;
    margin: 0 auto;
    height: 24px;
    color: white;
   	border-radius: 2px;
}

.newApList .applyCheck .agree{
    background: linear-gradient(to bottom right, rgb(9, 32, 80), rgb(81, 117, 164));
}
.newApList .applyCheck .agreed{
    background: linear-gradient(to bottom right, rgb(9, 32, 80), rgb(81, 117, 164));
}
.newApList .applyCheck .refuse{
    background: linear-gradient(to bottom right, rgb(247 17 17), rgb(185 114 121));
}
.newApList .applyCheck .refused{
    background: linear-gradient(to bottom right, rgb(247 17 17), rgb(185 114 121));
}

</style>
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
			<div class="sidebar" style="margin: 0px 0px 0px 0px;">
				<a href="${pageContext.request.contextPath}/user/userPage">회원정보</a>
				<a href="userPage">친구목록</a> <a href="userPage">그룹친구</a> <a
					class="active"
					href="${pageContext.request.contextPath }/attendUsers/myPage/myApplyList">게시판매칭</a>
				<a href="userPage">전적보기</a>
			</div>
		</div>

		<div id="apply" style="margin-right: 0px; width: 1030px;">
			<div class="apply_btn">
				<a id="myList" class="active" href="${pageContext.request.contextPath}/attendUsers/myPage/myBoardList">내
					게시글 목록
				</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a id="myList" href="${pageContext.request.contextPath}/attendUsers/myPage/myApplyList">
					내 신청글 목록
				</a>
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
								<td class="text-left"><a
									href="${pageContext.request.contextPath}/board/hitCount?boardNo=${boardVo.boardNo}">
										${boardVo.title} </a></td>
								<!-- 제목 -->
								<td style="color: ${boardVo.agreeCount+1 >= boardVo.membernum ? 'red' : 'black'}">${boardVo.agreeCount+1}/${boardVo.membernum}</td>
								<!-- 멤버 구인현황 현재 인원/ 총 모집인원 -->
								<td>${boardVo.nick}</td>
								<!-- 글쓴이 닉네임 -->
								<td>${boardVo.matchDate}</td>
								<!-- 게임 날짜 -->
								<c:choose>
									<c:when test="${boardVo.status == 0}">
										<td id="applyList">
											<button type="button" class="btnModal"
												data-boardno="${boardVo.boardNo}">관리</button>
										</td>
									</c:when>
									<c:otherwise>
										<td id="confirmed"> 
											<button type="button" class="btnModal"
												data-boardno="${boardVo.boardNo}">모집 완료</button>
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
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">신청 리스트</h4>
				</div>
				<div id="applyList">
					<table>
						<thead id="listHeader">
							<tr>
								<th>No.</th>
								<th>닉네임</th>
								<th>평균 타수</th>
								<th>신청 날짜</th>
								<th>승인 관리</th>
							</tr>
						</thead>
						<tbody>
							<!-- 리스트 -->
						</tbody>
					</table>
					
					<div id="decide" style="display: none;">
						<button type="button" id="confirmation">확정하기</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" id="dismiss">해산하기</button>
					</div>
				</div>
				<!-- //applyList -->
			</div>
		</div>
	</div>


	<!-- 삭제폼 모달창 -->
</body>
<script type="text/javascript">
$("#confirmation").on("click", function(){
	event.preventDefault();
	console.log("클릭 됨?")
	var boardNo = $(this).data("boardNo");
	console.log(boardNo);
	window.location.href = "confirmation?boardNo="+boardNo;
})

$("#dismiss").on("click", function(){
	event.preventDefault();
	console.log("클릭 됨?");
	var boardNo = $(this).data("boardNo");
	console.log(boardNo);
	window.location.href = "dismiss?boardNo="+boardNo;
})

//관리 모달창 호출 버튼 --> 모달창 뜸
$("#list").on("click", ".btnModal", function() {
	console.log("모달창 호출버튼 클릭");

	// 관리버튼 누를시 해당 게시판 번호 가져오기
	var boardNo = $(this).data("boardno");
	console.log(boardNo);
	
	//모달창 호출
	$('#myModal').modal('show');
	
	$.ajax({
		url : "${pageContext.request.contextPath}/attendUsers/myPage/applyList",
		type : "get",
		contentType : "application/json",
		data : {boardNo: boardNo},
		
		// 데이터 받은 후 
		dataType : "json",
		success : function(jsonResult) {
			console.log("테스트");
			console.log(jsonResult); 
			
			
			$(".newApList").remove();
			for(var i=0; i<jsonResult.data.length;i++){
				aLRender(jsonResult.data[i], "down")
			}
		 },
		error : function(XHR, status, error) {
			// 실패
		}
	});
	
	/* 확정하기, 해산하기 버튼이벤트 구현 여부를 위한 코드 */
	$.ajax({
		url : "${pageContext.request.contextPath}/board/checkBStatus",
		type : "get",
		contentType : "application/json",
		data : {boardNo: boardNo},
		
		// 데이터 받은 후 
		dataType : "json",
		success : function(jsonResult) {
			console.log("테스트");
			console.log(jsonResult.data.status); 
			if (jsonResult.data.status === 1) {
			    
                $("#decide").hide();
            } else {
				$("#confirmation").data("boardNo", boardNo);
			    $("#dismiss").data("boardNo", boardNo);
                $("#decide").show();
           	}
		 },
		error : function(XHR, status, error) {
			// 실패
		}
	}); 
});


/* 승인 / 거절 클릭이벤트 */
$(document).on("click", ".applyCheck button", function () {
	console.log("승인 / 거절 호출버튼 클릭");

	 // 현재 클릭한 버튼의 클래스를 가져옵니다.
    var buttonClass = $(this).attr("class");
    console.log("클릭한 버튼의 클래스:", buttonClass);

    // 버튼의 클래스에 따라 처리를 구분할 수 있습니다.
    if (buttonClass.includes("agree")) {
    	console.log("클릭한 버튼의 클래스:", buttonClass);
      	// agree 버튼을 클릭한 경우 처리할 로직
     	 var attendNo = $(this).data("attendno");
     	 var boardNo = $(this).data("boardno");
      	console.log("승인 버튼을 클릭한 경우, 해당 사용자 번호:", attendNo, boardNo );
      	// 여기에 승인 버튼을 클릭한 경우의 처리 로직을 추가하세요.
    } else if (buttonClass.includes("refuse")) {
     	 // refuse 버튼을 클릭한 경우 처리할 로직
      	var attendNo = $(this).data("attendno");
      	var boardNo = $(this).data("boardno");
      	console.log("거절 버튼을 클릭한 경우, 해당 사용자 번호:", attendNo, boardNo);
    	  // 여기에 거절 버튼을 클릭한 경우의 처리 로직을 추가하세요.
    }
    
    var AttendUsersVo={
    		buttonClass: buttonClass,
    		attendNo: attendNo,
    		boardNo: boardNo
    }
    
    var str = JSON.stringify(AttendUsersVo);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/attendUsers/decide",
		type : "post",
		contentType : "application/json",
		data : str,
		
		// 데이터 받은 후 
		dataType : "json",
		success : function(jsonResult) {
			console.log("테스트");
			console.log(jsonResult); 
			$(".newApList").remove();
			for(var i=0; i<jsonResult.data.length;i++){
				aLRender(jsonResult.data[i], "down")
			}
		 },
		error : function(XHR, status, error) {
			// 실패
		}
	});
});

function aLRender(AttendUsersVo, dir) {
    // BDCommentVo.depth 값을 가져와서 JavaScript 변수로 저장
	var str = "";
		/* str += ' <tbody>'; */
		str += ' 	<tr class="newApList">';
		str += ' 		<td>'+AttendUsersVo.rownum+'</td>';
		str += ' 		<td>'+AttendUsersVo.nick+'</td>';
		str += ' 		<td>'+AttendUsersVo.average+'</td>';
		str += ' 		<td>'+AttendUsersVo.attendDate+'</td>';
		str += ' 		<td class="applyCheck">';
		if(AttendUsersVo.status == 0){
			str += ' 			<button type="button" class="agree" data-attendNo='+AttendUsersVo.attendNo+' data-boardNo='+AttendUsersVo.boardNo+'>승인</button>';
			str += ' 			<button type="button" class="refuse" data-attendNo='+AttendUsersVo.attendNo+' data-boardNo='+AttendUsersVo.boardNo+'>거절</button>';
		}else if(AttendUsersVo.status == 1){
			str += ' 			<button type="" class="agreed" data-attendNo='+AttendUsersVo.attendNo+' data-boardNo='+AttendUsersVo.boardNo+'>승인됨</button>';
		}else if(AttendUsersVo.status == 2){
			str += ' 			<button type="" class="refused" data-attendNo='+AttendUsersVo.attendNo+' data-boardNo='+AttendUsersVo.boardNo+'>거절됨</button>';
		}
		str += ' 		</td>';
		str += ' 	</tr>';
		/* str += ' </tbody>'; */
		/* if (AttendUsersVo.boardNo != "" && leftValue < 2) 
		{
			str += ' 			<a href="#" role="button" class="comment_info_button" data-index=' + i + '>답글쓰기</a>';
		} */
	
	if (dir == 'up') {
		$("#selectApplyList").prepend(str);
	} else if (dir == 'down') {
		$("#applyList tbody").append(str);
	} else {
		console.log("에러요");
	}
}
	

</script>
</html>
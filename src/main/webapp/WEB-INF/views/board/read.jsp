
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 읽기</title>
<link rel="icon" sizes="any"
	href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
<!-- 게시판 css -->
<link href="${pageContext.request.contextPath}/assets/css/board.css"
	rel="stylesheet" type="text/css">
<!-- 사이트 전체 css -->
<link href="${pageContext.request.contextPath}/assets/css/modang.css"
	rel="stylesheet" type="text/css">
<!-- jquery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
</head>


<body>
	<!-- 헤더 시작 -->
	<div id="header">
		<c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
	</div>
	<!-- 헤더 끝 -->

	<div id="content">
		<div id="content-header">
			<h2>
				<a>매칭 게시판</a>
			</h2>
		</div>
	</div>

	<div id="board">
		<div id="read">
			<form action="#" method="get">
				<!-- 제목 -->
				<div class="title">
					<span class="title-value">${rList.title}</span>
				</div>

				<!-- 글 및 작성자 정보 -->
				<div class="title_area">
					<a href="" class="title_thumb"> <img
						src="${pageContext.request.contextPath}/assets/images/modang.png"
						alt="프로필 사진" width="36" height="36">
					</a>
					<div class="title_box">
						<div class="title_nick_box">
							<!-- 작성자 -->
							<div class="title_nick_info">
								<a id="" href="#" role="button" aria-haspopup="true"
									aria-expanded="false" class="title_nickname">${rList.nick}</a>
							</div>
						</div>
						<!-- 작성일 + 조회수 -->
						<div class="title_info_box">
							<span class="title_info_date">${rList.boardDate} 조회
								${rList.count}</span>
						</div>
						<div id="writer">
							<!-- 작성자 본인인 경우 -->
							<c:choose>
								<c:when test="${sessionScope.authUser.userNo == rList.userNo}">
									<a id="btn_applyList" href="">신청 리스트</a>
									<a id="btn_boardList" href="">목록</a>
									<a id="btn_modify" href="">글 수정</a>
									<a id="btn_delete" href="">삭제</a>
								</c:when>
								<c:when test="${sessionScope.authUser.userNo != rList.userNo}">
									<a id="btn_boardList" href="">목록</a>
									<a id="btn_apply" href="">신청하기</a>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
				<div>
					<div id="title_set_result">
						플레이 예정 정보 : [
						<c:choose>
							<c:when test="${rList.matchGameType == '0'}">
									3구
								</c:when>
							<c:when test="${rList.matchGameType == '1'}">
									4구
								</c:when>
							<c:when test="${rList.matchGameType == '2'}">
									포켓볼
								</c:when>
						</c:choose>
						${rList.matchRegion} ${rList.matchDate}]
					</div>
					<span id="title_state">구인현황 1/${rList.membernum}</span>
				</div>

				<!-- 내용 -->
				<div id="txt-content">
					<pre class="form-value">${rList.content}
						</pre>
				</div>
				<!-- 댓글 리스트 -->
				<div id="comment_list">
					<div id="cList">
						
					</div><!-- cList end -->
					<!-- comment_add -->
					<c:if test="${sessionScope.authUser != null}">
						<div id="comment_add">
							<div id="comment_inbox">
								<strong class="blind">댓글을 입력하세요</strong> <input type="hidden"
									value="${sessionScope.authUser.userNo}" name="userNo">
								<input type="hidden" value="${rList.boardNo}" name="boardNo">
								<input type="hidden" id="depth" value=1> <em
									id="comment_inbox_name">${sessionScope.authUser.nick}</em>
								<div class="comment_inbox_wrapper">
									<div class="comment_textarea_wrapper">
										<textarea placeholder="댓글을 남겨보세요" rows="1"
											id="comment_inbox_text"
											style="overflow: hidden; overflow-wrap: break-word;"></textarea>
									</div>
									<div id="register_box">
										<a href="" role="button" id="btn_register">등록</a>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<!-- //comment_add -->
				</div>
				<!-- //댓글 리스트 -->
			</form>
			<!-- //form -->
		</div>
		<!-- //read -->
	</div>
	<!-- //board -->
	<div id="readFooter">
		<c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
	</div>
</body>
<script>
	// 댓글 입력란 관련 코드 start
	//DOM에서 textarea 요소를 찾기
	var textarea = document.getElementById('comment_inbox_text');

	// 입력이 변경될 때마다 textarea의 높이를 조정
	textarea.addEventListener('input', function() {
		// 현재 스크롤 높이를 저장합니다.
		var scrollTop = textarea.scrollTop;

		// textarea의 높이를 임시로 0으로 설정하여 자동 높이를 측정
		textarea.style.height = '0';

		// 스크롤 높이를 유지하기 위해 textarea의 높이를 측정한 뒤 scrollTop 값을 설정
		textarea.style.height = textarea.scrollHeight + 'px';
		textarea.scrollTop = scrollTop;
	});

	// Backspace 키를 누를 때마다 높이를 17씩 줄임
	textarea.addEventListener('keydown', function(event) {
		if (event.key === 'Backspace') {
			// 현재 스크롤 높이를 저장
			var scrollTop = textarea.scrollTop;

			// textarea의 높이를 임시로 0으로 설정하여 자동 높이를 측정
			textarea.style.height = '0';

			// 스크롤 높이를 유지하기 위해 textarea의 높이를 측정한 뒤 scrollTop 값을 설정
			textarea.style.height = Math.max(textarea.scrollHeight - 17, 0)
					+ 'px';
			textarea.scrollTop = scrollTop;
		}
	});
	// 댓글 입력란 관련 코드 end

	$("#btn_register").on("click", function(event) {
		event.preventDefault(); // 기본 동작 막기
		console.log("버튼 클릭");
		var id = "${sessionScope.authUser.id}";
		var userNo = $("[name='userNo']").val();
		var boardNo = $("[name='boardNo']").val();
		var content = $("#comment_inbox_text").val();
		var depth = $("#depth").val();

		var BDCommentVo = {
			id : id,
			userNo : userNo,
			content : content,
			boardNo : boardNo,
			depth : depth
		}

		console.log(BDCommentVo);
		var str = JSON.stringify(BDCommentVo);

		// ajax통신 -> 요청은 같은 기술 데이터 응답에만 온다

		$.ajax({
			url : "${pageContext.request.contextPath}/api/comment/addComment",
			type : "post",
			contentType : "application/json",
			data : str,

			// 데이터 받은 후 
			dataType : "json",
			success : function(jsonResult) {
				console.log(jsonResult);
				// 성공시 ㅊㅓㄹㅣㅎㅐㅇㅑ할 코드

				/* if (jsonResult.result == "success") {
					// 정상 처리
					render(jsonResult.data); // 리스트에 추가
				
					//등록폼 비우기
					$("#comment_inbox_text").val("");
				
				} else {
					// 오류 처리
				
				} */
			},
			error : function(XHR, status, error) {
				// 실패

			}

		});
	});

	/* <div id="comment_add">
	<div id="comment_inbox">
		<strong class="blind">댓글을 입력하세요</strong> <input type="hidden"
			value="${sessionScope.authUser.userNo}" name="userNo">
		<input type="hidden" value="${rList.boardNo}" name="boardNo">
		<input type="hidden" id="depth" value=1>
		<em id="comment_inbox_name">${sessionScope.authUser.nick}</em>
		<div class="comment_inbox_wrapper">
			<div class="comment_textarea_wrapper">
				<textarea placeholder="댓글을 남겨보세요" rows="1" id="comment_inbox_text" style="overflow: hidden; overflow-wrap: break-word;"></textarea>
			</div>
			<div id="register_box">
				<a href="" role="button" id="btn_register">등록</a>
			</div>
		</div>
	</div>
	</div> */

	
	// 대댓글 입력 창
	function commentRender(BDCommentVo, dir) {
		var str = "";
		str += ' <div id="comment_add">';
		str += ' 	<div id="comment_inbox_second">';
		str += ' 		<strong class="blind">댓글을 입력하세요</strong>';
		str += ' 		<input type="hidden" value="${sessionScope.authUser.userNo}" name="userNo">';
		str += ' 		<input type="hidden" value='+BDCommentVo.boardNo+' name="boardNo">';
		str += ' 		<input type="hidden" value='+BDCommentVo.depth+' name="depth" >';
		str += ' 		<input type="hidden" value='+BDCommentVo.groupNo+' name="groupNo">';
		str += ' 		<em id="comment_inbox_name">${sessionScope.authUser.nick}</em>;
		str += ' 		<div class="comment_inbox_wrapper">';
		str += ' 			<div class="comment_textarea_wrapper">';
		str += ' 				<textarea placeholder="댓글을 남겨보세요" rows="1" id="comment_inbox_text" style="overflow: hidden; overflow-wrap: break-word;"></textarea>';
		str += ' 			</div>';
		str += ' 			<div id="register_box">';
		str += ' 	 			<a href="" role="button" id="btn_register">등록</a>';
		str += ' 			</div>';
		str += ' 		</div>';
		str += ' 	</div>';
		str += ' </div>';

		if (dir == 'up') {
			$("#cList").append(str);
		} else {
			console.log("에러요");
		}
	}
	
	// 대댓글 리스트 그리기
	function listRender(BDCommentVo, dir) {
		var str = "";
		str += ' <div id="line"></div>';
		str += ' <input type="hidden" name="groupNo" value="'+BDCommentVo.groupNo+'">';
		str += ' 	<div class="comment_area" style="position: relative; left: '+BDCommentVo.depth+' * 50}px;">';
		str += ' 	<a href="" class="comment_thumb">';
		str += ' 		<img src="${pageContext.request.contextPath}/assets/images/modang.png" alt="프로필 사진" width="36" height="36">';
		str += ' 	</a>';
		str += ' 	<div class="comment_box">';
		str += ' 		<div class="comment_nick_box">';
		str += ' 			<div class="comment_nick_info">';
		str += ' 				<a id="" href="#" role="button" aria-haspopup="true" aria-expanded="false" class="comment_nickname">';
		str += ' 					' + BDCommentVo.nick + '';
		str += ' 				</a>';
		str += ' 	 		</div>';
		str += ' 		</div>';
		str += ' 		<div class="comment_text_box">';
		str += ' 			<p class="comment_text_view">';
		str += ' 				<span class="text_comment">' + BDCommentVo.content
				+ '</span>';
		str += ' 			</p>';
		str += ' 		</div>';
		str += ' 		<div class="comment_info_box">';
		str += ' 			<span class="comment_info_date">' + BDCommentVo.writeDate
				+ '</span>';
		if ("${sessionScope.authUser.id}" != null && BDCommentVo.depth < 2 ) {
			str += ' 			<a href="#" role="button" class="comment_info_button">답글쓰기</a>';
		}
		str += ' 		</div>';
		str += ' 	</div>';
		str += ' </div>';

		if (dir == 'up') {
			$("#cList").prepend(str);
		} else if (dir == 'down') {
			$("#cList").append(str);
		} else {
			console.log("에러요");
		}
	}
</script>
</html>
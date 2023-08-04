<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${rList.title}</title>
<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
<!-- 게시판 css -->
<link href="${pageContext.request.contextPath}/assets/css/board.css" rel="stylesheet" type="text/css">
<!-- 사이트 전체 css -->
<link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">

<!-- jquery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
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
						src="${pageContext.request.contextPath}/upload/${rList.profileImage}"
						alt="프로필 사진" width="36" height="36">
					</a>
					<div class="title_box">
						<div class="title_nick_box">
							<!-- 작성자 -->
							<div class="title_nick_info">
								<a id="" href="${pageContext.request.contextPath}/mypage/${rList.userNo}/record" role="button" aria-haspopup="true"
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
									<a id="btn_boardList" href="${pageContext.request.contextPath}/board/list">목록</a>
									<a id="btn_modify" href="">글 수정</a>
									<a id="btn_delete" href="">삭제</a>
									
								</c:when>
								<c:when test="${sessionScope.authUser.userNo != rList.userNo}">
								
									<a id="btn_boardList" href="${pageContext.request.contextPath}/board/list">목록</a>
									<a id="btn_apply" href="#">신청하기</a>
									
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
					<span id="title_state" style="color: ${rList.agreeCount+1 >= rList.membernum ? 'red' : 'black'}">구인현황: ${rList.agreeCount+1}/${rList.membernum}</span>
				</div>

				<!-- 내용 -->
				<div id="txt-content">
					<pre class="form-value">${rList.content}
						</pre>
				</div>
				<div id="comment_list">
					<!-- 댓글 리스트 출력(cList) -->
					<div id="cList">
					
					</div>
					<!-- cList end -->
					<!-- comment_add -->
					<c:if test="${sessionScope.authUser != null}">
						<div class="comment_add">
							<div id="comment_inbox">
								<strong class="blind">댓글을 입력하세요</strong> 
								<input type="hidden" value="${sessionScope.authUser.userNo}" name="userNo">
								<input type="hidden" value="${rList.boardNo}" name="boardNo">
								<em	id="comment_inbox_name">${sessionScope.authUser.nick}</em>
								<div class="comment_inbox_wrapper">
									<div class="comment_textarea_wrapper">
										<textarea placeholder="댓글을 남겨보세요" rows="1" id="comment_inbox_text"
											style="overflow: hidden; overflow-wrap: break-word;" name="content"></textarea>
									</div>
									<div id="register_box">
										<a href="#" role="button" class="btn_register" id="main_btn">등록</a>
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
$(document).ready(function() {
	
	commentList();
	
	/* 신청하기 버튼 클릭이벤트 */
	$(document).on("click", "#btn_apply" , function(event){
		event.preventDefault();
		console.log("클릭 성공")
		var userNo = "${sessionScope.authUser.userNo}";
		var boardNo= "${rList.boardNo}";
		
		var AttendUsersVo={
			userNo: userNo,
			boardNo: boardNo
		}
		if(userNo==""){
				var url = "${pageContext.request.contextPath}/user/loginForm";
				window.location.href = url;
		}else{
				var url = "${pageContext.request.contextPath}/attendUsers/apply";
		}
		
		console.log(AttendUsersVo);
		
		$.ajax({
			url : url,
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(AttendUsersVo) ,
			
			// 데이터 받은 후 
			dataType : "json",
			success : function(jsonResult) {
				console.log("테스트");
				console.log(jsonResult); 
				alert(jsonResult.result);				 
			 },
			error : function(XHR, status, error) {
				// 실패

			}

		}); 
		
	});
    
});

	// 댓글 입력란 관련 코드 start
	//DOM에서 textarea 요소를 찾기
	var textarea = document.getElementById('comment_inbox_text');

	// 입력이 변경될 때마다 textarea의 높이를 조정
	textarea.addEventListener('input', function() {
		// 현재 스크롤 높이를 저장합니다.
		var scrollTop = textarea.scrollTop;

		// textarea의 높이를 임시로 0으로 설정하여 자동 높이를
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
	
	
	/* 대댓글에 입력한 textarea 등록버튼 이벤트 */
	function extractHiddenValues(commentNumber) {
		event.preventDefault();
	    // commentNumber에 따라 해당하는 댓글 입력 상자의 값들을 추출하여 콘솔에 출력
	    var userNo = "${sessionScope.authUser.userNo}";
	    var commentNo = $('.new input[name="commentNo"]').val();
	    var boardNo = $('.new input[name="boardNo"]').val();
	    var depth = $('.new input[name="depth"]').val();
	    var groupNo = $('.new input[name="groupNo"]').val();
	    var groupOrder = $('.new input[name="groupOrder"]').val();
	    var content = $("#comment_inbox_text").val();
	    var id = "${sessionScope.authUser.id}";
	    var nick = "${sessionScope.authUser.nick}";
	    
	    var BDCommentVo = {
			id : id,
			nick : nick,
			userNo : userNo,
			commentNo : commentNo,
			content : content,
			boardNo : boardNo,
			depth : depth,
			groupNo : groupNo,
			groupOrder : groupOrder
		}	
	    
	    var str = JSON.stringify(BDCommentVo);
	    console.log(str);
	    
	    $.ajax({
			url : "${pageContext.request.contextPath}/api/comment/addSComment",
			type : "post",
			contentType : "application/json",
			data : str,
			
			// 데이터 받은 후 
			dataType : "json",
			success : function(jsonResult) {
				console.log("테스트");
				console.log(jsonResult.data); 
				// 성공시 ㅊㅓㄹㅣㅎㅐㅇㅑ할 코드

				if (jsonResult.result == "success") {
					// 정상 처리
					listRender(jsonResult.data, "sDown", 0); 	// 리스트에 추가
				
					/* 창 초기화 */
					$(".line.lNew").remove();
			        $(".comment_add.new").remove();
				 
				} else {
					// 오류 처리
				
				}
			 },
			error : function(XHR, status, error) {
				// 실패

			}

		}); 
	}
	
	//등록버튼
	$(document).on("click", "#main_btn", function(event) {
		event.preventDefault(); // 기본 동작 막기
		console.log("버튼 클릭");
		var id = "${sessionScope.authUser.id}";
		var nick = "${sessionScope.authUser.nick}";
		var userNo = $("[name='userNo']").val();
		var boardNo = $("[name='boardNo']").val();
		var content = $("#comment_inbox_text").val();

		var BDCommentVo = {
			id : id,
			nick : nick,
			userNo : userNo,
			content : content,
			boardNo : boardNo,
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

				if (jsonResult.result == "success") {
					// 정상 처리
					listRender(jsonResult.data, "down", 0) // 리스트에 추가
				
					//등록폼 비우기
					$("#comment_inbox_text").val("");
				
				} else {
					// 오류 처리
				
				}
			 },
			error : function(XHR, status, error) {
				// 실패

			}

		}); 
	});

	// 리스트 출력함수
	function commentList(){
		// URL에서 쿼리 문자열을 가져온 뒤
		// 쿼리 문자열을 파싱하여 객체 형태로 변환
		const queryString = window.location.search;
        const params = new URLSearchParams(queryString);
     	// boardNo 값을 가져와서 화면에 출력하거나 필요한 작업을 수행
        const boardNo = params.get("boardNo");
        const data = { boardNo: boardNo };
		$.ajax({
			url : "${pageContext.request.contextPath}/api/comment/list",
			type : "post",
			dataType : "json",
			data : data,
			success : function(result) {
				console.log(result);
				//성공시 처리해야 될 코드 작성
				for (var i = 0; i < result.data.length; i++) {
					listRender(result.data[i], "down", i);
				}
				// "답글쓰기" 버튼에 대한 이벤트 처리
				// textarea의 높이 자동 조절을 적용할 클래스를 정의합니다.

				// 답글쓰기 버튼 클릭 시 대댓글 입력 창 생성
				$("#cList").on("click", ".comment_info_button", function () {
					event.preventDefault();
					// 기존에 생성된 모든 댓글 입력창 삭제
			        $(".line.lNew").remove();
			        $(".comment_add.new").remove();
					
				    var index = $(this).data("index");
				    var commentAddDiv = $(this).closest(".comment_area");
				    commentRender(result.data[index], "down", commentAddDiv, index);
				    // 생성된 textarea에 자동 높이 조절 기능 적용
				    commentAddDiv.find("textarea").on('input', function () {
				        var scrollTop = this.scrollTop;
				        this.style.height = 'auto';
				        this.style.height = this.scrollHeight + 'px';
				        this.scrollTop = scrollTop;
				    });
				});
				
			},
			error : function() {

			}
		}); 

	}
	

	
	// 대댓글 입력 창
	function commentRender(BDCommentVo, dir, commentAddDiv, index) {
		console.log(BDCommentVo);	
		var str = "";
		str += ' <div class="line lNew"></div>';
		str += ' <div class="comment_add new">';
		str += ' 	<div class="" id="comment_inbox_'+(index+1)+'">';
		str += ' 		<strong class="blind">댓글을 입력하세요</strong>';
		str += ' 		<input type="hidden" value=' + BDCommentVo.commentNo + ' name="commentNo">';
		str += ' 		<input type="hidden" value=' + BDCommentVo.boardNo + ' name="boardNo">';
		str += ' 		<input type="hidden" value=' + BDCommentVo.depth + ' name="depth" >';
		str += ' 		<input type="hidden" value=' + BDCommentVo.groupNo + ' name="groupNo">';
		str += ' 		<input type="hidden" value=' + BDCommentVo.groupOrder + ' name="groupOrder">';
		str += ' 		<em id="comment_inbox_name">${sessionScope.authUser.nick}</em>';
		str += ' 		<div class="comment_inbox_wrapper">';
		str += ' 			<div class="comment_textarea_wrapper">';
		str += ' 				<textarea placeholder="'+BDCommentVo.nick+'님에게 글을 남겨보세요" rows="1" id="comment_inbox_text" style="overflow: hidden; overflow-wrap: break-word;"></textarea>';
		str += ' 			</div>';
		str += ' 			<div id="register_box">';
		str += ' 	 			<a href="#" role="button" class="btn_register" id = "btn_register_'+index+'" onclick="extractHiddenValues('+(index+1)+')">등록</a>';
		str += ' 			</div>';
		str += ' 		</div>';
		str += ' 	</div>';
		str += ' </div>';
		
		// 'down' 방향일 경우 commentAddDiv 아래에 대댓글 입력창을 생성
	    if (dir === 'down') {
	        commentAddDiv.after(str);
	    } else {
			console.log("에러요");
		}
		
	    // textarea의 이벤트 리스너 추가
        var textarea = document.getElementById('comment_inbox_text');
        textarea.addEventListener('input', function () {
        	// 현재 스크롤 높이를 저장합니다.
    		var scrollTop = textarea.scrollTop;

    		// textarea의 높이를 임시로 0으로 설정하여 자동 높이를 측정
    		textarea.style.height = '0';

    		// 스크롤 높이를 유지하기 위해 textarea의 높이를 측정한 뒤 scrollTop 값을 설정
    		textarea.style.height = textarea.scrollHeight + 'px';
    		textarea.scrollTop = scrollTop;
        });

        textarea.addEventListener('keydown', function (event) {
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
        
        
	}
	
	// 대댓글 리스트 그리기
	function listRender(BDCommentVo, dir, i) {
		var authUser = "${sessionScope.authUser}";
	    // BDCommentVo.depth 값을 가져와서 JavaScript 변수로 저장
	    var leftValue = BDCommentVo.depth;
	    console.log(authUser);
	    console.log(leftValue);
		
		var str = "";
		str += ' <div class="line"></div>';
		str += ' <input type="hidden" name="groupNo" value="'+BDCommentVo.groupNo+'">';
		str += ' 	<div class="comment_area" style="position: relative; left: ' + (BDCommentVo.depth * 50) + 'px" data-index='+i+' >';
		str += ' 	<a href="" class="comment_thumb">';
		str += ' 		<img src="${pageContext.request.contextPath}/upload/'+BDCommentVo.profileImage+'" alt="프로필 사진" width="36" height="36">';
		str += ' 	</a>';
		str += ' 	<div class="comment_box">';
		str += ' 		<div class="comment_nick_box">';
		str += ' 			<div class="comment_nick_info">';
		str += ' 				<a id="" href="${pageContext.request.contextPath}/mypage/' + BDCommentVo.userNo+ '/record" role="button" aria-haspopup="true" aria-expanded="false" class="comment_nickname">';
		str += ' 					' + BDCommentVo.nick + '';
		str += ' 				</a>';
		str += ' 	 		</div>';
		str += ' 		</div>';
		str += ' 		<div class="comment_text_box">';
		str += ' 			<p class="comment_text_view">';
		str += ' 				<span class="text_comment">' + BDCommentVo.content + '</span>';
		str += ' 			</p>';
		str += ' 		</div>';
		str += ' 		<div class="comment_info_box">';
		str += ' 			<span class="comment_info_date">' + BDCommentVo.writeDate + '</span>';
		if (authUser != "" && leftValue < 2) 
		{
			str += ' 			<a href="#" role="button" class="comment_info_button" data-index=' + i + '>답글쓰기</a>';
		}
		str += ' 		</div>';
		str += ' 	</div>';
		str += ' </div>';

		if (dir == 'up') {
			$("#cList").prepend(str);
		} else if (dir == 'down') {
			$("#cList").append(str);
		} else if(dir == 'sDown'){
			$(".new").after(str);
		} else {
			console.log("에러요");
		}
		
	}
	
	
</script>
</html>
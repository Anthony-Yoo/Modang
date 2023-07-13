<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 읽기</title>
<!-- 게시판 css -->
<link href="${pageContext.request.contextPath}/assets/css/board.css"
	rel="stylesheet" type="text/css">
<!-- 사이트 전체 css -->
<link href="${pageContext.request.contextPath}/assets/css/modang.css"
	rel="stylesheet" type="text/css">
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
					<span class="title-value">여기에는 글제목이 출력됩니다.</span>
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
									aria-expanded="false" class="title_nickname">유고수</a>
							</div>
						</div>
						<!-- 작성일 + 조회수 -->
						<div class="title_info_box">
							<span class="title_info_date">2023.07.11 14:49 조회 1,834</span>
						</div>
						<div id="writer">
							<!-- 작성자 본인인 경우 -->
							<a id="btn_applyList" href="">신청 리스트</a> <a id="btn_boardList"
								href="">목록</a> <a id="btn_modify" href="">글 수정</a> <a
								id="btn_delete" href="">삭제</a>
						</div>
					</div>
				</div>
				<div>
					<div id="title_set_result">플레이 예정 정보 : [3구 강동구 2023.06.25
						14:00]</div>
					<div id="title_state">구인현황 1/3</div>

				</div>



				<!-- 내용 -->
				<div id="txt-content">
					<span class="form-value"> 여기에는 본문내용이 출력됩니다.<br> 여기에는
						본문내용이 출력됩니다.<br> 여기에는 본문내용이 출력됩니다.<br> 여기에는 본문내용이 출력됩니다.<br>
						여기에는 본문내용이 출력됩니다.<br> 여기에는 본문내용이 출력됩니다.<br> 여기에는 본문내용이
						출력됩니다.<br> 여기에는 본문내용이 출력됩니다.<br>
					</span>
				</div>

				<!-- 댓글 리스트 -->
				<div id="comment_list">
					<div id="line"></div>
					<div class="comment_area">
						<a href="" class="comment_thumb"> <img
							src="${pageContext.request.contextPath}/assets/images/modang.png"
							alt="프로필 사진" width="36" height="36">
						</a>
						<div class="comment_box">
							<div class="comment_nick_box">
								<div class="comment_nick_info">
									<a id="" href="#" role="button" aria-haspopup="true"
										aria-expanded="false" class="comment_nickname">유고수</a>
								</div>
							</div>
							<div class="comment_text_box">
								<p class="comment_text_view">
									<span class="text_comment">안녕하십니까</span>
								</p>
							</div>
							<div class="comment_info_box">
								<span class="comment_info_date">2023.07.11 14:49</span> <a
									href="#" role="button" class="comment_info_button">답글쓰기</a>
							</div>
						</div>
					</div>
					<div id="comment_second_list">
						<div id="line"></div>
						<div class="comment_area">
							<a href="" class="comment_thumb"> <img
								src="${pageContext.request.contextPath}/assets/images/modang.png"
								alt="프로필 사진" width="36" height="36">
							</a>
							<div class="comment_box">
								<div class="comment_nick_box">
									<div class="comment_nick_info">
										<a id="" href="#" role="button" aria-haspopup="true"
											aria-expanded="false" class="comment_nickname">유고수</a>
									</div>
								</div>
								<div class="comment_text_box">
									<p class="comment_text_view">
										<span class="text_comment">안녕하십니까</span>
									</p>
								</div>
								<div class="comment_info_box">
									<span class="comment_info_date">2023.07.11 14:49</span> <a
										href="#" role="button" class="comment_info_button">답글쓰기</a>
								</div>
							</div>
						</div>
					</div>

					<div id="line"></div>
					<div class="comment_area">
						<a href="" class="comment_thumb"> <img
							src="${pageContext.request.contextPath}/assets/images/modang.png"
							alt="프로필 사진" width="36" height="36">
						</a>
						<div class="comment_box">
							<div class="comment_nick_box">
								<div class="comment_nick_info">
									<a id="" href="#" role="button" aria-haspopup="true"
										aria-expanded="false" class="comment_nickname">유고수</a>
								</div>
							</div>
							<div class="comment_text_box">
								<p class="comment_text_view">
									<span class="text_comment">안녕하십니까</span>
								</p>
							</div>
							<div class="comment_info_box">
								<span class="comment_info_date">2023.07.11 14:49</span> <a
									href="#" role="button" class="comment_info_button">답글쓰기</a>
							</div>
						</div>
					</div>

					<div id="line"></div>
					<div class="comment_area">
						<a href="" class="comment_thumb"> <img
							src="${pageContext.request.contextPath}/assets/images/modang.png"
							alt="프로필 사진" width="36" height="36">
						</a>
						<div class="comment_box">
							<div class="comment_nick_box">
								<div class="comment_nick_info">
									<a id="" href="#" role="button" aria-haspopup="true"
										aria-expanded="false" class="comment_nickname">유고수</a>
								</div>
							</div>
							<div class="comment_text_box">
								<p class="comment_text_view">
									<span class="text_comment">안녕하십니까</span>
								</p>
							</div>
							<div class="comment_info_box">
								<span class="comment_info_date">2023.07.11 14:49</span> <a
									href="#" role="button" class="comment_info_button">답글쓰기</a>
							</div>
						</div>
					</div>

					<div id="line"></div>
					<div class="comment_area">
						<a href="" class="comment_thumb"> <img
							src="${pageContext.request.contextPath}/assets/images/modang.png"
							alt="프로필 사진" width="36" height="36">
						</a>
						<div class="comment_box">
							<div class="comment_nick_box">
								<div class="comment_nick_info">
									<a id="" href="#" role="button" aria-haspopup="true"
										aria-expanded="false" class="comment_nickname">유고수</a>
								</div>
							</div>
							<div class="comment_text_box">
								<p class="comment_text_view">
									<span class="text_comment">안녕하십니까</span>
								</p>
							</div>
							<div class="comment_info_box">
								<span class="comment_info_date">2023.07.11 14:49</span> <a
									href="#" role="button" class="comment_info_button">답글쓰기</a>
							</div>
						</div>
					</div>

					<div id="line"></div>
					<div class="comment_area">
						<a href="" class="comment_thumb"> <img
							src="${pageContext.request.contextPath}/assets/images/modang.png"
							alt="프로필 사진" width="36" height="36">
						</a>
						<div class="comment_box">
							<div class="comment_nick_box">
								<div class="comment_nick_info">
									<a id="" href="#" role="button" aria-haspopup="true"
										aria-expanded="false" class="comment_nickname">유고수</a>
								</div>
							</div>
							<div class="comment_text_box">
								<p class="comment_text_view">
									<span class="text_comment">안녕하십니까</span>
								</p>
							</div>
							<div class="comment_info_box">
								<span class="comment_info_date">2023.07.11 14:49</span> <a
									href="#" role="button" class="comment_info_button">답글쓰기</a>
							</div>
						</div>
					</div>
					<form action="#" method="">
						<div id="comment_add">
							<div id="comment_inbox">
								<strong class="blind">댓글을 입력하세요</strong> <em
									id="comment_inbox_name">유고수</em>
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
						<!-- //comment_add -->
						<input type="hidden" name="action" value="add">
					</form>
				</div>
				<!-- //댓글 리스트 -->
			</form>
			<!-- //form -->
		</div>
		<!-- //read -->
	</div>
	<!-- //board -->

</body>
<script>
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
</script>
</html>
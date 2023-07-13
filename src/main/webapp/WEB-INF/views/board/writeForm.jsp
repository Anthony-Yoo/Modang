<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 쓰기</title>
<!-- 사이트 전체 css -->
<link href="${pageContext.request.contextPath}/assets/css/modang.css"
	rel="stylesheet" type="text/css">
<!-- 게시판 css -->
<link href="${pageContext.request.contextPath}/assets/css/board.css"
	rel="stylesheet" type="text/css">

<style>
</style>
<script>
  document.getElementById('matchDate').value= new Date().toISOString().slice(0, 16);
</script>
</head>

<body>
	<!-- 메인 헤더 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
	<!-- 메인 헤더 끝-->
	<!-- 게시판 헤더-->
    <div id="content">
        <div id="content-header">
            <h2><a>게시판 글쓰기</a></h2>
        </div>
    </div>
    <!-- 게시판 헤더 끝-->
	<!-- 게시판 바디-->
	<div id="board">
		<div id="writeForm">
			<form action="write" method="post">
				<!-- 제목 -->
				<div id="category">
					<label for="type">게임 종류</label> <select name=matchGameType
						id="type">
						<option value="0">3구</option>
						<option value="1">4구</option>
						<option value="2">포켓볼</option>
					</select> &nbsp;&nbsp; <label for="matchRegion">지역</label> <select
						name="matchRegion" id="matchRegion">
						<option value="강남구">강남구</option>
						<option value="강동구">강동구</option>
						<option value="강북구">강북구</option>
						<option value="강서구">강북구</option>
						<option value="관악구">관악구</option>
						<option value="광진구">광진구</option>
						<option value="구로구">구로구</option>
						<option value="금천구">금천구</option>
						<option value="노원구">노원구</option>
						<option value="도봉구">도봉구</option>
						<option value="동대문구">동대문구</option>
						<option value="동작구">동작구</option>
						<option value="마포구">마포구</option>
						<option value="서대문구">서대문문구</option>
						<option value="서초구">서초구</option>
						<option value="성동구">성동구</option>
						<option value="성북구">성북구</option>
						<option value="송파구">송파구</option>
						<option value="양천구">양천구</option>
						<option value="영등포구">영등포구</option>
						<option value="용산구">용산구</option>
						<option value="은평구">은평구</option>
						<option value="종로구">종로구</option>
						<option value="종로구">종로구</option>
						<option value="중구">중구</option>
						<option value="중랑구">중랑구</option>
					</select> &nbsp;&nbsp; <label for="membernum">게임 인원(본인 포함)</label> <select
						name="membernum" id="membernum">
						<option value="2">2명</option>
						<option value="3">3명</option>
						<option value="4">4명</option>
						<option value="5">5명</option>
						<option value="6">6명</option>
					</select> &nbsp;&nbsp; <label for="matchDate">모임 날짜</label> <input
						type="datetime-local" id="matchDate" name="matchDate" /><br>
				</div>
				<!-- 글 제목 작성 칸 -->
				<div class="form-group">
					<label class="form-text" for="txt-title">제목</label> <input
						type="text" id="txt-title" name="title" value=""
						placeholder="제목을 입력해 주세요">
				</div>

				<!-- content -->
				<div class="form-group">
					<textarea id="txt-content" name="content" contenteditable="true">
  1. 모임 장소: 

  2. 플레이할 당구장 장소 협의 가능여부 (O/X) : 
                   
  3. 다마수 제한 (ex> 200이하 or 무관):  
                   
  4. 그 외 참고사항: </textarea>
				</div>

				<button id="btn_add" type="submit">작성 완료</button>

			</form>
			<!-- /form -->
		</div>
		<!-- /writeForm -->

		<!-- 카카오 지도 API 코드  -->
		<!-- <div id="map" style="width: 500px; height: 400px;"></div>
		<script>
			const container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			let options = { //지도를 생성할 때 필요한 기본 옵션
				center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
				level : 3
			//지도의 레벨(확대, 축소 정도)
			};
			let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		</script> -->
	</div>
	<!-- /board -->

</body>

</html>
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
<link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
<!-- 게시판 css -->
<link href="${pageContext.request.contextPath}/assets/css/board.css" rel="stylesheet" type="text/css">

<!-- jquery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>

</head>

<body>
	<!-- 메인 헤더 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
	<!-- 메인 헤더 끝-->
	
	<!-- 메인 컨텐츠-->
	<div id="content">
		<div id="content-header">
			<h2>매칭 게시판</h2>
		</div>
		<!-- //content-heade -->
		<!-- 글쓰기 바디-->
		<div id="board">
			<div id="writeForm">
				<form action="${pageContext.request.contextPath}/board/modify" method="Post" onsubmit="return validateForm()">
					<input type="hidden" name="boardNo" value="${rList.boardNo}">
					<table class="el-matchTable">
						<colgroup>
							<col style="width: 10%;" />
							<col style="width: 35%;" />
							<col style="width: 10%;" />
							<col style="width: 45%;" />
						</colgroup>
						<tbody>
							<tr>
								<th>제목</th>
								<td colspan="3"><input type="text" name="title" value="${rList.title}"></td>	
							</tr>
							<tr>
							
								<th>게임종류</th>
								<td>
									<input type="radio"  name="matchGameType" value="0" <c:if test="${rList.matchGameType == 0}">
							checked</c:if>>
									<label>3구</label>
									
									<input type="radio" name="matchGameType" value="1" <c:if test="${rList.matchGameType == 1}">
							checked</c:if>>
									<label>4구</label>
									
									<input type="radio" name="matchGameType" value="2" <c:if test="${rList.matchGameType == 2}">
							checked</c:if>>
									<label>포켓볼</label>
								</td>
								<th>지역</th>
								<td>
									<select name="matchRegion" id="matchRegion">
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
									</select>
								</td>		
							</tr>
							<tr>
								<th>게임인원</th>
								<td>
									<input type="radio" name="membernum" value="2" <c:if test="${rList.membernum == 2}">
							checked</c:if>>
									<label>2명</label>
									
									<input type="radio" name="membernum" value="3" <c:if test="${rList.membernum == 3}">
							checked</c:if>>
									<label>3명</label>
									
									<input type="radio" name="membernum" value="4" <c:if test="${rList.membernum == 4}">
							checked</c:if>>
									<label>4명</label>
								</td>	
								<th>모임 날짜</th>
								<td> <input type="datetime-local" id="matchDate" name="matchDate" required /></td>	
							</tr>
							<tr>
								<td colspan="4" class="textareaWrap">
									<textarea id="txt-content" name="content">${rList.content}</textarea>
								</td>	
							<tr>
								<td colspan="4" class="btnWrap txt-center">
									<button id="btn_add" class="btn-main btn-l" type="submit">작성 완료</button>
								</td>	
							</tr>
						</tbody>
					</table>
				</form>
				<!-- /form -->
			</div>
			<!-- /writeForm -->
		</div>
		<!-- //board -->
	</div>
	<!-- //content -->
	
	<!-- footer -->
	<c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
</body>
<script type="text/javascript">
function validateForm() {
    var title = $("input[name='title']").val();
    var gameType = $("input[name='matchGameType']:checked").val();
    var memberNum = $("input[name='membernum']:checked").val();
    
    if (title === "") {
        alert("제목을 입력해주세요.");
        return false;
    }
    
    if (gameType === undefined) {
        alert("게임 종류를 선택해주세요.");
        return false;
    }
    
    if (memberNum === undefined) {
        alert("게임 인원수를 선택해주세요.");
        return false;
    }
    
    // 모든 필수 입력 사항이 입력되었을 때 true 반환하여 폼 제출
    return true;
}

// 서버에서 가져온 rList.matchRegion 값을 가져옴
var selectedRegion = "${rList.matchRegion}";

// matchRegion select 엘리먼트 가져오기
var matchRegionSelect = document.getElementById("matchRegion");

// 옵션들을 반복하여 선택 여부 결정
for (var i = 0; i < matchRegionSelect.options.length; i++) {
    var option = matchRegionSelect.options[i];
    if (option.value === selectedRegion) {
        option.selected = true;
        break;  // 선택된 옵션을 찾았으므로 반복 중단
    }
}
	// 서버에서 가져온 rList.matchDate 값을 가져옴
	 var selectedMatchDate = "${rList.matchDate}";
    
    // 날짜와 시간 추출
    var dateParts = selectedMatchDate.split(" ");
    var date = dateParts[0];
    var time = dateParts[1].substring(0, 5);  // 시간 형식 (HH:mm) 추출
    
    // 날짜와 시간을 모양에 맞게 설정
    var matchDateInput = document.getElementById("matchDate");
    matchDateInput.value = date + "T" + time;
</script>
</html>
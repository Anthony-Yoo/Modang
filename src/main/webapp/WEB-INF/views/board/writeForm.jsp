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
				<form action="${pageContext.request.contextPath}/board/write" method="Post">
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
								<td colspan="3"><input type="text" name="title" value=""></td>	
							</tr>
							<tr>
								<th>게임종류</th>
								<td>
									<input type="radio"  name="matchGameType" value="0">
									<label>3구</label>
									
									<input type="radio" name="matchGameType" value="1">
									<label>4구</label>
									
									<input type="radio" name="matchGameType" value="2">
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
									<input type="radio" name="membernum" value="2">
									<label>2명</label>
									
									<input type="radio" name="membernum" value="3">
									<label>3명</label>
									
									<input type="radio" name="membernum" value="4">
									<label>4명</label>
								</td>	
								<th>모임 날짜</th>
								<td> <input type="datetime-local" id="matchDate" name="matchDate" /></td>	
							</tr>
							<tr>
								<td colspan="4" class="textareaWrap">
									<textarea id="txt-content" name="content">
1. 모임 장소: 

2. 플레이할 당구장 장소 협의 가능여부 (O/X) : 
                 
3. 다마수 제한 (ex> 200이하 or 무관):  
                 
4. 그 외 참고사항: 					</textarea>

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
  var matchDateInput = document.getElementById("matchDate");
  
  if (matchDateInput.value === "") {
    alert("모임 날짜를 선택해주세요.");
    return false; // Prevent form submission
  }
  
  return true; // Allow form submission
}
</script>
</html>
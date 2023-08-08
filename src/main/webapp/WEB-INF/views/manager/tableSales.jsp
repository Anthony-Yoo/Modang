<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>modang 관리자페이지</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/managerdefault.css" />
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<!-- jquery -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>

	<!-- 부트스트랩 js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
	
</head>
<body>
	<div id="page-wrapper">
		<!-- Header -->
		<section id="header">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<!-- Logo -->
						<h1>
							<a href="index.html"><img src="${pageContext.request.contextPath}/assets/images/logo.png" /></a>
						</h1>
						<!-- User login -->
						<c:choose>
							<c:when test="${sessionScope.loginManager==null}">
								<ul>
									<li><a href="${pageContext.request.contextPath}/manager/loginForm" class="btn btn-sm">로그인</a></li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul>	
									<li class="mr-2"><strong>${sessionScope.loginManager.repName}</strong>님</li>
									<li><a href="${pageContext.request.contextPath}/manager/logout" class="btn btn-sm">로그아웃</a></li>
									<li><a href="${pageContext.request.contextPath}/" class="btn btn-sm">모두의 당구장</a></li>
								</ul>
							</c:otherwise>
						</c:choose>

						<!-- Nav -->
						<nav id="nav">
							<a href="${pageContext.request.contextPath}/manager/index">테이블 현황</a>
							<a href="${pageContext.request.contextPath}/manager/tableSales" class="active">테이블 매출</a>
							<a href="${pageContext.request.contextPath}/manager/daySalesForm">일별 매출</a>
							<a href="${pageContext.request.contextPath}/manager/pricePolicyForm">요금 테이블</a>
							<a href="${pageContext.request.contextPath}/manager/settingsForm">관리자 설정</a>
						</nav>
					</div>
				</div>
			</div>
		</section>

		<!-- Content -->
		<section id="content">
			<div class="container">
				<div class="row">
					<div class="col-12">

						<!-- List -->
						<section>
							<header>
								<h2 class="float-left">테이블 매출</h2>
								
								<form name="" class="form-inline float-right mb-4" action="${pageContext.request.contextPath}/manager/tableSales" method="get" >
									<label class="mr-2">테이블 번호</label>
									<input type="hidden" name="biliardNo" value="${sessionScope.loginManager.biliardNo}">
									<div class="col-4">
									  <select class="form-control-5" name="tableNo" id="tableNameSelect">
									    <c:forEach items="${cuetableList}" var="cueTableVo">
									      	<option value="${cueTableVo.tableNo}">${cueTableVo.tableName}</option>
									    </c:forEach>
									  </select>
									</div>
									<label class="mr-2 ml-2">날짜</label>
										<input type="date" name="minDate" class="form-control form-control-sm" maxlength="20" />
									<label class="mr-1 ml-2">~</label>
										<input type="date" name="maxDate" class="form-control form-control-sm" maxlength="20" />
									<button type="submit" class="btn btn-sm btn-dark1">검색</button>
								</form>
							</header>
							
							<br>
							<p>전체매출: ${totalVo.t_income} 전체입금: ${totalVo.t_payMoney}<p>
							<p>카드매출: ${totalVo.c_income} 카드입금: ${totalVo.c_payMoney}<p>
							<p>현금매출: ${totalVo.m_income} 현금입금: ${totalVo.m_payMoney}<p>
							
							<table class="table table-striped">
								<thead class="thead-dark">
									<tr>
										<th>테이블번호</th>
										<th>게임 종류</th>
										<th>게임 날짜</th>
										<th>시작 시간</th>
										<th>종료 시간</th>
										<th>사용 시간</th>
										<th>결제 방법</th>
										<th>결제 금액</th>
										<th>입금 금액</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${salesList}" var="gamesVo">
										<tr>
											<td>${gamesVo.tableName}</td>
											<td>
											<c:if test ="${gamesVo.gameType==0}">3구</c:if>
											<c:if test ="${gamesVo.gameType==1}">4구</c:if>
											<c:if test ="${gamesVo.gameType==2}">8볼</c:if>
											<c:if test ="${gamesVo.gameType==3}">10볼</c:if>
											</td>
											<td>${gamesVo.gameDate}</td>
											<td>${gamesVo.startTime}</td>
											<td>${gamesVo.endTime}</td>
											<td>  
												  <c:set var="minutes" value="${(gamesVo.gameTime-60) / 60}" />
 												  <c:set var="seconds" value="${gamesVo.gameTime % 60}" />

  												  ${minutes}:${seconds < 10 ? '0' : ''}${seconds}
											</td>
											<td>
											<c:if test ="${gamesVo.payType==0}">카드</c:if>
											<c:if test ="${gamesVo.payType==1}">현금</c:if>
											</td>
											<td>${gamesVo.payMoney}</td>
											<td>${gamesVo.income}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</section>
					</div>
				</div>
			</div>
		</section>

		<!-- Copyright -->
		<div id="copyright">&copy; modang. All rights reserved.</div>
	</div>
</body>
<script type="text/javascript">
// 페이지 로드 시 실행
window.onload = function() {
    // "tableName" Select 요소 가져오기
    const tableNameSelect = document.getElementById("tableNameSelect");

    // URL의 쿼리 파라미터에서 "tableName" 값 가져오기
    const params = new URLSearchParams(window.location.search);
    const tableName = params.get("tableName");

    // "tableName" 값이 있을 경우 해당 값과 일치하는 옵션 선택
    if (tableName) {
        for (let i = 0; i < tableNameSelect.options.length; i++) {
            if (tableNameSelect.options[i].value === tableName) {
                tableNameSelect.selectedIndex = i;
                break;
            }
        }
    }
};//페이지 로드 end

</script>
</html>
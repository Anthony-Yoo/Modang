<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
							<a href="${pageContext.request.contextPath}/manager/tableSales" >테이블 매출</a>
							<a href="${pageContext.request.contextPath}/manager/daySalesForm" class="active">일별 매출</a>
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
					<div class="col-8">

						<!-- List -->
						<section>
							<header>
								<h2 class="float-left">일별 매출</h2>
								
								 <form name="" class="form-inline float-right mb-4" action="${pageContext.request.contextPath}/manager/daySalesForm" method="get" >
									<label class="mr-2">날짜</label>
										<input type="date" name="minDate" class="form-control form-control-sm" maxlength="20" />
									<label class="mr-1">~</label>
										<input type="date" name="maxDate" class="form-control form-control-sm" maxlength="20" />
									<button type="submit" class="btn btn-sm btn-dark">검색</button>
								</form> 
							</header>
							<div class ="daySalesBox">
							<table class="table table-striped">
								<thead class="thead-dark">
									<tr>
										<th>날짜</th>
										<th>카드매출</th>
										<th>카드입금</th>
										<th>현금매출</th>
										<th>현금입금</th>
										<th>토탈매출</th>
										<th>토탈입금</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${totalList}" var="totalVo">
										<tr>
											<td>${totalVo.gameDate}</td>
											<td><fmt:formatNumber type="number" maxFractionDigits="3"   value="${totalVo.c_payMoney}" /></td>
											<td><fmt:formatNumber type="number" maxFractionDigits="3"   value="${totalVo.c_income}" /></td>
											<td><fmt:formatNumber type="number" maxFractionDigits="3"   value="${totalVo.m_payMoney}" /></td>
											<td><fmt:formatNumber type="number" maxFractionDigits="3"   value="${totalVo.m_income}" /></td>
											<td><fmt:formatNumber type="number" maxFractionDigits="3"   value="${totalVo.t_payMoney}" /></td>
											<td><fmt:formatNumber type="number" maxFractionDigits="3"   value="${totalVo.t_income}" /></td>
										</tr>
									</c:forEach>
																																														
								</tbody>
							</table>
							</div>
						</section>
					</div>
					<div class="col-4">
						<section>
							<header>
								<h2>최근 일주일 매출 그래프</h2>
							</header>
							
							<div>
								<canvas id="chart-bars" width="320" height="520"></canvas>
							</div>
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

var dayList=[];
var cardList=[];
var moneyList=[];
var totalList=[];	

$(function() {
	
	makeGrapeInfo();
	
	var barsChart = new Chart(document.getElementById('chart-bars').getContext('2d'), {
		type: 'bar',
		data: {
			labels: dayList,// <- 세로축 데이터
			datasets: [
				{
					label: '카드매출',
					data: cardList, // <-- 가로축 데이터
					borderColor: '#FFCE56',
					backgroundColor: '#FFCE56',
					fontSize: 14
		        }, 
		        {
					label: '현금매출',
					data: moneyList, // <-- 가로축 데이터
					borderColor: '#4BC0C0',
					backgroundColor: '#4BC0C0',
					fontSize: 14
			    },
			    {
					label: '토탈매출',
					data: totalList, // <-- 가로축 데이터
					borderColor: '#00A2E8',
					backgroundColor: '#00A2E8',
					fontSize: 14
			    }
		    ]
		},
		options: {
			indexAxis: 'y',
			responsive: false,
		},
	});
});



function makeGrapeInfo() {
	
	$.ajax({			
		url : "${pageContext.request.contextPath}/manager/daySalesChart",		
		type : "post",
		/* contentType : "application/json", */
		/* data : {keyword: keyword}, */
		
		async: false,
		dataType : "json",
		success : function(jsonResult){						
			console.log(jsonResult.data);
			var list = jsonResult.data
			
			
			for(var i=0; i<list.length; i++){
				dayList.push(list[i].dates);
				cardList.push(list[i].c_income); 
				moneyList.push(list[i].m_income);
				totalList.push(list[i].t_income);;	
			}
			console.log(dayList);	
			console.log(cardList);	
			console.log(moneyList);	
			console.log(totalList);	
				
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}		
		
	});	
	
}

</script>
</html>
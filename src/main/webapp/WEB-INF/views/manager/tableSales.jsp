<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>modang 관리자페이지</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/image/favicon.ico" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/managerdefault.css" />
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>
	<div id="page-wrapper">

		<!-- Header -->
		<section id="header">
			<div class="container">
				<div class="row">
					<div class="col-12">

						<!-- Logo -->
						<h1><a href="${pageContext.request.contextPath}/manager/index"><img src="${pageContext.request.contextPath}/assets/image/logo.png" /></a></h1>

						<!-- User menu -->
						<ul>
							<!-- <li><a href="#" class="btn btn-sm">로그인</a></li> -->
							<!-- <li><a href="#" class="btn btn-sm">모두의 당구장</a></li> -->
							<li><a href="#" class="btn btn-sm">로그아웃</a></li>
							<li><a href="#" class="btn btn-sm">모두의 당구장</a></li>
						</ul>

						<!-- Nav -->
						<nav id="nav">
							<a href="${pageContext.request.contextPath}/manager/index">테이블 현황</a>
							<a href="${pageContext.request.contextPath}/manager/tableSalesForm" class="active">테이블 매출</a>
							<a href="${pageContext.request.contextPath}/manager/daySales">일별 매출</a>
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
									<div class="col-4">
										<input type="text" name="tableno" class="form-control form-control-sm" maxlength="10" />
									</div>
									<label class="mr-2">날짜</label>
										<input type="date" name="mindate" class="form-control form-control-sm" maxlength="20" />
									<label class="mr-1">~</label>
										<input type="date" name="maxdate" class="form-control form-control-sm" maxlength="20" />
									<button type="submit" class="btn btn-sm btn-dark">검색</button>
								</form>
							</header>
							
							<table class="table table-striped">
								<thead class="thead-dark">
									<tr>
										<th>테이블 번호</th>
										<th>종류</th>
										<th>시작시간</th>
										<th>종료시간</th>
										<th>사용시간</th>
										<th>요금제</th>
										<th>결제금액</th>
										<th>입금금액</th>
										<th>결제방법</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>4구</td>
										<td>00:00</td>
										<td>00:00</td>
										<td>00:00</td>
										<td>후불제</td>
										<td>10,000</td>
										<td>10,000</td>
										<td>카드</td>
										<td><span class="badge badge-success">완료</span></td>
									</tr>
									<tr>
										<td>2</td>
										<td>4구</td>
										<td>00:00</td>
										<td>00:00</td>
										<td>00:00</td>
										<td>후불제</td>
										<td>10,000</td>
										<td>10,000</td>
										<td>카드</td>
										<td><span class="badge badge-danger">미수</span></td>
									</tr>
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
</html>
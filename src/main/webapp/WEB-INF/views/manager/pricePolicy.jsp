<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
	<title>modang 관리자페이지</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/managerdefault.css" />
</head>
<body>
	<div id="page-wrapper">

		<!-- Header -->
		<section id="header">
			<div class="container">
				<div class="row">
					<div class="col-12">

						<!-- Logo -->
						<h1><a href="${pageContext.request.contextPath}/manager/index"><img src="${pageContext.request.contextPath}/assets/images/logo.png" /></a></h1>

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
							<a href="${pageContext.request.contextPath}/manager/tableSalesForm">테이블 매출</a>
							<a href="${pageContext.request.contextPath}/manager/daySales">일별 매출</a>
							<a href="${pageContext.request.contextPath}/manager/pricePolicyForm" class="active">요금 테이블</a>
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

						<!-- Form -->
						<section>
							<header>
								<h2>시간제 요금 설정 <small class="font-weight-normal text-blue">10분당 테이블 요금을 설정하세요</small></h2>
							</header>
							<div id="priccePolicyForm">
								<form action="${pageContext.request.contextPath}/manager/pricePolicy" method="get">
									<div class="row">
										<div class="col-4">
											<label class="form-label">대대요금</label>
											<div class="col input-group">
											    <input type="hidden" id="" name="biliardno" value="${requestScope.tariffVo.biliardno}">
												<input type="text" name="btablefee" class="form-control text-big text-right" maxlength="8" value="${requestScope.tariffVo.btablefee}"/>
												<span class="input-group-append"><span class="input-group-text">원</span></span>
											</div>
										</div>
										
										<div class="col-4">
											<label class="form-label">중대요금</label>
											<div class="col input-group">
												<input type="text" name="mtablefee" class="form-control text-big text-right" maxlength="8" value="${requestScope.tariffVo.mtablefee}"/>
												<span class="input-group-append"><span class="input-group-text">원</span></span>
											</div>
										</div>
										
										<div class="col-4">
											<label class="form-label">포켓요금</label>
											<div class="col input-group">
												<input type="text" name="ptablefee" class="form-control text-big text-right" maxlength="8" value="${requestScope.tariffVo.ptablefee}"/>
												<span class="input-group-append"><span class="input-group-text">원</span></span>
											</div>
										</div>
									</div>
									
									<div class="row mt-0">
										<div class="col-4">
											<label class="form-label">대대 최소 게임비</label>
											<div class="col input-group">
												<input type="text" name="bminfee" class="form-control text-big text-right" maxlength="8" value="${requestScope.tariffVo.bminfee}"/>
												<span class="input-group-append"><span class="input-group-text">원</span></span>
											</div>
										</div>
										
										<div class="col-4">
											<label class="form-label">중대 최소 게임비</label>
											<div class="col input-group">
												<input type="text" name="mminfee" class="form-control text-big text-right" maxlength="8" value="${requestScope.tariffVo.mminfee}"/>
												<span class="input-group-append"><span class="input-group-text">원</span></span>
											</div>
										</div>
										
										<div class="col-4">
											<label class="form-label">포켓 최소 게임비</label>
											<div class="col input-group">
												<input type="text" name="pminfee" class="form-control text-big text-right" maxlength="8" value="${requestScope.tariffVo.pminfee}"/>
												<span class="input-group-append"><span class="input-group-text">원</span></span>
											</div>
										</div>
									</div>
									
									<div class="mt-4 text-right" style="position: absolute; bottom: 32px; right: 32px;">
										<button type="submit" class="btn btn-lg btn-blue">저장</button>
									</div>
								</form>
							</div> <!--priccePolicyForm end -->
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

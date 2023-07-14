
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>modang 관리자페이지</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
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
						<h1>
							<a href="index.html"><img src="${pageContext.request.contextPath}/assets/images/logo.png" /></a>
						</h1>

						<!-- User menu -->
						<ul>
							<!-- <li><a href="#" class="btn btn-sm">로그인</a></li> -->
							<li class="mr-2"><strong>홍길동</strong>님</li>
							<li><a href="#" class="btn btn-sm">로그아웃</a></li>
							<li><a href="#" class="btn btn-sm">모두의 당구장</a></li>
						</ul>

						<!-- Nav -->
						<nav id="nav">
							<a href="${pageContext.request.contextPath}/manager/index" class="active">테이블 현황</a> 
							<a href="${pageContext.request.contextPath}/manager/tablesales">테이블 매출</a> 
							<a href="${pageContext.request.contextPath}/manager/daysales">일별 매출</a> 
							<a href="${pageContext.request.contextPath}/manager/pricePolicy">요금 테이블</a> 
							<a href="${pageContext.request.contextPath}/manager/settings">관리자 설정</a>
						</nav>
					</div>
				</div>
			</div>
		</section>

		<!-- Content -->
		<section id="content">
			<div class="container">
				<div class="row aln-center">

					<!-- Table -->
					<div class="col-8">
						<section>
							<header>
								<h2>테이블 현황</h2>
							</header>

						</section>
					</div>

					<!-- Form -->
					<div class="col-4">
						<section>
							<header>
								<h2>No.8</h2>
							</header>

							<form>
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">테이블 종류</label>
									<div class="col">
										<label class="custom-control custom-radio d-inline-block">
											<input type="radio" name="tabletype" class="custom-control-input" />
											<span class="custom-control-label">대대</span>
										</label> <label class="custom-control custom-radio d-inline-block">
											<input type="radio" name="tabletype" class="custom-control-input" /> 
											<span class="custom-control-label">중대</span>
										</label> <label class="custom-control custom-radio d-inline-block">
											<input type="radio" name="tabletype" class="custom-control-input" /> 
											<span class="custom-control-label">포켓</span>
										</label>
										     <a href="${pageContext.request.contextPath}/manager/settings"><img src="${pageContext.request.contextPath}/assets/images/settings.png" width="15px"/></a>
									</div>
								</div>
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">게임 종류</label>
									<div class="col">
										<label class="custom-control custom-radio d-inline-block">
											<input type="radio" name="gametype" class="custom-control-input" /> 
											<span class="custom-control-label">8볼</span>
										</label> 
										<label class="custom-control custom-radio d-inline-block">
											<input type="radio" name="gametype" class="custom-control-input" /> 
											<span class="custom-control-label">10볼</span>
										</label>
									</div>
								</div>
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">고객정보</label>
									<div class="col">
										<textarea name="" class="form-control mb-1" rows="5" maxlength="1000" disabled></textarea>
									</div> 
								</div>
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">요금제</label>
									<div class="col input-group">
										<select name="" class="custom-select input-group-prepend">
											<option value="">후불</option>
											<option value="">선불</option>
										</select> 
										<span class="input-group-prepend">
											<span class="input-group-text px-2 text-tiny" style="height: 2rem;">10분당</span>
										</span>
										<input type="text" name="" class="form-control form-control-sm px-2" maxlength="4" placeholder="" /> 
											<span class="input-group-append">
												<span class="input-group-text px-2 text-tiny" style="height: 2rem;">원</span>
											</span>
									</div>
								</div>
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">시작 시간</label>
									<div class="col-4">
										<input type="text" name="" class="form-control form-control-sm mb-1" maxlength="20" disabled />
									</div>
								</div>
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">이용 시간</label>
									<div class="col">
										<textarea name="" class="form-control mb-1" rows="5" maxlength="1000" disabled></textarea>
									</div> 
								</div>
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">종료 시간</label>
									<div class="col-4">
										<input type="text" name="" class="form-control form-control-sm mb-1" maxlength="20"	disabled />
									</div>
								</div>
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">총 결제금액</label>
									<div class="col input-group">
										<input type="text" name="" class="form-control" maxlength="20" disabled />
									</div>
								</div>

								<div class="mt-4" style="position: absolute; bottom: 32px;">
									<button type="button" class="btn btn-red btn-lg btn-block">정 산</button>
								</div>
							</form>
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
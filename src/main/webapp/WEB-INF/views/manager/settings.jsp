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
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	// 우편번호 서비스
	function daumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				var fullAddr = '';
				var extraAddr = '';
				
				if (data.userSelectedType === 'R') {
					fullAddr = data.roadAddress;
				} else {
					fullAddr = data.jibunAddress;
				}
				
				if(data.userSelectedType === 'R'){
					if(data.bname !== ''){
						extraAddr += data.bname;
					}
					
					if(data.buildingName !== ''){
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					
					fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
				}

				document.getElementById("zonecode").value = data.zonecode;
				document.getElementById("address").value = fullAddr;
				document.getElementById("address_detail").focus();
			}
		}).open();
	}
	</script>
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
							<a href="${pageContext.request.contextPath}/manager/tableSalesForm">테이블 매출</a>
							<a href="${pageContext.request.contextPath}/manager/daysales">일별 매출</a>
							<a href="${pageContext.request.contextPath}/manager/pricePolicyForm">요금 테이블</a>
							<a href="${pageContext.request.contextPath}/manager/settingsForm" class="active">관리자 설정</a>
						</nav>
					</div>
				</div>
			</div>
		</section>

		<!-- Content -->
		<section id="content">
			<div class="container">
				<div class="row">

					<!-- Form -->
					<div class="col-6">
						<section>
							<header>
								<h2>사업자 정보 <small class="font-weight-normal text-blue">변경할 정보를 입력하세요</small></h2>
							</header>
							
							<form>
								<div class="form-group row">
									<label class="col-form-label col-3">아이디</label>
									<div class="col">
										<input type="text" name="id" class="form-control" maxlength="20" disabled/>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-form-label col-3">대표자명</label>
									<div class="col">
										<input type="text" name="repname" class="form-control" maxlength="10" placeholder="" />
									</div>
								</div>
								<div class="form-group row">
									<label class="col-form-label col-3">비밀번호</label>
									<div class="col">
										<input type="text" name="passwd" class="form-control" maxlength="20" placeholder="" />
									</div>
								</div>
								<div class="form-group row">
									<label class="col-form-label col-3">상호명</label>
									<div class="col">
										<input type="text" name="bilardname" class="form-control" maxlength="50" placeholder="" />
									</div>
								</div>
								<div class="form-group row">
									<label class="col-form-label col-3">사업자등록번호</label>
									<div class="col">
										<input type="text" name="companyno" class="form-control" maxlength="20" placeholder="" />
									</div>
								</div>
								<div class="form-group row">
									<label class="col-form-label col-3">전화번호</label>
									<div class="col">
										<input type="text" name="biliardphone" class="form-control" maxlength="20" placeholder="" />
									</div>
								</div>
								<div class="form-group row">
									<label class="col-form-label col-3">주소</label>
									<div class="col">
										<input type="text" id="zonecode" name="zonecode" class="form-control w-33" placeholder="우편번호" onclick="daumPostcode();" readonly />
										<input type="text" id="address" name="address" class="form-control mt-1" placeholder="주소" onclick="daumPostcode();" readonly />
										<input type="text" id="address_detail" name="address_detail" class="form-control mt-1" maxlength="50" placeholder="상세주소" />
									</div>
								</div>
								
								<div class="mt-4 text-right" style="position: absolute; bottom: 32px; right: 32px;">
									<button type="submit" class="btn btn-lg btn-blue">수정</button>
									<button type="button" class="btn btn-lg btn-dark">취소</button>
								</div>
							</form>
							
						</section>
					</div>

					<!-- Form -->
					<div class="col-6">
						<section>
							<header>
								<h2>매장 정보 <small class="font-weight-normal text-blue">변경할 정보를 입력하세요</small></h2>
							</header>
							
							<form>
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
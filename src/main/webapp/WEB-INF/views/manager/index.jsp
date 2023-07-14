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
	<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
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
							<a href="${pageContext.request.contextPath}/manager/index" class="active">테이블 현황</a>
							<a href="${pageContext.request.contextPath}/manager/tableSalesForm">테이블 매출</a>
							<a href="${pageContext.request.contextPath}/manager/daysales">일별 매출</a>
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

					<!-- Form -->
					<div class="col-8">
						<section>
							<form>
							  <div class="col-3 float-left">
							  
							  </div>



							</form>
						</section>
					</div>

					<!-- Form -->
					<div class="col-4">
						<section>
							<header>
								<h2><small class="font-weight-normal">No 1</small></h2>
							</header>
								<form>
									<div class="form-group row">
										<label class="col-form-label col-5">테이블종류</label>
										<div class="col">
											<input type="text" name="id" class="form-control-1" maxlength="20" disabled/>
										</div>
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
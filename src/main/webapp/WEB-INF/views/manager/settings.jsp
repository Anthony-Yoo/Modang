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
							<a href="${pageContext.request.contextPath}/manager/tableSales">테이블 매출</a>
							<a href="${pageContext.request.contextPath}/manager/daySalesForm">일별 매출</a>
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
			<form action="${pageContext.request.contextPath}/manager/modify" id="" method="post" enctype="multipart/form-data">
			<input type="hidden"  name="biliardNo" value="${requestScope.managerVo.biliardNo}">
			<input type="hidden" name="id" value ="${requestScope.managerVo.id}"> <!-- modify할때  -->
				<div class="row">
					<!-- Form -->
					<div class="col-6">
						<section>
							<header>
								<h2>사업자 정보 <small class="font-weight-normal text-blue">변경할 정보를 입력하세요</small></h2>
							</header>
								<div class="form-group row mt">
									<label class="col-form-label col-3">아이디</label>
									<div class="col">
										<input type="text" name="id" class="form-control" maxlength="20" disabled placeholder="${requestScope.managerVo.id}"  value="${requestScope.managerVo.id}"/>
									</div>
								</div>
                                <div class="form-group row mt">
									<label class="col-form-label col-3">비밀번호</label>
									<div class="col">
										<input type="password" name="passwd" class="form-control" maxlength="20" placeholder=""  value="${requestScope.managerVo.passwd}"/>
									</div>
								</div>
                                <div class="form-group row mt">
									<label class="col-form-label col-3">사업자등록번호</label>
									<div class="col">
										<input type="text" name="companyNo" class="form-control" maxlength="20" placeholder="" value="${requestScope.managerVo.companyNo}"/>
									</div>
								</div>
								<div class="form-group row mt">
									<label class="col-form-label col-3">대표자명</label>
									<div class="col">
										<input type="text" name="repName" class="form-control" maxlength="10" placeholder="" value="${requestScope.managerVo.repName}" />
									</div>
								</div>
								<div class="form-group row mt">
									<label class="col-form-label col-3">상호명</label>
									<div class="col">
										<input type="text" name="biliardName" class="form-control" maxlength="50" placeholder="" value="${requestScope.managerVo.biliardName}" />
									</div>
								</div>
								<div class="form-group row mt">
									<label class="col-form-label col-3">주소</label>
									<div class="col">
										<input type="text" id="zonecode" name="postcode" class="form-control w-33" placeholder="우편번호" value="${requestScope.managerVo.postcode}"  onclick="daumPostcode();" readonly />
										<input type="text" id="address" name="biliardAddress1" class="form-control mt-1" placeholder="주소"  value="${requestScope.managerVo.biliardAddress1}" onclick="daumPostcode();" readonly />
										<input type="text" id="address_detail" name="biliardAddress2" class="form-control mt-1" maxlength="50" placeholder="상세주소"  value="${requestScope.managerVo.biliardAddress2}" />
									</div>
								</div>
                                <div class="form-group row mt">
									<label class="col-form-label col-3">전화번호</label>
									<div class="col">
										<input type="text" name="biliardPhone" class="form-control" maxlength="20" placeholder="" value="${requestScope.managerVo.biliardPhone}" />
									</div>                                   
								</div>
						</section>
					</div>
					<div class="col-6">
						<section>
							<header>
								<h2>매장 정보 <small class="font-weight-normal text-blue">변경할 정보를 입력하세요</small></h2>
							</header>s
                                <div class="form-group row">
                                    <label for="" class="col-form-label col-3">매장사진</label>
                                    <div class="col">
                                    	<div class="image-box">
                                    		<img src="${pageContext.request.contextPath }/upload/${requestScope.managerVo.imageFile1}" id="resultImg1"  class="resultImg" >
                                    		<input type="hidden"  name="imageFile1" value="${requestScope.managerVo.imageFile1}">
                                    		<input type="file" name="file" class="form-control resultFile" onchange="previewImage(event, 'resultImg1')"  maxlength="20" placeholder="" value="${requestScope.managerVo.imageFile1}" />
                                        </div>
                                        <div class="image-box">	
                                        	<img src="${pageContext.request.contextPath }/upload/${requestScope.managerVo.imageFile2}" id="resultImg2"  class="resultImg" >
                                    		<input type="hidden"  name="imageFile2" value="${requestScope.managerVo.imageFile2}">
                                        	<input type="file" name="file" class="form-control resultFile" onchange="previewImage(event, 'resultImg2')"  maxlength="20" placeholder="" value="${requestScope.managerVo.imageFile2}" />
                                        </div>
                                        <div class="image-box">	
                                        	<img src="${pageContext.request.contextPath }/upload/${requestScope.managerVo.imageFile3}" id="resultImg3"  class="resultImg" >
                                    		<input type="hidden"  name="imageFile3" value="${requestScope.managerVo.imageFile3}">
                                        	<input type="file" name="file" class="form-control resultFile" onchange="previewImage(event, 'resultImg3')"  maxlength="20" placeholder="" value="${requestScope.managerVo.imageFile3}" />
                                    	</div>
									</div>
                                </div>
                                <div class="form-group row">
                                    <label for="" class="col-form-label col-3">영업시간</label>
                                    <div class="col">
										<input type="time" name="time1" class="form-control time" maxlength="20" placeholder="" value="${requestScope.managerVo.time1}" />
                                        &nbsp;&nbsp;~&nbsp;&nbsp;
                                        <input type="time" name="time2" class="form-control time" maxlength="20" placeholder="" value="${requestScope.managerVo.time2}" />
									</div>
                                </div>
                                <div class="form-group row">
                                    <label for="" class="col-form-label col-3">주차 여부</label>
                                    <div class="col">
                                    	<c:if test="${ requestScope.managerVo.parking == 'Y'}">
											<input type="radio" name="parking" id="parking1" class="form-control" checked="checked" maxlength="50" placeholder="" value="${requestScope.managerVo.parking}" />
	                                        <label for="parking1" class="parking">주차 가능하당</label>
	                                        <input type="radio" name="parking" id="parking2" class="form-control" maxlength="50" placeholder="" value="${requestScope.managerVo.parking}" />
	                                        <label for="parking2" class="parking">주차 불가능하당</label>
	                                    </c:if>
	                                    <c:if test="${ requestScope.managerVo.parking == 'N'}">
	                                    	<input type="radio" name="parking" id="parking1" class="form-control" maxlength="50" placeholder="" value="${requestScope.managerVo.parking}" />
	                                        <label for="parking1" class="parking">주차 가능하당</label>
	                                        <input type="radio" name="parking" id="parking2" class="form-control" checked="checked" maxlength="50" placeholder="" value="${requestScope.managerVo.parking}" />
	                                        <label for="parking2" class="parking">주차 불가능하당</label>
                                        </c:if>
									</div>
                                </div>
                                <div class="form-group row">
                                    <label for="" class="col-form-label col-3">추가 내용</label>
                                    <div class="col">
										<input type="text" id="bdComment" name="bdComment" class="form-control" maxlength="50" placeholder="" value="${requestScope.managerVo.bdComment}" />
									</div>
                                </div>
                                <div class="mt-4 text-right" style="position: absolute; bottom: 32px; right: 32px;">
									<button type="submit" class="btn btn-lg btn-blue">수정</button>
									<button type="button" class="btn btn-lg btn-dark">취소</button>
								</div>
						</section>
					</div>

				</div>
			</form>
			</div>
		</section>

		<!-- Copyright -->
		<div id="copyright">&copy; modang. All rights reserved.</div>
	</div>
						<script>
						function previewImage(event, imgId) {
							const input = event.target;
							const imgElement = document.getElementById(imgId);
							
							if (input.files && input.files[0]) {
								const reader = new FileReader();

								reader.onload = function (e) {
								imgElement.style.display = "block"; // 이미지 보이도록 변경
								imgElement.src = e.target.result;
								
							};
							reader.readAsDataURL(input.files[0]);
							}else {
							      // 파일을 선택하지 않은 경우 빈 상태로 되돌림
							      imgElement.style.display = "none"; // 이미지 숨김
							    }
						}
					</script>
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
</body>
</html>
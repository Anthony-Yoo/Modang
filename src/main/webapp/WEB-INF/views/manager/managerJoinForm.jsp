<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modang 관리자 회원가입</title>
<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
<link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/manager.css" rel="stylesheet" type="text/css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e22dfae5a7af2f9805a3f47c324a0694"></script>
</head>
<body>
	<!-- 헤더 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
	<!-- 헤더 끝 -->
	<div id="main-content">
		<div class="container">
			<h2>환영합니당</h2>
			<h3>관리자 정보</h3>
			<form action="${pageContext.request.contextPath}/manager/join" id="" method="post">
				<div class="join-wrap">
					<div class="con">
						<span class="inp-txt">
							<img src="${pageContext.request.contextPath}/assets/images/id.png" alt="아이디"> 
							<input type="text" id="id" name="id" placeholder="아이디">
							<a href="" class="chck">중복체크</a>
						</span>
						<p class="error-msg">이미 사용중인 아이디 입니당</p>
					</div>
					<div class="con">
						<span class="inp-txt"> 
							<img src="${pageContext.request.contextPath}/assets/images/settings.png" alt="비밀번호">
							<input type="password" id="passwd" name="passwd" placeholder="비밀번호">
						</span>
					</div>
					<div class="con">
						<span class="inp-txt">
							<img src="${pageContext.request.contextPath}/assets/images/file.png" alt="사업자 등록번호"> 
							<input type="text" id="companyNo" name="companyNo" placeholder="사업자 등록번호">
						</span>
					</div>														
					<div class="con">
						<span class="inp-txt">
							<img src="${pageContext.request.contextPath}/assets/images/user.png" alt="이름">
							<input type="text" id="repName" name="repName" placeholder="이름">
						</span>
					</div>
					<div class="con">
						<span class="inp-txt"> 
							<img src="${pageContext.request.contextPath}/assets/images/home.png" alt="매장 이름"> 
							<input type="text" id="biliardName" name="biliardName" placeholder="매장 이름">
						</span>
					</div>
					<div class="con">
						<span class="inp-txt"> 
							<img src="${pageContext.request.contextPath}/assets/images/map.png" alt="매장 주소">
							<input type="text" class="post" id="postcode" name="postcode" placeholder="우편번호">
							<input type="button" class="postBt" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" class="addr" id="biliardAddress1" name="biliardAddress1" placeholder="주소"><br>
							<input type="text" class="addr" id="biliardAddress2" name="biliardAddress2" placeholder="상세 주소">
							<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
						</span>
					</div>							
					<div class="con">
						<span class="inp-txt">
							<img src="${pageContext.request.contextPath}/assets/images/phone.png" alt="매장 번호"> 
							<input type="text" id="biliardPhone" name="biliardPhone" placeholder="매장 번호">
						</span>
					</div>
				</div><!-- join-wrap -->
			<h3>매장 정보</h3>
				<div class="join-wrap">
					<div class="con">
						<label for="image">매장사진 (필수)</label>
						<input type="file" id="image" name="imageFile1" class="image" accept="images/*"/>
						<label for="image">매장사진 (선택)</label>
						<input type="file" id="image" name="imageFile1" class="image"/>
						<ul class="photo-list">
        				<!-- 이미지 미리보기를 위한 li 태그 -->
    					</ul>
					</div>
					<div class="con">
						<span class="inp-txt"> 
							<img src="${pageContext.request.contextPath}/assets/images/clock.png" alt="이용시간"> 
							<input type="time" class="time" name="time1">
							 ~ 
							<input type="time" class="time" name="time2">
						</span>
					</div>
					<div class="con">
						<span class="inp-txt">
							<img src="${pageContext.request.contextPath}/assets/images/parking.png" alt="주차 여부">
							<div class="parking">
								<input type="radio" id="parking1" name="parking">
								<label for="parking1">주차 가능하당</label>
								<input type="radio" id="parking2" name="parking">
								<label for="parking2">주차 불가능하당</label>
							</div>
						</span>
					</div>
					<div class="con">
						<span class="inp-txt">
							<img src="${pageContext.request.contextPath}/assets/images/file.png" alt="추가 내용">
							<input type="text" id="bdComment" name="bdComment" placeholder="추가 정보">
						</span>
					</div>					
				</div><!-- join-wrap -->
				<button id="btnJoin" class="button" type="submit" >회원가입할거당</button>
			</form>
		</div><!-- container -->
	</div><!-- main-content -->
	<!-- 푸터 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
	<!-- 푸터 끝 -->
</body>
<script>
    

</script>
</html>
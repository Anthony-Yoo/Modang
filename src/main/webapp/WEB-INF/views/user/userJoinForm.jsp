<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>사용자 선택 할꺼당!</title>

<!-- icon -->
<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />

<!-- css -->

<link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/user.css" rel="stylesheet" type="text/css"> 
<link href="${pageContext.request.contextPath}/assets/css/mypage.css" rel="stylesheet" type="text/css">
<!-- js -->

</head>
<body>
    <!-- 헤더 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
	<!-- 헤더 끝 -->
	
	<div id="main-content">
		<div id="content-header" class="line">
			<h2>
				<a>모당 회원 가입</a>
			</h2>
		</div>
		<div class="con">
			<div class="userJoin">
				<a href="${pageContext.request.contextPath}/user/joinForm">
					<span class="title">
						개인 회원 가입
						<img src="${pageContext.request.contextPath}/assets/images/right-chevron.png"   alt="">
					</span>
					<span class="user">
						당구를 좋아하시는 분들이라면,<br>
						누구나 개인회원으로 가입하여<br>
						모당을 통해 편리하고 알차게<br>
						당구를 즐길 수 있습니다?
					</span>
				</a>
			</div>
			<div class="managerJoin">
				<a href="${pageContext.request.contextPath}/manager/joinForm">
					<span class="title">
						관리자 회원 가입
						<img src="${pageContext.request.contextPath}/assets/images/right-chevron.png"  alt="">
					</span>
					<span class="manager">
						사업자등록을 보유중이라면,<br>
						사업자회원으로 가입하여<br>
						모당을 이용하실수 있습니다<br>
					</span>
				</a>
			</div>
		</div>
    <!-- //main-content -->
  	</div>
	<!-- 푸터 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
    <!-- 푸터 끝 -->
</body>
</html>
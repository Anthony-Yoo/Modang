<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>나의 모당!</title>

<!-- icon -->
<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />

<!-- css -->

<link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/user.css" rel="stylesheet" type="text/css">

<!-- js -->



</head>
<body>
    <!-- 헤더 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
	<!-- 헤더 끝 -->
		<div id="userPage">
			<!-- sideNav 시작 -->
			<c:import url="/WEB-INF/views/include/modangSideNav.jsp"></c:import>
			<!-- sideNav 끝 -->
					<div class="userContent" >
							<div id="content-header">
								<h2>
									<a>회원 정보</a>
								</h2>
							</div>
							<div class="show" >
								<div class="img">
									<img src="${pageContext.request.contextPath }/upload/${requestScope.userVo.profileImage}" id="userFroFileImage">
								</div>
								<div class="text">
									<span class="txt">
										<img src="${pageContext.request.contextPath}/assets/images/user.png" alt="">
										<span> ${requestScope.userVo.id}</span>
									</span>
									<span class="txt">
										<img src="${pageContext.request.contextPath}/assets/images/smartphone.png" alt="">
										<span>${requestScope.userVo.cellphone}</span>
									</span>
									<span class="txt">
										<img src="${pageContext.request.contextPath}/assets/images/business-card.png" alt="">
										<span>${requestScope.userVo.nick}</span>
									</span>
									<span class="txt">
										<img src="${pageContext.request.contextPath}/assets/images/line-graph.png" alt="">
										<span>${requestScope.userVo.average}</span>
									</span>
								</div>							
       						</div>
       					<div class="button-area">
       							<button type="submit" onclick="document.location='${pageContext.request.contextPath}/user/modifyForm'">수정하기로 고고!</button>
						</div>
							
           		</div>
    		</div>
    	<!-- //user -->
    	<!-- //content -->
	<!-- 푸터 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
    <!-- 푸터 끝 -->
   
</body>
</html>
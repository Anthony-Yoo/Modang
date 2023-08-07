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
							
									<div class="image-show" >
       									<img src="${pageContext.request.contextPath }/upload/${requestScope.userVo.profileImage}" id="userFroFileImage">
       									<img src="${pageContext.request.contextPath}/assets/images/gplayer0.jpg" id="userSubImage" style="" alt=""> 
       								</div>
       								
       							<div class="image-icon">
									
									 
									<div class="text" data-text-content="true" >
									<img src="${pageContext.request.contextPath}/assets/images/user.png" alt="">${requestScope.userVo.id}
									</div>
									
									
									<div class="text" data-text-content="true" >
									<img src="${pageContext.request.contextPath}/assets/images/smartphone.png" alt="">${requestScope.userVo.cellphone}
									</div>
									
									
									<div class="text" data-text-content="true">
									<img src="${pageContext.request.contextPath}/assets/images/business-card.png" alt="">${requestScope.userVo.nick}
									</div>
									
									
									<div class="text" data-text-content="true">
									<img src="${pageContext.request.contextPath}/assets/images/line-graph.png" alt="">${requestScope.userVo.average}
									</div> 
										
								</div>
								
       						<div class="button-area">
       								<button type="submit" class="btn btn-light" onclick="document.location='${pageContext.request.contextPath}/user/modifyForm'">수정하기로 고고!</button>
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
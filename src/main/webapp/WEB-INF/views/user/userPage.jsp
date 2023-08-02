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
	
	<div id="main-content">
	
		<div class="container text-center">

				<div id="userPage">
		
                 	<!-- sideNav 시작 -->
					<c:import url="/WEB-INF/views/include/modangSideNav.jsp"></c:import>
					<!-- sideNav 끝 -->

					<div class="content">
					
									<div class="image-show" id="image-show" >
       									<img src="${pageContext.request.contextPath }/upload/${requestScope.userVo.profileImage}" >
       									<img src="${pageContext.request.contextPath}/assets/images/gplayer.jpg" style="margin:-3px 0px 0px -15px;width:760px;opacity: 0.2;" alt="">
       								</div>
       							<div class="image-icon">
									
									<img src="${pageContext.request.contextPath}/assets/images/user.png" style="margin:-475px 10px -15px 240px;" alt="">
									<div class="text" data-text-content="true" style="margin: -255px 0px -25px 295px;font-size: 30px;">${requestScope.userVo.id}
									</div>
									
									<img src="${pageContext.request.contextPath}/assets/images/smartphone.png" style="margin:50px 10px 0px 240px;" alt="">
									<div class="text" data-text-content="true" style="margin: -42px 0px -25px 295px;font-size: 30px;">${requestScope.userVo.cellphone}
									</div>
									
									<img src="${pageContext.request.contextPath}/assets/images/business-card.png" style="margin:55px 10px -15px 240px;" alt="">
									<div class="text" data-text-content="true" style="margin: -30px 0px -25px 290px;font-size: 30px;">${requestScope.userVo.nick}
									</div>
									
									<img src="${pageContext.request.contextPath}/assets/images/line-graph.png" style="margin:50px 10px -15px 240px;" alt="">
									<div class="text" data-text-content="true" style="margin: -25px 0px -25px 295px;font-size: 30px;">${requestScope.userVo.average}
									</div>
										
								</div>
								
       								
       								
			 				<button type="button" class="btn btn-light" onclick="document.location='${pageContext.request.contextPath}/user/modifyForm'">수정하기로 고고!</button>
					
							
           			</div>
    		
    		<!-- //user -->
    	</div>
    	<!-- //container -->
    </div>
    <!-- //main-content -->
  	</div>
	<!-- 푸터 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
    <!-- 푸터 끝 -->
   
</body>
</html>
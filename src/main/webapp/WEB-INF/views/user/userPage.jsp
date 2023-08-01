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

    		<div id="user">
		
				<div id="userPage">
		
					<div id="main">
					
                    			<div class="sidebar">
  									<a class="active" href="userPage">회원정보</a>
  									<a href="userPage">친구목록</a>
  									<a href="userPage">그룹친구</a>
  									<a href="${pageContext.request.contextPath }/attendUsers/myPage/applyMenu">게시판매칭</a>
  									<a href="userPage">전적보기</a>
								</div>

								<div class="content">
									
									<div class="image-show" id="image-show" >
		        						<img src="${pageContext.request.contextPath }/upload/${requestScope.userVo.profileImage}" >
		        					</div>
		        					
		        					<div class="image-icon">
								
  										<p><img src="${pageContext.request.contextPath}/assets/images/user.png" style="width: 5%;margin:-247px 10px 286px 250px;" alt=""><div data-text-content="true" style="font-size:30px;padding : 50px 0px 0px 318px;margin:-380px 0px -25px 0px;" class="">${requestScope.userVo.id}</div>
  									
  										<p><img src="${pageContext.request.contextPath}/assets/images/smartphone.png" style="width: 5%;margin:50px 10px 10px 250px;" alt=""><div data-text-content="true" style="font-size:30px;padding : 50px 0px 0px 318px;margin:-100px 0px -25px 0px;" class="">${requestScope.userVo.cellphone}</div>
  									
  										<p><img src="${pageContext.request.contextPath}/assets/images/business-card.png" style="width: 5%;margin:50px 10px 10px 250px;" alt=""><div data-text-content="true" style="font-size:30px;padding : 50px 0px 0px 318px;margin:-105px 0px -25px 0px;" class="">${requestScope.userVo.nick}</div>
  									
  										<p><img src="${pageContext.request.contextPath}/assets/images/line-graph.png" style="width: 5%;margin:50px 10px 10px 250px;" alt=""><div data-text-content="true" style="font-size:30px;padding : 50px 0px 0px 318px;margin:-100px 0px -25px 0px;" class="">${requestScope.userVo.average}</div>
  									
  									</div>
		        					
 					 				<button type="button" class="btn btn-light" onclick="document.location='${pageContext.request.contextPath}/user/modifyForm'">수정하기로 고고!</button>
								</div>
								
								
							
    				</div>
           		</div>
    		</div>
    		<!-- //user -->
    	</div>
    	<!-- //container -->
    </div>
    <!-- //main-content -->
  
	<!-- 푸터 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
    <!-- 푸터 끝 -->
   
</body>
</html>
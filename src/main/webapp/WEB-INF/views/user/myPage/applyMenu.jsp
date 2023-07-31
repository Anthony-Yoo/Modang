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
  									<a class="active" href="userPage">&nbsp;&nbsp;회원정보</a>
  									<a href="userPage">&nbsp;&nbsp;친구목록</a>
  									<a href="userPage">&nbsp;&nbsp;그룹친구</a>
  									<a href="userPage">&nbsp;게시판매칭</a>
  									<a href="userPage">&nbsp;&nbsp;전적보기</a>
								</div>

								<div class="content">
									
									
									
									
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
    <%-- <div class="btn-group-vertical">
							<button type="button" class="btn btn-light" onclick="document.location=''">회원정보</button>
							<button type="button" class="btn btn-light" onclick="document.location=''">친구목록</button>
							<button type="button" class="btn btn-light" onclick="document.location=''">그룹친구</button>
							<button type="button" class="btn btn-light" onclick="document.location='${pageContext.request.contextPath}/board/list'">매칭목록</button>
							<button type="button" class="btn btn-light" onclick="document.location=''">전적보기</button>
				</div> --%>

</body>
</html>
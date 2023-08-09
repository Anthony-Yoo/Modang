<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입 완료!</title>

<!-- icon -->


<!-- css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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

				<div id="joinOK">
		
       					<div class="jumbotron">
           					<br>
           					<br>
           					<h1>회원가입을 축하합니다.</h1>
           					<br>      
           					<p><strong>modang! modang! 즐거운 modang!</strong></p>
       					
       					</div>
       					
    			</div>
    			<div class="button-area">	
						<button type="button" class="btn btn-primary" id="loginF" style="width:240px;height: 40px;border-radius:10px;color:white;background:linear-gradient(to bottom right, rgb(9, 32, 80),rgb(81, 117, 164));" onclick="document.location='${pageContext.request.contextPath}/user/loginForm'">로그인화면으로</button>
						<button type="button" class="btn btn-primary" id="mainF" style="width:240px;height: 40px;border-radius:10px;color:white;background:linear-gradient(to bottom right, rgb(9, 32, 80),rgb(81, 117, 164));" onclick="document.location='${pageContext.request.contextPath}/'">시작화면으로</button>
   				</div>
    	</div>
    </div>
           
	<!-- 푸터 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
    <!-- 푸터 끝 -->
</body>
</html>
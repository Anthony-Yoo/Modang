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

<!-- js -->

</head>
<body>
    <!-- 헤더 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
	<!-- 헤더 끝 -->
	
	<div id="main-content">
	
		<div class="container text-center">

    		<div id="user">
		
				<div id="userJoinFrom">
		
					<div id="main">
					
						<h3>모당 회원 가입!</h3>
						
							<div class="form-group">
                    			
									<div class="block" id="shadowG">
										<p id="shadowBox" >
										<p id="shadowBox2" >
									
											<div id="shadowTitle" onclick="document.location='${pageContext.request.contextPath}/user/joinForm'" class="">
											
												<p>개인 회원 가입
												<img src="${pageContext.request.contextPath}/assets/images/right-chevron.png" height="20px"  alt=""></p>
											
											
											
												<div id="subTitleSize" class="">
													<div>당구를 좋아하시는 분들이라면,</div><br>
													<div>누구나 개인회원으로 가입하여</div><br>
													<div>모당을 통해 편리하고 알차게</div><br>
													<div>당구를 즐길 수 있습니다?</div><br>
												</div>
											
											</div>
									
											<div id="shadowTitle2" onclick="document.location='${pageContext.request.contextPath}/manager/joinForm'" class="">
										
										<p >사업자 회원가입 
										<img src="/modang/assets/images/right-chevron.png" height="20px"  alt=""></p>
									
												<div id="subTitleSize2" class="">
													<div>사업자등록을 보유중이라면,</div><br>
													<div>사업자회원으로 가입하여</div><br>
													<div>모당을 이용하실수 있습니다</div><br>
										    	</div>
											</div>
									</div>
    						</div>
           			</div>
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
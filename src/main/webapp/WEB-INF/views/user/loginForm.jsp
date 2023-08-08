<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>	 		
    		
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">      
<title>로그인</title>

<!-- icon -->
<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />


<!-- css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/user.css" rel="stylesheet" type="text/css">

<!-- js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</head>
      
<body>
    <!-- 헤더 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
	<!-- 헤더 끝 -->
    
    <div id="main-content">
        
    	<div class="container text-center">
                 
        	<div id="user">
				
				<div id="loginForm">
					
					<div id="main">
					
						<h3>이것은 로그인 ^^</h3>
					
						<form id="loginSubmitForm" action="${pageContext.request.contextPath }/user/login" method="post" enctype="multipart/form-data">
            				
	            			<div class="form-group">
								<div id="inputId" class="input-group">
							
									<span class="img">
										<img src="${pageContext.request.contextPath}/assets/images/user.png" id="idcon" alt="">
									</span>
									<span class="input">
										<input id="id" type="text" maxlength="10" class="form-control" name="id" placeholder="ID">
									</span>
									
								</div>
						    </div>
			                
							<div class="form-group">
								<div id="inputPw" class="input-group">
									<span class="img">
										<img src="${pageContext.request.contextPath}/assets/images/passwd.png" id=pwcon alt="">
									</span>
									
									<span class="input">
										<input id="passwd" type="password" maxlength="16" class="form-control" name="passwd" placeholder="PASSWORD">
									</span>
								</div>
							</div>
	             
							<div class="button-area">
							  	<button type="submit" id="btn-submit">로그인 할거당^^</button>
							</div>
              			</form>
              			<!-- //loginSubmitForm -->
					
					</div>
					<!-- //main -->
					
                
                	<!-- 
                	<div class="links">
            			<a href="memberId">아이디 찾기</a> | <a href="memberPw">비밀번호 찾기</a>
       	 			</div>
       	 			 -->
              	</div>
              	<!-- //loginForm -->
              
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
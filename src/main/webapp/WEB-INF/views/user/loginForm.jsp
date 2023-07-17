<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    
<meta charset="UTF-8">
        
<title>로그인</title>

<!-- icon -->
<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/image/favicon.ico" />

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
					
						<h3>로그인 할꺼냥? ^^</h3>
					
						<form id="loginSubmitForm" action="${pageContext.request.contextPath }/user/login" method="get" enctype="multipart/form-data">
            	
			            	<div class="form-group">
								<div class="input-group shadow-none p-1 mb-2 bg-light rounded">
									<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
									<input id="id" type="text" maxlength="10" class="form-control" name="id" placeholder="ID">
									<button type="button" class="btn btn-Dark">&nbsp;&nbsp;찾기&nbsp;&nbsp;</button>
								</div>
			                </div>
	               
							<div class="form-group">
								<div class="input-group shadow-none p-1 mb-2 bg-light rounded">
									<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
									<input id="passwd" type="password" maxlength="16" class="form-control" name="passwd" placeholder="PASSWORD">
									<button type="button" class="btn btn-Dark">&nbsp;&nbsp;찾기&nbsp;&nbsp;</button>
								</div>
							</div>
	             
							<div class="button-area">
							  	<button type="submit" id="btn-submit" class="btn btn-primary rounded">로그인 할거당^^</button>
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
  <!--
  
  <button type="button" class="btn">Basic</button>
  <button type="button" class="btn btn-primary">Primary</button>
  <button type="button" class="btn btn-secondary">Secondary</button>
  <button type="button" class="btn btn-success">Success</button>
  <button type="button" class="btn btn-info">Info</button>
  <button type="button" class="btn btn-warning">Warning</button>
  <button type="button" class="btn btn-danger">Danger</button>
  <button type="button" class="btn btn-dark">Dark</button>
  <button type="button" class="btn btn-light">Light</button>
  <button type="button" class="btn btn-link">Link</button>   
-->
  
</html>
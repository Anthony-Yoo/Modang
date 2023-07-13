<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>로그인</title>
        <link href="${pageContext.request.contextPath}/assets/css/board.css" rel="stylesheet" type="text/css">
        <link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <style>
          .shadow-none{
            margin: 0 auto;
  
          }
        </style>
  </head>
      

  <body>
    <!-- 헤더 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
	<!-- 헤더 끝 -->
        <br>
        <br>
       
        
          <div class="container mt-5 text-center">
            <h1><strong>로그인 할꺼냥? ^^</strong></h1>
              <br>
              <br>
              <br>
                 
              <div id="user">
				
				<div id="loginForm">
					
                <form id="loginForm" action="${pageContext.request.contextPath }/user/login" method="get" enctype="multipart/form-data">
            	
            	<div class="form-group">
            	
                  <div class="input-group shadow-none p-1 mb-2 bg-light rounded w-25">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input id="id" type="text" maxlength="10" class="form-control" name="id" placeholder="ID">
                    <button type="button" class="btn btn-Dark">&nbsp;&nbsp;찾기&nbsp;&nbsp;</button>
                  </div>
                  
                </div>
                
                <div class="form-group">
                
                  <div class="input-group shadow-none p-1 mb-2 bg-light rounded w-25">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input id="passwd" type="password" maxlength="16" class="form-control" name="passwd" placeholder="PASSWORD">
                    <button type="button" class="btn btn-Dark">&nbsp;&nbsp;찾기&nbsp;&nbsp;</button>
                  </div>
                
                </div>
                  
                  <br>
                  <br>
                  
                  <div class="find-btn">
                    	<button type="submit" id="btn-submit" class="btn btn-success rounded w-25">login</button>
                  </div>
              </form>
                
                <br>
               
                	<!-- 
                	<div class="links">
            			<a href="memberId">아이디 찾기</a> | <a href="memberPw">비밀번호 찾기</a>
       	 			</div>
       	 			 -->
              	</div>
              </div>
          </div>
          <br> 
          <br>
          <br>
          <hr>
          <br>
          <br>
          <br>
          
         
    <!-- 푸터 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
    <!-- 푸터 끝 -->
  </body>
  <!--
  		<script>
	
		function upload(event){
        	alert(event.type);
        	
      }
		</script>

    
    

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
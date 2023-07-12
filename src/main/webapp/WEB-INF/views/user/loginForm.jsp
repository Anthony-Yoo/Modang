<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
        <meta charset="utf-8">
        <title>로그인</title>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="${pageContext.request.contextPath}/assets/css/board.css" rel="stylesheet" type="text/css">
        
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
    <div id="header">
        <div id ="logo">
            <h1><a href=""><img id="logo-img" src="${pageContext.request.contextPath}/assets/image/modang.png"></a></h1> <!-- 헤더 로고 이미지 -->
        </div>
        <div id="header-user">
            <!-- 로그인실패시, 로그인전 -->
            <ul>
                <li class="user"><a href="">로그인</a></li>
                <li class="user"><a href="">회원가입</a></li>
            </ul>
            <!-- 로그인성공시, 로그인후 -->
            <!-- <ul>
                <li>000님 안녕하세요</li>
                <li><a href="">로그아웃</a></li>
                <li><a href="">회원정보수정</a></li>
            </ul> -->
        </div>
        <!-- 사이트 메뉴 카테고리(?) -->
        <div id="header-menu">
            <ul>
                <li><a href="">모당이란?</a></li>
                <li><a href="">당구장 찾기</a></li>
                <li><a href="">매칭 게시판</a></li>
            </ul>
        </div>
        <!-- 사이트 메뉴 카테고리(?) 끝 -->
    </div>
    <!-- 헤더 끝 -->
        

          <div class="container mt-5 text-center">
            <p><strong>아이디 패스워드를 입력하세요 ^^</strong></p>
              <br>
              
              <div id="user">
				
				<div id="loginForm">
					
              		
                <form id="loginForm" action="${pageContext.request.contextPath }/user/login" method="get" enctype="multipart/form-data">
            	
            	<div class="form-group">
            	
                  <div class="input-group shadow-none p-1 mb-2 bg-light rounded w-25">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input id="id" type="text" maxlength="10" class="form-control" name="id" placeholder="ID">
                    <button type="button" class="btn btn-Dark">찾기</button>
                  </div>
                  
                </div>
                
                <div class="form-group">
                
                  <div class="input-group shadow-none p-1 mb-2 bg-light rounded w-25">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input id="passwd" type="text" maxlength="16" class="form-control" name="passwd" placeholder="PASSWORD">
                    <button type="button" class="btn btn-Dark">찾기</button>
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
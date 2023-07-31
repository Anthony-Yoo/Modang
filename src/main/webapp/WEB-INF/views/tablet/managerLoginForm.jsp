<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modang 관리자 로그인</title>
	<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
    <link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/manager.css" rel="stylesheet" type="text/css">
    <style>
    p {
    	margin-left : 100px;
    	align-content: center;
    	color: #F94069; 
    	font-size: 13px; 
    	text-align: center;    	
      }
    </style>
</head>
<body>
   	<div id="main-content">
        <div class="container">
            <h2>로그인</h2>
            <div class="">
                <form action="${pageContext.request.contextPath}/tablet/managerlogin" id="" name="" method="post">
                        <div class="login-wrap">
                            <div class="con">
                                <span class="inp-txt">
                                    <img src="${pageContext.request.contextPath}/assets/images/user.png" alt="">
                                    <input type="text" id="id" name="id" placeholder="아이디">
                                </span>
                            </div>
                            <div class="con">
                                <span class="inp-txt">
                                    <img src="${pageContext.request.contextPath}/assets/images/passwd.png" alt="">
                                    <input type="password" id="passwd" name="passwd" placeholder="비밀번호">
                                </span>
                            </div>
	                            <c:if test="${param.result == 'fail'}">
	                            	<p>아이디 또는 비밀번호가 틀렸습니다.</p>
	                            </c:if>       
                         <button class="button" type="submit" >로그인</button>
                     </div>
                </form>
            </div>
        </div>
    </div>   
</body>
</html>
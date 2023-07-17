<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>

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
				
					<div id="modifyForm">
					
						<div id="main">
						
							<h3>수정할꺼당 ^^</h3>
					
                			<form id="modifyForm" action="${pageContext.request.contextPath }/user/modify" method="get" enctype="multipart/form-data">
                    
                   			<!-- 아이디 -->
                   			<div class="form-group">
                     			<div class="shadow-none p-1 mb-2 bg-light rounded input-group">
                       				<span class="input-group-addon" class="text-large bold">${requestScope.userVo.id}<i class="glyphicon glyphicon-user"></i></span>
                       				<input id="id" type="text" maxlength="10" class="form-control" name="id" placeholder="ID">
                       				<button type="button" class="btn btn-Dark">  &nbsp;&nbsp;수정&nbsp;&nbsp;  </button>
                     			</div>
                   			</div>
                   
                   			<!-- 휴대폰 -->
                   			<div class="form-group">
                     			<div class="shadow-none p-1 mb-2 bg-light rounded input-group">
                       				<span class="input-group-addon" class="text-large bold">${requestScope.userVo.cellphone}<i class="glyphicon glyphicon-lock"></i></span>
                       				<input id="cellphone" type="text" maxlength="11" class="form-control" name="cellphone" placeholder="HP">
                       				<button type="button" class="btn btn-Dark">  &nbsp;&nbsp;수정&nbsp;&nbsp;  </button>
                     			</div>
                   			</div>
                   
                   			<!-- 별명 -->
                   			<div class="form-group">
                     			<div class="shadow-none p-1 mb-2 bg-light rounded input-group">
                       				<span class="input-group-addon" class="text-large bold">${requestScope.userVo.nick}<i class="glyphicon glyphicon-user"></i></span>
                       				<input id="nick" type="text" maxlength="7" class="form-control" name="nick" placeholder="NICK">
                       				<button type="button" class="btn btn-Dark">  &nbsp;&nbsp;수정&nbsp;&nbsp;  </button>
                     			</div>
                   			</div>
                   
                   			<!-- 평균 -->
                   			<div class="form-group">
                     			<div class="shadow-none p-1 mb-2 bg-light rounded input-group">
                       				<span class="input-group-addon" class="text-large bold">${requestScope.userVo.average}<i class="glyphicon glyphicon-lock"></i></span>
                       				<input id="average" type="text" maxlength="3" class="form-control" name="average" placeholder="AVER">
                       				<button type="button" class="btn btn-Dark">  &nbsp;&nbsp;수정&nbsp;&nbsp;  </button>
                     			</div>
                   			</div>
                    
                    		<div class="button-area">
								<button type="submit" id="btn-submit" class="btn btn-primary">수정 할거당 ^^</button>
							</div>
                    
                    		</form>
                    	</div>
                    	<!-- //main -->
                    </div>
                    <!-- //modifyForm -->
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
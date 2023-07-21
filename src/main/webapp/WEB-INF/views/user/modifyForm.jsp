<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원정보 수정</title>

<!-- icon -->
<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />

<!-- css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">    
<link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/manager.css" rel="stylesheet" type="text/css">
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
						
							<h3>이것은 수정 ^^</h3>
					
                   			<form id="modifysubmitForm" action="${pageContext.request.contextPath }/user/modify" method="post" enctype="multipart/form-data">
                    
	                   			<!-- 아이디 -->
	                   			<div class="form-group">
	                     			<div class="shadow-none p-1 mb-2 bg-light rounded input-group">
	                     				<span class="input-group-addon" class="text-large bold"></span>
	                       				<input id="id" type="text" maxlength="16" class="form-control" name="id" value="${requestScope.userVo.id}" placeholder="" readonly="readonly">
	                       				
	                     			</div>
	                   			</div>
                   			
	                   			<!-- 비밀번호 -->
								<div class="form-group">
	                     			<div class="shadow-none p-1 mb-2 bg-light rounded input-group">
	                       				<span class="input-group-addon" class="text-large bold"></span>
	                       				<input id="passwd" type="password" maxlength="16" class="form-control" name="passwd" value="${requestScope.userVo.passwd}" placeholder="PW">
	                       			
	                     			</div>
	                   			</div>

	                   			<!-- 휴대폰 -->
	                   			<div class="form-group">
	                     			<div class="shadow-none p-1 mb-2 bg-light rounded input-group">
	                       				<span class="input-group-addon" class="text-large bold"></span>
	                       				<input id="cellphone" type="text" maxlength="11" class="form-control" name="cellphone" value="${requestScope.userVo.cellphone}" placeholder="">
	                       				
	                     			</div>
	                   			</div>
                   
	                   			<!-- 별명 -->
	                   			<div class="form-group">
	                     			<div class="shadow-none p-1 mb-2 bg-light rounded input-group">
	                       				<span class="input-group-addon" class="text-large bold"></span>
	                       				<input id="nick" type="text" maxlength="7" class="form-control" name="nick" value="${requestScope.userVo.nick}" placeholder="">
	                       				
	                     			</div>
	                   			</div>
	                   
	                   			<!-- 평균 -->
	                   			<div class="form-group">
	                     			<div class="shadow-none p-1 mb-2 bg-light rounded input-group">
	                       				<span class="input-group-addon" class="text-large bold"></span>
	                       				<input id="average" type="text" maxlength="3" class="form-control" name="average" value="${requestScope.userVo.average}" placeholder="">
	                       				
	                     			</div>
	                   			</div>
                   			
                   			 	<!-- 이미지 -->
                   				<div class="form-group">
                   					<div class="image-show" id="image-show" >
		        						<img src="${pageContext.request.contextPath }/upload/${requestScope.userVo.profileimage}" >
		        					</div>
									<div class="fileContainer">
										
			                			<div class="fileInput">
				                  			<span class="input-group">
				                  			
				                  				<input id="profileimage" class="form-control" type="file" name="file"  value="" placeholder="">
				                  			</span>
			            				</div>
		        					</div>
		    					</div> <%----%>
                    
	                    		<div class="button-area">
									<button type="submit" id="btn-submit" class="btn btn-primary">수정 할거당^^</button>
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
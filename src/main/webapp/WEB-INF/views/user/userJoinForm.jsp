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
		
				<div id="joinFail">
		
					<div id="main">
					
						<h3>모당 회원 가입!</h3>
						
							<form id="modifysubmitForm" action="${pageContext.request.contextPath }/user/modify" method="post" enctype="multipart/form-data">
                    			<div class="element">
									<div class="data-text-content">
									<div data-text-content="true" style="background-color: rgb(255, 255, 255); text-shadow: none; box-shadow: rgba(46, 65, 154, 0.28) 5px 10px 10px 0px; border-width: 0px; border-style: none; border-radius: 4px;">
										<div data-text-content="true" style="font-size: 16px; font-weight: bold;" class="">
											개인 회원 가입
										</div>
										<div data-obj-id="1QCzC" data-obj-type="element" data-text-editable="true" class="" style="position: absolute; top: 300px; left: 380px; width: 175px; height: 74px;">
											<div data-text-content="true" style="font-size: 13px;" class="">
												당구를 좋아하시는 분들이라면,
											<div>누구나 개인회원으로 가입하여</div>
											<div>모당을 통해 편리하고 알차게</div>
											<div>당구를 즐길 수 있습니다?</div>
											</div>
										</div>
										<div data-obj-id="t4427" data-obj-type="icon" class="" style="position: absolute; top: 253px; left: 498px; width: 40px; height: 40px;">
										
										</div>
										
									</div>
									
									</div>
								</div>
								
								
								<div class="form-group">
										
								</div>
    							
    						</form>
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
</body>
</html>
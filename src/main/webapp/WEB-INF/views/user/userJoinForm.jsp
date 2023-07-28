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
                    			<div class="element">
									
										<div data-text-content="true" onclick="document.location='${pageContext.request.contextPath}/user/joinForm'" style="background-color: rgb(255, 255, 255);text-shadow: none;box-shadow: rgba(46, 65, 154, 0.28) 5px 10px 10px 0px;border-width: 0px;border-style: none;border-radius: 4px;width: 202px;height: 150px;margin: 66px 0px 110px 336px;padding: 10px 10px 10px 10px;">
											<div data-text-content="true" style="font-size: 20px;font-weight: bold;padding: 6px 0px 15px 25px;" class="">
											
											<p>개인 회원 가입
											<img src="${pageContext.request.contextPath}/assets/images/right-chevron.png" height="20px"  alt=""></p>
										
											</div>
											<div data-obj-id="1QCzC" data-obj-type="element" data-text-editable="true" class="" style="position: sticky;top: 300px;left: 360px;width: 185px;height: 100px;margin: 0px 0px 18px 13px;">
												<div data-text-content="true" style="font-size: 13px;" class="">
												<div>당구를 좋아하시는 분들이라면,</div><br>
												<div>누구나 개인회원으로 가입하여</div><br>
												<div>모당을 통해 편리하고 알차게</div><br>
												<div>당구를 즐길 수 있습니다?</div><br>
												</div>
											</div>
										
										</div>
										
										<div data-obj-id="CU3Tk" data-obj-type="element" data-text-editable="true" class="" style="position: absolute;top: 240px;left: 630px;width: 200px;height: 150px;margin: 67px 10px 10px 316px;" data-link-to="page:PBjRh">
											<div data-text-content="true" style="background-color: rgb(255, 255, 255);text-shadow: none;box-shadow: rgba(46, 65, 154, 0.28) 5px 10px 10px 0px;border-width: 0px;border-style: none;border-radius: 4px;margin: -27px -55px 0px 30px;padding: 13px 10px 10px 10px;height: 150px;">
									
											</div>
										</div>
										<div data-obj-id="DOLqn" onclick="document.location='/modang/manager/joinForm'" data-obj-type="element" data-text-editable="true" class="" style="position: absolute;top: 261.997px;left: 664.983px;width: 120px;height: 20px;margin: 60px 72px -37px 311px;">
											<div data-text-content="true" style="font-size: 20px;font-weight: bold;width: 179px;margin: -24px -35px 10px 25px;" class="">
											
											사업자 회원가입 
											<img src="/modang/assets/images/right-chevron.png" height="20px"  alt=""></div>
										</div>
									
										<div data-obj-id="7TjRA" data-obj-type="element" data-text-editable="true" class="" onclick="document.location='/modang/manager/joinForm'" style="position: absolute;top: 300px;left: 647.986px;width: 175px;height: 69px;margin: 52px 10px 10px 315px;">
											<div data-text-content="true" style="font-size: 13px;margin: -10px -26px 0px 35px;" class="">
												<div>사업자등록을 보유중이라면,</div><br>
												<div>사업자회원으로 가입하여</div><br>
												<div>모당을 이용하실수 있습니다</div><br>
											</div>
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
  
	<!-- 푸터 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
    <!-- 푸터 끝 -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입</title>

<!-- icon -->
<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/image/favicon.ico" />

<!-- css -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/user.css" rel="stylesheet" type="text/css">

<!-- js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>


</head>

<body>
	<!-- 헤더 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
	<!-- 헤더 끝 -->

    <div id="main-content">
    
		<div class="container text-center">
		
			<div id="user">
		
				<div id="joinForm">
				
					<div id="main">
		
						<h3>이것은 모당 ^^</h3>
		
						<form id="joinSubmitForm" action="${pageContext.request.contextPath}/user/join" method="post"
							enctype="multipart/form-data">
							
		
							<div class="form-group">
								<p id="idcheckMsg"></p>
								<br>
								<div
									class="shadow-none p-1 mb-2 bg-light rounded input-group">
									
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> 
										<input id="input-uid" type="text"
										value="" maxlength="10" class="form-control" name="id"
										placeholder="ID">
									<button id="btnIdCheck" type="button" class="btn btn-Dark" >&nbsp;&nbsp;확인&nbsp;&nbsp;</button>
									
								</div>
								
								
							</div>
							<!--  -->
							<!-- 아이디 
						<div class="form-group">
							<label class="form-text" for="input-uid">아이디</label> 
							<input type="text" id="input-uid" name="id" value="" placeholder="아이디를 입력하세요" autofocus required onKeypress="javascript:if(event.keyCode==13) {search_onclick_submit}">
							<button type="button" id="btnIdCheck">중복체크</button>
							<p id="idcheckMsg">ㅁㅁㅁ</p>
						</div>
						-->
		
							<div class="form-group">
								<div
									class="shadow-none p-1 mb-2 bg-light rounded input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-lock"></i></span> <input id="passwd"
										type="password" value="" maxlength="16" class="form-control"
										name="passwd" placeholder="PASSWORD">
									
								</div>
							</div>
		
							<div class="form-group">
								<div
									class="shadow-none p-1 mb-2 bg-light rounded input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input id="nick"
										type="text" value="" maxlength="7" class="form-control"
										name="nick" placeholder="NICK">
									<button type="button" class="btn btn-Dark">&nbsp;&nbsp;확인&nbsp;&nbsp;</button>
								</div>
							</div>
		
							<div class="form-group">
								<div
									class="shadow-none p-1 mb-2 bg-light rounded input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-lock"></i></span> <input id="cellphone"
										type="text" value="" maxlength="11" class="form-control"
										name="cellphone" placeholder="HP">
									
								</div>
							</div>
		
							<div class="form-group">
								<div
									class="shadow-none p-1 mb-2 bg-light rounded input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-lock"></i></span> <input id="average"
										type="text" value="" maxlength="3" class="form-control"
										name="average" placeholder="타수[VALUE]">
									
								</div>
							</div>
		
							<!-- <div class="form-group">
		                			<div class="shadow-none p-1 mb-2 bg-light rounded input-group">
		                  				<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
		                  				<input id="recentlogontime" type="text" value="" maxlength="15" class="form-control" name="recentlogontime" placeholder="sysdate">
		                  				<button type="button" class="btn btn-Dark">  &nbsp;&nbsp;입력&nbsp;&nbsp;  </button>
		                			</div>
		            			</div> -->
							
							<div class="form-group">
								<div class="fileContainer">
			                		<div class="fileInput">
				                		<div class="shadow-none p-1 mb-2 bg-light rounded input-group">
				                  			<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
				                  			<input id="profileimage" type="file" name="file" class="form-control" placeholder="upload image" value="">
				                		</div>
			            			</div>
		        				</div>
		        
		        				<div class="image-show" id="image-show"></div>
		    				</div>
		  					<div class="button-area">
								<button type="submit" id="btn-submit" class="btn btn-primary">회원가입 할거당</button>
							</div>
							
			    		</form>
			    		<!-- //joinSubmitForm -->
		    		</div>
		    		<!-- //main -->
		    
		           </div>
		                 
		                 <!-- 
		               <div class="form-group">
		               	<div class="button">
		               <label for="chooseFile">
		                   <input type="file" id="chooseFile" name="chooseFile" accept="image/*" onclick="loadFile(this)">
		               </label>
		               
		                -->
						
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

<script type="text/javascript">


	//예제
	//원래의 태그 기능을 강재로 차단시킴 data전송시 태그 는 남겨둬야 할 때
	$("#naver").on("click", function(event){
		event.preventDefault();//preventDefault
		
	});

	//회원가입버튼 눌렀을 때: 전송submit 은 form
	$("#joinSubmitForm").on("submit", function(){
		console.log("전송버튼 클릭");
		
		//아이디 체크
		var id = $("#input-uid").val();
		if(id.length<1){//입력 안할 시
			alert("아이디를 입력해 주세요");
			
			return false;
			
		}
		//패스원드 체크...
		
		
		/*약관 동의 유무
		var agree =	$("#chk-agree").is(":checked");
		if(agree == false){
			alert("약관에 동의해 주세요")
			return false;
		}
		*/
		
		
		return true;
		
	});
	//id check 버튼을 클릭했을 떄
	$("#btnIdCheck").on("click",function(){
		console.log("클릭");
		
		//아이디 추출
		var id = $("[name=id]").val();
		console.log(id);
		//통신 id
		$.ajax({

			url : "${pageContext.request.contextPath }/user/idcheck",//주소 요청
			type : "post",
			//contentType : "application/json",
			data : {id : id},

			dataType : "json",
			success : function(jsonResult) {
				console.log(jsonResult);
					
				if(jsonResult.result == "success"){//성공이면
					//사용가능한지 표현함
					if(jsonResult.data == true){//사용가능
						$("#idcheckMsg").html(id + "사용가능");
						
					}else{//불가
						$("#idcheckMsg").html(id + "사용중");
					}
					
				}else{//실패면
					var msg = jsonResult.failMsg;
					alert(msg);
				}
			},
			
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
			
		});
		
		
	});
</script>			

	
</html>
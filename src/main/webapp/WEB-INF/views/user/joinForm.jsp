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
		
				<div id="joinForm">
				
					<div id="main">
		
						<h3>이것은 모당 ^^</h3>
		
						<form id="joinSubmitForm" action="${pageContext.request.contextPath}/user/join" method="post"
							enctype="multipart/form-data">
		
							<div class="form-group">
								<div
									class="shadow-none p-1 mb-2 bg-light rounded input-group">
									
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input id="id" type="text"
										value="" maxlength="10" class="form-control" name="id"
										placeholder="ID">
									<button type="button" class="btn btn-Dark">&nbsp;&nbsp;확인&nbsp;&nbsp;</button>
								</div>
							</div>
		
							<div class="form-group">
								<div
									class="shadow-none p-1 mb-2 bg-light rounded input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-lock"></i></span> <input id="passwd"
										type="password" value="" maxlength="16" class="form-control"
										name="passwd" placeholder="PASSWORD">
									<button type="button" class="btn btn-Dark">
										&nbsp;&nbsp;확인&nbsp;&nbsp;</button>
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
									<button type="button" class="btn btn-Dark">
										&nbsp;&nbsp;인증&nbsp;&nbsp;</button>
								</div>
							</div>
		
							<div class="form-group">
								<div
									class="shadow-none p-1 mb-2 bg-light rounded input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-lock"></i></span> <input id="average"
										type="text" value="" maxlength="3" class="form-control"
										name="average" placeholder="타수[VALUE]">
									<button type="button" class="btn btn-Dark">
										&nbsp;&nbsp;입력&nbsp;&nbsp;</button>
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
								<button type="submit" id="btn-submit" class="btn btn-primary">회원가입 할거당 ^^</button>
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
	var submit = document.getElementById('submitButton');
	submit.onclick = showImage;     //Submit 버튼 클릭시 이미지 보여주기

	function showImage() {
	    var newImage = document.getElementById('image-show').lastElementChild;
	    newImage.style.visibility = "visible";
	    
	    document.getElementById('image-upload').style.visibility = 'hidden';

	    document.getElementById('fileName').textContent = null;     //기존 파일 이름 지우기
	}


	function loadFile(input) {
	    var file = input.files[0];

	    var name = document.getElementById('fileName');
	    name.textContent = file.name;

	    var newImage = document.createElement("img");
	    newImage.setAttribute("class", 'img');

	    newImage.src = URL.createObjectURL(file);   

	    newImage.style.width = "50%";
	    newImage.style.height = "50%";
	    newImage.style.visibility = "hidden";   //버튼을 누르기 전까지는 이미지 숨기기
	    newImage.style.objectFit = "contain";

	    var container = document.getElementById('image-show');
	    container.appendChild(newImage);
	};
	
	
	</script>

	  
<!-- 
	<script type="text/javascript">
		//예제 
		/*
		//원래의 태그의 기능을 사용하지 않을때
		$("#naver").on("click", function(event){
				event.preventDefault();
			});


		//회원가입 버튼을 눌렀을때:  전송submit은 form에 이벤트
		$("#joinSubmitForm").on("submit", function(){
				console.log("전송버튼 클릭");
	
		//아이디 체크
		var id = $("#input-uid").val();
		if(id.length < 1){ //입력안했으면
				alert("아이디를 입력해주세요");
			return false;
	}
		//아이디 체크 버튼 클릭했을때
		$("#btnIdCheck").on("click", function(){
			console.log("버튼 클릭");
			
			//id 추출
			var id = $("[name=id]").val();
			
			console.log(id);
			
			//통신  id////////////////////////////////////////////
			$.ajax({
				url : "${pageContext.request.contextPath }/user/idcheck",		
				type : "post",
				
				data : {id : id},

				dataType : "json",
				success : function(jsonResult){
					console.log(jsonResult);
					
					if(jsonResult.result == 'success'){ //처리성공
						//사용가능한지 불가능 한지 표현한다
						if(jsonResult.data == true){
							//사용가능
							$("#idcheckMsg").html( id+ "는 사용가능 합니다.");    
						}else {
							//사용불가
							$("#idcheckMsg").html( id+ "는 사용중입니다.");    
						}
						
					}else {
						//메세지 출력
						var msg = jsonResult.failMsg;
						alert(msg);
					}
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
			
		});
		
		
		function upload(event){
			let ret=prompt("ID를 입력하세요", "");//메시지, 디폴트 입력값을 출력 
			if(ret==null){//취소 또는 다이얼로그창 닫음
				document.write("ID입력이 취소되었습니다.")
			}
			else if(ret==""){//문자열 입력 없이 확인
				document.write("ID를 입력바랍니다.")
			}
			else{//ret사용자 입력 문자열
				document.write("")
			}
        	alert(event.type);
        	
      }
		
      	function loadFile(input){
        	var file = input.files[0];//선택된 파일 가져오기
        
        	//미리 만들어 놓은 div에 text(파일이름) 추가
        	var name = document.getElementById('fileName');
        	name.textContent = file.name;
        
        	//새로운 이미지 div 추가
        	var newImage = document.createElement("img");
        	newImage.setAttribute("class", 'img');
        
        	//이미지 source 가져오기
        	newImage.src = URL.createObjectURL(file);
        
        	newImage.style.width = "70%";
       		newImage.style.height = "70%";
        	newImage.style.visibility = "hidden";
        	newImage.style.objectFit = "contain";
        
        	//이미지를 image=show div에 추가
        	var container = document.getElementById('image-show');
        	container.appendChild(newImage);
        
      };
      /* contentType : "application/json", */
    </script>
     -->
</html>
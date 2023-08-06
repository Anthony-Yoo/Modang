<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<title>modang 마이페이지 친구목록</title>
	<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
    <link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/manager.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/user.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- 헤더 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>    
    <!-- 헤더 끝 -->

	<div id="userPage">
		<div id="user">
               	<!-- sideNav 시작 -->
			<c:import url="/WEB-INF/views/include/modangSideNav.jsp"></c:import>
			<!-- sideNav 끝 -->
		        <div class="mainCon">        
		        <h2>친구 검색</h2>
		        <div class="friendSearch">
		            <label for="seardid">회원 아이디 검색</label>
		            <input type="search" id="seardid" placeholder="회원 아이디 입력">
		            <button type="button" class="search" id="searchbtn">검색</button>
		            
		            <div class="searchList">
		                <!--검색한 아이디가 있는 경우 나오는 리스트-->	             
		            </div>
		        </div>
		        <h2>친구 목록</h2>
		        <div class="friendList">
		            <table>
		                <thead>
		                    <tr>
		                        <th>친구 닉네임</th>
		                        <th>Avg.</th>
		                        <th>다마상태</th>
		                        <th>승수 (최근 3개월)</th>
		                        <th>최근 로그인</th>
		                        <th>삭제</th>
		                    </tr>
		                </thead>
		                <%-- <c:forEach var="" items=""> --%>            
				                <tbody>
				                    <tr>
				                        <td>강동구일짱</td>
				                        <td>100</td>
				                        <td>120</td>
				                        <td><strong>3</strong>승<strong>2</strong>패</td>
				                        <td><strong>48</strong>일전</td>
				                        <td><button type="button" class="del">삭제</button></td>
				                    </tr>		                    
				                </tbody>
		             <%--    </c:forEach> --%>
		            </table>
		            
		        </div>
		    </div>
    	</div>
    </div>
    <!-- 푸터 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
    <!-- 푸터 끝 -->
</body>
<script>
$('#searchbtn').on("click",function(){
    console.log("id검색 버튼 클릭"); 
    $(".searchList").empty();
   	var id = $("#seardid").val();		
	console.log(id);
	
	$("#seardid").val("");
	$(".nickList").remove();
	if(id === "" || id===null ){
		console.log("id값이 없음");	
		alert("값을 입력하세요");
	}else{	
	
		$.ajax({			
			url : "${pageContext.request.contextPath}/tablet/idfind",		
			type : "post",
			/* contentType : "application/json"*/
			data : {id : id},

			dataType : "json",
			success : function(action){
				console.log(action);
				
				if(action.result == 'success') {//처리성공	
					console.log("성공");						
					renderEach(action.data);					
					
				}else {//오류처리
					var msg = action.failMsg;
						alert(msg);				
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}				
		});
		console.log("test입니다." + id);			
	};		
});   
function renderEach(playerVo) {	  	
	$.each(playerVo,function(key,value){
	var src = "";
	src += '	<ul>';
	src += '		<li>';
	src += '			<span>' + value.nick + '</span>';
	src += '			<button type="button" class="addPlayer add" data-userno="'+ value.userNo +'" data-no="'+ value.userNo +'" data-nick="'+ value.nick +'" data-average="'+ value.average +'" >추가</button>';
	src += '		</li>';
	src += '	</ul>';
	$(".searchList").append(src);
	});
};	
</script>
</html>
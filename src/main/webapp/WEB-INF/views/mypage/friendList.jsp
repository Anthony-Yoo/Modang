<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>modang 마이페이지 친구목록</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>	
	<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
    <link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/manager.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/mypage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- 헤더 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>    
    <!-- 헤더 끝 -->	
	<div class="content">
		<div id="userPage">
		    <!-- sideNav 시작 -->
	        <ul class="sidebar">
				<li><a href="${pageContext.request.contextPath}/user/userPage">회원정보</a> </li>
				<li><a class="active" href="${pageContext.request.contextPath }/mypage/friendlist">친구목록</a></li>
				<li><a href="${pageContext.request.contextPath }/mypage/FCardList">그룹친구</a> </li>
				<li><a href="${pageContext.request.contextPath }/attendUsers/myPage/myBoardList">게시판매칭</a></li>
				<li><a href="${pageContext.request.contextPath }/mypage/${sessionScope.authUser.userNo}/record" target="_blank">전적보기</a></li>
			</ul>
			<!-- sideNav 끝 -->
			<div class="userContent find">
				<div id="content-header">
					<h2>
						<a>친구 목록</a>
					</h2>
				</div>
			    <div class="show friend">        
			        <div class="friendSearch">
			            <label for="seardid">회원 아이디 검색</label>
			            <input type="search" id="seardid" placeholder="회원 아이디 입력">
			            <button type="button" class="search" id="searchbtn">검색</button>
			            
			            <div class="searchList">	
			                <!--검색한 아이디가 있는 경우 나오는 리스트-->
			            </div>
			        </div>
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
					        <tbody id="renderbd">
				                <c:forEach var="friendInfo" items="${friendList}">			                	  
				                    <tr>			                    	
				                        <td>${friendInfo.nick}</td>
				                        <td>${friendInfo.average}</td>
			                        	<c:if test ="${friendInfo.recommStatus == 0}">					                      
					                        <td>물다마</td>
				                        </c:if>
				                        <c:if test ="${friendInfo.recommStatus == 1}">					                       
					                        <td>적정다마</td>
				                        </c:if>
				                        <c:if test ="${friendInfo.recommStatus == 2}">					                     
					                        <td>짠다마</td>
				                        </c:if>
				                        <c:if test ="${friendInfo.recommStatus == 3}">						                       
					                        <td>새내기</td>
				                        </c:if>
			                        	<td><strong>${friendInfo.winCnt}</strong>승<strong>${friendInfo.loseCnt}</strong>패</td>
				                        <td><strong>${friendInfo.recentDays}</strong>일전</td>
				                        <td><button type="button" class="delPlayer del" data-userno="${friendInfo.userNo}" 
				                        data-favoriteNo="${friendInfo.favoriteNo}">삭제</button></td>
			                    	</tr>
				                  </c:forEach>	                    
					          </tbody>
			            </table>		            
			        </div>
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
function renderEach(playlist) {	  	
	var src = "";
	src += '<ul>';
	
	$.each(playlist,function(key,value){
		
		src += '<li>';
		src += '	<span>' + value.nick + '</span>';
		src += '	<button type="button" class="addPlayer add" data-userno="'+ value.userNo +'" data-no="'+ value.userNo +'" data-nick="'+ value.nick +'" data-average="'+ value.average +'" >추가</button>';
		src += '</li>';
	});

	src += '</ul>';
	$(".searchList").append(src);
};	

$(".searchList").on('click',".addPlayer",function(){
	console.log("추가버튼 클릭!");
	$(".searchList").empty();
	var userNo = $(this).data('userno');
	console.log("aJax 가기전 유져번호 : "+userNo);
	let $addbtn = $(this);
	let $delbtn = $("#renderbd>tr>td>button");
	
	//기존테이블에 넣을려는 데이터가 겹치는지 체크
	let flag = false;		
	$delbtn.each(function(i){					
		for(let i=0;i<$delbtn.length;i++) {
			console.log($delbtn.eq(i).data("userno"));	
			if($delbtn.eq(i).data("userno") != $addbtn.data("userno")) {
				flag = false;								
			}else {
				flag = true;
				break;
			}						
		}
	});
	
	console.log(flag);
	console.log("추가버튼 no:"+$addbtn.data("userno"));				
	console.log("삭제버튼 값 갯수:"+$delbtn.length);
	
	if(flag == false) { 
		if(${userNo} != userNo) {		
			$.ajax({			
				url : "${pageContext.request.contextPath}/mypage/${userNo}/friendinsert",		
				type : "post",
				/* contentType : "application/json"*/
				data : {userNo : userNo},
	
				dataType : "json",
				success : function(action){
					console.log(action);
					
					if(action.result == 'success') {//처리성공
						console.log(action.data);
						console.log("성공");			
						
						$("#renderbd").append(renderTr(action.data));							
												
					}else {//오류처리
						var msg = action.failMsg;
							alert(msg);				
					}
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}				
			});
		}else {
			alert("자신을 친구로 등록할수없습니다.");				
		}
	}else {
		alert("같은 멤버가있습니다.");	
	}
});

function renderTr(friendInfo) {	  
	var src = "";
	src += '<tr>';	
	src += '	<td>' + friendInfo.nick + '</td>';
	src += '	<td>' + friendInfo.average + '</td>';
	if(friendInfo.recommStatus == 0) {
		src += '	<td>물다마</td>';	
	}else if(friendInfo.recommStatus == 1) {
		src += '	<td>적정다마</td>';
	}else if(friendInfo.recommStatus == 2) {		
		src += '	<td>짠다마</td>';
	}else if(friendInfo.recommStatus == 3) {	
		src += '	<td>새내기</td>';
	}	
	src += '	<td><strong>' + friendInfo.winCnt + '</strong>승<strong>' + friendInfo.loseCnt + '</strong>패</td>';
	src += '	<td><strong>' + friendInfo.recentDays + '</strong>일전</td>';
	src += '	<td><button type="button" class="delPlayer del" data-userno="' + friendInfo.userNo + '"	data-favoriteNo="' + friendInfo.favoriteNo + '">삭제</button></td>';
	src += '</tr>';
	return src;
}

$("#renderbd").on('click',".delPlayer",function(){
	console.log("삭제버튼 클릭!");
	var favoriteNo = $(this).attr('data-favoriteNo');
	console.log("즐찾번호 : "+favoriteNo);
	console.log(this);
	var $this = $(this);
	
	$.ajax({			
		url : "${pageContext.request.contextPath}/mypage/friendDelete",		
		type : "post",
		/* contentType : "application/json"*/
		data : {favoriteNo : favoriteNo},

		dataType : "json",
		success : function(action){
			console.log(action);
			
			if(action.result == 'success') {//처리성공
				console.log(action.data);
				console.log("성공");			
				console.log(this);
				$this.parent().parent().remove();							
										
			}else {//오류처리
				var msg = action.failMsg;
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
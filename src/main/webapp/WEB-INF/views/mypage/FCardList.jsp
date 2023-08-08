<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modang 카드추가</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>	
	<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
    <link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/manager.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>  
	    <div class="main-Con">
        <div class="cardAdd left">
            <h2>카드 추가</h2>
            <div class="searhId">
                <input type="search" class="insertId" id="insertId" placeholder="아이디 입력">
                <button type="button" class="del" id="searchbtn">검색</button>
                <!--아이디검색- 하단 토글 리스트 팝업이든뭐든 공간 추가-->    
                <div class="searchList">   
                	<!--검색한 아이디가 있는 경우 나오는 리스트-->                 
	        	</div>
            </div>
            <div class="callFriend">
                <button type="button" class="call" id="friendbtn">친구목록 부르기</button>
                <!--친구목록 부르기- 하단 토글 리스트 팝업으로 추가--> 
                               
            </div>
            <div class="List">
                <form id="cardConfirm" action="${pageContext.request.contextPath}/mypage/FCardInsert" method="get">
                	<p>멤버카드</p>
	                <label>그룹명</label>
	                <input type="hidden" name="setUserNo" value="${userNo}">
	                <input type="text" id="cardName" class="cardName" name="title" placeholder="그룹명 입력">
	                <label>게임선택</label>
	                <div class="gt">
		                <input type="radio" id="3ball" class="cardName" name="gameType" value="0">
		                <label for="3ball">3구</label>
		                <input type="radio" id="4ball" class="cardName" name="gameType" value="1">
		                <label for="4ball">4구</label>
	                </div>
	                   <!--당구멤버 리스트는 최대 4명 // 
	                 // 4명이상 추가 시 "멤버는 4명까지 선택 가능합니당!" 팝업?-->	 
	                <div id="confirmList">		                
	                </div>
	                <button type="submit" class="call" id="confirmbtn">멤버 확정하기</button>
                </form>
            </div>
        </div>
        <div class="border"></div>
        <div class="cardList right">        	
            <h2>카드 리스트</h2>
            <ul>
            	<c:forEach var="cardInfo" items="${cardList}">
	               	<li>               		
	                    <h4>${cardInfo.title}</h4>
	                    	<ul class="nick">
		                    	<c:forEach var="member" items="${cardInfo.memberList}">
			               			<li>${member.guestNick}</li>
			                    </c:forEach>
		                    </ul>
	                    <span>${cardInfo.cardUserDate} || 
		                    <c:if test="${cardInfo.gameType == 0}">3구</c:if>
		                    <c:if test="${cardInfo.gameType == 1}">4구</c:if>
	                    </span>
	                    <button type="button">×</button><!--삭제버튼-->
	                </li>   
                </c:forEach>             
            </ul>
        </div>
    </div>
</body>
<script>
/* 1. 아이디 검색  */
$('#searchbtn').on("click",function(){
    console.log("id검색 버튼 클릭"); 
    $(".searchList").empty();
   	var id = $("#insertId").val();		
	console.log(id);
	
	$("#insertId").val("");
	
	if(id === "" || id=== null ){
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
	// + 검색리스트 랜더 +
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
	
/* 1-1. 검색리스트 추가 */
$(".searchList, .callFriend").on('click',".addPlayer",function(){
	console.log("추가버튼 클릭!");	
	var userNo = $(this).attr('data-userno');
	var nick = $(this).attr('data-nick');
	let cardVo = {
			userNo : userNo,
			nick : nick,			
	}	
	
	console.log("컨펌리스트 등록전 유져번호 : "+userNo);
	console.log("컨펌리스트 등록전 닉네임 : "+nick);
	let $addbtn = $(this);
	let $delbtn = $("#confirmList>ul>li>button");
	console.log("삭제버튼 : "+$delbtn);
	
	//기존테이블에 넣을려는 데이터가 겹치는지 체크
	let flag = false; // 데이터 동일여부
	
	if($delbtn.length > 0 ) {	
	
		$delbtn.each(function(i){					
			for(let i=0;i<$delbtn.length;i++) {
				console.log($delbtn.eq(i).data("userno"));								
				
				if($delbtn.eq(i).data("userno") != $addbtn.data("userno")) {
					flag = false;// 검색리스트 추가대상이 확정리스트멤버에 없으면 	

				}else {
					flag = true; // 검색리스트 추가대상이 확정리스트멤버에 있으면
					break;
				}
			}
		});
	
	}else {
		flag = false // 첫등록
	}
	
	console.log(cardVo);
	console.log(${userNo});
	console.log(flag);
	console.log("추가버튼 no:"+$addbtn.data("userno"));				
	console.log("삭제버튼 값 갯수:"+$delbtn.length);
	
	if(flag == false) { 
		if(${userNo} != userNo) { 
			if($delbtn.length != 3) {		
				$("#confirmList").append(renderLi(cardVo));
			}else {
				alert("멤버가 꽉찼습니다.(3명제한)")
			}
			
		}else{ // 자기자신 등록확인
			alert("자신을 친구로 등록할수없습니다.");			
		}
	}else if(flag != false) {
		alert("같은 멤버가있습니다.");	
	}
});		

	// + 확정리스트 랜더 +
	function renderLi(cardVo) {	  	
		var src = "";	
		
		src += '<ul>';		
		src += '	<li>';
		src += '		<input type="hidden" name="memberNoList" value="' + cardVo.userNo + '">';
		src += '		<span>' + cardVo.nick + '</span>';
		src += '		<button type="button" class="delPlayer del" data-userno="' + cardVo.userNo + '"data-no="'+ cardVo.userNo +'" data-nick="'+ cardVo.nick +'">삭제</button>';
		src += '	</li>';
		src += '</ul>';
		
		return src;
	};	

/* 1-3. 확정후 등록 */
/* $("#cardConfirm").on('submit',function(){
	console.log("폼 확정");		
	let memberList = [];
	let $input = $("#confirmList>ul>li>input");	
	
	$input.each(function(i){					
		for(let i=0 ; i < $input.length ; i++) {
			var memberNo = $input.eq(i).val();
			memberList.push(memberNo);
		}
	}
	
	//var setUserNo = $('[name="setUserNo"]').val();
	//var title = $('[name="title"]').val();
	//var gameType = $('[name="gameType"]').val();	
	let cardUserVo = {	
			memberList : memberList,
					
	} 
	});*/
	
$("#friendbtn").on('click',function(){
	console.log("친구목록 버튼 클릭");
	$("#friendList").remove();
	
	var userNo = ${userNo};
	
	console.log(userNo);
	$.ajax({			
		url : "${pageContext.request.contextPath}/mypage/friendload",		
		type : "post",
		/* contentType : "application/json"*/
		data : {userNo : userNo},

		dataType : "json",
		success : function(action){
			console.log(action);
			
			if(action.result == 'success') {//처리성공	
				console.log("성공");						
				renderUl(action.data);	
				
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
	
	function renderUl(friendlist) {	
		var src = "";		
		src += '<ul id="friendList">';
		
		$.each(friendlist,function(key,value){
			
		src += '	<li>';
		src += '		<img src="${pageContext.request.contextPath }/upload/' + value.profileImage + '" alt="프로필이미지">';
		src += '		<span>'+ value.nick +'</span>';
		src += '		<button type="button" class="addPlayer add" data-userno="'+ value.getUserNo +'" data-no="'+ value.favoriteNo +'" data-nick="'+ value.nick +'" >추가</button>';
		src += '	</li>';
		
		});
		
		src += '</ul>';		
		$("#friendbtn").after(src);
	}	

</script>

</html>
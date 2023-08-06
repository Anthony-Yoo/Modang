<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no,maximum-scale=1.0, minimum-scale=1.0">
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
		<title>Insert title here</title>
		<link href="${pageContext.request.contextPath}/assets/css/tablet.css" rel="stylesheet" type="text/css">
		<style>
			#logtitle {color : white;text-align: center;margin-top: 3%;font-size: 30px;}
			#container {background:#094e94;border-radius:10px; z-index: 1;	border: 1px;width: 1200px;height: 768px;position: absolute;left: 50%;	top: 50%;transform: translate(-50%, -50%);}
			#blankbox {border : 0px;width : 100%;height: 200px;}
			#tab {margin-top : 30px;border-radius :5px; width : 150px; height : 40px;background-color: #00498c; text-align: center;}	
			#tab p {color : white;font : 20px bold;	line-height : 2;}
			.imagebox {	margin-left : 105px;margin-top : 150px;	display : inline-block;	outline : solid 2px black;width : 350px;height :350px;}			
			.float-r {float: right; }
			.float-l {float: left; }
			.clear{clear: both; }			
			dt, dd {padding: 10px;}
			dt {border: 1px solid #eeeeee;margin-bottom: 5px;margin-top: 5px; background-color: #9dd6f4;}
			dt span {display: inline-block;	width: 5px; height: 5px; background-color: black;vertical-align: middle;margin-right: 10px;}
			dd {background-color: #eeeeee;margin-bottom: 5px;display: none;	}
			dd:hover{background-color: black;color:white;}	
			input[type=range]::-webkit-slider-runnable-track { 
			  width: 200px; height: 8.4px; 
			  cursor: pointer; 
			  box-shadow: 1px 1px 1px #000000, 0px 0px 1px #0d0d0d; 
			  background: #3071a9; 
			  border-radius: 1.3px; 
			  border: 0.2px solid #010101; 
			} 
		</style>
	</head>
	<body>
		<c:import url="/WEB-INF/views/include/tabletHeader.jsp"></c:import>
		<div id="container">				
			<div id="logtitle">같이할 친구를 선택하세요</div>
			<div id="gameType">
				<c:choose>
					<c:when test="${param.ball eq 0}">
						<h4>게임형식 : 3구</h4>
					</c:when>
					<c:when test="${param.ball eq 1}">
						<h4>게임형식 : 4구</h4>
					</c:when>
				</c:choose>
			</div>
			<!-- 카드리스트 -->
			<div class="cardlistBox float-l">
				<div class="left float-l" id="cardlist">
					<div id="tab"><p>카드리스트</p></div>
					<c:forEach var="card" items="${cardList}">			
					<div>				
						<dl>
		                	<dt>
		                    	<span></span>${card.title} // 선호종목 : ${card.gameType}구
		                 	</dt>
		                 	<c:forEach var="member" items="${card.memberList}">
			                 	<dd>${member.guestNick} &nbsp;&nbsp;&nbsp;
			                 		<button type="button" class="addPlayer" data-userno="${member.getUserNo}" data-no="1" data-nick="${member.guestNick}" data-average="${member.average}">추가</button>
			                 	</dd>
		                 	</c:forEach>
		               </dl>					
					</div>
					</c:forEach>
				</div>
			</div>
			<!-- 검색존 -->
			<div class="findBox float-l">
				<div class="cent float-l" id="findid">
					<div id="tab"><p>회원추가</p></div>			
					<div class="addList">					
						<input type="text" id="idtext" name="id" placeholder="ID를 입력하세요">
						<button type="button" id="idfind">검색</button>
						<!-- 검색결과 -->		
						<div id="findResult">
						</div>	
						<!-- 확정리스트 -->
						<form id="playerForm">		
						<input type="hidden" value="0" id="tb_cnt">			
							<table id="playerTable" style="border: 1px">
							  <tbody class="confirmBody" id="tb-0">					  	
							  	<tr class="addUserBox" id="t0">
							  		<%-- <td>${sessionScope.authUser.userNo}</td> 고객번호 가리기--%>
									<td class="nameTd">${sessionScope.authUser.nick}</td>
									<td class="averageTd">																				
										<span id="range-0">[${sessionScope.authUser.average}타]</span>
									</td>
									<td class="btnTd">
			 							<button type="button" class="delPlayer" data-userno="${sessionScope.authUser.userNo}" data-no="0" 
			 									data-nick="${sessionScope.authUser.nick}" data-average="" 
			 									disabled="disabled">삭제
			 							</button>		
									</td>
							  	</tr>
							  	<tr class="gageBox">
							  		<td class="rangeBox"><input class="confirmAverage" type="range" value="${sessionScope.authUser.average}" min="30" max="500" step="10" size="10" data-range="0"></td>
							  	</tr>							  	
							  </tbody>
							  <tfoot>
							  	<tr class="float-r">
							  		<td><button type="submit" id="confirm">확정</button></td>
							  	</tr>
							  </tfoot>
							</table>
						</form>
					</div>
				</div>
			</div>
			
			<div class="favoriteBox float-l">
				<div class="right float-l" id="favoriteList">
					<div id="tab"><p>친구목록</p></div>	
					<table id="favoriteTable" style="border: 1px">
						  <thead>
						  	<tr>
						    	<th>No</th>
						     	<th>Nick</th>
						     	<th>Average</th>
						     	<th>Add</th>
						    </tr>
						  </thead>
						  	<c:forEach var="favorite" items="${favoriteList}">
								  <tbody>
								  	<tr>
								  		<td>${favorite.favoriteNo}</td>
								  		<td>${favorite.nick}</td>
								  		<td>${favorite.average}</td>
								  		<td>
								  			<button type="button" class="addPlayer" data-userno="${favorite.getUserNo}" data-no="${favorite.favoriteNo}" data-nick="${favorite.nick}" data-average="${favorite.average}">추가
								  			</button>
								  		</td>
								  	</tr>					  		
								  </tbody>
						  </c:forEach>				  
					</table>
				</div>
			</div>
		</div>
	</body>
<script>
var docV = document.documentElement;
//전체화면 설정
function openFullScreenMode() {
 if (docV.requestFullscreen)
     docV.requestFullscreen();
 else if (docV.webkitRequestFullscreen) // Chrome, Safari (webkit)
     docV.webkitRequestFullscreen();
 else if (docV.mozRequestFullScreen) // Firefox
     docV.mozRequestFullScreen();
 else if (docV.msRequestFullscreen) // IE or Edge
     docV.msRequestFullscreen();
}

//전체화면 해제
function closeFullScreenMode() {
 if (document.exitFullscreen)
     document.exitFullscreen();
 else if (document.webkitExitFullscreen) // Chrome, Safari (webkit)
     document.webkitExitFullscreen();
 else if (document.mozCancelFullScreen) // Firefox
     document.mozCancelFullScreen();
 else if (document.msExitFullscreen) // IE or Edge
     document.msExitFullscreen();
}

$("#open").on('click',function(){
	openFullScreenMode()
});

$("#close").on('click',function(){
	closeFullScreenMode()
});

/* -------------------------------------------------------------------- */
  
   var cnt = $("#tb_cnt").val();   
   
   
   //다마수 레인지 움질일때
   $("#playerTable").on("change",".confirmAverage", function(){
	   console.log($(this).val());   
	   
	   var avg = $(this).val();
	   var rangeNo = $(this).data("range"); 
	   $("#range-"+rangeNo).text(avg);	   
   })
   
   
   /* document.getElementById('value1').innerHTML=this.value
   $("#") */
/*1. 카드리스트 구현 */
   var $target = $("dt"), isClass = null;
   
   $target.on("click", function() {
      var _$self = $(this), isActive = _$self.hasClass("active");

      _$self.toggleClass("active");
      _$self.nextUntil("dt").slideToggle(!isActive);
   });
   
   
/*2. 검색 구현 */   
   $('#idfind').on("click",function(){
	    console.log("id검색 버튼 클릭"); 
   
	   	var id = $("[name='id']").val();		
		console.log(id);
		
		$("[name='id']").val("");
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
						if(action.data.length === 0) {	
							alert("해당 ID가없습니다.");						
						
						} else {
							console.log(action.data);
							console.log("성공");						
							renderEach(action.data);				
							
						}						
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
		src += '	<table class="nickList findTable">';
		src += '		<tr>';
		src += '			<td>' + value.nick + '</td>';
		src += '			<td>&nbsp;&nbsp;&nbsp;' + value.average + '</td>';
		src += '			<td>';
		src += '				<button type="button" class="addPlayer" data-userno="'+ value.userNo +'" data-no="'+ value.userNo +'" data-nick="'+ value.nick +'" data-average="'+ value.average +'" >추가</button>';
		src += '			</td>';
		src += '		</tr>';
		src += '	</table>';
		$("#findResult").append(src);
		});
	};	

/*3. 확정리스트쿠현(추가버튼클릭할때) */
	$('#findResult,#cardlist,#favoriteTable').on("click",".addPlayer",function() {
		console.log("id추가 버튼 클릭");	
		
		//카운터 증가		
		cnt++;
		
		var src = renderTr($(this));
		/* 유저넘버체크 */
		//확정리스트에 멤버가 0보다 크면
		if($("#playerTable>tbody").length >= 0 ){
			console.log("선수1명 이상");	
			
			//그린다
			if($("#playerTable>tbody").length < 4){//멤버가 0보다크고 4보다 작으면 
				console.log("등록해도된다");
				let btnTags = $(".delPlayer");
				
				/* 반복비교 같은사용자 있는지만 확인 */	
				let state = false  ;
				for(let i=0; i<btnTags.length; i++){
					console.log(btnTags.eq(i).data("userno"));	
					
					//userno가 같지 않으면
					if($(this).data('userno') != btnTags.eq(i).data('userno')){						
						state = false;
					//userno가 같으면 경고 
					}else {
						state = true;
						break;
					}			
				}	
				
				/* 결과로 일한다 */
				if(state == false){ /* 같은맴버 없다 */
					$('#playerTable > tbody:last').after(src);
				    $("#tb_cnt").val(cnt);	
				}else{
					alert("같은 멤버가있습니다.");	
				}

				
			}else {//멤버가 4보다 크거나 같으면
				alert("최대인원이 넘었습니다.");
			}	
		}  
	});
	
	function renderTr(btn) {
		var src = "";
		src += '<tbody class="confirmBody" id="tb-' + cnt + '">'
		src += '	<tr class="addUserBox">';
		src += '		<td class="nameTd">' + btn.data('nick') +'</td>';
		src += '		<td class="averageTd">';
		src += '			<span id="range-'+ cnt +'">'+ btn.data('average') +'</span>';
		src += ' 		</td>';
		src += '		<td class="btnTd">';
		src += ' 			<button type="button" class="delPlayer" data-userno="'+btn.data('userno')+'" data-no="'+ cnt +'" data-nick="'+ btn.data('nick') +'" data-average="'+ btn.data('average') +'" >삭제</button>';		
		src += '		</td>';
		src += '	</tr>';	
		src += '	<tr>';
		src += '		<td>';
		src += ' 			<input class="confirmAverage" id ="rgno-'+ cnt +'" type="range" value="' + btn.data('average') + '" min="0" max="500" step="10" size="5" data-range="' + cnt + '">';
		src += ' 		</td>';
		src += '	</tr>'
		src += '</tbody>'
		return src;
	}
	//*삭제버튼
	$('#playerTable').on("click",".delPlayer",function() {
		console.log("id삭제 버튼 클릭");		
   		var no =$(this).data("no");
   		$("#tb-"+ no).remove();
   		
   	  	var tags = $("#playerTable>tbody").length;
		console.log("===========================");
		console.log(tags);
		console.log("===========================");	
	    
 	});	
	//*확정버튼
	$('#playerForm').on("submit",function(e) {
		e.preventDefault();
		console.log("확정 버튼 클릭");			
		
		var tableNo = ${tableNo};
		var gameType = ${param.ball};
		var userNo = new Array();
		var nick = new Array();
		var average = new Array();
		let btnTags = $(".delPlayer");
		
		var playUserList = []; 
		
		for(let i=0; i<btnTags.length; i++){
			userNo = btnTags.eq(i).data("userno");
			nick = btnTags.eq(i).data("nick");
			average = btnTags.eq(i).parent().parent().next().find(".confirmAverage").val();
			orderNo = btnTags.eq(i).parent().parent().parent().index();
			/* 순서, table번호 */			
			var playUserVo = {				
				userNo : userNo,
				nick : nick,
				currentAverage : average,
				orderNo : orderNo
			}
			playUserList.push(playUserVo);
			
		}		
		var tableGameVo = {
				/* biliardNo : 1,
				tableName : 1,		 */
				tableNo : tableNo,
				memberNum : btnTags.length,
				gameType : gameType,
				playUserList : playUserList
		}
		console.log(JSON.stringify(tableGameVo));
		
		$.ajax({			
			url : "${pageContext.request.contextPath}/tablet/confirm",		
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(tableGameVo),//제이슨형식 변경

			dataType : "json",
			success : function(action){
				console.log(action);
				
				if(action.result == 'success') {//처리성공	
					console.log("성공");
					console.log(action.data);
					/* 리다이렉트 */					
					let url = '/modang/tablet/${tableNo}/scoreboard';
					window.location.replace(url); 	 						
					
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
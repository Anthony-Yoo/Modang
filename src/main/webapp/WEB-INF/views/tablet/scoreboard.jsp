<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
		<title>Insert title here</title>
		<style>
		/*reset*/
			html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video { margin: 0; padding: 0; border: 0; vertical-align: baseline; }
			article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section { display: block; }
			body { line-height: 1; }
			ol, ul { list-style: none; }
			blockquote, q { quotes: none; }
			blockquote:before, blockquote:after, q:before, q:after { content: ''; content: none; }
			table { border-collapse: collapse; border-spacing: 0; }
			body { -webkit-text-size-adjust: none; }
			mark { background-color: transparent; color: inherit; }
			input::-moz-focus-inner { border: 0; padding: 0; }
			input, select, qktextarea { -moz-appearance: none; -webkit-appearance: none; -ms-appearance: none; appearance: none; }
			small {font-size:.75em;}			
			#logtitle {
				color : #404040;
				text-align: center;
				
			}
			#logtitle {
				color : #404040;
				text-align: center;
				
			}
			#container {
				border : 1px;
				outline: dashed 1px black;
				width : 1024px;
				height : 768px;
				position : absolute;
				left : 50%;
				top : 50%;
				transform : translate(-50%,-50%);						  	
			}
			#blankbox {		
				border : 0px;
				width : 100%;		
  				height: 200px;

			}
			#tab {
				margin-top : 30px;
				border-radius :5px;
				width : 150px;
				height : 40px;
				background-color: #00498c;		
				text-align: center;
			}	
			#tab p {
				color : white;
				font : 20px bold;
				line-height : 2;
			}
			#cardlist {
				width : 200px;  				
			}
			.imagebox {	
				margin-left : 105px;
				margin-top : 150px;			
				display : inline-block;
				outline : solid 2px black;
				width : 350px;
				height :350px;				
			}			
			
			.float-r {float: right; }
			.float-l {float: left; }
			.clear{clear: both; }	
			dt, dd {
		  		padding: 10px;
			}
			
			dt {
		  		border: 1px solid #eeeeee;
		  		margin-bottom: 5px;
			}
			
			dt span {
			  	display: inline-block;
		  		width: 5px;
		  		height: 5px;
		  		background-color: black;
		  		vertical-align: middle;
		  		margin-right: 10px;
			}
			
			dd {
		  		background-color: #eeeeee;;
	  			margin-bottom: 5px;
		  		display: none;
			}
			
			dd:hover{
		  		background-color: black;
		  		color:white;
			}	
		</style>
	</head>
	<body>
		<div id="container">			
			<!-- Top Info -->
			<div class="top" id="top-container">
				<div id="top-button"><input type="button"></div>
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
			<!-- 검색존 -->
			<div class="cent float-l" id="findid">
				<div id="tab"><p>회원추가</p></div>			
				<div>					
					<input type="text" name="id" placeholder="ID를 입력하세요">
					<button type="button" id="idfind">검색</button>
					<!-- 검색결과 -->		
					<div id="findResult">
					</div>	
					<!-- 확정리스트 -->		
					<input type="hidden" value="0" id="tb_cnt">			
					<table id="playerTable" style="border: 1px">
					  <thead>
					    <tr>
					      <th>UserNo</th>
					      <th>Nick</th>
					      <th>Average</th>
					      <th>Delete</th>
					    </tr>
					  </thead>
					  <tbody>					  	
					  	<tr id="t0">
					  		<td>${sessionScope.authUser.userNo}</td>
							<td>${sessionScope.authUser.nick}</td>
							<td>
								<input class="confirmAverage" type="number" value="${sessionScope.authUser.average}" min="0" max="300" step="10" size="5">
							</td>
							<td>
	 							<button type="button" class="delPlayer" data-userno="${sessionScope.authUser.userNo}" data-no="0" 
	 									data-nick="${sessionScope.authUser.nick}" data-average="" 
	 									disabled="disabled">삭제
	 							</button>		
							</td>
					  	</tr>
					  </tbody>
					  <tfoot>
					  	<tr>
					  		<td><button type="submit" id="confirm">확정</button></td>
					  	</tr>
					  </tfoot>
					</table>
				</div>
			</div>
			<div class="right float-l" id="favoriteList">
				<div id="tab"><p>즐겨찾기</p></div>	
				<table id="favoriteTable" style="border: 1px">
					  <thead>
					  	<tr>
					    	<th>No</th>
					     	<th>Nick</th>
					     	<th>Average</th>
					     	<th>Add</th>
					    </tr>
					  </thead>
					  <c:forEach var="card" items="${cardList}"  begin="0" end="0" step="1" varStatus="status">
					  	<c:forEach var="favorite" items="${card.favoriteList}">
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
					  </c:forEach>				  
				</table>
			</div>
		</div>
	</body>
<script>
   var $target = $("dt"), isClass = null;
   var cnt = $("#tb_cnt").val();
   

   $target.on("click", function() {
      var _$self = $(this), isActive = _$self.hasClass("active");

      _$self.toggleClass("active");
      _$self.nextUntil("dt").slideToggle(!isActive);
   });
   
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
	
	function renderTr(btn) {
		var src = "";
		src += '<tr id="t' + btn.data('no') + '">';
		src += '	<td>' + btn.data('userno') + '</td>';
		src += '	<td>' + btn.data('nick') +'</td>';
		src += '	<td><input class="confirmAverage" type="number" value="' + btn.data('average') + '" min="0" max="300" step="10" size="5"></td>';
		src += '	<td>';
		src += ' 		<button type="button" class="delPlayer" data-userno="'+btn.data('userno')+'" data-no="'+ cnt +'" data-nick="'+ btn.data('nick') +'" data-average="'+ btn.data('average') +'" >삭제</button>';			
		src += '	</td>';
		src += '</tr>';		
		
		return src;
	}

	/* 추가버튼클릭할때 */
	$('#findResult,#cardlist,#favoriteTable').on("click",".addPlayer",function() {
		console.log("id추가 버튼 클릭");	
		
		//카운터 증가		
		cnt++;
		
		var src = renderTr($(this));
		/* 유저넘버체크 */
		//확정리스트에 멤버가 0보다 크면
		if($("#playerTable>tbody>tr").length >= 0 ){
			console.log("선수1명 이상");	
			
			//그린다
			if($("#playerTable>tbody>tr").length < 4){//멤버가 0보다크고 4보다 작으면 
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
					$('#playerTable > tbody:last').append(src);
				    $("#tb_cnt").val(cnt);	
				}else{
					alert("같은 멤버가있습니다.");	
				}

				
			}else {//멤버가 4보다 크거나 같으면
				alert("최대인원이 넘었습니다.");
			}	
		}  
	});
	
	
	$('#playerTable').on("click",".delPlayer",function() {
		console.log("id삭제 버튼 클릭");		
   		$(this).parent().parent().remove();
   		
   	  	var tags = $("#playerTable>tbody>tr").length;
		console.log("===========================");
		console.log(tags);
		console.log("===========================");	
	    
 	});	

	$('#confirm').on("click",function() {
		console.log("확정 버튼 클릭");			
		
		var gameType = ${param.ball};
		var userNo = new Array();
		var nick = new Array();
		var average = new Array();
		let btnTags = $(".delPlayer");
		
		var playUserList = []; 
		
		for(let i=0; i<btnTags.length; i++){
			userNo = btnTags.eq(i).data("userno");
			nick = btnTags.eq(i).data("nick");
			average = btnTags.eq(i).parent().prev().children(".confirmAverage").val();
			orderNo = btnTags.eq(i).parent().parent().index();
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
				tableNo : 1,
				memberNum : btnTags.length,
				gameType : gameType,
				playUserList : playUserList
		}
		console.log(JSON.stringify(tableGameVo));
		
		$.ajax({			
			url : "${pageContext.request.contextPath}/tablet/confirm",		
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(tableGameVo),

			dataType : "json",
			success : function(action){
				console.log(action);
				
				if(action.result == 'success') {//처리성공	
					console.log("성공");		
					/* 리다이렉트 */		
					window.location.replace("/modang/tablet/scoreboard");								
					
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
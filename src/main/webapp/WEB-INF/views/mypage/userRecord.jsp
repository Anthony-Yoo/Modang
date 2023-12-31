<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modang 유저 전적보기</title>
	<!-- jquery -->   
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
	<!-- 부트스트랩 js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
	<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
    <link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/css/manager.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/css/user.css" rel="stylesheet" type="text/css"/>
    <style>
    /* 경험치바 베이스*/
		#bar{border:1px solid #ccc; background:#e9e9e9;}
		#bar{height:20px; width:486px;}
	 
	/* 경험치 비율 출력 */
		.perc{display:inline-block;border:1px solid #DB2525; background:#CD2323;}
		
    </style>    
</head>
<body>
    <div class="main-content">
        <div class="record-view">
            <div class="left">
                <div class="userImg">
                	<c:if test="${empty myUserVo.profileImage}">
                		<img src="${pageContext.request.contextPath}/assets/images/ori.png" alt="유저 프로필 이미지">
                	</c:if>
                	<c:if test="${not empty myUserVo.profileImage}">
                		<img src="${pageContext.request.contextPath }/upload/${myUserVo.profileImage}" alt="유저 프로필 이미지">
                    </c:if>
                </div>
                <div class="town">
                    <span>닉네임 : <strong>${myUserVo.nick}</strong></span>
                    <br>
                    <span>현재다마 : <strong>${myUserVo.average}</strong></span>
                    <br>
                    <span>최근접속일 : <strong>${myUserVo.recentLogonTime}</strong></span>
                </div>
            </div>
            <div class="userRecent center">
                <div class="recentAver">
                    <p>최근10 경기 등수</p>
                    <ul>
                    <c:forEach var="recordVo" items="${getGameList}" begin="0" end="9">
                    	<c:if test ="${recordVo.record == 1}">                                        	
                        	<li class="win">W</li>
                        </c:if>
                        <c:if test ="${recordVo.record != 1 && recordVo.record != recordVo.memberNum}">
                        	<li class="norm">${recordVo.record}</li>
                        </c:if>
                        <c:if test ="${recordVo.record != 1 && recordVo.record == recordVo.memberNum}">
                        	<li class="lose">L</li>
                        </c:if>
                    </c:forEach>
                    </ul>
                </div>
                <div class="recentGame">
                    <p>최근 10경기 평균 스탯</p>
                    <table>
                        <thead>
                            <tr>
                                <th>승률</th>
                                <th>최근다마</th>
                                <th>평균시간</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td id="winRate">${CurrentRecordVo.recentWinRate}</td>
                                <td id="recentAv">${CurrentRecordVo.recentHit}</td>                                
                                <td id="timeAv">${CurrentRecordVo.recentTimeAv}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="recentPlayer">
                    <p>최근 같이한 유저</p>
                    <ul>
                    	<c:forEach var="playVo" items="${getPlayList}" begin="0" end="7">
                        <li>${playVo.nick}</li>
                        </c:forEach>                        
                    </ul>
                </div>
            </div>
            <div class="userPlay right">
                <ul>
                    <li>
                    	<c:if test ="${CurrentRecordVo.recommStatus == 0}">
	                        <p>다마상태</p>
	                        <span class="recommTxt">물다마</span>
                        </c:if>
                        <c:if test ="${CurrentRecordVo.recommStatus == 1}">
	                        <p>다마상태</p>
	                        <span class="recommTxt">적정다마</span>
                        </c:if>
                         <c:if test ="${CurrentRecordVo.recommStatus == 2}">
	                        <p>다마상태</p>
	                        <span class="recommTxt">짠다마</span>
                        </c:if>
                        <c:if test ="${CurrentRecordVo.recommStatus == 3}">
	                        <p>다마상태</p>
	                        <span class="recommTxt">새내기</span>
                        </c:if>
                    </li>
                    <li>
                        <p>누적승률</p>
                        <span>${CurrentRecordVo.totalWinRate}</span>
                    </li>
                    <li>
                        <p>누적시간</p>
                        <span id="timeStamper"></span>
                    </li>
                    <li class="per">
                     	<p>EXP</p>
                    	<div id="bar">	                       
	                        <span class="perc">${CurrentRecordVo.totalNormRatePercent}%</span>
                        </div>
                    </li>
                    <li>
                        <p>총 경기</p>
                        <span>${CurrentRecordVo.totalCountGame}</span>
                    </li>
                    <li>
                        <p>이긴 경기</p>
                        <span>${CurrentRecordVo.totalCountWinGame}</span>
                    </li>
                    <li>
                        <p>패한 경기</p>
                        <span>${CurrentRecordVo.totalCountLoseGame}</span>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 리스트시작-상세보기 모달창 만들어애함 -->
        <div class="record-list">
            <table>
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>지역</th>
                        <th>당구장</th>
                        <th>당구대</th>
                        <th>게임종류</th>
                        <th>인원</th>
                        <th>게임일자</th>
                        <th>게임시간</th>
                        <th>등수</th>
                        <th>게임요금</th>
                    </tr>
                </thead>
                <tbody id="gameInfo">
                 <c:forEach var="recordVo" items="${getGameList}" begin="0" end="9">
                    <tr data-gameno="${recordVo.gameNo}">
                        <td>${recordVo.recordNo}</td>
                        <td>${recordVo.biliardAddress}</td>
                        <td>${recordVo.biliardName}</td>
                        <c:if test ="${recordVo.tableType == 0}">
                        	<td>대대</td>
                        </c:if>
                        <c:if test ="${recordVo.tableType == 1}">
                        	<td>중대</td>
                        </c:if>
                        <c:if test ="${recordVo.tableType == 2}">
                        	<td>포켓</td>
                        </c:if>
                        <c:if test ="${recordVo.gameType == 0}">
                        	<td>3구</td>
                        </c:if>
                        <c:if test ="${recordVo.gameType == 1}">
                        	<td>4구</td>
                        </c:if>
                        <c:if test ="${recordVo.gameType == 2}">
                        	<td>8포켓</td>
                        </c:if>
                        <c:if test ="${recordVo.gameType == 3}">
                        	<td>10포켓</td>
                        </c:if>
                        <td>${recordVo.memberNum}</td>
                        <td>${recordVo.gameDate}</td>
                        <td>${recordVo.gameTime}</td>
                        <td>${recordVo.record}</td>
                        <td>${recordVo.paymoney}</td>
                    </tr>  
                  </c:forEach>               
                </tbody>
            </table>
        </div>
        <!-- 리스트 끝-상세보기 모달창 만들어애함 -->
		<!--테이블 정산 모달창 ------------------------------------------------------- -->
	   <div class="modal fade modal-center" id="myModal" tabindex="-1"
	      role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	      <div class="modal-dialog modal-lg modal-center">
	         <div class="modal-content">
	            <div class="modal-header">
	               <button type="button" class="close" data-dismiss="modal"
	                  aria-label="Close">
	                  <span aria-hidden="true">×</span>
	               </button>
	               <h4 class="modal-title" id="paytitle">
	               </h4>
	            </div>
	            <div class="modal-body1">
	               <div class="record-list2">
	               		<table>
			                <thead>
			                    <tr>
			                        <th>No.</th>
									<th>닉네임</th>
									<th>기본다마</th>
									<th>권장다마</th>
									<th>플레이타임</th>
									<th>플레이등수</th>
									<th>총게임승률</th>
									<th>총게임시간</th>
			                    </tr>
			                </thead>
			                <tbody id="playInfo">			                                             
			                </tbody>
            			</table>
	               </div>
	            </div>
	            <div class="modal-footer">
	               <button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
	            </div>
	         </div>
	      </div>
	   </div>
	   <!--테이블 정산 모달창 끝------------------------------------------------------- -->
    </div>
</body>
<script>
$(document).ready(function(){
	console.log(${CurrentRecordVo.totalNormRatePercent});
	$(".perc").css( { "height" : "19px", "width" : "${CurrentRecordVo.totalNormRatePercent}%", "margin" : "-1px", "text-align" : "center",
					  "font" : "14px bold", "color" : "white" } );		
	timeStamper();
});

//삭제 모달창 호출 버튼 --> 모달창  뜸
$("#gameInfo").on("click", "tr", function(){
   console.log("모달창 호출");
   $("#playInfo").empty();
   var gameNo = $(this).data("gameno");
   console.log(gameNo);
   
   //AJAx
   $.ajax({			
			url : "${pageContext.request.contextPath}/mypage/${myUserVo.userNo}/playlist",		
			type : "post",
			/* contentType : "application/json", */
			data : {gameNo:gameNo},
			
			dataType : "json",
			success : function(action){						
				console.log(action);	
				if(action.result == 'success') {//처리성공	
					console.log("선택 게임 내 플레이 정보 획득완료");
					console.log(action.data);
					renderEach(action.data)		
					
					
				}else {//오류처리
					var msg = action.failMsg;
						alert(msg);				
				}					
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}		
			
		});      
   //모달창 호출
   $('#myModal').modal('show');
});

function renderEach(playlist) {	 
	var cnt = 0;
	$.each(playlist,function(key,data){	
	cnt++
	var src = "";
	src += '<tr id="t-' + cnt + '">';
	src += '	<td>' + cnt + '</td>';
	src += '	<td>' + data.nick +'</td>';
	src += '	<td>' + data.average +'</td>';
	
	if(data.recommStatus == 0) {
		src += '	<td>물다마</td>';	
	}else if(data.recommStatus == 1) {
		src += '	<td>적정다마</td>';	
	}else if(data.recommStatus == 2) {
		src += '	<td>짠다마</td>';	
	}else if(data.recommStatus == 3) {
		src += '	<td>새내기</td>';	
	}

	src += ' 	<td>' + data.playTime +'</td>';
	src += '	<td>' + data.record +'</td>';
	src += '	<td>' + data.totalWinRate +'</td>';
	src += '	<td>' + data.totalPlayTime +'</td>';
	src += '</tr>';		
	$("#playInfo").append(src);
	});
};	
time = ${CurrentRecordVo.totalGameTime};
timeStamper = function(){	
	min = Math.floor(time/60);
	hour = Math.floor(min/60);
	sec = time%60;
	min = min%60;
	
	var th = hour;
	var tm = min;
	var ts = sec;
	
	if(th < 10 ){
		th = "0" + hour;
	}			
	if(tm < 10){
		tm = "0" + min;
	}			
	if(ts < 10){
		ts = "0" + sec;
	}
	$("#timeStamper").html(th + ":" + tm + ":" + ts);						
}

</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>modang 관리자페이지</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="icon" sizes="any"
	href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/managerdefault.css" />

<!-- jquery -->
<script type="text/javascript"	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>

<!-- 부트스트랩 js -->
<script type="text/javascript"	src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>


</head>
<body>
	<div id="page-wrapper">

		<!-- Header -->
		<section id="header">
			<div class="container">
				<div class="row">
					<div class="col-12">

						<!-- Logo -->
						<h1>
							<a href="${pageContext.request.contextPath}/manager/index"><img
								src="${pageContext.request.contextPath}/assets/images/logo.png" /></a>
						</h1>

						<!-- User login -->
						<c:choose>
							<c:when test="${sessionScope.loginManager==null}">
								<ul>
									<li><a
										href="${pageContext.request.contextPath}/manager/loginForm"
										class="btn btn-sm">로그인</a></li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul>
									<li class="mr-2"><strong>${sessionScope.loginManager.repName}</strong>님</li>
									<li><a
										href="${pageContext.request.contextPath}/manager/logout"
										class="btn btn-sm">로그아웃</a></li>
									<li><a href="${pageContext.request.contextPath}/"
										class="btn btn-sm">모두의 당구장</a></li>
								</ul>
							</c:otherwise>
						</c:choose>

						<!-- Nav -->
						<nav id="nav">
							<a href="${pageContext.request.contextPath}/manager/index"
								class="active">테이블 현황</a> <a
								href="${pageContext.request.contextPath}/manager/tableSales">테이블
								매출</a> <a
								href="${pageContext.request.contextPath}/manager/daySalesForm">일별
								매출</a> <a
								href="${pageContext.request.contextPath}/manager/pricePolicyForm">요금
								테이블</a> <a
								href="${pageContext.request.contextPath}/manager/settingsForm">관리자
								설정</a>
						</nav>
					</div>
				</div>
			</div>
		</section>

		<!-- Content -->
		<section id="content">
			<div class="container">
				<div class="row aln-center">

					<!-- 테이블 목록 -->
					<div class="col-8">
						<section>
							<header class="d-inline-block">
								<h2>&nbsp;테이블 현황</h2>
							</header>
							<div class="d-inline-block status">
								대기 <img
									src="${pageContext.request.contextPath}/assets/images/tableStatus1.png"
									class="imgbox"> 사용중 <img
									src="${pageContext.request.contextPath}/assets/images/tableStatus0.png"
									class="imgbox"> 일시정지 <img
									src="${pageContext.request.contextPath}/assets/images/tableStatus2.png"
									class="imgbox"> &nbsp;&nbsp;

							</div>
							<div id="tablelist">
								<c:forEach items="${cueTableList}" var="cueTableVo">
									<div class="tableArea" data-biliardno="${cueTableVo.biliardNo}"
										data-tableno="${cueTableVo.tableNo}"
										data-tablename="${cueTableVo.tableName}"
										data-tabletype="${cueTableVo.tableType}"
										data-tablestatus="${cueTableVo.tableStatus}">
										<large class="font-weight-normal text-blue float-left">
										<strong>No. ${cueTableVo.tableName}</strong></large>
										<c:choose>
											<c:when test="${cueTableVo.tableStatus == 0}">
												<!--테이블 상태별 배경색 변경(대기)  -->
												<div class="status-available"
													style="background-color: #d2e4fb;">
													<div class="tableType small float-right" data-tabletype="${cueTableVo.tableType}">
														<c:if test="${cueTableVo.tableType==0}">
															<strong>대대</strong>
														</c:if>
														<c:if test="${cueTableVo.tableType==1}">
															<strong>중대</strong>
														</c:if>
														<c:if test="${cueTableVo.tableType==2}">
															<strong>포켓</strong>
														</c:if>
													</div>
													<div class="tableTime pt-8 pl-3">
														<strong>대 기</strong>
													</div>
													<br> <br>
													<div class="tablePay"></div>
												</div>
											</c:when>
											<c:when test="${cueTableVo.tableStatus==1}">
												<!--테이블 상태별 배경색 변경(사용)  -->
												<div class="status-occupied"
													style="background-color: #fdeba2;">
													<div class="small float-right">
														<c:if test="${cueTableVo.tableType==0}">
															<strong>대대</strong>
														</c:if>
														<c:if test="${cueTableVo.tableType==1}">
															<strong>중대</strong>
														</c:if>
														<c:if test="${cueTableVo.tableType==2}">
															<strong>포켓</strong>
														</c:if>
													</div>
													<div class="tableTime pt-8 pl-2"></div>
													<br> <br>
													<div class="tablePay">
														<strong></strong>
													</div>
												</div>
											</c:when>
											<c:otherwise>
												<!--테이블 상태별 배경색 변경(정지)  -->
												<div class="status-default"
													style="background-color: #ffeded;">
													<div class="small float-right">
														<c:if test="${cueTableVo.tableType==0}">
															<strong>대대</strong>
														</c:if>
														<c:if test="${cueTableVo.tableType==1}">
															<strong>중대</strong>
														</c:if>
														<c:if test="${cueTableVo.tableType==2}">
															<strong>포켓</strong>
														</c:if>
													</div>
													<div class="tableTime pt-8 pl-2"></div>
														<br> <br>
													<div class="tablePay">
														<strong></strong>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</c:forEach>
								<!-- 테이블 추가버튼 -->
								<div class="tableAdd">
									<img
										src="${pageContext.request.contextPath}/assets/images/addbt.png" />
								</div>
							</div>
						</section>
					</div>

					<!-- 테이블 상세정보-------------------------------------------------->
					<div class="col-4">
						<section>
							<header>
								<h2 id="info-01">테이블 정보</h2>
							</header>
							<!-- 테이블종류 -->
							<form
								action="${pageContext.request.contextPath}/manager/tableInfo"
								method="get">
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">테이블 종류</label>
									<div id="" class="col tableRadio01">
										<label id="" class="custom-control d-inline-block"> <span
											id="tabletypename" class="custom-control pt-1">대 대</span>
										</label>
										<button id="tableSetting" type="button"
											class=".your-button-selector">
											<img
												src="${pageContext.request.contextPath}/assets/images/settings.png"
												width="15px" />
										</button>
									</div>
								</div>

								<!-- 게임종류	 -->
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">게임 종류</label>
									<div class="col tableRadio02 ">
										<div class="gametype-1 ">
											<label class="custom-control custom-radio d-inline-block">
												<input type="radio" name="gametype0"
												class="custom-control-input" /> <span id="gametype"
												class="custom-control-label">3구</span>
											</label> <label class="custom-control custom-radio d-inline-block">
												<input type="radio" name="gametype1"
												class="custom-control-input" /> <span id="gametype"
												class="custom-control-label">4구</span>
											</label>
										</div>
										<div class="gametype-2" style="display: none">
											<label class="custom-control custom-radio d-inline-block">
												<input type="radio" name="gametype2"
												class="custom-control-input" /> <span id="gametype"
												class="custom-control-label">8볼</span>
											</label> <label class="custom-control custom-radio d-inline-block">
												<input type="radio" name="gametype3"
												class="custom-control-input" /> <span id="gametype"
												class="custom-control-label">10볼</span>
											</label>
										</div>
									</div>
								</div>
								<!-- 고객정보	 -->
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">고객정보</label>
									<div class="col">
										<textarea id="playUserList" class="form-control mb-1" rows="4"
											maxlength="1000" disabled>
										</textarea>
									</div>
								</div>
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">요금제</label>
									<div class="col input-group">
										<span class="input-group-prepend"> <span
											class="input-group-text px-2 text-tiny" style="height: 2rem;">10분당</span>
										</span> <input type="text" id="tableFee"
											class="form-control form-control-sm px-2" maxlength="4"
											readonly /> <span class="input-group-append"> <span
											class="input-group-text px-2 text-tiny" style="height: 2rem;">원</span>
										</span>
									</div>
								</div>
								<!-- 시작시간	 -->
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">시작 시간</label>
									<div class="col-4">
										<input type="text" id="startTime"
											class="form-control form-control-sm mb-1" maxlength="20"
											readonly />
									</div>
								</div>
								<!-- 종료시간	 -->
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">종료 시간</label>
									<div class="col-4">
										<input type="text" id="endTime"
											class="form-control form-control-sm mb-0" maxlength="20"
											readonly />
									</div>
								</div>
								<!-- 결제금액	 -->
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">결제 금액</label>
									<div class="col input-group">
										<input type="text" name=""
											class="form-control form-control-sm mb-0" maxlength="20"
											readonly />
									</div>
								</div>
								<div class="mt-4" style="position: absolute; bottom: 32px;">
									<button id="Modalpayview" type="button" class="btn btn-red btn-lg btn-block Modalpayview">정 산</button>
								</div>
								<!-- 미정산리스트	 -->
								<div class="row">
									<div class="col-12">
										<strong><미정산 리스트></strong>
											<table class="inCaluList">
												<thead class="thead-dark">
													<tr>
														<th>no</th>
														<th>시작시간</th>
														<th>종료시간</th>
														<th>결제금액</th>
														<th>결제상태</th>
													</tr>
												</thead>
												<tbody class="listTalbe">
													<!-- 											        <tr class="custom-height">
												          <td>1</td>
												          <td>11:45</td>
												          <td>12:51</td>
												          <td>8,000</td>
												          <td>미정산</td>
											        </tr> -->
												</tbody>
											</table>
									</div>
								</div>
							</form>
						</section>
					</div>
				</div>
			</div>
		</section>

		<!-- Copyright -->
		<div id="copyright">&copy; modang. All rights reserved.</div>

	</div>

	<!--테이블 변경 모달창 ------------------------------------------------------- -->

	<div class="modal fade modal-center" id="tableMngModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-center">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="mySmallModalLabel">
						<strong>테이블 변경</strong>
					</h4>
				</div>
				<div class="modal-body">
					<label for="inputEmail3" class="label01">테이블 종류</label>
					<div id="" class="col">
						<label class="custom-control custom-radio d-inline-block">
							<input type="radio" name="tabletypeModify" value="0"
							class="custom-control-input tabletypeModify" /> <span
							class="custom-control-label">대대</span>
						</label> <label class="custom-control custom-radio d-inline-block">
							<input type="radio" name="tabletypeModify" value="1"
							class="custom-control-input tabletypeModify" /> <span
							class="custom-control-label">중대</span>
						</label> <label class="custom-control custom-radio d-inline-block">
							<input type="radio" name="tabletypeModify" value="2"
							class="custom-control-input tabletypeModify" /> <span
							class="custom-control-label">포켓</span>
						</label>
					</div>
				</div>
				<div class="modal-footer">
					<button id="btnSave" type="button" class="btn btn-primary">변경</button>
					<button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!--테이블 변경 모달창 끝------------------------------------------------------- -->
	<!--테이블 추가 모달창 ------------------------------------------------------- -->
	<div class="modal fade modal-center" id="tableAddModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-center">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="mySmallModalLabel">
						<strong>테이블 추가</strong>
					</h4>
				</div>
				<div class="modal-body">
					<label for="inputEmail3" class="label01">테이블 번호</label> <input
						class="form-control-2 " id="tableName" type="text" name="">
					<br> <label for="inputEmail3" class="label01">테이블 종류</label>
					<div id="" class="col">
						<label class="custom-control custom-radio d-inline-block">
							<input type="radio" name="tabletype1" value="add0"
							class="custom-control-input" /> <span
							class="custom-control-label">대대</span>
						</label> <label class="custom-control custom-radio d-inline-block">
							<input type="radio" name="tabletype1" value="add1"
							class="custom-control-input" /> <span
							class="custom-control-label">중대</span>
						</label> <label class="custom-control custom-radio d-inline-block">
							<input type="radio" name="tabletype1" value="add2"
							class="custom-control-input" /> <span
							class="custom-control-label">포켓</span>
						</label>
					</div>
				</div>
				<div class="modal-footer">
					<button id="btnAdd" type="button" class="btn btn-primary">추가</button>
					<button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!--테이블 추가 모달창 끝------------------------------------------------------- -->
	<!--테이블 정산 모달창 ------------------------------------------------------- -->
	<div class="modal fade modal-center" id="tablePayModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm1 modal-center">
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
					<div class="form-group">
						<label for="modalgameNo" class="label02 d-inline-block">결제
							번호</label> <input class="form-control-4 d-inline-block" id="modalgameNo"
							type="text" name="" readonly>
					</div>
					<div class="form-group">
						<label for="" class="label02 custom-control d-inline-block">테이블 종류</label> 
						<label class="custom-control custom-radio d-inline-block">
							<input id="payType" type="radio" name="payType" value="0" class="custom-control-input" checked/> 
							<span class="custom-control-label">카드</span>
						</label> <label class="custom-control custom-radio d-inline-block">
							<input id="payType" type="radio" name="payType" value="1" class="custom-control-input" /> 
							<span class="custom-control-label">현금</span>
						</label>
					</div>
					<div class="form-group">
						<label for="modalPayMoney" class="label02 d-inline-block">결제금액</label>
						<input class="form-control-4 d-inline-block" id="modalpayMoney" type="text" readonly>
					</div>
					<div class="form-group">
						<label for="income" class="label02 d-inline-block">입금금액</label> 
						<input class="form-control-4 d-inline-block" id="income" type="text">
					</div>
				</div>
				<div class="modal-footer">
					<button id="btnPay" type="button" class="btn btn-primary">결제</button>
					<button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!--테이블 정산 모달창 끝------------------------------------------------------- -->

</body>

<script type="text/javascript">
/* 로딩 시작할때(다시켜질때) */
let $table = $(".tableArea");
let $timebox = $table.find(".tableTime");
let $paybox = $table.find(".tablePay");	
let minFee = 0;
let tableFee = 0;
let useFee = 0;

$(document).ready(function(){
		
	$table.each(function(i){// 테이블 반복수행 펑션	
		var tableStatus = $table.eq(i).data("tablestatus");
		var tableNo = $table.eq(i).data("tableno");
		var $this = $table.eq(i);

		switch(tableStatus) {
		case 0 : //case 0. 테이블상태가 0(대기) 일때
			console.log("테이블 : 대기 상태입니다.");			
			break;
		case 1 : //case 1. 테이블상태가 1(사용중) 일때
			console.log("테이블 : 사용중 상태입니다.");
			statusReStart(tableNo,$this);			
			break;
		case 2 : //case 2. 테이블상태가 2(일시정지) 일때
			console.log("테이블 : 정지 상태입니다.");	
			statusPause(tableNo,$this);

			break;
		
		default : //	

			break;	
		
		}
	});
		
});	

function payViewer($this){		
	console.log("이것 감지 :" + $this.data("tabletype"));
	if ($this.data("tabletype") == 0) {
		
		minFee = ${tariffVo.bminfee};
		tableFee = ${tariffVo.btablefee};
		
	}else if ($this.data("tabletype") == 1) {
		
		minFee = ${tariffVo.mminfee};
		tableFee = ${tariffVo.mtablefee};
		
	}else if ($this.data("tabletype") == 2) {
		
		minFee = ${tariffVo.pminfee};
		tableFee = ${tariffVo.ptablefee};
	}
	console.log("테이블 게임형태 : "+$this.find(".tableType"));
	
	var $time = $this.find(".tableTime").text();
	var splitTime = $time.split(":");
  	var sumMin =  splitTime[0]*60 + splitTime[1]*1;	  	
  	var ceilMin =  Math.ceil(sumMin/10)*10;
  	console.log("시간 : "+$time);
  	console.log("기본요금 : "+minFee);
  	console.log("10분요금 : "+tableFee);
  	//-실제경기시간
  	//-올림한경기시간* 
  	//---------------------------------------------------------------------	
  	//30분 이하일때
  	//    기본요금적용
  	//30분 초과일때
  	//    기본요금+ ((올림한경기시간-30)/10)*10분당 요금	  	
  	
  	
  	if (ceilMin <= 30 ) {//올림한경기시간이 30분 이하일때
  		useFee = minFee;	  	
  	}else{//올림한경기시간이 30분 초과일때	  		
  		useFee = minFee + ((ceilMin-30)/10) * tableFee; 	
  	}    
  	$this.find(".tablePay").html("<strong>" + useFee + "</strong>");
  	$this.find(".tableTime").on('DOMSubtreeModified', function(){
  		payViewer($this);
  	});
} 
 
/* 기능7. 포즈상태 */
function statusPause(tableNo,$this){	
	//1.테이블 게임번호 전송-->게임정보 받음	
	console.log("포즈상태 :"+ tableNo);
	
	$.ajax({			
		url : "${pageContext.request.contextPath}/tablet/pausestatus",		
		type : "post",
		/* contentType : "application/json", */
		data : {tableNo,tableNo},
		
		dataType : "json",
		success : function(action){						
			console.log(action);	
			if(action.result == 'success') {//처리성공	
				console.log("성공");
				console.log(action.data);
				
				/* 리다이렉트 */					
		
				
				//2.버튼출력변경()
				
				//3.타이머 기본값 결정				
				clearInterval(timer);				
				console.log("타이머 일시정지!");
				//4.사용시간 (출력)  //요금계산은 자동	
				console.log(action.data.secondsToTime);
				time = action.data.secondsToTime;
				minTime = Math.floor(time/60);
				//4.타이머 시작(출력)  //요금계산은 자동
				timeStamper = function(){	
					min = minTime;
					hour = Math.floor(min/60);				
					min = min%60; 						
					
					var th = hour;
					var tm = min;						
					
					if(th < 10 ){
						th = "0" + hour;
					}			
					if(tm < 10){
						tm = "0" + min;
					}						
					$this.find(".tableTime").html(th + ":" + tm);						
					console.log("타임스탬프 작동!");	
				}		
				timeStamper();
				payViewer($this);

					
			}else {//오류처리
				var msg = action.failMsg;
					alert(msg);				
			}					
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}		
		
	});	
}
 
/* 기능8. 재시작상태 */
function statusReStart(tableNo,$this){
	//1.테이블 게임번호 전송-->게임정보 받음
	console.log("사용중상태 :"+ tableNo);
	
	$.ajax({			
		url : "${pageContext.request.contextPath}/tablet/playstatus",		
		type : "post",
		/* contentType : "application/json", */
		data : {tableNo,tableNo},
		
		dataType : "json",
		success : function(action){						
			console.log(action);	
			if(action.result == 'success') {//처리성공	
				console.log("성공");
				console.log(action.data);				
				 
				//3.타이머 기본값 결정
					console.log(action.data.secondsToTime);
					time = action.data.secondsToTime;
					minTime = Math.floor(time/60);
					//4.타이머 시작(출력)  //요금계산은 자동
					timeStamper = function(){	
						min = minTime;
						hour = Math.floor(min/60);				
						min = min%60; 						
						
						var th = hour;
						var tm = min;						
						
						if(th < 10 ){
							th = "0" + hour;
						}			
						if(tm < 10){
							tm = "0" + min;
						}						
						$this.find(".tableTime").html(th + ":" + tm);						
						console.log("타임스탬프 작동!");	
					}		
					timeStamper();
					
					timer = setInterval(function(){		
						minTime++;
						min = minTime;
						hour = Math.floor(min/60);				
						min = min%60;  				
						
						var th = hour;
						var tm = min;						
						
						if(th < 10 ){
							th = "0" + hour;
						}			
						if(tm < 10){
							tm = "0" + min;
						}						
						$this.find(".tableTime").html(th + ":" + tm);					
						console.log("타이머 작동!");
						
					}, 60000);	
					payViewer($this);
			
			}else {//오류처리
				var msg = action.failMsg;
					alert(msg);				
			}					
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}		
	});		
}

let crtbiliardNo=0;//현재 선택된 당구장넘버
let crtTableNo=0; //현재 선택된 테이블넘버
let crtTableName=0; //현재 선택된 테이블네임
let selectGameNo = ""; 
let selectPayMoney = ""; 

//리스트 테이블 클릭 이벤트 처리
$(document).on("click", ".listTalbe tr.custom-height", function() {
	
  // 클릭한 행에 "selected" 클래스 추가/제거
 	$(this).toggleClass("selected");

	var selectedRow = $(this);
	var selectGameNo = selectedRow.find("td:eq(0)").text();
	var selectPayMoney = selectedRow.find("td:eq(3)").text();
	
	console.log("결제번호:"+selectGameNo);
	console.log("결제금액:"+selectPayMoney);
	
	$("#modalgameNo").val(selectGameNo);
	$("#modalpayMoney").val(selectPayMoney);
	
  // 다른 행들의 "selected" 클래스 제거
  $(".listTalbe tr.custom-height").not(this).removeClass("selected");

});


<!--결제 모달창 호출------------------------------------------------------ -->
$("#Modalpayview").on("click",function(){
	console.log("결제버튼 클릭");
	
	$("#paytitle").empty();
	var tableNo = crtTableNo;
	var tableName = crtTableName;
	console.log("테이블 네임:"+tableName);
	console.log("테이블 번호:"+tableNo);
	$("#paytitle").append("<strong>게임 결제 ["+tableName+"번 테이블]</strong>");
	$("#payType input[type='radio']").prop("checked", true);
    console.log(selectGameNo);
	
 	$('#tablePayModal').modal('show'); 

});

<!--결제 버튼 클릭-------------------------------------------------------- -->
$("#btnPay").on("click",function(){
	console.log("결제버튼 클릭");
	
	var tableName = crtTableName;
	var tableNo = crtTableNo;
	console.log("테이블 네임:"+tableName);
	console.log("테이블 번호:"+tableNo);
	var gameNo = $("#modalgameNo").val();
	var payType = $('#tablePayModal [name="payType"]:checked').val();
	var payMoney = $("#modalpayMoney").val();
	var income = $('#income').val();
	console.log("게임번호:"+ gameNo); //
	console.log("결제타입:"+ payType);
	console.log("결제금액:"+ payMoney);
	console.log("입금금액:"+ income);
	
	var gamesVo={
			gameNo: gameNo,
			payType: payType,
			income: income
	}
	
	$.ajax({
		
		url : "${pageContext.request.contextPath}/manager/payMent",		
		type : "get",
		contentType : "application/json",
		data : gamesVo,

		dataType : "json",
		success : function(jsonResult){
			/*성공시 처리해야될 코드 작성*/
			if(jsonResult.data !=null){
				$('#tablePayModal').modal('hide');
				alert("결제가 완료되었습니다.");
				location.reload();
			}else{
				
			} 
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	
});

<!--테이블 추가클릭------------------------------------------------------- -->
$(".tableAdd").on("click",function(){
	console.log('테이블 추가버튼');
	
	var tables = $(".tableArea") //테이블기본정도 div 클래스
	console.log(tables.length);
	
	if(tables.length<11){ //테이블갯수 15개까지만 등록 가능
		$('#tableAddModal').modal('show');
	}else{
		alert("추가할수 없습니다.");
	}
	
});

<!--테이블 추가하기------------------------------------------------------ --->
$("#btnAdd").on("click", function(){
	console.log("테이블 추가하기");
	
	var addtableName = $("#tableName").val(); 
	console.log(addtableName);
	var rawVal = $('#tableAddModal [name="tabletype1"]:checked').val();
	var addtableType = rawVal.substring(3);
	console.log(addtableType);
	
	var cuetableVo={ //입력한 정보 vo에 담기
			tableName: addtableName,
			tableType: addtableType
		};
	
	$.ajax({
		url : "${pageContext.request.contextPath }/manager/addTable",		
		type : "post",
		data : cuetableVo,

		dataType : "json",
		success : function(jsonResult){
			console.log(jsonResult);
			/*성공시 처리해야될 코드 작성*/
			
  			if(jsonResult.data !=null){
 			
				$('#tableAddModal').modal('hide');
				alert("테이블이 추가되었습니다.");
				location.reload(); //새로고침
	 					
			}else{
				
			}  
		},
		error : function(XHR, status, error) { 
			console.error(status + " : " + error);
		}
    }); //ajax end	
	
});

<!--테이블 상세정보 가져오기------------------------------------------------------- -->	
$(".tableArea").on("click",function(){

	crtTableNo = $(this).data("tableno");
	crtTableName = $(this).data("tablename");
	crtbiliardNo = $(this).data("biliardno");
	
	console.log('테이블 클릭');
	var biliardno = $(this).data("biliardno");
	var tableno = $(this).data("tableno");
	var tablename = $(this).data("tablename");
	var tabletype = $(this).data("tabletype");
	console.log("당구장번호: "+biliardno);
	console.log("테이블번호: "+tableno);
	console.log("테이블이름: "+tablename);
	console.log("테이블종류: "+tabletype);
	
	var cuetableVo={
		biliardNo: biliardno,
		tableNo: tableno,
		tableName: tablename,
		tableType: tabletype
	};
	
	$.ajax({
		url : "${pageContext.request.contextPath }/manager/info",		
		type : "get",
		data : cuetableVo,

		dataType : "json",
		success : function(jsonResult){
			console.log(jsonResult);
			/*성공시 처리해야될 코드 작성*/
 			if(jsonResult.data !=null){
 			
	 			$("#info-01").empty(); 									// 당구대 번호 초기화
	 			$('#startTime').empty();                                // 요금 초기화
	 			$(".tableRadio02 input[type='radio']").prop("checked", false);	//라디오버튼 게임종류 초기화
	 			$("#playUserList").empty(); 
	 			$(".listTalbe").empty();
	 			
	 			/* 테이블타입별표기 */
	 			$('#tabletypename').empty();
	 			var tableType = jsonResult.data.oneTable.tableType;
	 			if(tableType==0){
	 				$("#tabletypename").append("대 대");
	 			}else if(tableType==1){
		 			$("#tabletypename").append("중 대");	
	 			}else{
	 				$("#tabletypename").append("포 켓");
	 			}
					
				$("#info-01").append("No."+jsonResult.data.oneTable.tableName); //테이블이름 출력
				
				$('[value='+jsonResult.data.oneTable.tableType+']').prop("checked",true); //테이블타입 라디오버튼 선택
					
				if(jsonResult.data.oneTable.tableType < 2 ){ //게임타입정보 대대/중대일때 3구/4구 show 포켓일때 8볼/10볼 show
					$( ".gametype-2" ).hide();
					$( ".gametype-1" ).show();
				}else{
					$( ".gametype-1" ).hide();
					$( ".gametype-2" ).show();
				}
				
				var tableFee = 0; //요금정보 매칭
				switch (jsonResult.data.oneTable.tableType) {
					case 0:
						tableFee = jsonResult.data.tariffVo.btablefee;
						break;
					case 1:
						tableFee = jsonResult.data.tariffVo.mtablefee;
						break;
					case 2:
						tableFee = jsonResult.data.tariffVo.ptablefee;
						break;
					default:
						tableFee = 0;
						break;
				}
				
				var formattedTableFee = tableFee.toLocaleString(); // 천단위 구분기호
				$('#tableFee').val(formattedTableFee); //기본요금 표기
				
				$('#startTime').val(""); //시작시간 초기화
				$('#endTime').val("");   //종료시간 초기화
				
				if(jsonResult.data.gamesVo!=null){ //게임정보 있는 경우 보여주기
					
					$('[name=gametype'+jsonResult.data.gamesVo.gameType+']').prop("checked",true); //게임타입정보 라디오버튼 선택
					
					var cnt = jsonResult.data.gamesVo.playUserList.length; //테이블 게임고객 총인원수
					var userList = ""; 
					for(i=0;i<cnt;i++){                                    //테이블 게임고객 닉네임리스트
						userList += jsonResult.data.gamesVo.playUserList[i].nick +"  " ;
						console.log("고객이름:"+jsonResult.data.gamesVo.playUserList[i].nick);
					}//for end
					$("#playUserList").html(userList); //게임고객 닉네임 표기하기
	
					var startTime = jsonResult.data.gamesVo.startTime; 
					var endTime = jsonResult.data.gamesVo.endTime;

						if (startTime) {           //시작시간 단위 변경하기 함수
					        var startDate = new Date(startTime);
					        var startHours = startDate.getHours();
					        var startMinutes = startDate.getMinutes();

					        // 시작 시간을 오전/오후와 시:분 형식으로 변환합니다.
					        var formattedStartTime =
					          (startHours < 12 ? "오전" : "오후") +
					          " " +
					          (startHours % 12 === 0 ? 12 : startHours % 12) +
					          ":" +
					          (startMinutes < 10 ? "0" : "") +
					          startMinutes;

					        // 형식화된 시작 시간을 입력란에 설정합니다.
					        $("#startTime").val(formattedStartTime);
					      } else {
					        $("#startTime").val(""); // 시작 시간이 없는 경우 입력란을 비웁니다.
					      }//startTime end

					      if (endTime) {           //종료시간 단위 변경하기 함수
					        var endDate = new Date(endTime);
					        var endHours = endDate.getHours();
					        var endMinutes = endDate.getMinutes();

					        // 종료 시간을 오전/오후와 시:분 형식으로 변환합니다.
					        var formattedEndTime =
					          (endHours < 12 ? "오전" : "오후") +
					          " " +
					          (endHours % 12 === 0 ? 12 : endHours % 12) +
					          ":" +
					          (endMinutes < 10 ? "0" : "") +
					          endMinutes;

					        // 형식화된 종료 시간을 입력란에 설정합니다.
					        $("#endTime").val(formattedEndTime);
					      } else {
					        $("#endTime").val(""); // 종료 시간이 없는 경우 입력란을 비웁니다.
					      }//endTiem end
					      
					      console.log(jsonResult.data.incaluList[0]);
					      
					      var incaluList =jsonResult.data.incaluList;
					      
					      if(incaluList.length>0){ //미정산 리스트 있는 경우
					    	  for(var i=0;i<incaluList.length;i++){ //미정산 리스트 출력하기
						    	  console.log(incaluList[i].gameNo);
						    	  render(incaluList[i],"down");
						      }
					    	 //버튼 보이게 처리
					    	  $("#Modalpayview").show();
					      }else {
					    	 //버튼 안보이게 처리
					    	  $("#Modalpayview").hide();
					      }//미정산리스트 end
					      
				}else{
					$("#Modalpayview").hide();
				}//if end
				
			}else{
				 
			} 
		},
		error : function(XHR, status, error) { 
			console.error(status + " : " + error);
		}
    }); //ajax end
	
});



function render (tableGamesVo, dir) {

	var tr = ""; 
  	tr += '<tr class="custom-height" data-no="'+tableGamesVo.gameNo +'" data-price="'+tableGamesVo.payMoney+'">' ; 
    tr +=    '<td>' +tableGamesVo.gameNo+  '</td>' ;
    
    // startTime 처리
    var startDate = new Date(tableGamesVo.startTime);
    var startHours = startDate.getHours();
    var startMinutes = startDate.getMinutes();
    var formattedStartTime =
      (startHours < 10 ? "0" : "") + startHours + ":" + (startMinutes < 10 ? "0" : "") + startMinutes;
    tr += '<td>' + formattedStartTime + '</td>';  
    
    // endTime 처리
    var endDate = new Date(tableGamesVo.endTime);
    var endHours = endDate.getHours();
    var endMinutes = endDate.getMinutes();
    var formattedEndTime =
      (endHours < 10 ? "0" : "") + endHours + ":" + (endMinutes < 10 ? "0" : "") + endMinutes;
    tr += '<td>' + formattedEndTime + '</td>';
    
    tr +=    '<td>' + tableGamesVo.payMoney + '</td>' ;
    tr +=    '<td>'+"미정산"+ '</td>' ;
    tr += '</tr>';
    
	if(dir =='up'){
	    $(".listTalbe").prepend(tr);
	}else if(dir =='down'){
		$(".listTalbe").append(tr);
	}else{
		console.log("방향오류");
	}
   
}
	

<!--테이블 변경모달창 호출------------------------------------------------------- -->
$(".form-group").on("click","#tableSetting", function(){
			console.log("설정클릭");
			console.log("선택된 테이블넘버:"+crtTableNo);
		
			$('#tableMngModal').modal('show');
});  

 <!--table종류변경 팝업 수정버튼 클릭했을때--------------------------------------------->
$("#btnSave").on("click", function(){
		console.log("테이블종류 변경클릭");
		
		var tabletype = $("input[name='tabletypeModify']:checked").val();
		//$('[value='+tableType+']').prop("checked", true);
				
		console.log("당구장넘버:"+crtbiliardNo);
		console.log("선택된 테이블넘버:"+crtTableNo);
		console.log("변경된 테이블종류:"+tabletype);
		
		var cuttableVo ={
				biliardNo: crtbiliardNo,
				tableNo: crtTableNo,
				tableType: tabletype
		}; 
		
	 	$.ajax({
			
				url : "${pageContext.request.contextPath }/manager/tabletype",		
				type : "post",
				data : cuttableVo,
		
				dataType : "json",
				success : function(jsonResult){
					/*성공시 처리해야될 코드 작성*/
		  			console.log(jsonResult.data);
					
					if(jsonResult.data > 0 ){ //테이블종류 수정 성공시
						//정상처리
						$('#tableMngModal').modal('hide');
						alert("테이블종류가 변경되었습니다.");
						location.reload(); //새로고침
		
					}else{ //테이블종류 수정 실패시
						//오류처리
						alert("테이블을 다시 확인해주세요");
					} 
				},
				error : function(XHR, status, error) { 
				  console.error(status + " : " + error);
				}
	    }); //ajax end */ 
}); 


</script>
</html>
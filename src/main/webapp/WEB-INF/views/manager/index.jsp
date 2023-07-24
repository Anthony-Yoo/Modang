<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>modang 관리자페이지</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/managerdefault.css" />

<!-- jquery -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>

<!-- 부트스트랩 js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>


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
							<a href="index.html"><img src="${pageContext.request.contextPath}/assets/images/logo.png" /></a>
						</h1>

						<!-- User login -->
						<c:choose>
							<c:when test="${sessionScope.loginManager==null}">
								<ul>
									<li><a href="${pageContext.request.contextPath}/manager/loginForm" class="btn btn-sm">로그인</a></li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul>	
									<li class="mr-2"><strong>${sessionScope.loginManager.repName}</strong>님</li>
									<li><a href="${pageContext.request.contextPath}/manager/logout" class="btn btn-sm">로그아웃</a></li>
									<li><a href="${pageContext.request.contextPath}/" class="btn btn-sm">모두의 당구장</a></li>
								</ul>
							</c:otherwise>
						</c:choose>

						<!-- Nav -->
						<nav id="nav">
							<a href="${pageContext.request.contextPath}/manager/index" class="active">테이블 현황</a> 
							<a href="${pageContext.request.contextPath}/manager/tableSalesForm">테이블 매출</a> 
							<a href="${pageContext.request.contextPath}/manager/daysales">일별 매출</a> 
							<a href="${pageContext.request.contextPath}/manager/pricePolicyForm">요금 테이블</a> 
							<a href="${pageContext.request.contextPath}/manager/settingsForm">관리자 설정</a>
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
							<header>
								<h2>테이블 현황</h2>
							</header>
							<div id="tablelist">
								<c:forEach items="${cueTableList}" var="cueTableVo">
									<div class="tableArea" data-biliardno="${cueTableVo.biliardNo}" data-tableno="${cueTableVo.tableNo}" data-tablename="${cueTableVo.tableName}" data-tabletype="${cueTableVo.tableType}" >
										<large class="font-weight-normal text-blue float-left"><strong>No. ${cueTableVo.tableName}</strong></large>
											<div class="small float-right">
												<c:if test="${cueTableVo.tableType==0}" >
													<strong>대대</strong>
												</c:if>
												<c:if test="${cueTableVo.tableType==1}" >
													<strong>중대</strong>
												</c:if>
												<c:if test="${cueTableVo.tableType==2}" >
													<strong>포켓</strong>
												</c:if>
											</div>
											<div class="tableTime pt-8 pl-2">
											    00:43
											</div>
											<br><br>
											<div class="tablePay">
												<strong>9,000원</strong>
											</div>
									</div>
								</c:forEach>
								<!-- 테이블 추가버튼 -->
								<div class="tableAdd">
									<img src="${pageContext.request.contextPath}/assets/images/addbt.png"/>
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
							<form action="${pageContext.request.contextPath}/manager/tableInfo" method="get">
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">테이블 종류</label>
									<div id="" class="col">
										<label class="custom-control custom-radio d-inline-block">
											<input type="radio" name="tabletype" value="0" class="custom-control-input"  />
											<span class="custom-control-label">대대</span>
										</label> 
										<label class="custom-control custom-radio d-inline-block">
											<input type="radio" name="tabletype" value="1" class="custom-control-input"  /> 
											<span class="custom-control-label">중대</span>
										</label> 
										<label class="custom-control custom-radio d-inline-block">
											<input type="radio" name="tabletype" value="2" class="custom-control-input"  /> 
											<span class="custom-control-label">포켓</span>
										</label>
											<button id="tableSetting" type="button">
										     	<img src="${pageContext.request.contextPath}/assets/images/settings.png" width="15px"/>
										    </button>
									</div>
								</div>

<!-- 게임종류	 -->							
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">게임 종류</label>
									<div class="col">
										<div class="gametype-1">
											<label class="custom-control custom-radio d-inline-block">
												<input type="radio" name="gametype0" class="custom-control-input" /> 
												<span id="gametype" class="custom-control-label">3구</span>
											</label> 
											<label class="custom-control custom-radio d-inline-block">
												<input type="radio" name="gametype1" class="custom-control-input" /> 
												<span id="gametype" class="custom-control-label">4구</span>
											</label>
										</div>
										<div class="gametype-2" style="display: none">
											<label class="custom-control custom-radio d-inline-block">
												<input type="radio" name="gametype2" class="custom-control-input" /> 
												<span id="gametype" class="custom-control-label">8볼</span>
											</label> 
											<label class="custom-control custom-radio d-inline-block">
												<input type="radio" name="gametype3" class="custom-control-input" /> 
												<span id="gametype" class="custom-control-label">10볼</span>
											</label>
										</div>
									</div>
								</div>
<!-- 고객정보	 -->								
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">고객정보</label>
									<div class="col">
										<textarea name="" class="form-control mb-1" rows="5" maxlength="1000" disabled></textarea>
									</div> 
								</div>
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">요금제</label>
									<div class="col input-group">
										<span class="input-group-prepend">
											<span class="input-group-text px-2 text-tiny" style="height: 2rem;">10분당</span>
										</span>
										<input type="text" id="tableFee" class="form-control form-control-sm px-2" maxlength="4" readonly/> 
											<span class="input-group-append">
												<span class="input-group-text px-2 text-tiny" style="height: 2rem;">원</span>
											</span>
									</div>
								</div>
<!-- 시작시간	 -->								
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">시작 시간</label>
									<div class="col-4">
										<input type="text" id="startTime" class="form-control form-control-sm mb-1" maxlength="20" readonly />
									</div>
								</div>
<!-- 이용시간	 -->								
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">이용 시간</label>
									<div class="col">
										<textarea name="" class="form-control mb-1" rows="5" maxlength="1000" readonly></textarea>
									</div> 
								</div>
<!-- 종료시간	 -->								
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">종료 시간</label>
									<div class="col-4">
										<input type="text" id="endTime" class="form-control form-control-sm mb-1" maxlength="20"	readonly />
									</div>
								</div>
<!-- 결제금액	 -->								
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">총 결제금액</label>
									<div class="col input-group">
										<input type="text" name="" class="form-control" maxlength="20" readonly />
									</div>
								</div>

								<div class="mt-4" style="position: absolute; bottom: 32px;">
									<button type="submit" class="btn btn-red btn-lg btn-block">정 산</button>
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

<div class="modal fade modal-center" id="tableMngModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-center">
    <div class="modal-content">
		<div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
		    <h4 class="modal-title" id="mySmallModalLabel"><strong>테이블 변경</strong></h4>
		</div>
      <div class="modal-body">
        <label for="inputEmail3" class="label01">테이블 종류</label>
		<div id="" class="col">
			<label class="custom-control custom-radio d-inline-block">
				<input type="radio" name="tabletype" value="0" class="custom-control-input"  /> 
				<span class="custom-control-label">대대</span>
			</label> 
			<label class="custom-control custom-radio d-inline-block">
				<input type="radio" name="tabletype" value="1" class="custom-control-input"  /> 
				<span class="custom-control-label">중대</span>
			</label> 
			<label class="custom-control custom-radio d-inline-block">
				<input type="radio" name="tabletype" value="2" class="custom-control-input"  /> 
				<span class="custom-control-label">포켓</span>
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

<div class="modal fade modal-center" id="tableAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-center">
    <div class="modal-content">
		<div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
		    <h4 class="modal-title" id="mySmallModalLabel"><strong>테이블 추가</strong></h4>
		</div>
      <div class="modal-body">
      	<label for="inputEmail3" class="label01">테이블 번호</label>
      	<input class="form-control-2 " id="tableName" type="text" name="" >
      	<br>
        <label for="inputEmail3" class="label01">테이블 종류</label>
		<div id="" class="col">
			<label class="custom-control custom-radio d-inline-block">
				<input type="radio" name="tabletype1" value="0" class="custom-control-input"  />
				<span class="custom-control-label">대대</span>
			</label> 
			<label class="custom-control custom-radio d-inline-block">
				<input type="radio" name="tabletype1" value="1" class="custom-control-input"  /> 
				<span class="custom-control-label">중대</span>
			</label> 
			<label class="custom-control custom-radio d-inline-block">
				<input type="radio" name="tabletype1" value="2" class="custom-control-input"  /> 
				<span class="custom-control-label">포켓</span>
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
	
	
</body>

<script type="text/javascript">
let crtbiliardNo=0;//현재 선택된 당구장넘버
let crtTableNo=0; //현재 선택된 테이블넘버
let crtTableName=0; //현재 선택된 테이블네임

<!--테이블 추가클릭------------------------------------------------------- -->
$(".tableAdd").on("click",function(){
	console.log('테이블 추가버튼');
	
	$('#tableAddModal').modal('show');
});

<!--테이블 추가하기------------------------------------------------------ --->
$("#btnAdd").on("click", function(){
	console.log("테이블 추가하기");
	
	var addtableName = $("#tableName").val(); //테이블이름 초기화
	console.log(addtableName);
	var addtableType = $('#tableAddModal [name="tabletype1"]:checked').val(); //테이블타입 초기화
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
	 			$(".col input[type='radio']").prop("checked", false);	//라디오버튼 당구장종류 초기화
					
				$("#info-01").append("No."+jsonResult.data.oneTable.tableName); //테이블이름 출력
				
				$('[value='+jsonResult.data.oneTable.tableType+']').prop("checked",true); //테이블타입 라디오버튼 선택
				
				if(jsonResult.data.oneTable.tableType < 2 ){ //게임타입정보 대대/중대일때 3구/4구 show 포켓일때 8볼/10볼 show
					$( ".gametype-2" ).hide();
					$( ".gametype-1" ).show();
				}else{
					$( ".gametype-1" ).hide();
					$( ".gametype-2" ).show();
				}
				
				var tableFee = 0;
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
				
				if(jsonResult.data.gamesVo!=null){ //게임정보 있는 경우 보여주기
					$('[name=gametype'+jsonResult.data.gamesVo.gameType+']').prop("checked",true); //게임타입정보 라디오버튼 선택
	
					var startTime = jsonResult.data.gamesVo.startTime; 
					var date = new Date(startTime);
					var hours = date.getHours();
					var minutes = date.getMinutes();
	
					// 시간 형식 변환
					var formattedHours = hours % 12 === 0 ? 12 : hours % 12; // 12시간 형식으로 변환
					var amPm = hours < 12 ? '오전' : '오후'; // 오전/오후 구분
	
					var formattedStartTime = amPm + ' ' + formattedHours + ':' + (minutes < 10 ? '0' : '') + minutes; // 시간과 분을 조합하여 형식화된 시작 시간 생성
	
					$('#startTime').val(formattedStartTime); //시작시간 표기(오전/오후 시간:분)
				}
				
				
			}else{
				
			} 
		},
		error : function(XHR, status, error) { 
			console.error(status + " : " + error);
		}
    }); //ajax end
	
});

<!--테이블 변경모달창 호출------------------------------------------------------- -->
 $(".form-group").on("click","#tableSetting", function(){
	console.log("설정클릭");
	
	console.log("선택된 테이블넘버:"+crtTableNo);

	$('#tableMngModal').modal('show');

});  

 <!--table종류변경 팝업 수정버튼 클릭했을때--------------------------------------------->
  $("#btnSave").on("click", function(){
	console.log("테이블종류 변경클릭");
		
	let tabletype = $('#tableMngModal [name="tabletype"]:checked').val();
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
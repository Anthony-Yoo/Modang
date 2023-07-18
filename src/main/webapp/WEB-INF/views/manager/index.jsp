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
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
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

						<!-- User menu -->
						<ul>
							<!-- <li><a href="#" class="btn btn-sm">로그인</a></li> -->
							<li class="mr-2"><strong>홍길동</strong>님</li>
							<li><a href="#" class="btn btn-sm">로그아웃</a></li>
							<li><a href="#" class="btn btn-sm">모두의 당구장</a></li>
						</ul>

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

					<!-- Table -->
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
								
							</div>							
						</section>
					</div>

					<!-- Form -->
					<div class="col-4">
						<section>
							<header>
								<h2 id="info-01">테이블</h2>
							</header>

							<form action="${pageContext.request.contextPath}/manager/tableInfo" method="get">
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">테이블 종류</label>
									<div id="" class="col">
										<label class="custom-control custom-radio d-inline-block">
											<input type="radio" name="tabletype0" class="custom-control-input" />
											<span class="custom-control-label">대대</span>
										</label> 
										<label class="custom-control custom-radio d-inline-block">
											<input type="radio" name="tabletype1" class="custom-control-input" /> 
											<span class="custom-control-label">중대</span>
										</label> 
										<label class="custom-control custom-radio d-inline-block">
											<input type="radio" name="tabletype2" class="custom-control-input" /> 
											<span class="custom-control-label">포켓</span>
										</label>
										     <a href="${pageContext.request.contextPath}/manager/settings"><img src="${pageContext.request.contextPath}/assets/images/settings.png" width="15px"/></a>
									</div>
								</div>
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
										<input type="text" name="" class="form-control form-control-sm px-2" maxlength="4" disabled /> 
											<span class="input-group-append">
												<span class="input-group-text px-2 text-tiny" style="height: 2rem;">원</span>
											</span>
									</div>
								</div>
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">시작 시간</label>
									<div class="col-4">
										<input type="text" name="" class="form-control form-control-sm mb-1" maxlength="20" disabled />
									</div>
								</div>
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">이용 시간</label>
									<div class="col">
										<textarea name="" class="form-control mb-1" rows="5" maxlength="1000" disabled></textarea>
									</div> 
								</div>
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">종료 시간</label>
									<div class="col-4">
										<input type="text" name="" class="form-control form-control-sm mb-1" maxlength="20"	disabled />
									</div>
								</div>
								<div class="form-group row mb-1">
									<label class="col-form-label col-4">총 결제금액</label>
									<div class="col input-group">
										<input type="text" name="" class="form-control" maxlength="20" disabled />
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
</body>

<script type="text/javascript">
	
$(".tableArea").on("click",function(){
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
	 			$(".col input[type='radio']").prop("checked", false);	//라디오버튼 당구장종류 초기화
					
				   console.log("성공");
				$("#info-01").append("No."+jsonResult.data.tableName);
				$('[name=tabletype'+jsonResult.data.tableType+']').prop("checked",true);
				if(jsonResult.data.tableType < 2 ){
					$( ".gametype-2" ).hide();
					$( ".gametype-1" ).show();
				}else{
					$( ".gametype-1" ).hide();
					$( ".gametype-2" ).show();
				}
				$('[name=gametype'+jsonResult.data.gameType+']').prop("checked",true);
				
			}else{
				
			} 
		},
		error : function(XHR, status, error) { 
			console.error(status + " : " + error);
		}
    }); //ajax end
	
});

</script>


</html>
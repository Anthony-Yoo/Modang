<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modang 관리자 회원가입</title>
<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
<link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet"
	type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/manager.css" rel="stylesheet"
	type="text/css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e86c03dc169e845e1ac8650bdaa97ae6a"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
</head>
<body>
	<!-- 헤더 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
	<!-- 헤더 끝 -->
	<div id="main-content">
		<div class="container">
			<h2>환영합니당</h2>
			<h3>관리자 정보</h3>
			<form action="${pageContext.request.contextPath}/manager/join" id="" method="post"
				enctype="multipart/form-data">
				<div class="join-wrap">
					<div class="con">
						<!-- 아이디 -->
						<span class="inp-txt">
							<img src="${pageContext.request.contextPath}/assets/images/id.png" alt="아이디" class="icon">
							<input type="text" id="id" name="id" placeholder="아이디">
							<button class="chck" id="btnIdCheck">중복체크</button>
						</span>
						<p class="correct-msg">사용가능한 아이디입니당</p>
						<p class="error-msg">사용가능한 아이디입니당</p>
					</div>
					<div class="con">
						<!-- 비밀번호 -->
						<span class="inp-txt">
							<img src="${pageContext.request.contextPath}/assets/images/passwd.png" alt="비밀번호" class="icon">
							<input type="password" id="passwd" name="passwd" placeholder="비밀번호">
						</span>
					</div>
					<div class="con">
						<!-- 사업자등록번호 -->
						<span class="inp-txt">
							<img src="${pageContext.request.contextPath}/assets/images/file.png" alt="사업자 등록번호" class="icon">
							<input type="text" id="companyNo" name="companyNo" placeholder="사업자 등록번호">
						</span>
					</div>
					<div class="con">
						<!-- 이름 -->
						<span class="inp-txt">
							<img src="${pageContext.request.contextPath}/assets/images/user.png" alt="이름" class="icon">
							<input type="text" id="repName" name="repName" placeholder="이름">
						</span>
					</div>
					<div class="con">
						<!-- 매장이름 -->
						<span class="inp-txt">
							<img src="${pageContext.request.contextPath}/assets/images/home.png" alt="매장 이름" class="icon">
							<input type="text" id="biliardName" name="biliardName" placeholder="매장 이름">
						</span>
					</div>
					<div class="con">
						<!-- 매장주소/우편번호 찾기 -->
						<span class="inp-txt">
							<img src="${pageContext.request.contextPath}/assets/images/map.png" alt="매장 주소" class="icon">
							<input type="text" class="post" id="postcode" name="postcode" placeholder="우편번호">
							<input type="button" class="postBt" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" class="addr" id="biliardAddress1" name="biliardAddress1" placeholder="주소"><br>
							<input type="text" class="addr" id="biliardAddress2" name="biliardAddress2" placeholder="상세 주소">
						</span>
					</div>
					<div class="con">
						<!-- 매장번호 -->
						<span class="inp-txt">
							<img src="${pageContext.request.contextPath}/assets/images/phone.png" alt="매장 번호" class="icon">
							<input type="text" id="biliardPhone" name="biliardPhone" placeholder="매장 번호">
						</span>
					</div>
				</div>
				<!-- join-wrap -->
				<h3>매장 정보</h3>
				<div class="join-wrap">
					<div class="con" id="imageContainer">
						<!-- 모든 이미지 포함하는 박스 -->
						<ul class="imageBox">
				            <li>
				            	<!-- 미리보기 이미지 -->
				                <img id="resultImg1" class="resultImg" src="${pageContext.request.contextPath }/upload/${imageFile1}" />
				                <!-- 이미지 파일 입력 요소 -->
				                <input type="file" name="file" class="image" accept="image/*" multiple onchange="previewImage(event, 'resultImg1')" />
				            </li>
				            <li>
				            	<!-- 미리보기 이미지 -->
				                <img id="resultImg2" class="resultImg" src="${pageContext.request.contextPath }/upload/${imageFile2}" />
				                <!-- 이미지 파일 입력 요소 -->
				                <input type="file" name="file" class="image" accept="image/*" multiple onchange="previewImage(event, 'resultImg2')" />
				            </li>
				            <li>
				            	<!-- 미리보기 이미지 -->
				                <img id="resultImg3" class="resultImg" src="${pageContext.request.contextPath }/upload/${imageFile3}" />
				                <!-- 이미지 파일 입력 요소 -->
				                <input type="file" name="file" class="image" accept="image/*" multiple onchange="previewImage(event, 'resultImg3')" />
				            </li>				            
						</ul>
					</div>

					<div class="con">
						<!-- 매장이용시간 -->
						<span class="inp-txt">
							<img src="${pageContext.request.contextPath}/assets/images/clock.png" alt="이용시간" class="icon">
							<input type="time" class="time" name="time1"> ~ <input type="time" class="time" name="time2">
						</span>
					</div>
					<div class="con">
						<!-- 주차 가능여부 -->
						<span class="inp-txt"> <img
							src="${pageContext.request.contextPath}/assets/images/parking.png" alt="주차 여부" class="icon">
							<span class="parking">
								<input type="radio" id="parking1" name="parking" value="Y"><label for="parking1">주차가능하당</label>
								<input type="radio" id="parking2" name="parking" value="N"><label for="parking2">주차 불가능하당</label>
							</span>
						</span>
					</div>
					<div class="con">
						<!-- 추가 내용 -->
						<span class="inp-txt">
							<img src="${pageContext.request.contextPath}/assets/images/file.png" alt="추가 내용" class="icon">
							<input type="text" id="bdComment" name="bdComment" placeholder="추가 정보">
						</span>
					</div>
				</div>
				<!-- join-wrap -->
				<button id="btnJoin" class="button" type="submit">회원가입할거당</button>
			</form>
		</div>
		<!-- container -->
	</div>
	<!-- main-content -->
	<!-- 푸터 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
	<!-- 푸터 끝 -->
</body>
    <!-- 회원가입 완료 메시지를 표시하기 위한 JavaScript 코드 -->
 <script>
    // JSP에서 Java 변수를 JavaScript 변수로 변환
    var successMessage = "${successMessage}";
    var failMessage = "${failMessage}";

    if (successMessage) {
        alert(successMessage); // 회원가입 성공 알림창
        location.href = "/manager/managerLoginForm"; // 로그인 창으로 이동
    } else if (failMessage) {
        alert(failMessage); // 회원가입 실패 알림창
    }
</script>
 <script>/*이미지 미리보기*/
	function previewImage(event, imgId) {
		const input = event.target;
		const imgElement = document.getElementById(imgId);

		if (input.files && input.files[0]) {
			const reader = new FileReader();

			reader.onload = function (e) {
			imgElement.src = e.target.result;
			
		};

		reader.readAsDataURL(input.files[0]);
		}
	}
</script> 
<script>
	/*우편변호/주소*/
function execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== ''
								&& /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== ''
								&& data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						/*                 if(extraAddr !== ''){
						 extraAddr = ' (' + extraAddr + ')';
						 } */
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("biliardAddress2").value = extraAddr;
					} else {
						document.getElementById("biliardAddress2").value = '';
					}
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("biliardAddress1").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("biliardAddress2").focus();
				}
			}).open();
	}
</script>
<script>
	/*id중복체크*/
	$("#btnIdCheck").on("click", function(event) {
		event.preventDefault();
		console.log("버튼 클릭");
		//id 추출
		var id = $("[name=id]").val(); //항상 입력한 id→보냈을때 이 id
		console.log(id);
		//통신 ===================================id 뽑아내서 보내서
		$.ajax({
			url : "${pageContext.request.contextPath}/manager/join/idcheck",//주소 요청해야할 곳
			type : "post",
			data : {
				id : id
			},
			dataType : "json", //돌아올때 방식
			success : function(jsonResult) {
				console.log(jsonResult);
				if (jsonResult.result == 'success') {//처리 성공
					//사용가능한지 불가능한지 표현
					if (jsonResult.data == true) {
						//사용가능
						$(".correct-msg").show();
						$(".error-msg").hide();
					} else {
						//사용불가능
						$(".error-msg").show();
						$(".correct-msg").hide();
					}
				} else {
					//메세지 출력
					var msg = jsonResult.failMsg;
					alert(msg);
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
				//alert("서버요청실패");
			}
		});
	});
</script>
</html>
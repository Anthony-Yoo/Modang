<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b-join</title>
<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
<link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/manager.css" rel="stylesheet" type="text/css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=86c03dc169e845e1ac8650bdaa97ae6a&libraries=services"></script>
</head>
<body>
	<!-- 헤더 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
	<!-- 헤더 끝 -->
	<div id="main-content">
		<div class="container">
			<h2>환영합니당</h2>
			<h3>관리자 정보</h3>
			<form action="${pageContext.request.contextPath}/manager/join" id="" method="post">
				<div class="">
						<div class="join-wrap">
							<div class="con">
								<span class="inp-txt">
									<img src="${pageContext.request.contextPath}/assets/images/id.png" alt="아이디ㄲ"> 
									<input type="text" id="id" name="id" placeholder="아이디">
									<a href="" class="chck">중복체크</a>
								</span>
								<p class="error-msg">이미 사용중인 아이디 입니당</p>
							</div>
							<div class="con">
								<span class="inp-txt"> 
									<img src="${pageContext.request.contextPath}/assets/images/settings.png" alt="비밀번호">
									<input type="password" id="passwd" name="passwd" placeholder="비밀번호">
								</span>
							</div>
							<div class="con">
								<span class="inp-txt">
									<img src="${pageContext.request.contextPath}/assets/images/file.png" alt="사업자 등록번호"> 
									<input type="text" id="companyNo" name="companyNo" placeholder="사업자 등록번호">
								</span>
							</div>														
							<div class="con">
								<span class="inp-txt">
									<img src="${pageContext.request.contextPath}/assets/images/user.png" alt="이름">
									<input type="text" id="repName" name="repName" placeholder="이름">
								</span>
							</div>
							<div class="con">
								<span class="inp-txt"> 
									<img src="${pageContext.request.contextPath}/assets/images/home.png" alt="매장 이름"> 
									<input type="text" id="biliardName" name="biliardName" placeholder="매장 이름">
								</span>
							</div>
							<div class="con">
								<span class="inp-txt"> 
									<img src="${pageContext.request.contextPath}/assets/images/map.png" alt="매장 주소">
									<input type="text" id="postcode" name="postcode" placeholder="우편번호">
									<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
									<input type="text" id="biliardAddress1" name="biliardAddress1" placeholder="주소">
									<input type="text" id="biliardAddress2" name="biliardAddress2" placeholder="상세 주소">
									<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
								</span>
							</div>							
							<div class="con">
								<span class="inp-txt">
									<img src="${pageContext.request.contextPath}/assets/images/phone.png" alt="매장 번호"> 
									<input type="text" id="biliardPhone" name="biliardPhone" placeholder="매장 번호">
								</span>
							</div>
							<div class="con">
								<div class="inp-txt">
	
								</div>
							</div>
						</div><!-- join-wrap -->
			</div>
			<h3>매장 정보</h3>
			<div>
				<div class="join-wrap">
					<div class="con">
						<ul>
							<li class="image">
								<img src="${pageContext.request.contextPath}/assets/images/poketball.jpg" alt="포켓볼">
							</li>
							<li class="image">
								<img src="${pageContext.request.contextPath}/assets/images/4gu.jpg" alt="4구">
							</li>
							<li class="image">
								<img src="${pageContext.request.contextPath}/assets/images/smoking.jpg" alt="흡연구역">
							</li>
						</ul>
					</div>
					<div class="con">
						<span class="inp-txt"> 
							<img src="${pageContext.request.contextPath}/assets/images/clock.png" alt="이용시간"> 
							<input type="time" class="input" name="time1">
							 ~ 
							<input type="time" class="input" name="time2">
						</span>
					</div>
					<div class="con">
						<span class="inp-txt">
							<img src="${pageContext.request.contextPath}/assets/images/parking.png" alt="주차 여부">
							<input type="radio" id="parking" name="parking">
						</span>
					</div>
					<div class="con">
						<span class="inp-txt">
							<img src="${pageContext.request.contextPath}/assets/images/file.png" alt="추가 내용">
							<input type="text" id="bdComment" name="bdComment" placeholder="추기 정보">
						</span>
					</div>					
				</div><!-- join-wrap -->
			</div>
				<button id="btnJoin" class="button" type="submit" >회원가입할거당</button>
			</form>
		</div><!-- container -->
	</div><!-- main-content -->
	<!-- 푸터 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
	<!-- 푸터 끝 -->
</body>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });
    
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('ostcode').value = data.zonecode;
                document.getElementById("billardAddress1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("billardAddress2").focus();
            }
        }).open();
    }

    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
</html>
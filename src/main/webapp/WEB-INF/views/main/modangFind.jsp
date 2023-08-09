<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modang 당구장 찾기</title>
	
	<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
	<%-- <link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" /> --%>


    <link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
    <%-- <link href="${pageContext.request.contextPath}/assets/css/manager.css" rel="stylesheet" type="text/css">
     --%>

    <!-- 당구장 찾기 페이지에서만 사용되는 css -->
     <link href="${pageContext.request.contextPath}/assets/css/find.css" rel="stylesheet" type="text/css">
    
    <!-- jquery -->   
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
	<!-- 부트스트랩 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c37d351b11287c4a3b2a8008d77ddff8"></script>
</head>
<body>
    <!-- 헤더 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
    <!-- 헤더 끝 -->
    
    <!-- 메인 컨텐츠-->
	<div id="content">
		<div id="content-header">
			<h2>당구장 찾기</h2>
		</div>
		<!-- //content-heade -->
        <div id="find">
            <div class="b-search-map clearfix" >
            	<div class="b-listWrap">
            		<form action="${pageContext.request.contextPath}/manager/modangfind" method="get" class="b-searchForm">
            			<input class="keyword" type="text" name="keyword" value="">
            			<button type="submit" class="btn-main btn-s">검색</button>
            		</form>
            		<div class="b-searchList">
	            		<ul class="modangList">
	            			<!-- 당구장 리스트 영역 -->
	            		</ul>
            		</div>
            	</div>
            	<div class="mapWrap">
                   <!-- 지도를 표시할 div 입니다 -->
					<div id="map" style="width:878px; height:700px;"></div>
                </div>
            </div>
            <!-- //b-search -->
        </div>
		<!-- //biliard -->
    </div>
	<!-- //content -->
	
	
    <!-- 푸터 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
    <!-- 푸터 끝 -->
    
    
    
    
	    
	    
<div id="modalContainer" class="hidden">
	<div id="modalContent">
    	<div class="modal-header">
	    	<p>☆☆당구장</pd>
		</div>
		
		<div class="modal-body">
			<div class="mImg">
				<img class="m-img-01"  alt="당구장 이미지 1(필수)">
				<img class="m-img-02"  alt="당구장 이미지 2">
				<img class="m-img-03"  alt="당구장 이미지 3">
			</div>
			<div class="mDetail">
				<ul>
				    <li>
				        <img src="${pageContext.request.contextPath}/assets/images/clock.png" alt="시간">
				    	<span class="m-time"></span>
					</li>
					<li>
				        <img src="${pageContext.request.contextPath}/assets/images/phone.png" alt="전화번호">
				    	<span class="m-phone"></span>
					</li>
					
					<li>
				    	<img src="${pageContext.request.contextPath}/assets/images/parking.png" alt="주차 여부">
				    	<span class="m-parking"></span>
					</li>
					<li>
				    	<img src="${pageContext.request.contextPath}/assets/images/map.png" alt="매장 주소">
				    	<span class="m-address"></span>
					</li>
					<li class="txt">
				   		<img src="${pageContext.request.contextPath}/assets/images/file.png" alt="추가 내용">
				        <span class="m-comment"></span>
				    </li>
				</ul>
			</div>
		</div>
		
		<div class="modal-footer">
        	<button id="modalCloseButton" type="button" class="btn-main btn-s">닫기</button>
   		</div>
  	</div>
	
</div>
	    
    
    
</body>


<script>

var markerList = [] ; /* 지도에 표시된 마커정보 배열 */


<!-- 카카오지도 스크립트 -->
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 

var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
<!----------------------------------------------------------------->



/* 화면이 시작될때 */
$(document).ready(function() {
	console.log("당구장 리스트 가져오기");  
	fetchModangList("");
});



//당구장 상세보기 모달창 버튼 클릭했을때 -> 모달창 뜸
$(".modangList").on("click", "li", function() {
	var biliardno = $(this).data("biliardno");
	modalInfo(biliardno);
});

function modalInfo(biliardno){
	console.log("모달창 호출버튼 클릭");
	
	
	$.ajax({			
		url : "${pageContext.request.contextPath}/manager/modang/"+biliardno,		
		type : "get",
		/* contentType : "application/json", */
		dataType : "json",
		success : function(jsonResult){						
			if(jsonResult.result == 'success') {//처리성공	
				console.log("성공");						
				
				var modangVo = jsonResult.data; //모당 정보
				console.log(modangVo);	
				
				var imgUrl = "${pageContext.request.contextPath}/upload/"
				
				$(".m-img-01").prop( 'src', imgUrl+modangVo.imageFile1 );
				$(".m-img-02").prop( 'src', imgUrl+modangVo.imageFile2 );
				$(".m-img-03").prop( 'src', imgUrl+modangVo.imageFile3 );
				
				
				$(".m-time").html( modangVo.time1+ " ~ " + modangVo.time2 );
				$(".m-phone").html( modangVo.biliardPhone );
				
				if(modangVo.parking == 'Y'){
					$(".m-parking").html( "주차가능");
				}else {
					$(".m-parking").html( "주차불가능");
				}
				
				$(".m-address").html( modangVo.biliardAddress1 +" "+ modangVo.biliardAddress1);
				$(".m-comment").html( modangVo.bdComment );
				
				
			}else {//오류처리
				var msg = jsonResult.failMsg;
					//alert(msg);				
			}				
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}		
		
	});	
  
	$("#modalContainer").removeClass("hidden");
}



/* 모달창 닫기 버튼 클릭했을때 */
$("#modalCloseButton").on("click", function() {
  console.log("모달창 닫기버튼 클릭");
  
  $("#modalContainer").addClass("hidden");
});




//검색버튼 눌렀을때
$(".b-searchForm").on("submit", function(e){
	e.preventDefault();
	
	var keyword = $(".keyword").val();
	console.log(keyword);
	
	fetchModangList(keyword);
});


/* 당구장 리스트정보 가져오기 */
function fetchModangList(keyword){
	$.ajax({			
		url : "${pageContext.request.contextPath}/manager/modang",		
		type : "get",
		/* contentType : "application/json", */
		data : {keyword: keyword},
		
		async: false,
		dataType : "json",
		success : function(jsonResult){						
			console.log(jsonResult);	
			if(jsonResult.result == 'success') {//처리성공	
				console.log("성공");						
				console.log(jsonResult.data);	
				
				var modangList = jsonResult.data; //모당 리스트
				
				//마커그리기
				renderMarker(modangList);
				
				
				//리스트 그리기
				renderModang(modangList)
				
				
			}else {//오류처리
				var msg = jsonResult.failMsg;
					alert(msg);				
			}				
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}		
		
	});	
}


//마커그리기
function renderMarker(modangList){
	console.log("renderMarker()");
	
	/* 이전의 표시된 마커를 지웁니다. */
	for (var i = 0; i < markerList.length; i ++) {
		markerList[i].setMap(null);
	}
	
	/* 마커를 지도위에 표시합니다. */
	for (var i = 0; i < modangList.length; i ++) {
	    var no = modangList[i].biliardNo
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        position: new kakao.maps.LatLng(modangList[i].latitude, modangList[i].longtitude), // 마커를 표시할 위치
	        title: modangList[i].biliardName, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        biliardNo: modangList[i].biliardNo //추가정보
	    });
	    
	    marker.biliardNo = modangList[i].biliardNo;
	    /* 마커를 지도에 표시 */
	    marker.setMap(map);
	    
	    /*
	    var iwContent = '<div class="infowin">'+modangList[i].biliardName+'</div>'
	    var iwPosition = new kakao.maps.LatLng(modangList[i].latitude, modangList[i].longtitude); //인포윈도우 표시 위치입니다
	 	// 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        position : iwPosition, 
	        content : iwContent 
	    });
	      
	    // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	    infowindow.open(map, marker);  
	    */
	    
	    
	   
	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
		    modalInfo(this.biliardNo)
	    });
	    
	    //생성된 마커를 관리배열에 추가합니다
	    markerList.push({id:no, marker: marker});
	    
	    
	}
	
	console.log(markerList);
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(modangList[0].latitude, modangList[0].longtitude);
    
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
    
}







/* 당구장 정보 리스트 출력 */
function renderModang(modangList){
	$(".modangList").empty ();
	
	for(var i=0; i<modangList.length; i++){
		var modangVo = modangList[i];
		console.log(modangVo.imageFile1);
		var str = '';
		str += '<li class="modangItem" data-biliardno="'+modangVo.biliardNo+'"  >';
		str += '    <img src="${pageContext.request.contextPath}/upload/'+modangVo.imageFile1+'" alt="당구장이미지">';
		str += '    <div class="info">';
		str += '        <p class="repname">'+modangVo.biliardName+'</p>';
		str += '        <p class="addr">'+modangVo.biliardAddress1+' '+modangVo.biliardAddress2+'</p>';
		str += '        <p class="sub">'+modangVo.biliardPhone+'</p>';
		str += '    </div>';
		str += '</li>';
		$(".modangList").append(str);
	}
}



</script>
</html>
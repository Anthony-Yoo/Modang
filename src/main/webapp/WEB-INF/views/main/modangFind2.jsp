<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modang 당구장 찾기</title>
	<link rel="icon" sizes="any" href="${pageContext.request.contextPath}/assets/images/favicon.ico" />
    <link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/manager.css" rel="stylesheet" type="text/css">
    
    <!-- 당구장 찾기 페이지에서만 사용되는 css -->
    
    
    
    <!-- jquery -->   
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
	<!-- 부트스트랩 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
</head>
<body>
    <!-- 헤더 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
    <!-- 헤더 끝 -->
    
    
    <div class="main-con">
        <div class="BCon">
            <h2>모당 찾기</h2>
            <div class="con">
                <div class="search">
                    <div class="search-map">
                        <p>주변당구장</p>
                        <select name="" id="do" class="search-add">
                            <option value="시/도">시/도</option>
                            <option value="서울시">서울시</option>
                            <option value="경기도">경기도</option>
                        </select>
                        <select name="" id="gu" class="search-add">
                            <option value="구">구</option>
                            <option value="강동구">강동구</option>
                            <option value="강남구">강남구</option>
                            <option value="송파구">송파구</option>
                            <option value="어쩌구">어쩌구</option>
                                <option value="저쩌구">저쩌구</option>
                        </select>
                        <select name="" id="dong" class="search-add">
                            <option value="동">동</option>
                            <option value="천호동">천호동</option>
                            <option value="풍납동">풍납동</option>
                            <option value="성내동">성내동</option>
                        </select>
                        <button type="button">검색</button>
                    </div>
                    <div class="search-list">
                        <input type="text" id="" name="" placeholder="당구장 이름으로 검색">
                        <button type="button">검색</button>
                    </div>
                </div>
                <div class="map">
                    <div class="mapImg">
                        <img src="${pageContext.request.contextPath}/assets/images/map1.png" alt="지도">
                    </div>
                </div>
                <div class="modang_list">
                    <ul id="modanglist">
                    	<c:forEach var="biliVo" items="${modanglist}">
	                        <li class="modangList">
	                        	<img src="${pageContext.request.contextPath }/upload/${biliVo.imageFile1}" alt="당구장이미지">
	                            <div class="txt">
	                                <p class="repname">${biliVo.biliardName}</p>
	                                <p class="addr">${biliVo.biliardAddress1} ${biliVo.biliardAddress2}</p>
	                            </div>
	                        </li>
                        </c:forEach>                        
                    </ul>
                </div>
            </div>
        </div>
    </div>    
    <!-- 푸터 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
    <!-- 푸터 끝 -->
    
    <!--당구장 상세보기 모달창-->
    <div class="modal fade" id="detailModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <!--<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>-->
                    <h4>☆☆당구장</h4>
                </div>
                <div class="modal-body">
                    <div class="mView">
                        <div class="mImg">
                            <img src="${pageContext.request.contextPath}/assets/images/room.jpg" alt="당구장 이미지 1(필수)">
                            <img src="${pageContext.request.contextPath}/assets/images/ori.png" alt="당구장 이미지 2">
                            <img src="${pageContext.request.contextPath}/assets/images/smoking.jpg" alt="당구장 이미지 3">
                        </div>
                        <div class="mDetail">
                            <ul>
                                <li>
                                    <img src="${pageContext.request.contextPath}/assets/images/clock.png" alt="시간">
                                    <span>11:00 ~24:00</span>
                                </li>
                                <li>
                                    <img src="${pageContext.request.contextPath}/assets/images/parking.png" alt="주차 여부">
                                    <span>주차 가능</span>
                                </li>
                                <li>
                                    <img src="${pageContext.request.contextPath}/assets/images/map.png" alt="매장 주소">
                                    <span>강동구 강동동 강동 88-88 2층</span>
                                </li>
                                <li class="txt">
                                    <img src="${pageContext.request.contextPath}/assets/images/file.png" alt="추가 내용">
                                    <span>가브리엘 국제식 대대 5대 및 중대, 포켓볼을 구비한 강동구 최고 시설</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫당</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
	$(document).ready(function() {
	    // 당구장 상세보기 모달창 호출 버튼 -> 모달창 뜸
	    $(".modangList").on("click", function() {
	        console.log("모달창 호출버튼 클릭");
	
	        // 모달창 호출
	        $('#detailModal').modal('show');
	    });
	});
</script>
<script>
   
</script>
</html>
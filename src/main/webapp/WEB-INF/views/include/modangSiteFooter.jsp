<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>
    <div id="footer">
        <div class="container">
            <div class="f_left">
                <div class="f_logo">
                    <img src="${pageContext.request.contextPath}/assets/image/modang_logo1.jpg" alt="하단로고">
                </div><!-- //.f_logo -->
                <ul class="">
                    <li>회사명 : 이도단짱</li>
                    <li>대표자 : 유상우</li>
                    <li class="no_bar">
                        사업자등록번호 : 123-4-567-890 
                        <a href="#">사업자번호조회 &gt;</a>
                    </li>
                    <li>주소 : 서울특별시 강동구 천호대로 1027 5층</li>
                    <li class="no_bar">개인정보관리책임자 : 박유준</li>
                    <li>고객센터 : 18-8282-9999 </li>
                    <li class="no_bar">
                        이메일 : 
                        <a href="">abcd@efg.com</a> 
                    </li>
                </ul>
                <p class="copy">
                    Copyright ⓒ Hyesun. All Rights Reserved.
                </p>
            </div><!-- //.f_left -->
            <div class="f_right">
                <ul class="f_menu">
                    <li><a href="#">개인정보처리방침</a></li>
                    <li><a href="#">이용안내</a></li>
                    <li><a href="#">이용약관</a></li>
                </ul><!-- //.f_menu -->
                <ul class="sns">
                    <li><a href="#"><img src="${pageContext.request.contextPath}/assets/image/kakao32.png" alt="카카오톡"></a></li>
                    <li><a href="#"><img src="${pageContext.request.contextPath}/assets/image/facebook32.png" alt="페이스북"></a></li>
                    <li><a href="#"><img src="${pageContext.request.contextPath}/assets/image/insta32.png" alt="인스타"></a></li>
                </ul>
            </div><!-- //.f_right -->
        </div><!-- //.container -->
    </div>
</body>

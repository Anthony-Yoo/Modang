<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="sideNav">
		<div id="userPage" class="sidebar">
			<a class="active" href="${pageContext.request.contextPath}/user/userPage">회원정보</a> <a href="userPage">친구목록</a>
			<a href="userPage">그룹친구</a> <a
				href="${pageContext.request.contextPath }/attendUsers/myPage/applyMenu">게시판매칭</a>
			<a href="userPage">전적보기</a>
		</div>
	</div>
</body>
</html>
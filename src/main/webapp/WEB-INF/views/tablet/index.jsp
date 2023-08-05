<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no,maximum-scale=1.0, minimum-scale=1.0">
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
		<title>Insert title here</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
		<link href="${pageContext.request.contextPath}/assets/css/tablet.css" rel="stylesheet" type="text/css">
		<style>
			#container {background:#094e94;border-radius:10px; z-index: 1;	border: 1px;width: 1200px;height: 768px;position: absolute;left: 50%;	top: 50%;transform: translate(-50%, -50%);}
			input:focus {outline: 2px solid #d50000;} /* outline 테두리 속성 수정 */
			input:focus {outline: none;} /* outline 테두리 없애기 */			
			.mid {height: 760px;}
			.bdtop {width : 500px;height: 50px;outline: 1px solid black;}
			.panel {width : 160px;height: 250px;outline: 1px solid black;font: 20px bold;}
			.tableType {font: 20px bold;}
			.tableName {font: 80px bold;text-align: center; color: white;}
			.float-r {float: right; }
			.float-l {float: left; }
			.clear{clear: both; }	
		
		</style>
	</head>
	<body>
		<div id="container">		
			<!-- Mid Info -->		
			<div class="mid" id="mid-scores">
				<div class="title"><사용할 테이블을 선택하세요>
				</div>
				<c:forEach var="tableVo" items="${tableList}">
					<c:choose>
						<c:when test = "${tableVo.tableType eq 0}">
							<div class="tableStatus1 float-l tb-${tableVo.tableStatus}" id="boardno-${tableVo.tableNo}" data-no="${tableVo.tableStatus}" onclick="location.href='${pageContext.request.contextPath}/tablet/${tableVo.tableNo}/loginForm'">						
								<input class="tableType" type="button" value="대대"><p class="tableName">${tableVo.tableName}</p>								
							</div>
						</c:when>
						<c:when test = "${tableVo.tableType eq 1}">
							<div class="tableStatus2 float-l tb-${tableVo.tableStatus}" id="boardno-${tableVo.tableNo}" data-no="${tableVo.tableStatus}" onclick="location.href='${pageContext.request.contextPath}/tablet/${tableVo.tableNo}/loginForm'">						
								<input class="tableType" type="button" value="중대"><p class="tableName">${tableVo.tableName}</p>								
							</div>
						</c:when>
						<c:when test = "${tableVo.tableType eq 2}">
							<div class="tableStatus3 float-l tb-${tableVo.tableStatus}" id="boardno-${tableVo.tableNo}" data-no="${tableVo.tableStatus}" onclick="location.href='${pageContext.request.contextPath}/tablet/${tableVo.tableNo}/loginForm'">						
								<input class="tableType" type="button" value="포켓"><p class="tableName">${tableVo.tableName}</p>								
							</div>
						</c:when>
					</c:choose> 
				</c:forEach>				
			</div>
		</div>
	</body>
<script>
</script>
</html>
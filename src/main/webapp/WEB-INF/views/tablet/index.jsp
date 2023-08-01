<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
		<title>Insert title here</title>
		<style>
		/*reset*/
			html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video { margin: 0; padding: 0; border: 0; vertical-align: baseline; }
			article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section { display: block; }
			body { line-height: 1; }
			ol, ul { list-style: none; }
			blockquote, q { quotes: none; }
			blockquote:before, blockquote:after, q:before, q:after { content: ''; content: none; }
			table { border-collapse: collapse; border-spacing: 0; }
			body { -webkit-text-size-adjust: none; }
			mark { background-color: transparent; color: inherit; }
			input::-moz-focus-inner { border: 0; padding: 0; }
			input, select, qktextarea { -moz-appearance: none; -webkit-appearance: none; -ms-appearance: none; appearance: none; }
			small {font-size:.75em;}			
			#container {
				border : 1px;
				outline: dashed 1px black;
				width : 1024px;
				height : 768px;
				position : absolute;
				left : 50%;
				top : 50%;
				transform : translate(-50%,-50%);						  	
			}
			input:focus {outline: 2px solid #d50000;} /* outline 테두리 속성 수정 */
			input:focus {outline: none;} /* outline 테두리 없애기 */			
			.mid {
				height: 760px;
			}
			.tableStatus {
				width: 255px;
				height: 255px;
				outline: 2px solid black;
				
			}
			.bdtop {
				width : 500px;
				height: 50px;
				outline: 1px solid black;				
			}
			.panel {
				width : 160px;
				height: 250px;
				outline: 1px solid black;
				font: 20px bold;
			}
			.tableType {
				font: 20px bold;
			}
			.tableName {
				font: 30px bold;
			}
				
			
			
			.float-r {float: right; }
			.float-l {float: left; }
			.clear{clear: both; }	
		
		</style>
	</head>
	<body>
		<div id="container">		
			<!-- Mid Info -->		
			<div class="mid" id="mid-scores">
				<c:forEach var="tableVo" items="${tableList}">
					<c:choose>
						<c:when test = "${tableVo.tableType eq 0}">
							<div class="tableStatus float-l tb-${tableVo.tableStatus}" id="boardno-${tableVo.tableNo}" data-no="${tableVo.tableStatus}" onclick="location.href='${pageContext.request.contextPath}/tablet/${tableVo.tableNo}/loginForm'">						
								<input class="tableType" type="button" value="대대"><p class="tableName">${tableVo.tableName}</p>								
							</div>
						</c:when>
						<c:when test = "${tableVo.tableType eq 1}">
							<div class="tableStatus float-l tb-${tableVo.tableStatus}" id="boardno-${tableVo.tableNo}" data-no="${tableVo.tableStatus}" onclick="location.href='${pageContext.request.contextPath}/tablet/${tableVo.tableNo}/loginForm'">						
								<input class="tableType" type="button" value="중대"><p class="tableName">${tableVo.tableName}</p>								
							</div>
						</c:when>
						<c:when test = "${tableVo.tableType eq 2}">
							<div class="tableStatus float-l tb-${tableVo.tableStatus}" id="boardno-${tableVo.tableNo}" data-no="${tableVo.tableStatus}" onclick="location.href='${pageContext.request.contextPath}/tablet/${tableVo.tableNo}/loginForm'">						
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
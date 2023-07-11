<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			#logtitle {
				color : #404040;
				text-align: center;
				
			}
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
			#imagebox {
				display : inline-block;
				border : 0px;
				width : 350px;
				height :350px;
				
			}
			#blankbox {		
				border : 0px;
				width : 100%;		
  				height: 150px;

			}		
			#idbox {
				border : 0px;		
				margin-left : 50px;	
			}
			.box {
				margin-left : 74px;
				border: 1px solid #404040; 
				background-color: #DDDDDD; 
				border-radius: 5px;
				width : 400px;
				height : 400px;		
			}
			#qrbox img {
				border : 0px;
				display : inline-block;
				width : 400px;
				height : 400px;				
			}			
			#logbox img {
				margin-left : 50px;
				margin-top : 50px;
				border : 0px;
				display : inline-block;
				width : 300px;
				height : 300px;				
			}
			.float-r {float: right; }
			.float-l {float: left; }
			.clear{clear: both; }
		</style>
	</head>
	<body>
		<div id="container">			
			<div class="top" id="blankbox">
			<h2 id="logtitle">Modang</h2>
			</div>
			<div class="content">	
				<div class="box float-l" id="qrbox">
					<img src="${pageContext.request.contextPath}/assets/images/photo.jpg"/>
				</div>
				<div class="box float-l" id="logbox">
					<img src="${pageContext.request.contextPath}/assets/images/photo.jpg"/>
					<div id="idbox">
						<form action="" method="get">
							<input type="text" id="KeyNum">
							<button type="submit" id="keyin">키입력</button>
						</form>
					</div>
				</div>			 
			</div>
		</div>
	</body>
</html>
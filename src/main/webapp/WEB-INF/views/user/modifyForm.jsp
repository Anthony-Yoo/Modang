<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="${pageContext.request.contextPath }/assets/css/board.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/modang.css" rel="stylesheet" type="text/css">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</head>
<style>

    .shadow-none{
      margin: 0 auto;
    }

  </style>
<body>
    <!-- 헤더 시작 -->
	<c:import url="/WEB-INF/views/include/modangSiteHeader.jsp"></c:import>
	<!-- 헤더 끝 -->
        <br>
        <br>

         <div class="container mt-5 text-center">
         
                    <h1><strong>고칠꺼당!!!</strong></h1>
                    <br>
                    <br>
                    
                <div id="user">
				
					<div id="modifyForm">
					
                	<form id="modifyForm" action="${pageContext.request.contextPath }/user/modify" method="get" enctype="multipart/form-data">
                    
                    <div class="form-group">
                      <div class="shadow-none p-1 mb-2 bg-light rounded input-group w-25">
                        <span class="input-group-addon" class="text-large bold"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="id" type="text" maxlength="10" class="form-control" name="id" placeholder="ID">
                        <button type="button" class="btn btn-Dark">  &nbsp;&nbsp;수정&nbsp;&nbsp;  </button>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <div class="shadow-none p-1 mb-2 bg-light rounded input-group w-25">
                        <span class="input-group-addon" class="text-large bold"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="cellphone" type="text" maxlength="11" class="form-control" name="cellphone" placeholder="HP">
                        <button type="button" class="btn btn-Dark">  &nbsp;&nbsp;수정&nbsp;&nbsp;  </button>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="shadow-none p-1 mb-2 bg-light rounded input-group w-25">
                        <span class="input-group-addon" class="text-large bold"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="passwd" type="password" maxlength="16" class="form-control" name="passwd" placeholder="PW">
                        <button type="button" class="btn btn-Dark">  &nbsp;&nbsp;수정&nbsp;&nbsp;  </button>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="shadow-none p-1 mb-2 bg-light rounded input-group w-25">
                        <span class="input-group-addon" class="text-large bold"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="nick" type="text" maxlength="7" class="form-control" name="nick" placeholder="NICK">
                        <button type="button" class="btn btn-Dark">  &nbsp;&nbsp;수정&nbsp;&nbsp;  </button>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="shadow-none p-1 mb-2 bg-light rounded input-group w-25">
                        <span class="input-group-addon" class="text-large bold"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="average" type="text" maxlength="3" class="form-control" name="average" placeholder="AVER">
                        <button type="button" class="btn btn-Dark">  &nbsp;&nbsp;수정&nbsp;&nbsp;  </button>
                      </div>
                    </div>
                    
                    </form>
                    </div>
                </div>
         </div>
            
          	<br>
          	<br>
          	<hr>
          	<br>
          	<br>
          	<br>
    <!-- 푸터 시작 -->
    <c:import url="/WEB-INF/views/include/modangSiteFooter.jsp"></c:import>
    <!-- 푸터 끝 -->   
</body>
</html>
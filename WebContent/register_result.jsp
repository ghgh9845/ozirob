<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" 
      content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
	<br/><br/><br/>
	<div class="container" style="background-image: url(image/oziroper.jpg)">
		<div class="row">
			<br/><br/><br/>
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="panel panel-warning">
					<div class="panel-heading">
						회원 가입 완료
					</div>
					<div class='panel-body'>
						<h2>회원 가입 완료</h2>
					</div>
				</div>
					<c:url var="path" value="/oz_index.jsp"/>
					<a href="${path}"
					   class="btn btn-default btn-block">
					   메인 페이지
					</a>
					
					<c:url var="path2" value="/login_index.jsp"/>
					<a href="${path2}"
					   class="btn btn-default btn-block">
					   로그인 페이지
					</a>
			</div>
			<div class="col-sm-3"></div>
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>      
		</div>
	</div>
</body>
</html>










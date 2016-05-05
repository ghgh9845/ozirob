<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","No-cache");
	response.addHeader("Cache-Control","No-store");	
	response.setDateHeader("Expires",1L);

	String school_page = request.getContextPath() + "/ssul/oz_school.jsp";
	String company_page = request.getContextPath() + "/ssul/oz_company.jsp";
	String main_page = request.getContextPath() + "/ssul/oz_main.jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body style="background-color:#d1c25e">
	
		<div class="container" style="background-color:white; margin-top:100px;" >
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
			<h1>김민지님 반갑습니다</h1>
			<ul class="nav nav-tabs">
				<li class="active" data-toggle="tab"><a href="<%=main_page%>">가족</a></li>
				<li data-toggle="tab"><a href="<%=school_page%>">학교</a></li>
				<li data-toggle="tab"><a href="<%=company_page%>" >회사</a></li>
			</ul>
				<table class="table table-hover"
				       id="board_list">
				   <thead>
				   	  <tr>
				   	  	<th width="10%">글번호</th>
				   	  	<th>제목</th>
				   	  	<th width="20%">작성자</th>
				   	  </tr>
				   </thead>
				   <tbody>
				   	
				   	   	<tr data-idx="3">
					   		<td>3</td>
					   		<td>hh</td>
					   		<td>김민지</td>
				   		</tr>
				   	
				   	   	<tr data-idx="2">
					   		<td>2</td>
					   		<td>옹</td>
					   		<td>김민지</td>
				   		</tr>
				   	
				   	   	<tr data-idx="1">
					   		<td>1</td>
					   		<td>앙앙</td>
					   		<td>김민지</td>
				   		</tr>
				   	
				   </tbody>
				</table>
				
				<div style="text-align:center">
					<ul class="pagination" id="page_indicator">
						
						   <li>
						   	  
						   	  <a href="/FinalProject/board_main.final?page_num=1">1</a>
						   </li>
						
					</ul>
				</div>
				
				<div style="text-align:right">
					
					<a href="/FinalProject/board_writer.final"
					   class="btn btn-primary">
					   글쓰기
					</a>
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
</body>
</html>
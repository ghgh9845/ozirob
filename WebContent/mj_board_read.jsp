<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="bean.*" %>
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
<body style="background-image: url(image/oziroper.jpg)">
	<br/><br/><br/>
	<div class="container" style="background:white">
		<div class="row box">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<div class="panel panel-success">
					<div class='panel-heading'>
						글읽기
					</div>
					<div class='panel-body'>
						<form class="form-horizontal"
						      role="form">
						   <div class="form-group">
						   	<label class="control-label col-sm-3"
						   	       for="board_write">
						   	       작성자
						   	    <!--   ${requestScope.board_bean.board_writer}, ${sessionScope.user_bean.user_mail}  --> 
						   	</label>
						   	<div class="col-sm-9">
						   		<input type="text" class="form-control"
						   		       id="board_writer"
						   		       value="${requestScope.board_bean.board_writer}" readonly/>
						   	</div>
						   </div>
						   <div class="form-group">
						   	<label class="control-label col-sm-3"
						   	       for="board_subject">
						   	    제목
						   	</label>
						   	<div class="col-sm-9">
						   	  <input type="text" class="form-control"
						   	         id="board_subject"
						   	         value="${requestScope.board_bean.board_title}" readonly/>
						   	</div>
						   </div>
						   <div class="form-group">
						      <label class="control-label col-sm-3"
						             for="board_content">
						         내용
						      </label>
						      <div class="col-sm-9">
						         <pre style="padding:0px">
								<%-- <%
								 	BoardBean board_bean
								 		= (BoardBean)request.getAttribute("board_bean");
								    if(board_bean.getBoard_file_name() != null){
								 %>														         
						         
									<c:url var="path" value="/upload/${requestScope.board_bean.board_file_name}"/>
						         	<img src="${path }"/>
						         <% } %>
						          --%>
						         	${requestScope.board_bean.board_content}
						         </pre>
						      </div>
						   </div>
						   <div style="text-align:right">
						   <%-- 작성자 아이디와 사용자 아이디가 같을 경우 --%>
						   <c:if test="${requestScope.board_bean.board_writer==sessionScope.user_bean.user_mail}">
						   	<c:url var="path" value="/modify_board.final">
						   		<c:param name="board_idx"
						   		     value="${param.board_idx }"/>
						   		<c:param name="page_num"
						   			 value="${param.page_num }" />
						   	</c:url>
						   <!--  	<a href="${path }"
						   	   class="btn btn-primary">
						   	   글 수정
						   	</a>
						   	<c:url var="path" value="/remove_board.final">
						   		<c:param name="board_idx" value="${param.board_idx }"></c:param>
						   	</c:url>
						   	<a href="${path }"
						   	   class="btn btn-danger">
						   	   글 삭제
						   	</a>-->
						   	</c:if>
						   	<c:url var="path" value="/board_main.minji">
						   	</c:url>
						   	<a href="${path}" 
						   	   class="btn btn-info">
						   	  목록보기
						   	</a>
						   </div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
</body>
</html>








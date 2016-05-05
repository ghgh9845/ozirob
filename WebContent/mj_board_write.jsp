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
<script>
	function check_input(){
		if($("#board_subject").val() == ""){
			alert('제목을 입력해주세요');
			$("#board_subject").focus();
			return false;
		}
		
		if($("#board_content").val() == ""){
			alert('내용을 입력해주세요');
			$("#board_content").focus();
			return false;
		}
		
		return true;
	}
</script>
</head>
<body style="background-image: url(image/oziroper.jpg)">
<br/><br/><br/>
	<div class="container" style="background:white">
		<div class="row box">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div class="panel panel-success">
					<div class="panel-heading">
						글 작성하기
					</div>
					<div class="panel-body">
						<c:url var="path" value="/board_write.minji"/>
						<form class="form-horizontal" role="form"
						      method="post"
						      action="${path}"
						      onsubmit="return check_input()">
						   <div class="form-group">
						   	<label class="control-label col-sm-3"
						   	       for="board_title">
						   	   제목
						   	</label>
						   	<div class="col-sm-9">
						   	   <input type="text" class="form-control"
						   	          id="board_title"
						   	          name="board_title"
						   	          placeholder="제목"
						   	          autocomplete="off"
						   	          autofocus="autofocus"/>
						   	</div>
						   </div>
						   <div class="form-group">
						   	<label class="control-label col-sm-3"
						   	       for="board_content">
						   	   내용
						   	</label>
						   	<div class="col-sm-9">
						   	   <textarea name="board_content"
						   	             id="board_content"
						   	             class="form-control"
						   	             placeholder="내용"
						   	             rows="5"></textarea>
						   	</div>
						   </div>
						   <div class="form-group">
<!-- 						   	<label class="control-label col-sm-3"
						   	       for="file_name">
						   	       이미지 첨부
						   	</label>
 -->						   	<div class="col-sm-9">
						   	  <!--  <input type='file' name="board_file_name"
						   	          id="board_file_name"
						   	          class="form-control"
						   	          accept="image/*"/> -->
						   	</div>
						   </div>
						   <div style="text-align:right">
						   	<button type="submit" class="btn btn-primary">
						   		작성하기
						   	</button>
						   	<button type='reset' class="btn btn-danger">
						   		초기화
						   	</button>
						   	<c:url var="path" value="/board_main.minji"/>
						   	<a href="${path}" class="btn btn-info">
						   		메인 페이지
						   	</a>
						   	
						   </div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
</body>
</html>










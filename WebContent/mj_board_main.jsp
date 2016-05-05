<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "No-cache");
	response.addHeader("Cache-Control", "No-store");
	response.setDateHeader("Expires", 1L);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script>
	$(function() {
		// 인디케이터에 페이지 표시 설정
		$("#page_indicator > li:nth-child(${requestScope.page_num})").addClass(
				"active");
		// 글의 항목을 클릭했을 때 처리
		$("#board_list > tbody > tr").click(
				function() {
					// dataset에 설정되어 있는 글 번호를 가지고 온다.
					// 태그객체.data.이름
					var idx = $(this).data("idx");
					location.href = "${board_read_path}?board_idx=" + idx
							+ "&page_num=${requestScope.page_num}";

				});
	});
</script>
</head>
<body style="background-image: url(image/oziroper.jpg)">
	<br />
	<br />
	<br />
	<div class="container" style="background: white">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<%-- 	<%
				UserBean user_bean = (UserBean)session.getAttribute("user_bean");
			
			%> --%>
				<%--	<h1><%=user_bean.getUser_name() %></h1> --%>
				<h1>${sessionScope.user_bean.user_nickname}님반갑습니다</h1>
				<table class="table table-hover" id="board_list">
					<thead>
						<tr>
							<th width="10%">글번호</th>
							<th>제목</th>
							<th width="20%">작성자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board_bean" items="${requestScope.board_list}">
							<tr data-idx="${board_bean.board_idx}">
								<td>${board_bean.board_idx}</td>
								<td>${board_bean.board_title}</td>
								<td>${board_bean.board_writer}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<%-- 페이지 번호 --%>
				<div style="text-align: center">
					<ul class="pagination" id="page_indicator">
						<c:forEach var="i" begin="1" end="${requestScope.page_cnt}">
							<li><c:url var="path" value="/board_main.minji">
									<c:param name="page_num" value="${i}" />
								</c:url> <a href="${path}">${i}</a></li>
						</c:forEach>
					</ul>
				</div>
				<%-- 글쓰기 버튼 --%>
				<div style="text-align: right">
					<c:url var="path" value="/board_write_form.minji" />
					<a href="${path}" class="btn btn-primary"> 글쓰기 </a>

					<c:url var="path1" value="/oz_index.minji" />
					<a href="${path1}" class="btn btn-info"> 메인 페이지 </a>
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>

</body>
</html>
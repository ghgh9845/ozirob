<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","No-cache");
	response.addHeader("Cache-Control","No-store");	
	response.setDateHeader("Expires",1L);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<%-- css 추가 --%>
<c:url var="path" value="/css/link_effect.css"/>
<link rel="stylesheet" href="${path}"/>
<%-- 요청할 주소 --%>
<c:url var="path2" value="/check_user_exist.minji"/>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script>

		function check_user_mail_exist(){
			// 유효성 검사
			if($("#user_mail").val() == "" || $("#user_mail").val().length < 4){
				alert("아이디를 4글자 이상 입력해주세요");
				$("#user_mail").focus();
				return;
			}
			// 파라미터
			var param = {
				user_id : $("#user_mail").val()
			};
			// 요청한다.
			$.ajax({
				url : "${path2}",
				data : param,
				type : "post",
				dataType : "text",
				success : function(data){
					// 없는 아이디인 경우
					if(data.trim() == 'false'){
						$("#check_value").val('1');
						//$("#user_id").attr("readonly", true);
						alert("사용 가능한 아이디 입니다");
					} else {
						alert("이미 존재하는 아이디 입니다");
					}
				}, error : function(a, b, c){
					alert(c);
				}
			});
		
	}
</script>
<style>
	.form-4 {
	    /* Size and position */
	    width: 300px;
	    margin: 60px auto 30px;
	    padding: 10px;
	    position: relative;
	
	    /* Font styles */
	    font-family: 'Raleway', 'Lato', Arial, sans-serif;
	    color: white;
	    text-shadow: 0 2px 1px rgba(0,0,0,0.3);
	}
	
	.form-4 h1 {
	    font-size: 22px;
	    padding-bottom: 20px;
	}
	
	.form-4 input[type=text], .form-4 input[type=password] {
    /* Size and position */
    width: 100%;
    padding: 8px 4px 8px 10px;
    margin-bottom: 15px;

    /* Styles */
    border: 1px solid #4e3043; /* Fallback */
    border: 1px solid rgba(78,48,67, 0.8);
    background: rgba(0,0,0,0.15);
    border-radius: 2px;
    box-shadow: 
        0 1px 0 rgba(255,255,255,0.2), 
        inset 0 1px 1px rgba(0,0,0,0.1);
    -webkit-transition: all 0.3s ease-out;
    -moz-transition: all 0.3s ease-out;
    -ms-transition: all 0.3s ease-out;
    -o-transition: all 0.3s ease-out;
    transition: all 0.3s ease-out;

    /* Font styles */
    font-family: 'Raleway', 'Lato', Arial, sans-serif;
    color: #fff;
    font-size: 13px;
}

.form-4 input::-webkit-input-placeholder {
    color: rgba(37,21,26,0.5);
    text-shadow: 0 1px 0 rgba(255,255,255,0.15);
}

.form-4 input:-moz-placeholder {
    color: rgba(37,21,26,0.5);
    text-shadow: 0 1px 0 rgba(255,255,255,0.15);
}

.form-4 input:-ms-input-placeholder {
    color: rgba(37,21,26,0.5);
    text-shadow: 0 1px 0 rgba(255,255,255,0.15);
}

.form-4 input[type=text]:hover,
.form-4 input[type=password]:hover {
    border-color: #333;
}

.form-4 input[type=text]:focus,
.form-4 input[type=password]:focus,
.form-4 input[type=submit]:focus {
    box-shadow: 
        0 1px 0 rgba(255,255,255,0.2), 
        inset 0 1px 1px rgba(0,0,0,0.1),
        0 0 0 3px rgba(255,255,255,0.15);
    outline: none;
}

/* Fallback */
.no-boxshadow .form-4 input[type=text]:focus,
.no-boxshadow .form-4 input[type=password]:focus {
    outline: 1px solid white;
}

.form-4 input[type=submit] {
    /* Size and position */
    width: 100%;
    padding: 8px 5px;
    
    /* Styles */
    background: linear-gradient(rgba(99,64,86,0.5), rgba(76,49,65,0.7));    
    border-radius: 5px;
    border: 1px solid #4e3043;
    box-shadow: 
    	inset 0 1px rgba(255,255,255,0.4), 
    	0 2px 1px rgba(0,0,0,0.1);
    cursor: pointer;
    transition: all 0.3s ease-out;

    /* Font styles */
    color: white;
    text-shadow: 0 1px 0 rgba(0,0,0,0.3);
    font-size: 16px;
    font-weight: bold;
    font-family: 'Raleway', 'Lato', Arial, sans-serif;
}

.form-4 input[type=submit]:hover {
    box-shadow: 
        inset 0 1px rgba(255,255,255,0.2), 
        inset 0 20px 30px rgba(99,64,86,0.5);
}

/* Fallback */
.no-boxshadow .form-4 input[type=submit]:hover {
    background: #594642;
}

.form-4 label {
    display: none;
    padding: 0 0 5px 2px;
    cursor: pointer;
}

.form-4 label:hover ~ input {
    border-color: #333;
}

.no-placeholder .form-4 label {
    display: block;
}

</style>
</head>
<body>
	<body>
	<br/><br/><br/>
	<div class="container"  style="background-image: url(image/oziroper.jpg)">
		<div class="header"></div>
		<div class="content">
		<form class="form-4"
			  role="form"
			  method="post"
			  action="add_user_pro.minji">
		    <h1>Register</h1>
		    <p>
		        <label for="login">write your email.</label>
		        <input type="text" name="user_mail" 
		        	   id="user_mail"
		        	   placeholder="write your email..." required>
				<button class="btn btn-default" type="button"
						onclick="check_user_mail_exist()">
			    	이메일 중복확인
			    </button>			    
		    </p>
		    <p>
		        <label for="password">Password</label>
		        <input type="password" name='user_pw' placeholder="Password" required> 
		    </p>
			<p>
				<label for="nickname">Nickname</label>
				<input type="text" name="user_nickname" placeholder="nickname" id="nickname" required>
			</p>
		    <p>
		        <input type="submit" name="submit" value="Continue">
		    </p>
		     <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>      
		</form>	
		</div>
		<div class="footer"></div>
	</div>
</body>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>oziRop</title>
<meta name="viewport" 
      content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<%-- css 파일 추가 --%>
<%-- <link rel="stylesheet" href="${path}"/> --%>
<%-- <link rel="stylesheet" type="text/css" href="style.css" />
--%>
<script type="text/javascript">
$(document).ready(function(){
    $('#pop_btn1').popover({
        placement : 'left',
        html : true, 
        content : function() {
        	return $("#test_pop1").html();
        }
    });
    
    $('#pop_btn2').popover({
        placement : 'right',
        html : true, 
        content : function() {
        	return $("#test_pop2").html();
        }
    });
    
    $('#pop_btn3').popover({
        placement : 'left',
        html : true, 
        content : function() {
        	return $("#test_pop3").html();
        }
    });
    $('#pop_btn4').popover({
        placement : 'right',
        html : true, 
        content : function() {
        	return $("#test_pop4").html();
        }
    });
    
    $('body').on('click', function(e){
    	if($(e.target).data('toggle')!=='popover' &&
    			$(e.target).parents('.popover.in').length== 0){
    		$('[data-toggle="popover"]').popover('hide');
    	}
    })
});
</script>
<link rel="stylesheet" type="text/css" href="link_effect.css" />
<style>
	.button1 {
		background-color:black; 
		padding:30%;
		margin-top:150px;
		margin-bottom:150px;
	}	
	.link {
	outline: none;
	text-decoration: none;
	position: relative;
	font-size: 8em;
	line-height: 1;
	color: #9e9ba4;
	display: inline-block;
}

.link--kukuri {
	text-transform: uppercase;
	font-weight: 900;
	overflow: hidden;
	line-height: 1;
	color: #b2b0a9;
}

.link--kukuri:hover {
	color: #b2b0a9;
}

.link--kukuri::after {
	content: '';
	position: absolute;
	height: 16px;
	width: 100%;
	top: 50%;
	margin-top: -8px;
	right: 0;
	background: #F9F9F9;
	transform: translate3d(-100%,0,0);
	transition: transform 0.4s;
	transition-timing-function: cubic-bezier(0.7,0,0.3,1);
}

.link--kukuri:hover::after {
	transform: translate3d(100%,0,0);
}

.link--kukuri::before {
	content: attr(data-letters);
	position: absolute;
	z-index: 2;
	overflow: hidden;
	color: #424242;
	white-space: nowrap;
	width: 0%;
	transition: width 0.4s 0.3s;
}

.link--kukuri:hover::before {
	width: 100%;
}

.popover {
	max-width:100%;
	min-width:100%;
	width:100%;    
}
</style>
</head>
<body>
	<div id="container">
		<div id="header" 
			 style="background-color:#d1c25e; 
			         width:3000px; margin:0 auto; padding:10px;">
				     <p style="font-size:130px">OziRop</p>
			    <!--  <p style=font-size:250%;>OziRob</p>  --> 
			</div>
		<div id="content">
			<div class="row" style="background-image: url(image/oziroper.jpg)">
					 <div class="col-xs-5"></div>
	    			 <div class="col-xs-2">
	 					 <a id="pop_btn1" class="btn btn-default button1 link link--kukuri"
	 					 		 data-toggle="popover" title="오지랖-說[발음 : 오지랍썰]" style="text-decoration:none;">
	 					 		 썰
	 					 </a>
	    			 </div>
	   			     <div class="col-xs-5"></div>	   			     
			</div>
			<div class="row" style="background-image: url(image/ozirop_1.png);">
					 <div class="col-xs-5"></div>
	    			 <div class="col-xs-2">
	    			 	<a id="pop_btn2" class="btn btn-default button1 link link--kukuri"
	 					 		 data-toggle="popover" title="팁" style="text-decoration:none;">
	 					 		 팁
	 					 </a>
	 					 
	    			 </div>
	   			     <div class="col-xs-5"></div>	   			     
			</div>
			<div class="row" style="background-image: url(image/ozirop_2.png)">
					 <div class="col-xs-5"></div>
	    			 <div class="col-xs-2">
	    			 	<a id="pop_btn3" class="btn btn-default button1 link link--kukuri"
	 					 		 data-toggle="popover" title="퍼" style="text-decoration:none;">
	 					 		 퍼
	 					 </a>
	 					 
	    			 </div>
	   			     <div class="col-xs-5"></div>	   			     
			</div>
			<div class="row" style="background-image: url(image/ozirop_non1.png)">
					 <div class="col-xs-5"></div>
	    			 <div class="col-xs-2">
	 					 <a id="pop_btn4" class="btn btn-default button1 link link--kukuri"
	 					 		 data-toggle="popover" title="피" style="text-decoration:none;">
	 					 		 피
	 					 </a>
	    			 </div>
	   			     <div class="col-xs-5"></div>	   			     
			</div>
		</div><!-- content의 div -->
		<div id="footer" class="center-block">footer</div>
	</div>
	
	<div id="test_pop1" class="hide">
		<a href="oz_main.jsp">눌러봐~~</a>
	</div>
	<div id="test_pop2" class="hide">
		<a href="http://google.com">구글로가자</a>
	</div>
	<div id="test_pop3" class="hide">
		<a href="http://naver.com">네이버</a>
	</div>
	<div id="test_pop4" class="hide">
		<a href="http://naver.com">네이버22</a>
	</div>
	
</body>
</html>










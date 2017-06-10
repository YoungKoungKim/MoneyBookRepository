<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Insert title here</title>
<!-- IE10 viewport hack  -->
<script src="assets/js/ie-10-view-port.js"></script>
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css"
   rel="stylesheet">
<link
   href="homeCss/blur-color-variation/assets/css/font-awesome.min.css"
   rel="stylesheet">

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="https://code.jquery.com/jquery-2.2.4.min.js"
   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
   crossorigin="anonymous"></script>
   
<script type="text/javascript">
$(document).ready(function() {
	$('#content').css('min-height', $(window).height()-200);
});
</script>

<style type="text/css">
@import url('http://fonts.googleapis.com/css?family=Lato');
@import url('https://fonts.googleapis.com/css?family=Amatic+SC');
@import url(http://fonts.googleapis.com/css?family=Pacifico);
@font-face {
	font-family: 'NanumGothic';
	src: url(font/NanumBarunGothic_0.ttf) format('truetype');
	
	font-family: 'NanumBarunpenR';
	src: url(font/NanumBarunpenR.ttf) format('truetype');
}

html, body {
	height: auto;
/* 	margin: 0;
	padding: 0; */
}
#header {
	font-family: 'Amatic SC';
	height: 100px;
}

#container {
	background-color: white;
	font-family: NanumBarunpenR;
}
#container #content {
	height: 100%;
	min-height: 900px;
	font-family: NanumBarunpenR;
}
#footer {
	margin-top : 50px;
	padding-top : 15px;
	background-color: #649173;
	width : 100%;
	height: 50px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="header">
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
	</div>
	
	<div id=container>
		<div id="content">
			<tiles:insertAttribute name="content"></tiles:insertAttribute>
		</div>
	</div>
	
	<div id="footer">
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</div>
</body>
</html>
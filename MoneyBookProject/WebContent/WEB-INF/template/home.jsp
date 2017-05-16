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
<!-- BOOTSTRAP CORE CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- ION ICONS STYLES -->
<link href="assets/css/ionicons.css" rel="stylesheet" />
<!-- CUSTOM CSS -->
<link href="assets/css/style.css" rel="stylesheet" />
<!-- IE10 viewport hack  -->
<script src="assets/js/ie-10-view-port.js"></script>

<style type="text/css">
@import url('http://fonts.googleapis.com/css?family=Lato');
@import url('https://fonts.googleapis.com/css?family=Amatic+SC');
@font-face {
	font-family: 'NanumGothic';
	src: url(font/NanumBarunGothic_0.ttf) format('truetype');
	
	font-family: 'NanumBarunpenR';
	src: url(font/NanumBarunpenR.ttf) format('truetype');
}

html, body {
	height: 100%;
/* 	margin: 0;
	padding: 0; */
}
#header {
	background-color: #91D4B5;
	color: #fff;
	padding-top: 30px;
	padding-bottom: 10px;
}
#container {
	height: auto;
	background-color: white;
	font-family: NanumBarunpenR;
}
#container #content {
	min-height: 800px;
	font-family: NanumBarunpenR;
}
#footer {
	margin-top : 50px;
	width : 100%;
    height : auto;
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
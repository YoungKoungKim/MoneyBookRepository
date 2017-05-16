<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
@font-face {
	font-family: 'NanumGothic';
	src: url(font/NanumBarunGothic_0.ttf) format('truetype');
	
	font-family: 'Hanna';
	
	
}

#container {
	min-height: 80%;
	background-color: white;
	font-family: Hanna;
}
#container #content {
	min-height: 300px;
	font-family: Hanna;
}

</style>
</head>
<body>
	<div id=container>
		<div id="content">
			<tiles:insertAttribute name="content"></tiles:insertAttribute>
		</div>
	</div>
</body>
</html>
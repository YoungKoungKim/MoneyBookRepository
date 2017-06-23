<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<style type="text/css">
.root {
	margin: 20px auto auto;
	width: 800px;
	background-color: #f0f8ff;
	border: solid #CCE2D8;
}

.top {
	width: 100%;
	height: 100%;
	text-align: center;
		border-bottom: dashed #CCE2D8;
	
}

.right {
	margin: auto;
	width: 100%;
	text-align: left;
	font-size: 20px;
	border-bottom: solid #CCE2D8;
}

.right #textarea1 {
	width: 798px;
	height: 200px;
}

.bottom {
	
}

.category_td {
	color: #000000;
	font-size: 70px;
	text-align: center;
	width: 150px;
	height: 100px;
	/* margin-left: 5px; */
}

.categoryfont {
	font-size: 20px;
	text-align: center;
}

.titlebar {
	width: 800px;
	border: 1px solid #e4e4e4;
	background: #fff;
	border-radius: 2px;
	transition: .3s;
	-webkit-transition: .3s;
	-moz-transition: .3s;
	-o-transition: .3s;
}

.titlebar #title1 {
	font-size: 30px;
	text-align: center;
	border: solid #ffffff;
}

.titlebar #type1 {
	width: 80px;
	height: 40px;
	margin-right: 20px;
	border: solid #ffffff;
	font-size: 20px;
}

.titlebar #title1:hover {
	border: 1px solid #5B5F61;
	box-shadow: 0px 0px 15px 5px #847F7F;
	-webkit-box-shadow: 0px 0px 15px 5px #847F7F;
	-moz-box-shadow: 0px 0px 15px 5px #847F7F;
}
#it{
	font-size: 70px;
}
.div_category{
	width: 170px; 
	height: 150px; 
	display: inline-block;
}
.div_all{
	font-size: 24px;
}
.myButton {
	background-color: #f0f8ff;
	-moz-border-radius: 9px;
	-webkit-border-radius: 9px;
	border-radius: 9px;
	display: inline-block;
	cursor: pointer;
	color: #000000;
	font-family: Arial;
	font-size: 15px;
	padding: 6px 17px;
	text-decoration: none;
}

.myButton:hover {
	background-color: #91D4B5;
}

.myButton:active {
	position: relative;
	top: 1px;
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<form action="secondBoardUpdate.do">
		<div class="root">
			<div class="top">
				<div class="titlebar">
					<input type="text" id="title1" name="title" value="${board.title}">
				</div>
				<div align="right">
					<table>
						<tr>
							<td style="width: 100px;" align="right" colspan="4">
								<fmt:formatDate value="${board.b_date}" pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<td style="width: 400px" align="right">${board.nick }</td>
							<td style="width: 100px;" align="right">조회수 : ${board.viewNo }</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="right">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<textarea id="textarea1" name="content" style="resize:inherit;" value="${board.content}">${board.content}</textarea>
			</div>
	
			<div class="bottom">
				<input type="hidden" value="${board.boardNo}" name="boardNo">
				<input type="hidden" value="${id_index}" name="id_index">
				 <input type="submit" class="myButton" value="확인"> 
				 <input type="button" class="myButton" value="돌아가기" onclick="location.href='secondBoardDetailView.do?boardNo=${board.boardNo}'">
			</div>
		</div>
	</form>
</body>
</html>
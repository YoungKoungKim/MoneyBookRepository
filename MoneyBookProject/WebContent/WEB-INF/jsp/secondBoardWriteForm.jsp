<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function() {
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth() + 1; //January is 0!
	var yyyy = today.getFullYear();
	if (dd < 10) {
		dd = '0' + dd
	}
	if (mm < 10) {
		mm = '0' + mm
	}
	today = yyyy + '-' + mm + '-' + dd;
	$("#nowDate").text("날짜 : " + today); //날짜 표시
	
	$("#submitBtn").on("click", function(){
		if($("#content1").val() == "" || $("#title").val() == ""){
			alert("내용을 입력해주세요");
			return false;
		} else if($("#title").val().length > 50) {
			  alert("제목은 50자까지 가능합니다.")
			  return false;
		}
	});
});
</script>

<style type="text/css">
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
.root {
margin: auto;
	width: 800px;
	background-color: #f0f8ff;
	border: solid #CCE2D8;
	margin-top: 50px;
}

.top {
	width: 100%;
	height: 100%;
	text-align: center;
	border-bottom: dashed #CCE2D8;
	padding: 20px 5px;
}


.left {
	width: 100%;
	padding: 40px 40px;
	text-align: center;
}

.bottom {
	width: 100%;
	height: 100%;
	clear: both;
	text-align: center;
	padding: 30px 5px;
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
select {
 width: 70px; /* 원하는 너비설정 */ 
 padding: .3em .3em; /* 여백으로 높이 설정 */ 
 margin-right : 10px;
 font-family: inherit; /* 폰트 상속 */ 
 background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
 border: 1px solid #999; 
 border-radius: 0px; /* iOS 둥근모서리 제거 */ 
 -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
 -moz-appearance: none; 
 appearance: none; 
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

</head>
<body>
<div class="root">
		<form action="secondBoardWrite.do">
					<input type="hidden" value="${nick}" name="nick">
					<input type="hidden" value="${id_index}" name="id_index">
			<div class="top">
				<table align="center">
					<tr>
						<td>
							제목 &nbsp; 
							 <input style="width: 400px" type="text" name="title" id="title" placeholder="제목을 입력하세요">
						</td>
						<td>
							<span id="nowDate"></span>
						</td>
					</tr>
				</table>
			</div>
			<div class="bottom">
				<br>
				<textarea style="resize: inherit;" rows="15" cols="110" name="content" id="content1" placeholder="내용을 입력하세요"></textarea>
				<br> 
				<input type="submit" class="myButton" value="확인" id="submitBtn"> 
				<input type="button" class="myButton" value="취소" onclick="location.href='secondBoardList.do'">
			</div>
		</form>
	</div>
</body>
</html>
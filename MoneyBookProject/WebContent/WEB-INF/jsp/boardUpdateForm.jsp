<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="boardcss/boardUpdateForm.css" rel="stylesheet" type="text/css">

 <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	
	
	
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>

	
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.css" rel="stylesheet">	
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">

  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script>


<script type="text/javascript" src="js/boardUpdateForm.js"></script>
</head>
<body>
	<form method="post" id="formsubmit" action="boardUpdate.do">
		<div class="root">
			<div class="top">
				<div class="titlebar">
					<select name="ageType" id="type1">
						<option value="10">10대</option>
						<option value="20">20대</option>
						<option value="30">30대</option>
						<option value="40">40대</option>
					</select> <input type="text" id="title1" name="title"
						placeholder="제목을 입력하세요" value="${board.title}">
				</div>
				<div align="right">
					<table>
						<tr>
							<td style="width: 100px;" align="right" colspan="4"><fmt:formatDate
									value="${board.b_date}" pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<td style="width: 400px" align="right">${board.nick }</td>
							<td style="width: 100px;" align="right">조회수 : ${board.viewNo }</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="left" id="left">
				<div>
					<h2>${year}년${nowMonth }월가계부공유</h2>
					<br>
				</div>
			</div>

			<div class="right">
<%-- 				<div id="summernote">${board.content}</div> --%>
				 <textarea rows="" cols="" style="display:none" id="summernote" name="content">${board.content}</textarea>
				
			</div>

			<div class="bottom">
				<input type="hidden" value="${board.boardNo}"  name="boardNo" id="boardNo">
				<input type="hidden" value="${id_index}" name="id_index"> 
				
				<input type="button" class="myButton" value="확인" id="formsubmitBtn">
				<input type="button" class="myButton" value="돌아가기"
					onclick="location.href='boardDetailView.do?boardNo=${board.boardNo}'">
			</div>
		</div>
	</form>

</body>
</html>
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
 
 <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
 
<link href="boardcss/boardWrite.css" rel="stylesheet" type="text/css">

	

<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
	
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.css" rel="stylesheet">	
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">

  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script>

<script type="text/javascript" src="js/boardWriteForm.js"></script>
</head>

<body>
	<div class="root">
	
		<form action="boardWrite.do" method="post" id="formsubmit">
					<input type="hidden" value="${date}" name="date2" id="date2">
					<input type="hidden" value="${nick}" name="nick">
					<input type="hidden" value="${id_index}" name="id_index">
			<div class="top">
				<table align="center">
					<tr>
						<td width="100px"><select id="ageType" name="ageType">
								<option value="10">10대</option>
								<option value="20">20대</option>
								<option value="30">30대</option>
								<option value="40">40대이상</option>
						</select>
						</td>
						<td>
						제목  <input style="width: 400px" type="text" id="title1" name="title" placeholder="제목을 입력하세요">
						</td>
						<td>
							<span id="nowDate"></span>
						</td>
					</tr>

				</table>

			</div>

			<div class="left" align="center" id="left">
					<div><h2> ${year} 년 ${nowMonth }월 가계부 공유 </h2><br></div>
					
					
			</div>
			<div class="bottom">
				  <div id="summernote"><p>내용을입력하세요</p></div>
				 <textarea rows="" cols="" style="display:none" id="textarea" name="content"></textarea>
			
			<div align="center">
				<span><input type="button" class="myButton" value="확인" id="formsubmitBtn"></span>
				<span></span><input type="button" id="back" class="myButton" value="취소"></span>
			</div>
			</div>
		</form>

	</div>

</body>
</html>
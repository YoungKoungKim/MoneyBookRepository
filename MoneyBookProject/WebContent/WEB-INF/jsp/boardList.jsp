<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<style type="text/css">
select {
	width: 70px; /* 원하는 너비설정 */
	padding: .3em .3em; /* 여백으로 높이 설정 */
	margin-right: 10px;
	font-family: inherit; /* 폰트 상속 */
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%; /* 네이티브 화살표 대체 */
	border: 1px solid #999;
	border-radius: 0px; /* iOS 둥근모서리 제거 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}
a:link {
	color: black;
	text-decoration: none;
}
a:visited {
	color: black;
	text-decoration: none;
}
a {
	text-decoration: none;
	color: black;
	cursor: pointer;
}
a:hover {
	color: black;
	text-decoration: none;
}
.root {
	margin: auto;
	width: 1000px;
	height: auto;
	background-color: #f0f8ff;
}
.left {
	height: auto;
	width: 15%;
	float: left;
	font-size: 15px;
	border-right: solid red;
	text-align: center;
}
.right {
	height: auto;
	width: 80%;
	float: right;
}
.bottom {
	width: 100%;
	height: 100%;
	clear: both;
}
ul {
	list-style: none;
	padding-left: 0px;
}
li {
	padding-left: 10px;
}
.menu .hide {
	display: none;
}
.left .btn btn-default {
	background: #91D4B5;
	color: #E9F2EE;
}
#img1 {
	height: 15px;
	width: auto;
	margin-right: 5px;
}
.myButton {
	background-color: #ffffff;
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
	// html dom 이 다 로딩된 후 실행된다.
	$(document).ready(function() {
		// memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
		$(".menu>a").click(function() {
			// 현재 클릭한 태그가 a 이기 때문에
			// a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
			$(this).next("ul").toggleClass("hide");
		});
	});
</script>

</head>
<body>
	<!-- 		<input type="button" value="공유" id="form" onclick="location.href='boardWriteForm.do?id_index=4&date=2017-04-28'"> -->

	<br>
	<div class="root">
		<div class="left">
			<div>
				<br> &nbsp;&nbsp;&nbsp; <a class="myButton" href="boardList.do">전체게시판
				</a>

			</div>
			<div>
				<br>
				<ul>
					<li class="menu"><a class="myButton">연령별 게시판</a>
						<ul class="hide">

							<li><a class="myButton" href="boardList.do?ageType=10">10대</a>
							<li><a class="myButton" href="boardList.do?ageType=20">20대
							</a></li>

							<li><a class="myButton" href="boardList.do?ageType=30">
									30대</a></li>
							<li><a class="myButton" href="boardList.do?ageType=40">40대
									이상 </a></li>
						</ul></li>
				</ul>
			</div>
		</div>

		<div class="right">
			<div align="right" style="margin-bottom: 20px;">
				<form action="boardList.do">
					<table>
						<tr align="center">
							<td><select name="category">
									<option value="title">제목</option>
									<option value="nick">작성자</option>
							</select></td>
							<td><input style="width: 650px" type="text" name="content">
								<input type="submit" id="searchWhat" value="검색"></td>
						</tr>
					</table>
				</form>
			</div>
			<div>
				<table width="800px" height="100px"
					style="border-bottom: 1px solid #CCE2D8; background-color: #EAF2EE">
					<c:forEach var="best" items="${boardBest }">
						<tr align="center"
							style="border-bottom: 1px solid #CCE2D8; background-color: ##EAF2EE; font-size: 15px; color: red;">
							<td>공지</td>
							
							<td align="left">
							<a style="color: red; margin-right: 100px;"
								href="boardDetailView.do?boardNo=${best.boardNo}">${best.title }
								<samp>[${bset.commentNum}]</samp>
								</a>
							</td>
							
							<td align="left"><img id="img1"
								src="homeCss/assets/images/demo/name.png" alt="" />${best.nick }</td>
								
							<td><img id="img1" src="homeCss/assets/images/demo/date.png"
								alt="" /> <fmt:formatDate value="${best.date }"
									pattern="yyyy-MM-dd" /></td>
									
							<td><img id="img1"
								src="homeCss/assets/images/demo/recommend.png" alt="" />${best.recommend }</td>
							<td><img id="img1" src="homeCss/assets/images/demo/view.png"
								alt="" />${best.viewNo }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div>
				<table width="800px" height="500px"
					style="border-bottom: 1px solid #CCE2D8; background-color: #EAF2EE">
					<c:forEach var="board" items="${boardList }">
						<tr align="center"
							style="border-bottom: 1px solid #CCE2D8; background-color: ##EAF2EE; font-size: 15px; color: red;">
							<td>${board.boardNo }</td>
							
							<td align="left">
							<a style="margin-right: 100px;"
								href="boardDetailView.do?boardNo=${board.boardNo}">${board.title }
									<span>[${board.commentNum}]</span>
							</a></td>
							
							<td align="left"><img id="img1"
								src="homeCss/assets/images/demo/name.png" alt="" />${board.nick }</td>
								
							<td><img id="img1" src="homeCss/assets/images/demo/date.png"
								alt="" /> <fmt:formatDate value="${board.date }"
									pattern="yyyy-MM-dd" /></td>
							<td><img id="img1"
								src="homeCss/assets/images/demo/recommend.png" alt="" />${board.recommend }</td>
							<td><img id="img1" src="homeCss/assets/images/demo/view.png"
								alt="" />${board.viewNo }</td>

						</tr>
					</c:forEach>
				</table>
			</div>
			<div>
				<table>
					<tr align="center">
						<td width="1250px" colspan="5"><c:if test="${start != 1 }">
								<a href="boardList.do?page=${start-1 }">[이전]</a>
							</c:if> <c:forEach begin="${start }" end="${end }" var="i">
								<c:choose>
									<c:when test="${i == current }">
											[${i }]
										</c:when>
									<c:otherwise>
										<a
											href="boardList.do?page=${i }&ageType=${ageType}&content=${content}&category=${category}">[${i }]</a>
									</c:otherwise>
								</c:choose>
							</c:forEach> <c:if test="${end != last }">
								<a href="boardList.do?page=${end+1 }">[다음]</a>
							</c:if></td>
					</tr>
				</table>
			</div>
			<br>
		</div>
	</div>

</body>
</html>
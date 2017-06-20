<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아무말 대잔치 게시판</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<style type="text/css">
.boardNo {
	width: 50px;
	text-align: center;
}

.title {
	width: 300px;
	text-align: left;
}

.nick {
	width: 150px;
	text-align: left;
}

.date {
	width: 150px;
	text-align: center;
}

.recommend {
	width: 70px;
	text-align: center;
}

.ViewNo {
	width: 70px;
	text-align: center;
}

.tablelist {
	border-bottom: 1px solid #CCE2D8;
	background-color: #EAF2EE;
	display: inline-block;
}

.right td {
	border-bottom: 1px solid #CCE2D8;
	background-color: ##EAF2EE;
	font-size: 15px;
	padding: 8px 5px;
}

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
	background-color: #f0f8ff;
}

.left {
	height: auto;
	width: 15%;
	float: left;
	font-size: 15px;
	border-right: solid #CCE2D8;
	text-align: center;
	display: inline-block;
}

.right {
	width: 80%;
	display: inline-block;
	margin-left: 30px;
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

#img1 {
	height: 15px;
	width: auto;
	margin-right: 5px;
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

.boardType {
	margin: 5px 0px 5px 0px;
	font-size: 28px;
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

		$("#backback").click(function() {
			alert("로그인을 해주세요");
		});

	});
</script>
</head>
<body>
	<br>
	<div class="root">
		<div class="left">
			<div>
				<br> &nbsp;&nbsp;&nbsp; <a class="myButton" href="boardList.do">공유게시판</a>
			
			</div>
			<div>
				<br> &nbsp;&nbsp;&nbsp; <a class="myButton"
					href="secondBoardList.do" style="background-color: #91D4B5">자유게시판</a>
			</div>
		</div>

		<div class="right">
			<div align="right" style="margin-bottom: 20px;">
				<div class="col-md-12 boardType" align="left">자유 게시판</div>
				<form action="secondBoardList.do">
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
				<table class="tablelist">
					<c:forEach var="best" items="${boardBest}">
						<tr>
							<td class="boardNo">Best</td>
							<td class="title"><a
								style="color: #FF6753; margin-right: 100px;"
								href="secondBoardDetailView.do?boardNo=${best.boardNo}">${best.title}
									<samp>[${best.commentNum}]</samp>
							</a></td>

							<td class="nick"><img id="img1"
								src="homeCss/assets/images/demo/name.png" alt="" />${best.nick }</td>

							<td class="Date"><img id="img1"
								src="homeCss/assets/images/demo/date.png" alt="" /> <fmt:formatDate
									value="${best.sb_date }" pattern="yyyy-MM-dd" /></td>

							<td class="recommend"><img id="img1"
								src="homeCss/assets/images/demo/recommend.png" alt="" />${best.recommend }</td>

							<td class="ViewNo"><img id="img1"
								src="homeCss/assets/images/demo/view.png" alt="" />${best.viewNo }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div>
				<table class="tablelist">
					<c:forEach var="board" items="${boardList }">
						<tr>
							<td class="boardNo">${board.boardNo }</td>

							<td class="title"><a style="margin-right: 100px;"
								href="secondBoardDetailView.do?boardNo=${board.boardNo}">${board.title }
									<span>[${board.commentNum}]</span>
							</a></td>

							<td class="nick"><img id="img1"
								src="homeCss/assets/images/demo/name.png" alt="" />${board.nick }</td>

							<td class="Date"><img id="img1"
								src="homeCss/assets/images/demo/date.png" alt="" /> <fmt:formatDate
									value="${board.sb_date }" pattern="yyyy-MM-dd" /></td>

							<td class="recommend"><img id="img1"
								src="homeCss/assets/images/demo/recommend.png" alt="" />${board.recommend }</td>

							<td class="ViewNo"><img id="img1"
								src="homeCss/assets/images/demo/view.png" alt="" />${board.viewNo }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div>
				<table>
					<tr align="center">
						<td width="1250px" colspan="5"><c:if test="${start != 1 }">
								<a href="secondBoardList.do?page=${start-1 }">[이전]</a>
							</c:if> <c:forEach begin="${start }" end="${end }" var="i">
								<c:choose>
									<c:when test="${i == current }">
											<span style="color: red;">[${i }]</span>
										</c:when>
									<c:otherwise>
										<a
											href="secondBoardList.do?page=${i }&content=${content}&category=${category}">[${i }]</a>
									</c:otherwise>
								</c:choose>
							</c:forEach> <c:if test="${end != last }">
								<a href="secondBoardList.do?page=${end+1 }">[다음]</a>
							</c:if></td>
						<c:choose>
							<c:when test="${id_index != null }">
								<td><input type="button" value="글쓰기"
									onclick="location.href='secondBoardWriteForm.do'"></td>
							</c:when>
							<c:when test="${id_index == null }">
								<td><input type="button" value="글쓰기" id="backback">
								</td>
							</c:when>
						</c:choose>
					</tr>
				</table>
			</div>
			<br>
		</div>
	</div>

</body>
</html>
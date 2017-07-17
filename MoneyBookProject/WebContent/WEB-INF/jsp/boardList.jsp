<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="boardcss/boardList.css" rel="stylesheet" type="text/css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>title</title>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>

<script type="text/javascript" src="js/boardList.js">
	
</script>

</head>
<body>
	<!--       <input type="button" value="공유" id="form" onclick="location.href='boardWriteForm.do?id_index=4&date=2017-04-28'"> -->

	<br>
	<div class="root">
		<div class="left">
			<div>
				<br> &nbsp;&nbsp;&nbsp; <a class="myButton" href="boardList.do"
					style="background-color: #91D4B5;">공유게시판</a>
			</div>
			<div>
				<br> &nbsp;&nbsp;&nbsp; <a class="myButton"
					href="secondBoardList.do">자유게시판</a>
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
				<div class="col-md-12 boardType" align="left">
					<c:choose>
						<c:when test="${ageType eq 0 }">공유게시판</c:when>
						<c:when test="${ageType eq 10 }">10대 게시판</c:when>
						<c:when test="${ageType eq 20 }">20대 게시판</c:when>
						<c:when test="${ageType eq 30 }">30대 게시판</c:when>
						<c:when test="${ageType eq 40 }">40대 이상 게시판</c:when>
					</c:choose>
				</div>
				<form action="boardList.do">
					<table>
						<tr align="center">
							<td><select name="category">
									<option value="title">제목</option>
									<option value="nick">작성자</option>
							</select></td>
							<td><input style="width: 650px" type="text" name="content">
							</td>
							<td><input type="submit" id="searchWhat" value="검색"></td>
						</tr>
					</table>
				</form>
			</div>
			<div>
				<table class="table tablelist">
					<thead style="background-color: #91D4B5;">
						<tr>
							<td class="boardNo">글번호</td>
							<td>연령대</td>
							<td class="mainTitle" style="text-align: center;">제목</td>
							<td class="nick">작성자</td>
							<td class="date">작성일</td>
							<td class="recommend">추천</td>
							<td class="viewNo">조회수</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="best" items="${boardBest}">
							<tr class="board_list_tr">
								<td class="boardNo">Best</td>
								<td><span>[${best.ageType}대]</span></td>
								<td class="mainTitle"><a style="color: #FF6753;"
									href="boardDetailView.do?boardNo=${best.boardNo}">${best.title}
										<samp>[${best.commentNum}]</samp>
								</a></td>

								<td class="nick"><img id="img1"
									src="homeCss/assets/images/demo/name.png" alt="" />${best.nick }</td>

								<td class="date"><img id="img1"
									src="homeCss/assets/images/demo/date.png" alt="" /> <fmt:formatDate
										value="${best.b_date }" pattern="yyyy-MM-dd" /></td>

								<td class="recommend"><img id="img1"
									src="homeCss/assets/images/demo/recommend.png" alt="" />${best.recommend }</td>

								<td class="viewNo"><img id="img1"
									src="homeCss/assets/images/demo/view.png" alt="" />${best.viewNo }</td>
							</tr>
						</c:forEach>
						<c:forEach var="board" items="${boardList }">
							<tr class="board_list_tr">
								<td class="boardNo">${board.boardNo }</td>
								<td><span>[${board.ageType}대]</span></td>
								<td class="mainTitle"><a
									href="boardDetailView.do?boardNo=${board.boardNo}">${board.title }
										<span>[${board.commentNum}]</span>
								</a></td>

								<td class="nick"><img id="img1"
									src="homeCss/assets/images/demo/name.png" alt="" />${board.nick }</td>

								<td class="date"><img id="img1"
									src="homeCss/assets/images/demo/date.png" alt="" /> <fmt:formatDate
										value="${board.b_date }" pattern="yyyy-MM-dd" /></td>

								<td class="recommend"><img id="img1"
									src="homeCss/assets/images/demo/recommend.png" alt="" />${board.recommend }</td>

								<td class="viewNo"><img id="img1"
									src="homeCss/assets/images/demo/view.png" alt="" />${board.viewNo }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<!--             <table class="tablelist"> -->
				<%--                <c:forEach var="best" items="${boardBest }"> --%>
				<!--                   <tr class="board_list_tr"> -->
				<!--                      <td class="boardNo">Best</td> -->
				<!--                      <td> -->
				<%--                         <span>[${best.ageType}대]</span> --%>
				<!--                      </td> -->
				<!--                      <td class="title"><a -->
				<!--                         style="color: #FF6753; margin-right: 100px;" -->
				<%--                         href="boardDetailView.do?boardNo=${best.boardNo}&page=${current}">${best.title } --%>
				<%--                            <samp>[${best.commentNum}]</samp> --%>
				<!--                      </a></td> -->

				<!--                      <td class="nick"><img id="img1" -->
				<%--                         src="homeCss/assets/images/demo/name.png" alt="" />${best.nick }</td> --%>

				<!--                      <td class="Date"><img id="img1" -->
				<%--                         src="homeCss/assets/images/demo/date.png" alt="" /> <fmt:formatDate --%>
				<%--                            value="${best.b_date }" pattern="yyyy-MM-dd" /></td> --%>

				<!--                      <td class="recommend"><img id="img1" -->
				<%--                         src="homeCss/assets/images/demo/recommend.png" alt="" />${best.recommend }</td> --%>
				<!--                      <td class="ViewNo"><img id="img1" -->
				<%--                         src="homeCss/assets/images/demo/view.png" alt="" />${best.viewNo }</td> --%>
				<!--                   </tr> -->
				<%--                </c:forEach> --%>
				<!--             </table> -->
				<!--          </div> -->
				<!--          <div> -->
				<!--             <table class="tablelist"> -->
				<%--                <c:forEach var="board" items="${boardList }"> --%>
				<!--                   <tr class="board_list_tr"> -->
				<%--                      <td class="boardNo">${board.boardNo }</td> --%>
				<!--                      <td> -->
				<%--                         <span>[${board.ageType}대]</span> --%>
				<!--                      </td> -->
				<!--                      <td class="title"><a style="margin-right: 100px;" -->
				<%--                         href="boardDetailView.do?boardNo=${board.boardNo}&page=${current}">${board.title } --%>
				<%--                            <span>[${board.commentNum}]</span> --%>
				<!--                      </a></td> -->

				<!--                      <td class="nick"><img id="img1" -->
				<%--                         src="homeCss/assets/images/demo/name.png" alt="" />${board.nick }</td> --%>

				<!--                      <td class="Date"><img id="img1" -->
				<%--                         src="homeCss/assets/images/demo/date.png" alt="" /> <fmt:formatDate --%>
				<%--                            value="${board.b_date }" pattern="yyyy-MM-dd" /></td> --%>
				<!--                      <td class="recommend"><img id="img1" -->
				<%--                         src="homeCss/assets/images/demo/recommend.png" alt="" />${board.recommend }</td> --%>
				<!--                      <td class="ViewNo"><img id="img1" -->
				<%--                         src="homeCss/assets/images/demo/view.png" alt="" />${board.viewNo }</td> --%>

				<!--                   </tr> -->
				<%--                </c:forEach> --%>
				<!--             </table> -->
			</div>
			<div>
				<table>
					<tr align="center">
						<td width="1250px" colspan="5"><c:if test="${start != 1 }">
								<a href="boardList.do?page=${start-1 }">[이전]</a>
							</c:if> <c:forEach begin="${start }" end="${end }" var="i">
								<c:choose>
									<c:when test="${i == current }">
										<span style="color: red;">[${i }]</span>
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
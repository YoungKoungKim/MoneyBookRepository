<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script type="text/javascript">
function getCommentList() {
	var id_index = parseInt('${id_index}');
	$.ajax({
		url : "getCommentList.do",
		type : "get",
		data : "boardNo=" + ${board.boardNo},
		dataType : "json",
		success : function(data) {
			$("#commentTable").html("");
			for(var comment in data) {
				var date = new Date(data[comment].date);
				var time = date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate() + " " + date.getHours() + ":" + date.getMinutes();
					
					if(id_index == data[comment].id_index)
					{

					$("#commentTable").html($("#commentTable").html() + 
							"<tr>	<td>" + data[comment].nick + 
							"&nbsp;&nbsp;&nbsp;" + time + 
							"</td></tr><tr><td> <textarea class='comment' id='comment_"+data[comment].commentNo+"' rows='2' cols='100' readonly='readonly'> "+ data[comment].content + "</textarea> <input class='delete' id='"+data[comment].commentNo+"@' name='"+data[comment].commentNo+"' type='button' value='삭제'>"
							+"<input class='update' type='button' id='"+data[comment].commentNo+"@' name='"+data[comment].commentNo+"' value='수정'> </td> </tr>");
					
					}else {
						$("#commentTable").html($("#commentTable").html() + 
						"<tr>	<td>" + data[comment].nick + 
						"&nbsp;&nbsp;&nbsp;" + time + 
						"</td></tr><tr><td> <textarea rows='2' cols='100' readonly='readonly'> "+ data[comment].content + "</textarea></td>	</tr>");						
					}	
					
					}
					$('.delete').on('click',function(){
						var idno = $(this).attr('id').split('@')[0];
						var commentNo = $(this).attr('name');
						if(idno == commentNo) {
						$.ajax({
							type : 'post',
							url : 'commentDelete.do',
							data : 'commentNo='+commentNo,
							dataType : 'json',
							success : function(data){
								getCommentList();
								alert("삭제완료");
							},
							error:function(){
						      
						       }
						});
						}
					});
					
					$('.update').on('click', function(){
// 						var idno = $(this).attr('id').split('@')[0];
						var btnval =$(this).val();
						var commentNo = $(this).attr('name');
						var content = $('#comment_'+commentNo).val();					
						if(btnval == "수정"){
						$('#comment_' + commentNo).removeAttr("readonly");	
						 	$(this).attr('value','변경');
						}else if(btnval=="변경"){
							$.ajax({
								type : 'post',
								url : 'commentUpdate.do',
								data : 'commentNo='+commentNo +"&content="+content,
								dataType : 'json',
								success : function(data){
									alert("수정완료");
									getCommentList();
								},
								error:function(){
							      
							       }
							});
						}
						
					});
					
				},
				error : function() {
					alert("실패");
				}
			
			});

			}
		
		
	$(document).ready(function() {
		getCommentList();
		
		$('#recommendbtn').on('click', function() {

			$.ajax({
				type : 'post',
				url : 'boardRecommend.do',
				data : 'boardNo='+${board.boardNo},
				dataType : 'json',
				success : function(data) {
					$('#recommend').text(data);
				}, 
				error : function(){
					alert("실패");
				}
			});
		});
	
	$('#commentbut').on('click', function() {
		var content1 = $('#content1').val();
		var nick1 = $('#nick1').val();
		$.ajax({
			type : 'post',
			url : 'commentWrite.do',
			data : 'boardNo='+${board.boardNo}+'&nick1='+ nick1 +'&content1='+ content1 +'&id_index='+'${id_index}',
			dataType : 'json',
			success :  function () {
				$('#content1').val(' ');
				getCommentList();
			},
			error : function() {
				alert('실패');
			}
		});
	});
		
});
</script>
<style type="text/css">
.root {
	margin: auto;
	width: 800px;
	background-color: #f0f8ff;
}

.top {
	width: 100%;
	height: 100%;
	text-align: center;
}

.left {
	width: 100%;
	margin: auto;
}

.right {
	margin: auto;
	width: 100%;
	text-align: left;
	font-size: 20px;
}

.bottom {
	width: 100%;
	height: 100%;
	clear: both;
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

.re_btn {
	background-color: #A8E7ED;
	font-size: 25px;
	text-align: center;
	margin-left: 5px;
	border-radius: .25em;
	border-color: #ffffff;
}
</style>
</head>
<body>
	<br>
	<div class="root">
		<div class="top">
			<center>

				<table>
					<tr>
						<td style="width: 300px; font-size: 30px;" align="center">${board.title}</td>
				</table>
			</center>
			<div align="right">
				<table>
					<tr>
						<td style="width: 100px;" align="right" colspan="4"><fmt:formatDate
								value="${board.date}" pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>

						<td style="width: 400px" align="right">${board.nick }</td>

						<td style="width: 100px;" align="right">조회수 : ${board.viewNo }</td>
						<!-- 						<td style="width: 100px;" id="recommend" align="right">추천수 : -->
						<%-- 							${board.recommend }</td> --%>
					</tr>
				</table>
			</div>
		</div>

		<div class="left" align="center">
			<br>
			<table>

				<tr style="width: 50px">
					<c:forEach items="${list}" var="exboard">
						<c:if test="${exboard.category eq 'food'}">
							<td class="category_td">
							<i style="color: #ADD8E6;"class="fa fa-cutlery" aria-hidden="true"></i>
							</span></td>
						</c:if>

						<c:if test="${exboard.category eq 'traffic'}">
							<td class="category_td"><i style="color: #FF6347;"
								class="fa fa-bus" aria-hidden="true"></i></td>
						</c:if>

						<c:if test="${exboard.category eq 'commodity'}">
							<td class="category_td"><i style="color: #FFA500;"
								class="fa fa-shopping-cart" aria-hidden="true"></i></td>
						</c:if>

						<c:if test="${exboard.category eq 'beauty'}">
							<td class="category_td"><i style="color: #FFB6C1;"
								class="fa fa-bath" aria-hidden="true"></i></td>
						</c:if>

					</c:forEach>
				</tr>

				<tr style="width: 50px;" class="categoryfont" id="tre">
					<c:forEach items="${list}" var="exboard">
						<c:if test="${exboard.category eq 'food'}">
							<td id="food">식비<br>${exboard.price }</td>
						</c:if>
						<c:if test="${exboard.category eq 'traffic'}">
							<td>교통비<br>${exboard.price }</td>
						</c:if>

						<c:if test="${exboard.category eq 'commodity'}">
							<td>생필품<br>${exboard.price }</td>
						</c:if>

						<c:if test="${exboard.category eq 'beauty'}">
							<td>미용<br>${exboard.price }</td>
						</c:if>
					</c:forEach>
				</tr>


			</table>

			<table>
				<br>

				<tr style="width: 50px">
					<c:forEach items="${list}" var="exboard">
						<c:if test="${exboard.category eq 'medical'}">
							<td class="category_td"><i style="color: #708090"
								class="fa fa-medkit" aria-hidden="true"></i></td>
						</c:if>
						<c:if test="${exboard.category eq 'education'}">
							<td class="category_td"><i style="color: #DDA0DD;"
								class="fa fa-book" aria-hidden="true"></i></td>
						</c:if>
						<c:if test="${exboard.category eq 'phonefees'}">
							<td class="category_td"><i style="color: #1E90FF;"
								class="fa fa-mobile" aria-hidden="true"></i></td>
						</c:if>
						<c:if test="${exboard.category eq 'saving'}">
							<td class="category_td"><i style="color: #DAA520;"
								class="fa fa-database" aria-hidden="true"></i></td>
						</c:if>
 
					</c:forEach>
				</tr>
				<tr style="width: 50px;" class="categoryfont">
					<c:forEach items="${list}" var="exboard">

						<c:if test="${exboard.category eq 'medical'}">
							<td>의료<br>${exboard.price }</td>
						</c:if>

						<c:if test="${exboard.category eq 'education'}">
							<td>교육<br>${exboard.price }</td>
						</c:if>

						<c:if test="${exboard.category eq 'phonefees'}">
							<td>통신비<br>${exboard.price }</td>
						</c:if>

						<c:if test="${exboard.category eq 'saving'}">
							<td>저축<br>${exboard.price }</td>
						</c:if>

					</c:forEach>
				</tr>
			</table>
			<table>
				<br>

				<tr>
					<c:forEach items="${list}" var="exboard">

						<c:if test="${exboard.category eq 'utilitybills'}">
							<td class="category_td"><i style="color: #6A5ACD;"
								class="fa fa-plug" aria-hidden="true"></i></td>
						</c:if>
						<c:if test="${exboard.category eq 'culturallife'}">
							<td class="category_td"><i style="color: #3CB371;"
								class="fa fa-film" aria-hidden="true"></i></td>
						</c:if>
						<c:if test="${exboard.category eq 'otheritems'}">
							<td class="category_td"><i style="color: #FA8072;"
								class="fa fa-minus-circle" aria-hidden="true"></i></td>
						</c:if>
						<c:if test="${exboard.category eq 'income'}">
							<td class="category_td"><i style="color: #9ACD32;"
								class="fa fa-krw" aria-hidden="true"></i></td>
						</c:if>


					</c:forEach>
				</tr>
				<tr style="width: 50px;" class="categoryfont">
					<c:forEach items="${list}" var="exboard">

						<c:if test="${exboard.category eq 'utilitybills'}">
							<td>공과금<br>${exboard.price }</td>
						</c:if>

						<c:if test="${exboard.category eq 'culturallife'}">
							<td>문화생활비<br>${exboard.price }</td>
						</c:if>

						<c:if test="${exboard.category eq 'otheritems'}">
							<td>기타<br>${exboard.price }</td>
						</c:if>

						<c:if test="${exboard.category eq 'income'}">
							<td>수입<br>${exboard.price }</td>
						</c:if>
					</c:forEach>
				</tr>


			</table>

		</div>
		
		<div class="right">
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${board.content }
		</div>

		<div class="bottom">
			<br>

			<div align="center">

				<button class="re_btn" id="recommendbtn">
					추천 <span id="recommend"> ${board.recommend } </span>
				</button>

				<input class="re_btn" type="button" value="목록"
					onclick="location.href='boardList.do'">
				<c:if test="${board.id_index eq id_index}">
					<input  class="re_btn" type="button" value="수정"
						
					
						onclick="location.href='boardUpdateForm.do?boardNo=${board.boardNo}'">
				</c:if>
			</div>
			<table class="table table-bordered" style="width: 70%;"
				id="commentTable" align="center">
			</table>
			<br>
		</div>


		<div>
			<c:if test="${id_index != null}">
				<table align="center">
					<tr>
						<td><i class="fa fa-user" aria-hidden="true"></i>${nick}</td>

					</tr>
					<tr>
						<td><textarea rows="2" cols="80" id="content1"
								name="content1"></textarea></td>
						<td><input type="button" value="등록" id="commentbut">
						</td>
					</tr>
				</table>
				<input type="hidden" value="${nick}" readonly="readonly" id="nick1"
					name="nick1">
			</c:if>


		</div>

	</div>


	<%-- 	
	<center>
	<div>
			<table border="1">
				<tr>
					<td style="width: 300px;" align="center">${board.title}</td>
					<td style="width: 150px;" align="center"><fmt:formatDate
							value="${board.date}" pattern="yyyy-MM-dd" /></td>
			</table>

	</div>
	<div>
			<table border="3">
				<tr>
					<td style="width: 400px" align="center">${board.nick }</td>

					<td style="width: 200px;">조회수 : ${board.viewNo }</td>
					<td style="width: 200px;" id="recommend">추천수 :
						${board.recommend }</td>
				</tr>
				<tr>

				</tr>

				
				<tr>
					<td colspan="3" align="center">${board.content }</td>
				</tr>


			</table>
		</div>
		<div>
		<c:forEach items="${list}" var="exboard">
					<tr>
						<td colspan="3" align="center">${exboard.category }
							${exboard.price }</td>
					</tr>

				</c:forEach>
		</div>
		<div>
			<input type="button" value="추천" id="recommendbtn"> <input
				type="button" value="목록" onclick="location.href='boardList.do'">
			<c:if test="${board.id_index eq id_index}">
				<input type="button" value="수정"
					onclick="location.href='boardUpdateForm.do?boardNo=${board.boardNo}'">
			</c:if>
		</div>

		<table class="table table-bordered" style="width: 70%;"
			id="commentTable">

		</table>
		<c:if test="${id_index != null}">
			<input type="text" value="${nick}" readonly="readonly" id="nick1"
				name="nick1">
			<textarea rows="5" cols="120" id="content1" name="content1"></textarea>
			<input type="button" value="등록" id="commentbut">
		</c:if>
	</center> --%>
</body>
</html>
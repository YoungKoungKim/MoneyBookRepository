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
							"</td></tr><tr><td> <textarea class='comment' id='comment_"+data[comment].commentNo+"' rows='3' cols='120' readonly='readonly'> "+ data[comment].content + "</textarea> <input class='delete' id='"+data[comment].commentNo+"@' name='"+data[comment].commentNo+"' type='button' value='삭제'>"
							+"<input class='update' type='button' id='"+data[comment].commentNo+"@' name='"+data[comment].commentNo+"' value='수정'> </td> </tr>");
					
					}else {
						$("#commentTable").html($("#commentTable").html() + 
						"<tr>	<td>" + data[comment].nick + 
						"&nbsp;&nbsp;&nbsp;" + time + 
						"</td></tr><tr><td> <textarea rows='3' cols='120' readonly='readonly'> "+ data[comment].content + "</textarea></td>	</tr>");						
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
					$('#recommend').text("추천수 : "+data);
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
			success : function () {
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
</head>
<body>
	<center>
		<br>
		<br>
		<div>
			<table border="3">
				<tr>
					<td style="width: 150px; font-size: 20px;" align="center">
						${board.ageType}대</td>
					<td style="width: 300px;" align="center">${board.title}</td>
					<td style="width: 150px;" align="center"><fmt:formatDate
							value="${board.date}" pattern="yyyy-MM-dd" /></td>
							
				</tr>
			</table>
		</div>
	
		<div>
			<table border="3">
				<tr style="background-color: pink">
					<td style="width: 150px; font-size: 20px;" align="center">
						${board.ageType}대</td>
					<td style="width: 300px;" align="center">${board.title}</td>
					<td style="width: 150px;" align="center"><fmt:formatDate
							value="${board.date}" pattern="yyyy-MM-dd" /></td>
			</table>

			<table border="3">
				<tr>
					<td style="width: 400px" align="center">${board.nick }</td>

					<td style="width: 200px;">조회수 : ${board.viewNo }</td>
					<td style="width: 200px;" id="recommend">추천수 :
						${board.recommend }</td>
				</tr>
				<tr>

				</tr>

				<c:forEach items="${list}" var="exboard">
					<tr>
						<td colspan="3" align="center">${exboard.category }
							${exboard.price }</td>
					</tr>

				</c:forEach>
				<tr>
					<td colspan="3" align="center">${board.content }</td>
				</tr>


			</table>
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
	</center>
</body>
</html>
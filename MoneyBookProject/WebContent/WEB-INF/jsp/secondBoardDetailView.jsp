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

					$("#commentTable").html($("#commentTable").html() + "<tr>	<td>" + data[comment].nick + "&nbsp;&nbsp;&nbsp;" + time +"&nbsp;&nbsp;&nbsp; 추천:"+ data[comment].recommend
					+ "</td></tr><tr><td> <textarea class='comment' style='resize: none;' id='comment_"+data[comment].commentNo+"' rows='2' cols='100' readonly='readonly'> "+ data[comment].content + "</textarea>"
							+"<input class='delete' id='"+data[comment].commentNo+"@' name='"+data[comment].commentNo+"' type='button' value='삭제'>"
							+"<input class='update' type='button' id='"+data[comment].commentNo+"@' name='"+data[comment].commentNo+"' value='수정'></td> </tr>"
							);
					
					}else {
						$("#commentTable").html($("#commentTable").html() + 
						"<tr>	<td>" + data[comment].nick + 
						"&nbsp;&nbsp;&nbsp;" + time +"&nbsp;&nbsp;&nbsp; 추천:"+ data[comment].recommend
						+"</td></tr><tr><td> <textarea class='comment' style='resize: none;' rows='2' cols='100' readonly='readonly'> "+ data[comment].content + "</textarea>"
						+"<input class='recommendcomment' type='button' id='" + data[comment].commentNo + "@' name ='" + data[comment].commentNo + "' value='추천'> </td></tr>"
						);						
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
					
					$('.recommendcomment').on('click',function(){
						var idno = $(this).attr('id').split('@')[0];
						var commentNo = $(this).attr('name');
						$.ajax({
							type : 'post',
							url : 'secondBoardRecommend.do',
							data : 'commentNo='+commentNo+"&boardNo="+${board.boardNo},
							dataType : 'json',
							success : function(data){
								if(date.code==0){
									$('#commentread').text(data.recommend);
								}else if(data.code ==1){
										$('#commentread').text(data.recommend);						
										alert("이미추천하셨습니다.");
								}else if(data.code==3){
									alert("로그인해주세여");
								}
							},
							error:function(){
						      
						       }
							});
					});
					
				},
				error : function() {
					alert("실패");
				}
			
			});
		}//getcommenList
		
	$(document).ready(function() {
		getCommentList();
		
		var id_index = parseInt('${id_index}');
		
		$('#recommendbtn').on('click', function() {
				$.ajax({
				type : 'post',
				url : 'secondBoardRecommend.do',
				data : 'boardNo='+${board.boardNo},
				dataType : 'json',
				success : function(data) {
					if(data.code ==0){
						//추천 성공
						$('#recommend').text(data.recommend);	
						alert("추천하셨습니다.");
					}else if(data.code ==1){
						//로그인해
						alert("로그인해주세요.");
					}else if(data.code==3){
						//이미 추천해썽
						alert("이미 추천한 게시글입니다.");
					}
				}, 
				error : function(data){
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
#it {
	font-size: 70px;
}

.root {
	margin: auto;
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
	padding: 20px 100px;
}

.div_category {
	width: 170px;
	height: 100px;
	display: inline-block;
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

.div_all {
	font-size: 24px;
}

.categoryfont {
	font-size: 20px;
	text-align: center;
}

.myButton, .update, .delete, .recommendcomment {
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

.myButton, .update, .delete, .recommendcomment:hover {
	background-color: #91D4B5;
}

.myButton, .update, .delete, .recommendcomment:active {
	position: relative;
	top: 1px;
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
					</tr>
				</table>
			</center>
			<div align="right">
				<table>
					<tr>
						<td style="width: 100px;" align="right" colspan="4">
							<fmt:formatDate value="${board.date}" pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<td style="width: 400px" align="right">${board.nick }</td>
						<td style="width: 100px;" align="right">조회수 : ${board.viewNo }</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="right">${board.content }</div>

		<div class="bottom">
			<br>
			<div align="center" style="padding-bottom: 30px;">
				<button class="myButton" id="recommendbtn">
					추천 <span id="recommend"> ${board.recommend } </span>
				</button>
				<input class="myButton" type="button" value="목록"
					onclick="location.href='secondBoardList.do'">
				<c:if test="${board.id_index eq id_index}">
					<input class="myButton" type="button" value="수정"
						onclick="location.href='secondBoardUpdateForm.do?boardNo=${board.boardNo}'">
				</c:if>
				<c:if test="${board.id_index eq id_index }">
					<input class="myButton" type="button" value="삭제"
						onclick="location.href='secondBoardDelete.do?boardNo=${board.boardNo}'">
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
						<td><textarea style="resize: none;" rows="2" cols="80"
								id="content1" name="content1"></textarea></td>
						<td><input class="myButton" type="button" value="등록"
							id="commentbut"></td>
					</tr>
				</table>
				<input type="hidden" value="${nick}" readonly="readonly" id="nick1"
					name="nick1">
			</c:if>
		</div>
	</div>
</body>
</html>
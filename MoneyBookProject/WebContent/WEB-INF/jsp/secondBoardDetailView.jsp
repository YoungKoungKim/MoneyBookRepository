<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="boardcss/boardDetailView.css" rel="stylesheet" type="text/css">
<title>자유게시판 - 글 상세보기</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script type="text/javascript">
function getCommentList() {
	var id_index = parseInt('${id_index}');
	$.ajax({
		url : "getSecondCommentList.do",
		type : "get",
		data : "boardNo=" + ${board.boardNo},
		dataType : "json",
		success : function(data) {
			$("#commentTable").html("");
			for(var comment in data) {
				var date = new Date(data[comment].date);
				var time = date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate() + " " + date.getHours() + ":" + date.getMinutes();
				var msg = "";
				var tdStyle = "";
				var reDiv = "";
					if(data[comment].lv != 0 ){
						msg = "ㄴ";
						tdStyle = " style='padding-left: 48px;'";
						reDiv = "class='col-md-1' style='padding: 0; width: 10px;'";
					}
					if(id_index == data[comment].id_index)
					{
					$("#commentTable").html($("#commentTable").html() + "<tr>	<td" + tdStyle + ">" + data[comment].nick + "&nbsp;&nbsp;&nbsp;" + time +"&nbsp;&nbsp;&nbsp; <span id='rec_" + data[comment].commentNo + "'>추천:"+ data[comment].recommend+"</span>"
					+ "</td></tr><tr><td" + tdStyle + "><div " + reDiv + ">" + msg + "</div><div class='col-md-11' style='padding: 0;'><textarea class='comment' style='resize: none; border:0;  background-color: #f0f8ff;' id='comment_"+data[comment].commentNo+"' rows='2' cols='80' readonly='readonly'>"+ data[comment].content + "</textarea></div>"
							
							+"<div class='col-md-3'><a class='delete' id='"+data[comment].commentNo+"@' name='"+data[comment].commentNo+"'>삭제</a>"
							+"<a class='update' id='"+data[comment].commentNo+"@' name='"+data[comment].commentNo+"'>수정</a>"
							+"<a class='recomment' id='"+data[comment].commentNo+"@' name='"+data[comment].commentNo+"'>답글</a><div></td></tr>"
							
							+"<tr><td><div style='display: none' id='re_" + data[comment].commentNo +"'>"
							+"<input type='hidden' value='${nick}' readonly='readonly' id='nick1' name='nick1'>"
							+"<textarea style='resize: none; ' rows='2' cols='80' id='reply_content"+data[comment].commentNo+"'  placeholder='내용을 입력하세요'></textarea>"
							+"<input class='reply' type='button' value='등록' id='"+data[comment].commentNo+"@' name='reply_"+data[comment].commentNo+"'>"
							+"</div></td></tr>"
							);
					}else {
						$("#commentTable").html($("#commentTable").html() + 
						"<tr>	<td>" + data[comment].nick + 
						"&nbsp;&nbsp;&nbsp;" + time +"&nbsp;&nbsp;&nbsp; <span id='rec_" + data[comment].commentNo + "'>추천:"+ data[comment].recommend+"</span>"
						+"</td></tr><tr><td" + tdStyle + "><div " + reDiv + ">" + msg + "</div><div class='col-md-11' style='padding: 0;'><textarea class='comment' style='resize: none; border:0;  background-color: #f0f8ff;' id='comment_"+data[comment].commentNo+"' rows='2' cols='80' readonly='readonly'>"+ data[comment].content + "</textarea></div>"
						+"<div class='col-md-3'><a class='recommendcomment' id='" + data[comment].commentNo + "@' name ='" + data[comment].commentNo + "'>추천</a> "
						+"<a class='recomment' id='" + data[comment].commentNo + "@' name ='" + data[comment].commentNo + "' >답글</a><div></td></tr>"
						
						+"<tr><td><div style='display: none' id='re_" + data[comment].commentNo +"'>"
						+"<input type='hidden' value='${nick}' readonly='readonly' id='nick1' name='nick1'>"
						+"<textarea style='resize: none;' rows='2' cols='80' id='reply_content"+data[comment].commentNo+"'  placeholder='내용을 입력하세요'></textarea>"
						+"<input class='reply' type='button' value='등록' id='"+data[comment].commentNo+"@' name='reply_"+data[comment].commentNo+"'>"
						+"</div></td></tr>"
						);		
					}	
					
			}//for문 End
					$('.delete').on('click',function(){
						var idno = $(this).attr('id').split('@')[0];
						var commentNo = $(this).attr('name');
						if(idno == commentNo) {
						$.ajax({
							type : 'post',
							url : 'secondCommentDelete.do',
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
					});//delete End
					
					$('.update').on('click', function(){
						var atext = $(this).text();
						var commentNo = $(this).attr('name');
						var content = $('#comment_'+commentNo).val();					
						if(atext == "수정"){
						$('#comment_' + commentNo).removeAttr("readonly");	
						 	alert('수정가능합니다');
							$(this).text("변경");
						 	$('#comment_' + commentNo).focus();
						}else if(atext=="변경"){
							$.ajax({
								type : 'post',
								url : 'secondCommentUpdate.do',
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
					});//update End
					
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
					});//recommendcomment End
					
					$('.recomment').on('click',function(){
						var commentNo = $(this).attr('name');
						var atext = $(this).text();
					 	var id_index = $("#id_index").val();
					 	if(id_index == ""){
							alert("로그인해주세요");					 		
					 	}else{
					 		
						if(atext =="답글"){
						$(this).text('답글닫기');						
						$("#re_" + commentNo).css("display","");
						
						}else if(atext == "답글닫기"){
						$(this).text('답글');
						$("#re_" + commentNo).css("display","none");
						}
					 	}
						
					});
					
					$('.reply').on('click',function(){
						var boardNo = $("#boardNo").val();
						var nick1 = $('#nick1').val();
						var commendNo = $(this).attr('id').split('@')[0];
						var content1 = $("#reply_content"+commendNo).val();
						$.ajax({
							type : 'post',
							url : 'secondCommentreplyWrite.do',
							data : 'boardNo='+boardNo+'&nick1='+ nick1 +'&content1='+ content1+'&commendNo='+commendNo,
							dataType : 'json',
							success : function(data){
								getCommentList();
								alert("등록완료");
							},
							error:function(){
						      
						       }
						});
					});// reply End
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
		if(content1 == ""){
			alert("내용을 입력해주세요");	
		}
		else{
			$.ajax({
				type : 'post',
				url : 'secondCommentWrite.do',
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
		}
	});//commentbut
		
});
</script>

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
	<input type="hidden" value="${board.boardNo}"  name="boardNo" id="boardNo">
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>

<script type="text/javascript">
// 	$(document).ready(function() {
// 		$("#submitBtn").on("click", function() {
// 			if ($("#id").val() == "") {
// 				$("#pwdCheck").text("");
// 				$("#idCheck").text("아이디를 입력해주세요.");
// 				$("#id").focus();
// 			} else if ($("#pwd").val() == "") {
// 				$("#idCheck").text("");
// 				$("#pwdCheck").text("비밀번호를 입력해주세요.");
// 				$("#pwd").focus();
// 			} else {
// 				$.ajax({
// 					url : "loginSuccess.do",
// 					type : "post",
// 					data : "id=" + $("#id").val() + "&pwd=" + $("#pwd").val(),
// 					dataType : "json",
// 					success : function(data) {
// 						if (data == 2101) {
// 							opener.parent.location.reload();
// 							self.close();
// 						} else if (data == 2102) {
// 							$("#pwd").val("");
// 							$("#idCheck").text("");
// 							$("#pwdCheck").text("아이디 또는 비밀번호를 잘못 입력하셨습니다.");
// 							$("#pwd").focus();
// 						}
// 					},
// 					error : function() {
// 						alert("에러 : 로그인 실패");
// 					}
// 				})
// 			}
// 		})
		
// 		$("#cancelBtn").on("click", function() {
// 			self.close();
// 		})
// 	})
</script>

<script type="text/javascript">
	
</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<center>
		<h1>로그인</h1>
		<table>
			<tr align="center">
				<td>아이디</td>
				<td><input type="text" id="id" class="form-control"
					placeholder="이메일을 입력하세요."></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="idCheck" style="color: red;"></span></td>
			</tr>
			<tr align="center">
				<td>비밀번호</td>
				<td><input type="password" id="pwd" class="form-control"
					placeholder="비밀번호를 입력해주세요."></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="pwdCheck" style="color: red;"></span></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="button" value="로그인"
					class="btn btn-primary" id="submitBtn">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="취소"
					class="btn btn-danger" id="cancelBtn"></td>
			</tr>
		</table>
	</center>
</body>
</html>
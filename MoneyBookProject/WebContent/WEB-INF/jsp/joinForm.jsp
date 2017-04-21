<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var pwdForm = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{6,20})/;
						var emailForm = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
						var phoneChk = /^(01[016789]{1}|070|02|0[3-9]{1}[0-9]{1})-[0-9]{3,4}-[0-9]{4}$/;
						var nickPattern = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/;

						$("#id").on("keyup", function() {
							if (emailForm.test($(this).val())) {
								$("#idCheck").text("사용 가능");
							} else {
								$("#idCheck").text("이메일 형식에 맞게 입력해주세요.");
							}
						});
						
						$("#nick").on("keyup", function() {
							if(nickPattern.test($(this).val())) {
								$("#nickCheck").text("사용 가능");
							} else {
								$("#nickCheck").text("닉네임 형식에 맞게 입력해주세요.");
							}
						});
						
						$("#pwd").on("keyup", function() {
							if(pwdForm.test($(this).val())) {
								$("#pwdCheck").text("사용 가능");
							} else {
								$("#pwdCheck").text("비밀번호는 대소문자, 숫자가 포함되어야 합니다.");
							}
						});
							
						$("#pwdOk").on("keyup", function() {
							if($("#pwd").val() == $(this).val()) {
								$("#pwdOkCheck").text("사용 가능");
							} else {
								$("#pwdOkCheck").text("위 비밀번호와 같게 입력해주세요.");
							}
						});
					})
</script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<center>
		<h1>회 원 가 입</h1>
		<form action="join_Success.do" method="post" class="form-horizontal">
			<table>
				<tr align="center">
					<td>아이디</td>
					<td><input type="text" id="id" name="id" class="form-control"
						placeholder="이메일을 입력하세요."></td>
				</tr>
				<tr>
					<td></td>
					<td><span id="idCheck"></span></td>
				</tr>
				<tr align="center">
					<td>닉네임</td>
					<td><input type="text" id="nick" name="nick"
						class="form-control" placeholder="닉네임을 입력하세요."></td>
				</tr>
				<tr>
					<td></td>
					<td><span id="nickCheck"></span></td>
				</tr>
				<tr align="center">
					<td>비밀번호</td>
					<td><input type="password" id="pwd" name="pwd"
						class="form-control" placeholder="비밀번호를 입력해주세요."></td>
				</tr>
				<tr>
					<td></td>
					<td><span id="pwdCheck"></span></td>
				</tr>
				<tr align="center">
					<td>비밀번호 확인</td>
					<td><input type="password" id="pwdOk" class="form-control"
						placeholder="다시 한번 입력해주세요."></td>
				</tr>
				<tr>
					<td></td>
					<td><span id="pwdOkCheck"></span></td>
				</tr>
				<tr align="center">
					<td colspan="2"><input type="submit" value="확인"
						class="btn btn-primary" id="submitBtn">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="취소"
						class="btn btn-danger"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>
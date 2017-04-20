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
					<td><input type="text" name="id" class="form-control"
						placeholder="이메일을 입력하세요."></td>
				</tr>
				<tr align="center">
					<td>닉네임</td>
					<td><input type="text" name="nick" class="form-control"
						placeholder="닉네임을 입력하세요."></td>
				</tr>
				<tr align="center">
					<td>비밀번호</td>
					<td><input type="password" name="pwd" class="form-control"
						placeholder="비밀번호를 입력해주세요."></td>
				</tr>
				<tr align="center">
					<td>비밀번호 확인</td>
					<td><input type="password" name="checkPwd"
						class="form-control" placeholder="다시 한번 입력해주세요."></td>
				</tr>
				<tr align="center">
					<td colspan="2"><input type="submit" value="확인"
						class="btn btn-primary"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
						type="reset" value="취소" class="btn btn-danger"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>

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
		<h1>회 원 정 보 수 정</h1>
		<table>
			<tr align="center">
				<td>아이디</td>
				<td align="left">${member.id }</td>
			</tr>
			<tr align="center">
				<td>닉네임</td>
				<td><input type="text" id="inform_Nick"
					value="${member.nick }" class="form-control"
					placeholder="닉네임을 입력하세요."></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="inform_NickCheck" style="color: red;"></span></td>
			</tr>
			<tr align="center">
				<td>현재 비밀번호</td>
				<td><input type="password" id="inform_NowPwd" class="form-control"
					placeholder="비밀번호를 입력해주세요."></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="inform_NowPwdCheck" style="color: red;"></span></td>
			</tr>
			<tr align="center">
				<td>새 비밀번호</td>
				<td><input type="password" id="inform_NewPwd" class="form-control"
					placeholder="비밀번호를 입력해주세요."></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="inform_NewPwdCheck" style="color: red;"></span></td>
			</tr>
			<tr align="center">
				<td>새 비밀번호 확인</td>
				<td><input type="password" id="inform_NewPwdOk" class="form-control"
					placeholder="다시 한번 입력해주세요."></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="inform_NewPwdOkCheck" style="color: red;"></span></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="button" value="수정"
					class="btn btn-success" id="inform_SubmitBtn">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="취소"
					class="btn btn-info" id="inform_CancelBtn"></td>
			</tr>
		</table>
		<input type="hidden" value="${member.nick }" id="inform_NickName">
		<input type="hidden" value="${member.id_index }" id="inform_Id_index">
		<input type="hidden" value="true" id="inform_NickTest"> <input
			type="hidden" value="false" id="inform_NewPwdTest"> <input
			type="hidden" value="false" id="inform_NewPwdOkTest">
	</center>
</body>
</html>
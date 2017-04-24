<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
<script type="text/javascript">
	$(document).ready(function() {
			var pwdForm = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{6,20})/;
			var emailForm = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			var phoneChk = /^(01[016789]{1}|070|02|0[3-9]{1}[0-9]{1})-[0-9]{3,4}-[0-9]{4}$/;
			var nickPattern = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/;
			
			
			$("#id").on("blur", function() {
				if (emailForm.test($(this).val())) {
					$.ajax({
						url : "id_Check.do",
						type : "get",
						data : "id=" + $(this).val(),
						dataType : "json",
						success : function(data) {
							if (data == 1002) {
								$("#idCheck").text("사용 가능");
								$("#idTest").val("true");
							} else if(data == 1001) {
								$("#idCheck").text("이미 있는 아이디입니다.");
								$("#idTest").val("false");
							}	
						},
						error : function(e) {
							alert("전송 실패");
						}
					});
				} else {
						$("#idCheck").text("이메일 형식에 맞게 입력해주세요.");
						$("#idTest").val("false");
				}
			});

			$("#nick").on("blur", function() {
				if (nickPattern.test($(this).val())) {
						$.ajax({
							url : "nick_Check.do",
							type : "get",
							data : "nick=" + $(this).val(),
							dataType : "json",
							success : function(data) {
								if (data == 1102) {
									$("#nickCheck").text("사용 가능");
									$("#nickTest").val("true");
								} else if(data == 1101) {
									$("#nickCheck").text("이미 있는 닉네임입니다.");
									$("#nickTest").val("false");
								}
							},
							error : function(e) {
								alert("전송 실패");
							}
						});
				} else {
					$("#nickCheck").text("닉네임 형식에 맞게 입력해주세요.");
					$("#nickTest").val("false");
				}
			});

			$("#pwd").on("blur", function() {
					if (pwdForm.test($(this).val())) {
							$("#pwdCheck").text("사용 가능");
							$("#pwdTest").val("true");
					} else {
							$("#pwdCheck").text("비밀번호는 대소문자, 숫자가 포함되어야 합니다.");
							$("#pwdTest").val("false");
					}
					
					if (pwdForm.test($("#pwdOk").val())) {
						if($(this).val() == $("#pwdOk").val()) {
							$("#pwdOkCheck").text("사용 가능");
							$("#pwdOkTest").val("true");
						} else {
							$("#pwdOkCheck").text("위 비밀번호와 같게 입력해주세요.");
							$("#pwdOkTest").val("false");
						}
					} else {
						$("#pwdOkCheck").text("비밀번호는 대소문자, 숫자가 포함되어야 합니다.");
						$("#pwdOkTest").val("false");
					}
			});

			$("#pwdOk").on("blur", function() {
				if (pwdForm.test($(this).val())) {
					if ($("#pwd").val() == $(this).val()) {
						$("#pwdOkCheck").text("사용 가능");
						$("#pwdOkTest").val("true");
					} else {
						$("#pwdOkCheck").text("위 비밀번호와 같게 입력해주세요.");
						$("#pwdOkTest").val("false");
					}
				} else {
					$("#pwdOkCheck").text("비밀번호는 대소문자, 숫자가 포함되어야 합니다.");
					$("#pwdOkTest").val("false");
				}
			});

			$("#submitBtn").on("click", function() {
				if($("#idTest").val() != "true") {
					$("#id").focus();
					return;
				} else if ($("#nickTest").val() != "true") {
					$("#nick").focus();
					return;
				}  else if ($("#pwdTest").val() != "true") {
					$("#pwd").focus();
					return;
				} else if ($("#pwdOkTest").val() != "true") {
					$("#pwdOk").focus();
					return;
				} else {
					$.ajax({
						url : "join_Success.do",
						type : "post",
						data : "id=" + $("#id").val() + "&nick=" + $("#nick").val() + "&pwd=" + $("#pwd").val(),
						dataType : "json",
						success : function(data) {	
							if(data == 2001) {
								opener.parent.location.reload();
								self.close();
							} else if (data == 2002) {
								alert("가입 실패, 다시 시도해주세요.");
							}
						},
						error : function(e) {
							alert("전송 실패");
						}
					})
				}
			})
			
			$("#cancelBtn").on("click", function() {
				self.close();
			})
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
		<table>
			<tr align="center">
				<td>아이디</td>
				<td>${member.id }</td>
			</tr>
			<tr align="center">
				<td>닉네임</td>
				<td><input type="text" id="nick" name="nick" value="${member.nick }"
					class="form-control" placeholder="닉네임을 입력하세요."></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="nickCheck" style="color: red;"></span></td>
			</tr>
			<tr align="center">
				<td>현재 비밀번호</td>
				<td><input type="password" id="nowPwd"
					class="form-control" placeholder="비밀번호를 입력해주세요."></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="nowPwdCheck" style="color: red;"></span></td>
			</tr>
			<tr align="center">
				<td>새 비밀번호</td>
				<td><input type="password" id="newPwd"
					class="form-control" placeholder="비밀번호를 입력해주세요."></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="newPwdCheck" style="color: red;"></span></td>
			</tr>
			<tr align="center">
				<td>새 비밀번호 확인</td>
				<td><input type="password" id="newPwdOk" class="form-control"
					placeholder="다시 한번 입력해주세요."></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="newPwdOkCheck" style="color: red;"></span></td>
			</tr>
				<tr align="center">
				<td colspan="2"><input type="button" value="수정"
				class="btn btn-primary" id="submitBtn">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="취소"
				class="btn btn-danger" id="cancelBtn"></td>
			</tr>
		</table>
		<input type="hidden" value="false" id="nickTest">
		<input type="hidden" value="false" id="pwdTest">
		<input type="hidden" value="false" id="pwdOkTest">
	</center>
</body>
</html>
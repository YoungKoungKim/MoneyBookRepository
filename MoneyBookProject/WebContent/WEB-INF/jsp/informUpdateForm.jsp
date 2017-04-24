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
		var nickPattern = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/;
		
		$("#nick").on("blur", function() {
			if (nickPattern.test($(this).val())) {
					$.ajax({
						url : "nickCheck.do",
						type : "get",
						data : "nick=" + $(this).val(),
						dataType : "json",
						success : function(data) {
							if (data == 1102) {	
								$("#nickCheck").text("사용 가능");
								$("#nickTest").val("true");
							} else if(data == 1101) {
								if($("#nick").val() != "${member.nick}") {										
									$("#nickCheck").text("이미 있는 닉네임입니다.");
									$("#nickTest").val("false");
								} else {
									$("#nickCheck").text("");
									$("#nickTest").val("true");
								}
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

		$("#newPwd").on("blur", function() {
				if (pwdForm.test($(this).val())) {
						$("#newPwdCheck").text("사용 가능");
						$("#newPwdTest").val("true");
				} else {
						$("#newPwdCheck").text("비밀번호는 대소문자, 숫자가 포함되어야 합니다.");
						$("#newPwdTest").val("false");
				}
					
				if (pwdForm.test($("#newPwdOk").val())) {
					if($(this).val() == $("#newPwdOk").val()) {
						$("#newPwdOkCheck").text("사용 가능");
						$("#newPwdOkTest").val("true");
					} else {
						$("#newPwdOkCheck").text("위 비밀번호와 같게 입력해주세요.");
						$("#newPwdOkTest").val("false");
					}
				} else {
					$("#newPwdOkCheck").text("비밀번호는 대소문자, 숫자가 포함되어야 합니다.");
					$("#newPwdOkTest").val("false");
				}
		});

		$("#newPwdOk").on("blur", function() {
			if (pwdForm.test($(this).val())) {
				if ($("#newPwd").val() == $(this).val()) {
					$("#newPwdOkCheck").text("사용 가능");
					$("#newPwdOkTest").val("true");
				} else {
					$("#newPwdOkCheck").text("위 비밀번호와 같게 입력해주세요.");
					$("#newPwdOkTest").val("false");
				}
			} else {
				$("#newPwdOkCheck").text("비밀번호는 대소문자, 숫자가 포함되어야 합니다.");
				$("#newPwdOkTest").val("false");
			}
		});

		$("#submitBtn").on("click", function() {
			if ($("#nickTest").val() != "true") {
				$("#nick").focus();
				return;
			}  else if ($("#newPwdTest").val() != "true") {
				$("#newPwd").focus();
				return;
			} else if ($("#newPwdOkTest").val() != "true") {
				$("#newPwdOk").focus();
				return;
			} else {
				$.ajax({
					url : "informUpdate.do",
					type : "post",
					data : "id_index=${member.id_index}&id=" + $("#id").val() + "&nick=" + $("#nick").val() + "&pwd=" + $("#nowPwd").val() + "&newPwd=" + $("#newPwd").val(),
					dataType : "json",
					success : function(data) {	
						if(data == 4101) {
							location.href = "viewMyPage.do?id_index=${member.id_index}&date=" + new Date();
						} else if (data == 4102) {
							$("#nowPwd").val("");
							$("#nowPwdCheck").text("비밀번호가 틀렸습니다.");
						} else if (data == 4103) {
							alert("db 수정 실패");
						}
					},
					error:function(request,status,error){
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
		<h1>회 원 정 보 수 정</h1>
		<table>
			<tr align="center">
				<td>아이디</td>
				<td>${member.id }</td>
			</tr>
			<tr align="center">
				<td>닉네임</td>
				<td><input type="text" id="nick" name="nick"
					value="${member.nick }" class="form-control"
					placeholder="닉네임을 입력하세요."></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="nickCheck" style="color: red;"></span></td>
			</tr>
			<tr align="center">
				<td>현재 비밀번호</td>
				<td><input type="password" id="nowPwd" class="form-control"
					placeholder="비밀번호를 입력해주세요."></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="nowPwdCheck" style="color: red;"></span></td>
			</tr>
			<tr align="center">
				<td>새 비밀번호</td>
				<td><input type="password" id="newPwd" class="form-control"
					placeholder="비밀번호를 입력해주세요."></td>
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
		<input type="hidden" value="true" id="nickTest"> <input
			type="hidden" value="false" id="newPwdTest"> <input
			type="hidden" value="false" id="newPwdOkTest">
	</center>
</body>
</html>
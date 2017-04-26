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
		
		$("#inform_Nick").on("blur", function() {
			if (nickPattern.test($(this).val())) {
					$.ajax({
						url : "nickCheck.do",
						type : "get",
						data : "nick=" + $(this).val(),
						dataType : "json",
						success : function(data) {
							if (data == 1102) {	
								$("#inform_NickCheck").text("사용 가능");
								$("#inform_NickTest").val("true");
							} else if(data == 1101) {
								if($("#inform_Nick").val() != "${member.nick}") {										
									$("#inform_NickCheck").text("이미 있는 닉네임입니다.");
									$("#inform_NickTest").val("false");
								} else {
									$("#inform_NickCheck").text("");
									$("#inform_NickTest").val("true");
								}
							}
						},
						error : function(e) {
							alert("전송 실패");
						}
					});
			} else {
				$("#inform_NickCheck").text("닉네임 형식에 맞게 입력해주세요.");
				$("#inform_NickTest").val("false");
			}
		});

		$("#inform_NewPwd").on("blur", function() {
				if (pwdForm.test($(this).val())) {
						$("#inform_NewPwdCheck").text("사용 가능");
						$("#inform_NewPwdTest").val("true");
				} else {
						$("#inform_NewPwdCheck").text("비밀번호는 대소문자, 숫자가 포함되어야 합니다.");
						$("#inform_NewPwdTest").val("false");
				}
					
				if (pwdForm.test($("#inform_NewPwdOk").val())) {
					if($(this).val() == $("#inform_NewPwdOk").val()) {
						$("#inform_NewPwdOkCheck").text("사용 가능");
						$("#inform_NewPwdOkTest").val("true");
					} else {
						$("#inform_NewPwdOkCheck").text("위 비밀번호와 같게 입력해주세요.");
						$("#inform_NewPwdOkTest").val("false");
					}
				} else {
					$("#inform_NewPwdOkCheck").text("비밀번호는 대소문자, 숫자가 포함되어야 합니다.");
					$("#inform_NewPwdOkTest").val("false");
				}
		});

		$("#inform_NewPwdOk").on("blur", function() {
			if (pwdForm.test($(this).val())) {
				if ($("#inform_NewPwd").val() == $(this).val()) {
					$("#inform_NewPwdOkCheck").text("사용 가능");
					$("#inform_NewPwdOkTest").val("true");
				} else {
					$("#inform_NewPwdOkCheck").text("위 비밀번호와 같게 입력해주세요.");
					$("#inform_NewPwdOkTest").val("false");
				}
			} else {
				$("#inform_NewPwdOkCheck").text("비밀번호는 대소문자, 숫자가 포함되어야 합니다.");
				$("#inform_NewPwdOkTest").val("false");
			}
		});

		$("#inform_SubmitBtn").on("click", function() {
			if ($("#inform_NickTest").val() != "true") {
				$("#inform_Nick").focus();
				return;
			}  else if ($("#inform_NewPwdTest").val() != "true") {
				$("#inform_NewPwd").focus();
				return;
			} else if ($("#inform_NewPwdOkTest").val() != "true") {
				$("#inform_NewPwdOk").focus();
				return;
			} else {
				$.ajax({
					url : "informUpdate.do",
					type : "post",
					data : "id_index=${member.id_index}" + "&nick=" + $("#inform_Nick").val() + "&pwd=" + $("#inform_NowPwd").val() + "&newPwd=" + $("#inform_NewPwd").val(),
					dataType : "json",
					success : function(data) {	
						if(data == 4101) {
							location.href = "viewMyPage.do?id_index=${member.id_index}&date=" + new Date();
						} else if (data == 4102) {
							$("#inform_NowPwd").val("");
							$("#inform_NowPwdCheck").text("비밀번호가 틀렸습니다.");
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
			
		$("#inform_CancelBtn").on("click", function() {
			location.href = "javascript:history.back(-1)";
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
		<input type="hidden" value="true" id="inform_NickTest"> <input
			type="hidden" value="false" id="inform_NewPwdTest"> <input
			type="hidden" value="false" id="inform_NewPwdOkTest">
	</center>
</body>
</html>
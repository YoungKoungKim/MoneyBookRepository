/**
 * 
 */

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
		
		
		var pwdForm = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{6,20})/;
			var emailForm = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			var phoneChk = /^(01[016789]{1}|070|02|0[3-9]{1}[0-9]{1})-[0-9]{3,4}-[0-9]{4}$/;
			var nickPattern = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/;
			
			
			$("#id").on("blur", function() {
				if (emailForm.test($(this).val())) {
					$.ajax({
						url : "idCheck.do",
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
							url : "nickCheck.do",
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
						url : "joinSuccess.do",
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
			
			
			
			
			$("#submitBtn").on("click", function() {
			if ($("#id").val() == "") {
				$("#pwdCheck").text("");
				$("#idCheck").text("아이디를 입력해주세요.");
				$("#id").focus();
			} else if ($("#pwd").val() == "") {
				$("#idCheck").text("");
				$("#pwdCheck").text("비밀번호를 입력해주세요.");
				$("#pwd").focus();
			} else {
				$.ajax({
					url : "loginSuccess.do",
					type : "post",
					data : "id=" + $("#id").val() + "&pwd=" + $("#pwd").val(),
					dataType : "json",
					success : function(data) {
						if (data == 2101) {
							opener.parent.location.reload();
							self.close();
						} else if (data == 2102) {
							$("#pwd").val("");
							$("#idCheck").text("");
							$("#pwdCheck").text("아이디 또는 비밀번호를 잘못 입력하셨습니다.");
							$("#pwd").focus();
						}
					},
					error : function() {
						alert("에러 : 로그인 실패");
					}
				})
			}
		})
		
		$("#cancelBtn").on("click", function() {
			self.close();
		})
})
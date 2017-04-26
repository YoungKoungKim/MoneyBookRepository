$(document)
		.ready(
				function() {
					var pwdForm = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{6,20})/;
					var emailForm = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
					var phoneChk = /^(01[016789]{1}|070|02|0[3-9]{1}[0-9]{1})-[0-9]{3,4}-[0-9]{4}$/;
					var nickPattern = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/;
					$("#loginBtn")
							.on(
									"click",
									function() {
										if ($("#login_Id").val() == "") {
											$("#login_PwdCheck").text("");
											$("#login_IdCheck").text(
													"아이디를 입력해주세요.");
											$("#login_Id").focus();
										} else if ($("#login_Pwd").val() == "") {
											$("#login_IdCheck").text("");
											$("#login_PwdCheck").text(
													"비밀번호를 입력해주세요.");
											$("#login_Pwd").focus();
										} else {
											$
													.ajax({
														url : "loginSuccess.do",
														type : "post",
														data : "id="
																+ $("#login_Id")
																		.val()
																+ "&pwd="
																+ $(
																		"#login_Pwd")
																		.val(),
														dataType : "json",
														success : function(data) {
															if (data == 2101) {
																location
																		.reload();
															} else if (data == 2102) {
																$("#login_Pwd")
																		.val("");
																$(
																		"#login_IdCheck")
																		.text(
																				"");
																$(
																		"#login_PwdCheck")
																		.text(
																				"아이디 또는 비밀번호를 잘못 입력하셨습니다.");
																$("#login_Pwd")
																		.focus();
															}
														},
														error : function() {
															alert("에러 : 로그인 실패");
														}
													})
										}
									})

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
									} else if (data == 1001) {
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
									} else if (data == 1101) {
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

					$("#pwd").on(
							"blur",
							function() {
								if (pwdForm.test($(this).val())) {
									$("#pwdCheck").text("사용 가능");
									$("#pwdTest").val("true");
								} else {
									$("#pwdCheck").text(
											"비밀번호는 대소문자, 숫자가 포함되어야 합니다.");
									$("#pwdTest").val("false");
								}

								if (pwdForm.test($("#pwdOk").val())) {
									if ($(this).val() == $("#pwdOk").val()) {
										$("#pwdOkCheck").text("사용 가능");
										$("#pwdOkTest").val("true");
									} else {
										$("#pwdOkCheck").text(
												"위 비밀번호와 같게 입력해주세요.");
										$("#pwdOkTest").val("false");
									}
								} else {
									$("#pwdOkCheck").text(
											"비밀번호는 대소문자, 숫자가 포함되어야 합니다.");
									$("#pwdOkTest").val("false");
								}
							});

					$("#pwdOk").on(
							"blur",
							function() {
								if (pwdForm.test($(this).val())) {
									if ($("#pwd").val() == $(this).val()) {
										$("#pwdOkCheck").text("사용 가능");
										$("#pwdOkTest").val("true");
									} else {
										$("#pwdOkCheck").text(
												"위 비밀번호와 같게 입력해주세요.");
										$("#pwdOkTest").val("false");
									}
								} else {
									$("#pwdOkCheck").text(
											"비밀번호는 대소문자, 숫자가 포함되어야 합니다.");
									$("#pwdOkTest").val("false");
								}
							});

					$("#submitBtn").on(
							"click",
							function() {
								if ($("#idTest").val() != "true") {
									$("#id").focus();
									return;
								} else if ($("#nickTest").val() != "true") {
									$("#nick").focus();
									return;
								} else if ($("#pwdTest").val() != "true") {
									$("#pwd").focus();
									return;
								} else if ($("#pwdOkTest").val() != "true") {
									$("#pwdOk").focus();
									return;
								} else {
									$.ajax({
										url : "joinSuccess.do",
										type : "post",
										data : "id=" + $("#id").val()
												+ "&nick=" + $("#nick").val()
												+ "&pwd=" + $("#pwd").val(),
										dataType : "json",
										success : function(data) {
											if (data == 2001) {
												alert("가입 성공")
												location.reload();
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

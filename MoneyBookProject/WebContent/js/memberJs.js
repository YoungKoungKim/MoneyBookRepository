//*********************************로그인***************************************
$(document).ready(function() {
	var pwdForm = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{6,20})/;
	var emailForm = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	var phoneChk = /^(01[016789]{1}|070|02|0[3-9]{1}[0-9]{1})-[0-9]{3,4}-[0-9]{4}$/;
	var nickPattern = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/;
	
	$("#login_SubmitBtn").on("click", function() {
		if ($("#login_Id").val() == "") {
			$("#login_PwdCheck").text("");
			$("#login_IdCheck").text("아이디를 입력해주세요.");
			$("#login_Id").focus();
		} else if ($("#pwd").val() == "") {
			$("#login_IdCheck").text("");
			$("#login_PwdCheck").text("비밀번호를 입력해주세요.");
			$("#login_Pwd").focus();
		} else {
			$.ajax({
				url : "loginSuccess.do",
				type : "post",
				data : "id=" + $("#login_Id").val() + "&pwd=" + $("#login_Pwd").val(),
				dataType : "json",
				success : function(data) {
					if (data == 2101) {
						location.reload();
					} else if (data == 2102) {
						$("#login_Pwd").val("");
						$("#login_IdCheck").text("");
						$("#login_PwdCheck").text("아이디 또는 비밀번호를 잘못 입력하셨습니다.");
						$("#login_Pwd").focus();
					}
				},
				error : function() {
					alert("에러 : 로그인 실패");
				}
			})
		}
	})

	//*********************************회원가입***************************************
	$("#join_Id").on("blur", function() {
 				if (emailForm.test($(this).val())) {
 					$.ajax({
 						url : "idCheck.do",
 						type : "get",
 						data : "id=" + $(this).val(),
 						dataType : "json",
 						success : function(data) {
 							if (data == 1002) {
 								$("#join_IdCheck").text("사용 가능");
 								$("#join_IdTest").val("true");
 							} else if(data == 1001) {
 								$("#join_IdCheck").text("이미 있는 아이디입니다.");
 								$("#join_IdTest").val("false");
 							}	
 						},
 						error : function(e) {
 							alert("전송 실패");
 						}
 					});
 				} else {
 						$("#join_IdCheck").text("이메일 형식에 맞게 입력해주세요.");
 						$("#join_IdTest").val("false");
 				}
 			});

 			$("#join_Nick").on("blur", function() {
 				if (nickPattern.test($(this).val())) {
 						$.ajax({
 							url : "nickCheck.do",
 							type : "get",
 							data : "nick=" + $(this).val(),
 							dataType : "json",
 							success : function(data) {
 								if (data == 1102) {
 									$("#join_NickCheck").text("사용 가능");
 									$("#join_NickTest").val("true");
 								} else if(data == 1101) {
 									$("#join_NickCheck").text("이미 있는 닉네임입니다.");
 									$("#join_NickTest").val("false");
 								}
 							},
 							error : function(e) {
 								alert("전송 실패");
 							}
 						});
 				} else {
 					$("#join_NickCheck").text("닉네임 형식에 맞게 입력해주세요.");
 					$("#join_NickTest").val("false");
 				}
 			});

 			$("#join_Pwd").on("blur", function() {
 					if (pwdForm.test($(this).val())) {
 							$("#join_PwdCheck").text("사용 가능");
 							$("#join_PwdTest").val("true");
 					} else {
 							$("#join_PwdCheck").text("비밀번호는 대소문자, 숫자가 포함되어야 합니다.");
 							$("#join_PwdTest").val("false");
 					}
					
 					if (pwdForm.test($("#join_PwdOk").val())) {
 						if($(this).val() == $("#join_PwdOk").val()) {
 							$("#join_PwdOkCheck").text("사용 가능");
 							$("#join_PwdOkTest").val("true");
 						} else {
 							$("#join_PwdOkCheck").text("위 비밀번호와 같게 입력해주세요.");
 							$("#join_PwdOkTest").val("false");
 						}
 					} else {
 						$("#join_PwdOkCheck").text("비밀번호는 대소문자, 숫자가 포함되어야 합니다.");
 						$("#join_PwdOkTest").val("false");
 					}
 			});

 			$("#join_PwdOk").on("blur", function() {
 				if (pwdForm.test($(this).val())) {
 					if ($("#join_Pwd").val() == $(this).val()) {
 						$("#join_PwdOkCheck").text("사용 가능");
 						$("#join_PwdOkTest").val("true");
 					} else {
 						$("#join_PwdOkCheck").text("위 비밀번호와 같게 입력해주세요.");
 						$("#join_PwdOkTest").val("false");
 					}
 				} else {
 					$("#join_PwdOkCheck").text("비밀번호는 대소문자, 숫자가 포함되어야 합니다.");
 					$("#join_PwdOkTest").val("false");
 				}
 			});

 			$("#join_SubmitBtn").on("click", function() {
 				if($("#join_IdTest").val() != "true") {
 					$("#join_Id").focus();
 					return;
 				} else if ($("#join_NickTest").val() != "true") {
 					$("#join_Nick").focus();
 					return;
 				}  else if ($("#join_PwdTest").val() != "true") {
 					$("#join_Pwd").focus();
 					return;
 				} else if ($("#join_PwdOkTest").val() != "true") {
 					$("#join_PwdOk").focus();
 					return;
 				} else {
 					$.ajax({
 						url : "joinSuccess.do",
 						type : "post",
 						data : "id=" + $("#join_Id").val() + "&nick=" + $("#join_Nick").val() + "&pwd=" + $("#join_Pwd").val(),
 						dataType : "json",
 						success : function(data) {	
 							if(data == 2001) {
 								alert("가입하셨습니다.")
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
 			});
 				//*********************************정보 수정***************************************
 				
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
 		 								if($("#inform_Nick").val() != $("#inform_NickName").val()) {										
 		 									$("#inform_NickCheck").text("이미 있는 닉네임입니다.");
 		 									$("#inform_NickTest").val("false");
 		 								} else {
 		 									$("#inform_NickCheck").text("현재 닉네임과 같습니다.");
 		 									$("#inform_NickTest").val("false");
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

 				
 				//비밀번호 수정
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

 		 		
 		 		//버튼을 2개로 나눠서 닉네임 따로 해야 함 true 체크
 		 		
 		 		//닉네임 수정
 		 		$("#nick_UpdateBtn").on("click", function() {
 		 			if ($("#inform_NickTest").val() != "true") {
 		 				$("#inform_Nick").focus();
 		 				return;
 		 			} else {
 		 				$.ajax({
 		 					url : "nickUpdate.do",
 		 					type : "post",
 		 					data : "nick=" + $("#inform_Nick").val(),
 		 					dataType : "json",
 		 					success : function(data) {	
 		 						if(data == 4101) {
 		 							location.href = "myInfo.do";
 		 						} else if (data == 4103) {
 		 							alert("db 수정 실패");
 		 						}
 		 					},
 		 					error:function(request,status,error){
 		 				        alert("닉네임 수정 실패 : 다시 시도해주세요. " + data);
 		 				       }
 		 				})
 		 			}
 		 		})
 		 		
 		 		//이건 비밀번호 수정
 		 		$("#pwd_UpdateBtn").on("click", function() {
 		 			if($("#inform_NowPwd").val() == "") {
 		 				alert("현재 비밀번호를 입력해주세요.");
 		 				$("#inform_NowPwd").focus();
 		 				return;
 		 			}
 		 			if ($("#inform_NewPwdTest").val() != "true") {
 		 				$("#inform_NewPwd").focus();
 		 				return;
 		 			} else if ($("#inform_NewPwdOkTest").val() != "true") {
 		 				$("#inform_NewPwdOk").focus();
 		 				return;
 		 			} else {
 		 				$.ajax({
 		 					url : "pwdUpdate.do",
 		 					type : "post",
 		 					data : "pwd=" + $("#inform_NowPwd").val() + "&newPwd=" + $("#inform_NewPwd").val(),
 		 					dataType : "json",
 		 					success : function(data) {	
 		 						if(data == 4101) {
 		 							alert("수정되었습니다.");
 		 							location.href = "myInfo.do";
 		 						} else if (data == 4102) {
 		 							$("#inform_NowPwd").val("");
 		 							$("#inform_NowPwdCheck").text("비밀번호가 틀렸습니다.");
 		 						} else if (data == 4103) {
 		 							alert("비밀번호 db 수정 실패");
 		 						}
 		 					},
 		 					error:function(request,status,error){
 		 				        alert("비밀번호 수정 실패 : 다시 시도해주세요.");
 		 				       }
 		 				})
 		 			}
 		 		});
 			})
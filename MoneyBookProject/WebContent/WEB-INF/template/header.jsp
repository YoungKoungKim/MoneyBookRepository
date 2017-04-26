<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<!-- 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 -->
 
<script type="text/javascript">
	$(document).ready(function() {
		$("#loginBtn").on("click", function() {
			if ($("#login_Id").val() == "") {
				$("#login_PwdCheck").text("");
				$("#login_IdCheck").text("아이디를 입력해주세요.");
				$("#login_Id").focus();
			} else if ($("#login_Pwd").val() == "") {
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

	})
</script>

<script type="text/javascript">
	$(document).ready(function() {
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
</script>
</head>
<body>
	<div id="header">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 logo-wrapper">
					<img src="assets/img/logo1.jpg" alt="" />
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right">
					<div class="menu-links scroll-me">
						<!-- 공유게시판 -->
						<a href="boardList.do" title="공유게시판">BulletinBoard</a>
						<!-- 가계부 -->
						<a href="#moneyBook" title="가계부">MyMoneyBook</a>
						<!-- 로그인 -->
						<a data-toggle="modal" data-target="#loginModal" data-backdrop="static" 
						href="#loginForm" title="로그인">Login</a>
						<!-- 회원가입 -->
						<a data-toggle="modal" data-target="#joinModal" data-backdrop="static"
							href="#joinForm" title="회원가입">Join</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- LoginModal -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel" style="color: black;">로그인</h4>
				</div>
				<div class="modal-body">
					<center>
						<h1 style="color: black;">로그인</h1>
						<table>
							<tr align="center">
								<td style="color: black;">아이디</td>
								<td><input type="text" id="login_Id" class="form-control"
									placeholder="이메일을 입력하세요."></td>
							</tr>
							<tr>
								<td></td>
								<td><span id="login_IdCheck" style="color: red;"></span></td>
							</tr>
							<tr align="center">
								<td style="color: black;">비밀번호</td>
								<td><input type="password" id="login_Pwd" class="form-control"
									placeholder="비밀번호를 입력해주세요."></td>
							</tr>
							<tr>
								<td></td>
								<td><span id="login_PwdCheck" style="color: red;"></span></td>
							</tr>
							<tr align="center">
								<td colspan="2"><input type="button" value="로그인"
									class="btn btn-success" id="loginBtn">
									&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="취소"
									class="btn btn-info" id="loginCancelBtn" data-dismiss="modal"></td>
							</tr>
						</table>
					</center>
				</div>
			</div>
		</div>
	</div>

<div class="modal fade" id="joinModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel" style="color: black;">회원가입</h4>
				</div>
				<div class="modal-body">
					<center>
		<h1 style="color: black;">회 원 가 입</h1>
		<table>
			<tr align="center">
				<td style="color: black;">아이디</td>
				<td><input type="text" id="id" class="form-control"
					placeholder="이메일을 입력하세요."></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="idCheck" style="color: red;"></span></td>
			</tr>
			<tr align="center">
				<td style="color: black;">닉네임</td>
				<td><input type="text" id="nick"
					class="form-control" placeholder="닉네임을 입력하세요."></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="nickCheck" style="color: red;"></span></td>
			</tr>
			<tr align="center">
				<td style="color: black;">비밀번호</td>
				<td><input type="password" id="pwd"
					class="form-control" placeholder="비밀번호를 입력해주세요."></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="pwdCheck" style="color: red;"></span></td>
			</tr>
			<tr align="center">
				<td style="color: black;">비밀번호 확인</td>
				<td><input type="password" id="pwdOk" class="form-control"
					placeholder="다시 한번 입력해주세요."></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="pwdOkCheck" style="color: red;"></span></td>
			</tr>
				<tr align="center">
				<td colspan="2"><input type="button" value="확인"
				class="btn btn-success" id="submitBtn">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="취소"
				class="btn btn-info" id="cancelBtn"  data-dismiss="modal"></td>
			</tr>
		</table>
		<input type="hidden" value="false" id="idTest">
		<input type="hidden" value="false" id="nickTest">
		<input type="hidden" value="false" id="pwdTest">
		<input type="hidden" value="false" id="pwdOkTest">
	</center>
				</div>
			</div>
		</div>
	</div>


	<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	<!-- CORE JQUERY  SCRIPTS -->
	<script src="assets/js/jquery-1.11.1.js"></script>
	<!-- BOOTSTRAP SCRIPTS  -->
	<script src="assets/js/bootstrap.js"></script>
	<!-- SCROLLING SCRIPTS PLUGIN  -->
	<script src="assets/js/jquery.easing.min.js"></script>
	<!-- CUSTOM SCRIPTS   -->
	<script src="assets/js/custom.js"></script>
</body>
</html>
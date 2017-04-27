<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="js/memberScript.js"></script>

</head>
<body>
	<c:choose>
		<c:when test="${id_index == null }">
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
								<a data-toggle="modal" data-target="#loginModal"
									data-backdrop="static" href="#loginForm" title="로그인">Login</a>
								<!-- 회원가입 -->
								<a data-toggle="modal" data-target="#joinModal"
									data-backdrop="static" href="#joinForm" title="회원가입">Join</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
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
								<a href="logout.do" title="로그아웃">Logout</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>

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
								<td><input type="text" id="nick" class="form-control"
									placeholder="닉네임을 입력하세요."></td>
							</tr>
							<tr>
								<td></td>
								<td><span id="nickCheck" style="color: red;"></span></td>
							</tr>
							<tr align="center">
								<td style="color: black;">비밀번호</td>
								<td><input type="password" id="pwd" class="form-control"
									placeholder="비밀번호를 입력해주세요."></td>
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
									class="btn btn-info" id="cancelBtn" data-dismiss="modal"></td>
							</tr>
						</table>
						<input type="hidden" value="false" id="idTest"> <input
							type="hidden" value="false" id="nickTest"> <input
							type="hidden" value="false" id="pwdTest"> <input
							type="hidden" value="false" id="pwdOkTest">
					</center>
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
										<td><input type="password" id="login_Pwd"
											class="form-control" placeholder="비밀번호를 입력해주세요."></td>
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
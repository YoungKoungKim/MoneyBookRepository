<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가계이득</title>
<!-- Mobile Specific Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap  -->
<link href="homeCss/blur-color-variation/assets/css/bootstrap.min.css"
	rel="stylesheet">
<!-- icon fonts font Awesome -->
<link
	href="homeCss/blur-color-variation/assets/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Custom Styles -->
<link href="homeCss/blur-color-variation/assets/css/style.css"
	rel="stylesheet">
<!--Color Style -->
<link rel="stylesheet" type="text/css" id="color"
	href="homeCss/blur-color-variation/assets/css/colors/default.css" />
<!-- 	제이쿼리 -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<!-- 	모달때문에가져옴 -->
<script type="text/javascript" src="js/memberJs.js"></script>
<script type="text/javascript" src="js/headerScript.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css"
	rel="stylesheet">
<!-- 	부트스트랩 모달 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- 	모달때문에 끝 -->
<script type="text/javascript">
	function today() {
		var date = new Date();
		var dd = date.getDate();
		var mm = date.getMonth() + 1; //January is 0!
		var yyyy = date.getFullYear();
		var id_index = parseInt('${id_index}');
		if (dd < 10) {
			dd = '0' + dd
		}
		if (mm < 10) {
			mm = '0' + mm
		}
		today = yyyy + '-' + mm + '-' + dd;
		return location.href = "viewMyPage.do?date="+ today;
	} //today()

	$(document).ready(function() {
		$("#header_Logout").on("click", function() {
			alert("로그아웃 되었습니다");
			Kakao.Auth.logout();

			setTimeout(function() {
				location.href = "logout.do";
			}, 1500);
		});

	}) //ready
</script>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

@import url(http://fonts.googleapis.com/css?family=Pacifico);

@import
	url(http://fonts.googleapis.com/css?family=Roboto:400,300,400italic,700)
	;

@font-face {
	font-family: 'NanumGothic';
	src: url(font/NanumBarunGothic_0.ttf) format('truetype');
	font-family: 'koverwatch';
	src: url(font/koverwatch.ttf) format('truetype');
	font-family: 'Hanna', serif;
	font-family: 'Roboto', sans-serif;
}

body {
	font-family: 'Roboto', sans-serif;
	color: #fff;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

.time-name {
	text-transform: uppercase;
	font-size: 20px;
	width: 100%;
	display: inline-block;
	font-weight: 700;
	padding-top: 25%;
}

.modal-content {
	width: 523px;
	height: auto;
}

.modal-body {
	border: 3px solid #1ABC9C;
	margin: 10px;
	height: auto;
	font-family: NanumGothic;
}

#login_Label {
	color: #91D4B5;
	font-family: koverwatch;
}

.btn {
	font-family: Hanna;
	border-radius: 10px;
	background-color: #1abc9c;
	padding: 5px 15px;
	margin-top: 5px;
	margin-bottom: 15px;
	text-align: center;
	color: white;
	border-radius: 10px;
}

.btn:hover {
	background-color: grey;
	color: #fff;
	text-decoration: none
}

#noneMemberModal-content {
	padding: 5px;
	margin: 10px;
	border: 3px solid #1ABC9C;
	font-family: Hanna;
	font-size: 18px;
	color: black;
}
body,
.section-style {
  background: -webkit-linear-gradient(90deg, #649173 10%, #DBD5A4 90%); /* Chrome 10+, Saf5.1+ */
  background:    -moz-linear-gradient(90deg, #649173 10%, #DBD5A4 90%); /* FF3.6+ */
  background:     -ms-linear-gradient(90deg, #649173 10%, #DBD5A4 90%); /* IE10 */
  background:      -o-linear-gradient(90deg, #649173 10%, #DBD5A4 90%); /* Opera 11.10+ */
  background:         linear-gradient(90deg, #649173 10%, #DBD5A4 90%); /* W3C */
}
</style>
</head>
<body>
	<!-- Preloader -->
	<div id="preloader">
		<div id="loader">
			<div class="dot"></div>
			<div class="dot"></div>
			<div class="dot"></div>
			<div class="dot"></div>
			<div class="dot"></div>
			<div class="dot"></div>
			<div class="dot"></div>
			<div class="dot"></div>
			<div class="lading"></div>
		</div>
	</div>
	<!-- /#preloader -->
	<!-- Preloader End-->

	<!-- Main Menu -->
	<div id="main-menu" class="navbar navbar-default navbar-fixed-top"
		role="navigation">
		<div class="navbar-header">
			<!-- responsive navigation -->
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <i class="fa fa-bars"></i>
			</button>
			<!-- /.navbar-toggle -->
		</div>
		<!-- /.navbar-header -->
		<c:choose>
			<c:when test="${id_index == null }">
				<nav class="collapse navbar-collapse"> <!-- Main navigation -->
				<ul id="headernavigation" class="nav navbar-nav">
					<li class="active"><a href="home.do">Home</a></li>
					<li><a href="jsp/about.jsp">About</a></li>
					<li><a data-toggle="modal" data-target="#loginModal"
						data-backdrop="static" href="#loginForm" title="로그인">Login</a></li>
					<li><a data-toggle="modal" data-target="#joinModal"
						data-backdrop="static" href="#joinForm" title="회원가입">Join</a></li>
				</ul>
				<!-- /.nav .navbar-nav --> </nav>
				<!-- /.navbar-collapse  -->
			</c:when>

			<c:when test="${id_index != null }">
				<nav class="collapse navbar-collapse"> <!-- Main navigation -->
				<ul id="headernavigation" class="nav navbar-nav">
					<li class="active"><a href="home.do">Home</a></li>
					<li><a href="jsp/about.jsp">About</a></li>
					<li><a href="myInfo.do" title="로그인">MyInfo</a></li>
					<li><a href="#" id="header_Logout">Logout</a></li>
				</ul>
				<!-- /.nav .navbar-nav --> </nav>
				<!-- /.navbar-collapse  -->
			</c:when>
		</c:choose>
	</div>
	<!-- /#main-menu -->
	<!-- Main Menu End -->

	<!-- Page Top Section -->
	<section id="page-top" class="section-style">
<!-- 		data-background-image="homeCss/blur-color-variation/images/background/page-top.jpg" -->
	<div class="pattern height-resize">
		<div class="container">
			<h1 class="site-title">MoneyBook</h1>
			<!-- /.site-title -->
			<h3 class="section-name">
				<span> 가계이득 </span>
			</h3>
			<!-- /.section-name -->
			<h2 class="section-title">가계부개이득</h2>
			<!-- /.Section-title  -->
			<div id="time_countdown" class="time-count-container">
				<div class="col-sm-3">
					<div class="time-box">
						<div class="time-box-inner dash days_dash animated">
							<a href="boardList.do"><span class="time-name">Board</span></a>
						</div>
					</div>
				</div>

				<div class="col-sm-3">
					<div class="time-box">
						<div class="time-box-inner dash hours_dash animated">
							<c:if test="${id_index ne null}">
								<a href="JavaScript:today()"><span class="time-name">MoneyBook</span></a>
							</c:if>
							<c:if test="${id_index eq null}">
								<a data-toggle="modal" data-target="#noneMember"
									data-backdrop="static" href="#noneMember"> <span
									class="time-name">MoneyBook</span></a>
							</c:if>
						</div>
					</div>
				</div>

				<div class="col-sm-3">
					<div class="time-box">
						<div class="time-box-inner dash minutes_dash animated">
							<a href="homerecommend.do"><span class="time-name">Best</span></a>
						</div>
					</div>
				</div>

				<div class="col-sm-3">
					<div class="time-box">
						<div class="time-box-inner dash seconds_dash animated">
							<a href="howToUseMoneyBook.do"><span class="time-name">Information</span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.time-count-container -->
	</div>
	<!-- /.container --> <!-- /.pattern --> </section>
	<!-- /#page-top -->
	<!-- Page Top Section  End -->

	<!-- JoinModal -->
	<div class="modal fade" id="joinModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="z-index: 2222;">
		<div class="modal-dialog" style="z-index: 2222;">
			<div class="modal-content" style="z-index: 2222;">
				<div class="modal-body" style="z-index: 2222;">
					<center>
						<h1 style="color: black;">회 원 가 입</h1>
						<table>
							<tr align="center">
								<td style="color: black;">아이디</td>
								<td width="320px;"><input type="text" id="join_Id"
									class="form-control" placeholder="이메일을 입력하세요."></td>
							</tr>
							<tr>
								<td></td>
								<td><span id="join_IdCheck" style="color: red;"></span><br></td>
							</tr>
							<tr align="center">
								<td style="color: black;">닉네임</td>
								<td><input type="text" id="join_Nick" class="form-control"
									placeholder="2~12자로 닉네임을 입력하세요."></td>
							</tr>
							<tr>
								<td></td>
								<td><span id="join_NickCheck" style="color: red;"></span><br></td>
							</tr>
							<tr align="center">
								<td style="color: black;">비밀번호</td>
								<td><input type="password" id="join_Pwd"
									class="form-control" placeholder="6~20자 영문 대 소문자, 숫자는 필수입니다."></td>
							</tr>
							<tr>
								<td></td>
								<td><span id="join_PwdCheck" style="color: red;"></span><br></td>
							</tr>
							<tr align="center">
								<td style="color: black;">비밀번호 확인&nbsp;</td>
								<td><input type="password" id="join_PwdOk"
									class="form-control" placeholder="다시 한번 입력해주세요."></td>
							</tr>
							<tr>
								<td></td>
								<td><span id="join_PwdOkCheck" style="color: red;"></span><br></td>
							</tr>
							<tr align="center">
								<td colspan="2"><input type="button" value="확인"
									class="btn btn-success" id="join_SubmitBtn">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="취소"
									class="btn btn-info" data-dismiss="modal"></td>
							</tr>
						</table>
						<input type="hidden" value="false" id="join_IdTest"> <input
							type="hidden" value="false" id="join_NickTest"> <input
							type="hidden" value="false" id="join_PwdTest"> <input
							type="hidden" value="false" id="join_PwdOkTest">
					</center>
				</div>
			</div>
		</div>
	</div>

	<!-- LoginModal -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="z-index: 2222;">
		<div class="modal-dialog" style="z-index: 2222;">
			<div class="modal-content" style="z-index: 2222;">
				<div class="modal-body" style="z-index: 2222;">
					<center>
						<h1 id="login_Label">로그인</h1>
						<table>
							<tr align="center">
								<td style="color: black;">아이디</td>
								<td width="305px;"><input type="text" id="login_Id"
									class="form-control" placeholder="이메일을 입력하세요."></td>
							</tr>
							<tr>
								<td></td>
								<td><span id="login_IdCheck" style="color: red;"></span><br></td>
							</tr>
							<tr align="center">
								<td style="color: black;">비밀번호&nbsp;</td>
								<td><input type="password" id="login_Pwd"
									class="form-control" placeholder="비밀번호를 입력해주세요."></td>
							</tr>
							<tr>
								<td></td>
								<td><span id="login_PwdCheck" style="color: red;"></span><br></td>
							</tr>
							<tr align="center">
								<td colspan="2"><input type="button" value="로그인"
									class="btn btn-success" id="login_SubmitBtn">
									&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="취소"
									class="btn btn-info" data-dismiss="modal"></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><br> <a
									id="kakao-login-btn"></a> <a
									href="http://developers.kakao.com/logout"></a>
								<td>
							</tr>
						</table>
					</center>
				</div>
			</div>
		</div>
	</div>


	<!-- Footer Section -->
	<footer id="footer-section">
	<p class="copyright">
		&copy; <a href="https://github.com/YoungKoungKim/MoneyBookRepository/">잘해보조</a>
		2017, All Rights Reserved. Designed by & Developed by <a
			href="http://jeweltheme.com">RyunJa Theme</a>
	</p>
	</footer>
	<!-- Footer Section End -->

	<!-- if user dont login, show modal -->
	<div class="modal fade" id="noneMember" aria-hidden="true"
		style="z-index: 2222;">
		<div class="modal-dialog" style="z-index: 2222;">
			<div class="modal-content" style="z-index: 2222;">
				<div class="modal-body" id="noneMemberModal-content"
					style="z-index: 2222;">
					<div align="center" style="z-index: 2222;">
						<h3>가계부 작성은 로그인 후 이용 가능합니다.</h3>
						<button class="btn" id="goToLogin" data-dismiss="modal"
							data-toggle="modal" data-target="#loginModal"
							data-backdrop="static" href="#loginForm">
							로그인&nbsp;<i class="fa fa-sign-out" aria-hidden="true"></i>
						</button>
						<button class="btn" data-dismiss="modal">취소</button>
					</div>
				</div>

			</div>
		</div>
	</div>

	<script type='text/javascript'>
		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('9712483447f19279ea7f16e2db8de389');
		// 카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {
				Kakao.API.request({
					url : '/v1/user/me',
					success : function(res) {
						$.ajax({
							url : "kakaoLogin.do",
							type : "post",
							data : "id=" + res.id + "&nick="
									+ res.properties.nickname,
							success : function() {
								alert(res.properties.nickname + "님 환영합니다!!");
								location.reload();
							},
							error : function(error) {
								alert("카카오 로그인 실패 : " + error);
							}
						});
					},
					fail : function(error) {
						alert(JSON.stringify(error));
					}
				})
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
		//]]>
	</script>

	<!-- jQuery Library -->
	<script type="text/javascript"
		src="homeCss/blur-color-variation/assets/js/jquery-2.1.0.min.js"></script>
	<!-- Modernizr js -->
	<script type="text/javascript"
		src="homeCss/blur-color-variation/assets/js/modernizr-2.8.0.min.js"></script>
	<!-- Custom JavaScript Functions -->
	<script type="text/javascript"
		src="homeCss/blur-color-variation/assets/js/functions.js"></script>
</body>
</html>
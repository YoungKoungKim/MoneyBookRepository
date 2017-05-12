<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보</title>

<style type="text/css">
#myInfoContainer {
	margin-top: 30px;
	margin-bottom: 50px;
	min-height: 700px;
	width: 1100px;
	vertical-align: middle;
}

#myInfo_Body {
	font-size: 18px;
}

.left_t, .left_b, .right_t, .right_b {
	width: 538px;
	height: 300px;
	margin: 5px;
	border: 1px solid #dadada;
	background-color: #eaeae9;
}
</style>
</head>
<body id="myInfo_Body">
	<center>
		<h1>회원 정보 관리</h1>
		<div id="myInfoContainer" align="center">
			<div class="col-md-5 left_t">
				<h2>프로필</h2>
				<div style="padding: 5px; height: 20%;">
					<div class="col-md-4">
						<h3>ID :</h3>
					</div>
					<div class="col-md-8" style="text-align: left;">
						<h3>${member.id }</h3>
					</div>
				</div>

				<div style="padding: 5px; height: 20%;">
					<div class="col-md-4">
						<h3>닉네임 :</h3>
					</div>
					<div class="col-md-8" style="text-align: left;">
						<h3>${member.nick }</h3>
					</div>
				</div>
				
				<div style="padding: 5px; height: 20%;">
					<div class="col-md-4">
						<h3>가입 경로 :</h3>
					</div>
					<div class="col-md-8" style="text-align: left;">
						<h3>
							<c:choose>
								<c:when
									test="${member.pwd eq '4a7d1ed414474e4033ac29ccb8653d9b'}">
									카카오 아이디
								</c:when>
								<c:otherwise>
									일반 아이디
								</c:otherwise>
							</c:choose>
						</h3>
					</div>
				</div>
				
			</div>
			<div class="col-md-5 right_t"><h2>닉네임 수정</h2></div>
			<div class="col-md-5 left_b"><h2>비밀번호 수정</h2></div>
			<div class="col-md-5 right_b"><h2>탈퇴</h2></div>
		</div>
	</center>
</body>
</html>
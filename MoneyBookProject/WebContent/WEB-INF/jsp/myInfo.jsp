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
	min-height: 620px;
	width: 1100px;
	vertical-align: middle;
}

.left_t, .left_b, .right_t, .right_b {
	width: 538px;
	height: 300px;
	margin: 5px;
	border: 1px solid #dadada;
	background-color: #eaeae9;
}

#inform_Nick {
	height: 45px;
	font-size: 24px;
}

#inform_Btn {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	
	/* 	border-radius: 0px; */
	/* 	padding-left: 120px; */
	/* 	padding-right: 120px; */
}

#inform_Btn:ACTIVE {
	position: relative;
	top: 1px;
}

.myButton {
	background-color: #91D4B5;
	font-size: 17px;
}
</style>
</head>
<body>
	<center>
		<c:choose>
			<c:when test="${id_index == member.id_index }">
				<h1>회원 정보 관리</h1>
				<div id="myInfoContainer" align="center">
					<div class="col-md-5 left_t">
						<h2>프로필</h2>
						<div style="padding: 5px; height: 20%;">
							<div class="col-md-4" style="text-align: left;">
								<h3>아이디 :</h3>
							</div>
							<div class="col-md-8" style="text-align: left;">
								<h3>${member.id }</h3>
							</div>
						</div>

						<div style="padding: 5px; height: 20%;">
							<div class="col-md-4" style="text-align: left;">
								<h3>닉네임 :</h3>
							</div>
							<div class="col-md-8" style="text-align: left;">
								<h3>${member.nick }</h3>
							</div>
						</div>

						<div style="padding: 5px; height: 20%;">
							<div class="col-md-4" style="text-align: left;">
								<h3>가입 경로 :</h3>
							</div>
							<div class="col-md-8" style="text-align: left;">
								<h3>
									<c:choose>
										<c:when
											test="${member.pwd eq '4a7d1ed414474e4033ac29ccb8653d9b'}">카카오 아이디</c:when>
										<c:otherwise>일반 아이디</c:otherwise>
									</c:choose>
								</h3>
							</div>
						</div>

					</div>
					<div class="col-md-5 right_t">
						<h2 style="margin-bottom: 20px;">닉네임 수정</h2>

						<div style="padding: 5px; height: 20%;">

							<div class="col-md-4" style="text-align: left;">
								<h3 style="margin-top: 10px;">닉네임 :</h3>
							</div>

							<div class="col-md-8"
								style="text-align: left; padding-left: 0px;">
								<input type="text" id="inform_Nick" value="${member.nick }"
									class="form-control" placeholder="닉네임을 입력하세요.">
							</div>

						</div>

						<div class="col-md-12" id="inform_NickCheck"
							style="color: red; padding: 5px; min-height: 45px; font-size: 24px; margin-top: 10px; margin-bottom: 10px;"></div>

						<div class="col-md-12" style="padding: 5px; height: 20%;">
							<button type="button" id="inform_Btn" style="">닉네임 수정</button>
						</div>

					</div>
					<div class="col-md-5 left_b">
						<h2>비밀번호 수정</h2>
					</div>
					<div class="col-md-5 right_b">
						<h2>탈퇴</h2>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<h1>죄송합니다.</h1>
				<br>
				<h3>잘못된 요청입니다.</h3>
			</c:otherwise>
		</c:choose>
	</center>
</body>
</html>
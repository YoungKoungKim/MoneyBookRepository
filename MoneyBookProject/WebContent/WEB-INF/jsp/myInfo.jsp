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

.check {
	margin-top: 4px;
	margin-bottom: 4px;
	color: red;
}

.inputLabel {
	width: 131px;
}

.piece {
	/* 	background-image: url("bg_char.jpg"); */
	width: 538px;
	height: 300px;
	margin: 5px;
	border: 1px solid #dadada;
	background-color: #eaeae9;
}

#nick_UpdateBtn, #pwd_UpdateBtn, #user_DeleteBtn {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 2px 2px;
	cursor: pointer;
	padding-left: 120px;
	padding-right: 120px;
	padding-top: 5px;
	padding-bottom: 5px;
}

#nick_UpdateBtn:ACTIVE {
	position: relative;
	top: 1px;
}
</style>
</head>
<body>
	<center>
		<c:choose>
			<c:when test="${id_index == member.id_index }">
				<h1>회원 정보 관리</h1>
				<div id="myInfoContainer" align="center">
					<div class="col-md-5 piece left_t">
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
								<h3>${userType }아이디</h3>
							</div>
						</div>

					</div>

					<div class="col-md-5 piece right_t">
						<h2 style="margin-bottom: 20px;">닉네임 수정</h2>

						<div class="col-md-12">

							<div class="input-group">
								<span class="input-group-addon inputLabel">닉네임</span> <input
									id="inform_Nick" type="text" class="form-control"
									placeholder="2~12자로 수정할 닉네임을 입력해주세요." style="width: 345px;">
							</div>

						</div>

						<div class="col-md-12" id="inform_NickCheck"
							style="color: red; padding: 5px; min-height: 45px; font-size: 24px; margin-top: 10px; margin-bottom: 10px;"></div>

						<div class="col-md-12" style="padding: 5px; height: 20%;">
							<button type="button" id="nick_UpdateBtn">닉네임 수정</button>
						</div>

					</div>
					<!-- ---------------------- 비밀번호------------------------ -->
					<div class="col-md-5 piece left_b">
						<h2>비밀번호 수정</h2>

						<c:choose>
							<c:when test="${userType eq '카카오'}">
								<div class="col-md-12">
									<h2>
										카카오 아이디는 비밀번호를 <br> 수정할 수 없습니다.
									</h2>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-md-12">
									<div class="input-group">
										<span class="input-group-addon inputLabel">현재 비밀번호</span> <input
											id="inform_NowPwd" type="password" class="form-control"
											placeholder="현재 비밀번호를 입력해주세요." style="width: 345px;">
									</div>
								</div>

								<div class="col-md-12 check">&nbsp;</div>

								<div class="col-md-12">
									<div class="input-group">
										<span class="input-group-addon inputLabel">새 비밀번호</span> <input
											id="inform_NewPwd" type="password" class="form-control"
											placeholder="6~20자 영문 대 소문자, 숫자는 필수입니다."
											style="width: 345px;">
									</div>
								</div>

								<div class="col-md-12 check" id="inform_NewPwdCheck">&nbsp;</div>

								<div class="col-md-12">
									<div class="input-group">
										<span class="input-group-addon inputLabel">새 비밀번호 확인</span> <input
											id="inform_NewPwdOk" type="password" class="form-control"
											placeholder="새 비밀번호를 다시 입력해주세요." style="width: 345px;">
									</div>
								</div>

								<div class="col-md-12 check" id="inform_NewPwdOkCheck">&nbsp;</div>

								<div class="col-md-12" style="height: 20%; margin-top: 2px;">
									<button type="button" id="pwd_UpdateBtn">비밀번호 수정</button>
								</div>
							</c:otherwise>
						</c:choose>

					</div>
					<div class="col-md-5 piece right_b">
						<h2>탈퇴</h2>

						<div class="col-md-12">
							<h2>탈퇴 하면 작성한 글은 모두 삭제됩니다.</h2>
						</div>


						<c:if test="${userType ne '카카오'}">
							<div class="col-md-12" style="margin-top: 20px;">
								<div class="input-group">
									<span class="input-group-addon inputLabel">비밀번호</span> <input
										id="delete_PwdInput" type="password" class="form-control"
										placeholder="현재 비밀번호를 입력해주세요." style="width: 345px;">
								</div>
							</div>
						</c:if>

						<div class="col-md-12" style="margin-top: 20px;">
							<button type="button" id="user_DeleteBtn">회원 탈퇴</button>
						</div>

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
	<input type="hidden" value="${userType }" id="user_Type">
	<input type="hidden" value="${member.nick }" id="inform_NickName">
	<input type="hidden" value="false" id="inform_NickTest">
	<input type="hidden" value="false" id="inform_NewPwdTest">
	<input type="hidden" value="false" id="inform_NewPwdOkTest">
</body>
</html>
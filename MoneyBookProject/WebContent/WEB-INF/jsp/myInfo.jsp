<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보</title>

<style type="text/css">
#myInfoContainer {
	margin-top: 70px;
	margin-bottom: 50px;
	min-height: 600px;
}

#tabContent {
	border: 1px solid #ddd;
	border-top-color: white;
	min-height: 600px;
}
</style>
</head>
<body>
	<div class="container" id="myInfoContainer">
		<ul id="myTab" class="nav nav-tabs nav-justified" role="tablist">
			<li role="presentation" class="active"><a data-target="#home"
				id="home-tab" role="tab" data-toggle="tab" aria-controls="home"
				aria-expanded="true"> 회원 정보 </a></li>
			<li role="presentation" class=""><a data-target="#profile"
				role="tab" id="profile-tab" data-toggle="tab"
				aria-controls="profile" aria-expanded="false"> 보안 설정 </a></li>
		</ul>

		<div id="tabContent" class="tab-content">
			<div role="tabpanel" class="tab-pane fade active in" id="home"
				aria-labelledby="home-tab" style="padding: 30px;">
				<!-- 회원 정보 탭의 내용 -->
				<center>
					<table>
						<tr align="center">
							<td>아이디</td>
							<td align="left" width="305px;"><input type="text"
								id="inform_Id" value="${member.id }" class="form-control"
								readonly="readonly"></td>
						</tr>
						<tr>
							<td></td>
							<td><br></td>
						</tr>
						<tr align="center">
							<td>닉네임</td>
							<td><input type="text" id="inform_Nick"
								value="${member.nick }" class="form-control"
								placeholder="닉네임을 입력하세요."></td>
						</tr>
						<tr>
							<td></td>
							<td><span id="inform_NickCheck" style="color: red;"></span><br></td>
						</tr>
						<tr align="center">
							<td colspan="2"><input type="button" value="수정"
								class="btn btn-success" id="inform_SubmitBtn">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="취소"
								class="btn btn-info" id="inform_CancelBtn"></td>
						</tr>
					</table>
					<input type="hidden" value="${member.nick }" id="inform_NickName">
					<input type="hidden" value="${member.id_index }"
						id="inform_Id_index"> <input type="hidden" value="true"
						id="inform_NickTest"> <input type="hidden" value="false"
						id="inform_NewPwdTest"> <input type="hidden" value="false"
						id="inform_NewPwdOkTest">
				</center>
			</div>
			<div role="tabpanel" class="tab-pane fade" id="profile"
				aria-labelledby="profile-tab">
				<!-- 보안 설정 탭의 내용 -->
				보안 설정은? ${id_index }
			</div>
		</div>
	</div>
</body>
</html>
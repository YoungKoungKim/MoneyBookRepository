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

<script type="text/javascript" src="js/memberJs.js"></script>
<script type="text/javascript" src="js/headerScript.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript">
   $(document).ready(function() {
      $("#header_Logout").on("click", function() {
         Kakao.Auth.logout();

         setTimeout(function() {
            location.href = "logout.do";
         }, 1500);
      })

   })
</script>

<link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css"
   rel="stylesheet">
<link
   href="homeCss/blur-color-variation/assets/css/font-awesome.min.css"
   rel="stylesheet">

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
@CHARSET "UTF-8";
/************* Common *************/
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

@font-face {
   font-family: 'NanumGothic';
   src: url(font/NanumBarunGothic_0.ttf) format('truetype');
   font-family: 'koverwatch';
   src: url(font/koverwatch.ttf) format('truetype');
}

.modal-content {
   width: 523px;
   height: auto;
}

.modal-body {
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
</style>
</head>
<body>
   <c:choose>
      <c:when test="${id_index == null }">
         <div id="header">
            <div class="container">
               <div class="row">
                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 logo-wrapper">
                     <a href="home.do"><img src="assets/img/logo1.jpg" alt="" /></a>
                  </div>
                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right">
                     <div class="menu-links scroll-me">
                        <!-- 공유게시판 -->
                        <a href="boardList.do" title="공유게시판">BulletinBoard</a>
                        <!-- 가계부 -->
                        <a data-toggle="modal" data-target="#noneMember"
                           data-backdrop="static" href="#noneMember" title="가계부">MyMoneyBook</a>
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
                     <a href="home.do"><img src="assets/img/logo1.jpg" alt="" /></a>
                  </div>
                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right">
                     <div class="menu-links scroll-me">
                        <!-- 공유게시판 -->
                        <a href="boardList.do" title="공유게시판">BulletinBoard</a>
                        <!-- 가계부 -->
                        <a href="#" onclick="viewMyPage(${id_index})" title="가계부">MyMoneyBook</a>
                        <!-- 가계부 -->
                        <a href="myInfo.do" title="회원 정보" id="MyInfoLink">Account</a>
                        <!-- 로그인 -->
                        <a href="#" title="로그아웃" id="header_Logout">Logout</a>
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
            <div class="modal-body" style="border: 2px solid #91D4B5;">
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
                           placeholder="닉네임을 입력하세요."></td>
                     </tr>
                     <tr>
                        <td></td>
                        <td><span id="join_NickCheck" style="color: red;"></span><br></td>
                     </tr>
                     <tr align="center">
                        <td style="color: black;">비밀번호</td>
                        <td><input type="password" id="join_Pwd"
                           class="form-control" placeholder="비밀번호를 입력해주세요."></td>
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
                           class="btn" id="join_SubmitBtn">
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="취소"
                           class="btn" data-dismiss="modal"></td>
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
      aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-body" style="border: 2px solid #91D4B5;">
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
                           class="btn" id="login_SubmitBtn">
                           &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="취소"
                           class="btn" data-dismiss="modal"></td>
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
                     data : "id=" + res.id + "&nick=" + res.properties.nickname,
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

   <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
   <!-- CORE JQUERY  SCRIPTS -->
   <!--    <script src="assets/js/jquery-1.11.1.js"></script> -->
   <!-- BOOTSTRAP SCRIPTS  -->
   <!--    <script src="assets/js/bootstrap.js"></script> -->
   <!-- SCROLLING SCRIPTS PLUGIN  -->
   <!--    <script src="assets/js/jquery.easing.min.js"></script> -->
   <!-- CUSTOM SCRIPTS   -->
   <!--    <script src="assets/js/custom.js"></script> -->
</body>
</html>
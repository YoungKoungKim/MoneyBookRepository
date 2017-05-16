<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth() + 1; //January is 0!
		var yyyy = today.getFullYear();
		if (dd < 10) {
			dd = '0' + dd
		}
		if (mm < 10) {
			mm = '0' + mm
		}
		today = yyyy + '-' + mm + '-' + dd;
		$("#nowDate").text("날짜 : " + today); //날짜 표시

	})
</script>
<style type="text/css">
.root {
	margin: auto;
	width: 800px;
	background-color: #f0f8ff;
}

.top {
	width: 100%;
	height: 100%;
	text-align: center;
}


.left {
	width: 100%;
	margin: auto;
}

.bottom {
	width: 100%;
	height: 100%;
	clear: both;
	text-align: center;
}

.category_td {
	color: #000000;
	font-size: 70px;
	text-align: center;
	width: 150px;
	height: 100px;
	/* margin-left: 5px; */
}

.categoryfont {
	font-size: 20px;
	text-align: center;
}
select {
 width: 70px; /* 원하는 너비설정 */ 
 padding: .3em .3em; /* 여백으로 높이 설정 */ 
 margin-right : 10px;
 font-family: inherit; /* 폰트 상속 */ 
 background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
 border: 1px solid #999; 
 border-radius: 0px; /* iOS 둥근모서리 제거 */ 
 -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
 -moz-appearance: none; 
 appearance: none; 
 }
</style>
</head>

<body>
	<div class="root">
			<br>
		<form action="boardWrite.do" method="post">
					<input type="hidden" value="${date}" name="date2">
					<input type="hidden" value="${nick}" name="nick">
					<input type="hidden" value="${id_index}" name="id_index">
			<div class="top">
				<table align="center">

					<tr>
						<td width="100px"><select id="ageType" name="ageType">
								<option value="10">10대</option>
								<option value="20">20대</option>
								<option value="30">30대</option>
								<option value="40">40대이상</option>
						</select>
						</td>
						<td>
						제목 
							&nbsp;
							 <input style="width: 400px" type="text" name="title" placeholder="제목을 입력하세요">
						</td>
						<td width="200px" id="nowDate" align="right"></td>
					</tr>

				</table>

			</div>

			<div class="left" align="center">
				<br>
				<table>

					<tr style="width: 50px">
						<c:if test="${categoryfood eq 'food'}">
							<td class="category_td"><i style="color: #ADD8E6;"
								class="fa fa-cutlery" aria-hidden="true"></i> </span></td>
						</c:if>

						<c:if test="${categorytraffic eq 'traffic'}">
							<td class="category_td"><i style="color: #FF6347;"
								class="fa fa-bus" aria-hidden="true"></i></td>
						</c:if>

						<c:if test="${categorycommodity eq 'commodity'}">
							<td class="category_td"><i style="color: #FFA500;"
								class="fa fa-shopping-cart" aria-hidden="true"></i></td>
						</c:if>

						<c:if test="${categorybeauty eq 'beauty'}">
							<td class="category_td"><i style="color: #FFB6C1;"
								class="fa fa-bath" aria-hidden="true"></i></td>
						</c:if>

					</tr>

					<tr style="width: 50px;" class="categoryfont" id="tre">
						<c:if test="${categoryfood eq 'food'}">
							<td id="food">식비<br>${food }</td>
						</c:if>
						<c:if test="${categorytraffic eq 'traffic'}">
							<td>교통비<br>${traffic}</td>
						</c:if>

						<c:if test="${categorycommodity eq 'commodity'}">
							<td>생필품<br>${commodity }</td>
						</c:if>

						<c:if test="${categorybeauty eq 'beauty'}">
							<td>미용<br>${beauty }</td>
						</c:if>
					</tr>


				</table>

				<table>
					<br>

					<tr style="width: 50px">
						<c:if test="${categorymedical eq 'medical'}">
							<td class="category_td"><i style="color: #708090"
								class="fa fa-medkit" aria-hidden="true"></i></td>
						</c:if>
						<c:if test="${categoryeducation eq 'education'}">
							<td class="category_td"><i style="color: #DDA0DD;"
								class="fa fa-book" aria-hidden="true"></i></td>
						</c:if>
						<c:if test="${categoryphonefees eq 'phonefees'}">
							<td class="category_td"><i style="color: #1E90FF;"
								class="fa fa-mobile" aria-hidden="true"></i></td>
						</c:if>
						<c:if test="${categorysaving eq 'saving'}">
							<td class="category_td"><i style="color: #DAA520;"
								class="fa fa-database" aria-hidden="true"></i></td>
						</c:if>

					</tr>
					<tr style="width: 50px;" class="categoryfont">

						<c:if test="${categorymedical eq 'medical'}">
							<td>의료<br>${medical }</td>
						</c:if>

						<c:if test="${categoryeducation eq 'education'}">
							<td>교육<br>${education }</td>
						</c:if>

						<c:if test="${categoryphonefees eq 'phonefees'}">
							<td>통신비<br>${phonefees }</td>
						</c:if>

						<c:if test="${categorysaving eq 'saving'}">
							<td>저축<br>${saving }</td>
						</c:if>

					</tr>
				</table>
				<table>
					<br>

					<tr>
						<c:if test="${categoryutilitybills eq 'utilitybills'}">
							<td class="category_td"><i style="color: #6A5ACD;"
								class="fa fa-plug" aria-hidden="true"></i></td>
						</c:if>
						<c:if test="${categoryculturallife eq 'culturallife'}">
							<td class="category_td"><i style="color: #3CB371;"
								class="fa fa-film" aria-hidden="true"></i></td>
						</c:if>
						<c:if test="${categoryotheritems eq 'otheritems'}">
							<td class="category_td"><i style="color: #FA8072;"
								class="fa fa-minus-circle" aria-hidden="true"></i></td>
						</c:if>
						<c:if test="${categoryincome eq 'income'}">
							<td class="category_td"><i style="color: #9ACD32;"
								class="fa fa-krw" aria-hidden="true"></i></td>
						</c:if>

					</tr>
					<tr style="width: 50px;" class="categoryfont">
						<c:if test="${categoryutilitybills eq 'utilitybills'}">
							<td>공과금<br>${utilitybills}</td>
						</c:if>

						<c:if test="${categoryculturallife eq 'culturallife'}">
							<td>문화생활비<br>${culturallife}</td>
						</c:if>

						<c:if test="${categoryotheritems eq 'otheritems'}">
							<td>기타<br>${otheritems}</td>
						</c:if>

						<c:if test="${categoryincome eq 'income'}">
							<td>수입<br>${income}</td>
						</c:if>
					</tr>


				</table>

			</div>
			<div class="bottom">
				<br>
				<textarea rows="10" cols="110" id="content" name="content"
					placeholder="내용을 입력하세요"></textarea>
				<br> <input type="submit" value="확인"> <input
					type="button" value="취소" onclick="location.href='history.back()'">
			</div>
		</form>

	</div>
	
</body>
</html>
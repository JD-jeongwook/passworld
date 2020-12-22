<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="HTML Study">
<meta name="keywords" content="HTML,CSS,XML,JavaScript">
<meta name="author" content="Bruce">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css_file/my_page.css">
<title>마이 페이지</title>
<script src="js_file/my_page.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://kit.fontawesome.com/d355e2785c.js" crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<a href="main_page.do" id="logo">PASS WORLD</a>
	</header>
	
	<section>
	<h2 id='head_text'>M Y &ensp;&ensp; P A G E</h2>
	<div id='trip_pic'>
		<img class='random_picture' src="picture/trip_pic/trip_picture_${ rNum }.jpg">
	</div>
	<form method='post' action='my_info_modify.do' name='myform' onsubmit="return pwChk()">
		<table>
			<tr>
				<th colspan='2'>${ dto.name } ( ${dto.id } ) 님의 개인정보</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${ dto.id }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${ dto.name }</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type='password' name='pw' required class='text_box' minlength="8" maxlength="16"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type='password' name='pw2' required class='text_box'><span id='blank' minlength="8" maxlength="16"></span></td>
			</tr>
			<tr>
				<td>주소</td>
				<td id="address">
					<input type="text" id="sample4_postcode" name="postcode" placeholder="우편번호" style="width:100px;" readonly value="${ dto.postcode }">
					<input name='postbutton' id='post_search' type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="width:100px"><br> 
					<input type="text" id="sample4_roadAddress" name="address_1" placeholder="도로명주소" readonly value="${ dto.address_1 }"><br> 
					<input type="text" id="sample4_jibunAddress" name="address_2" placeholder="지번주소" readonly value="${ dto.address_2 }"><span id="guide" style="color: #999; display: none" style="margin-left:70px; margin-top:10px;"></span><br>
					<input type="text" id="sample4_detailAddress" name="detail_address" placeholder="상세주소" style="width:327px;" value="${ dto.detail_address }" autocomplete="off"> 
					<input type="text" id="sample4_extraAddress" name="extra_address" placeholder="참고항목" style="width:97px; margin-left:0px;" readonly value=" ${ dto.extra_address }">
					
					
			</td>
			</tr>
			<tr>
				<td>휴대폰 번호</td>
				<td>
					<select name='phone_company' class='select_box'>
						<option value='skt' <c:if test="${ dto.phone_company eq 'skt' }">selected</c:if>>SKT</option>
						<option value='kt' <c:if test="${ dto.phone_company eq 'kt' }">selected</c:if>>KT</option>
						<option value='lg' <c:if test="${ dto.phone_company eq 'lg' }">selected</c:if>>LG</option>
					</select><br>
					<select name='f_phone' class='select_box'>
						<option value='010'<c:if test="${ dto.f_phone eq '010' }">selected</c:if>>010</option>
						<option value='011'<c:if test="${ dto.f_phone eq '011' }">selected</c:if>>011</option>
						<option value='016'<c:if test="${ dto.f_phone eq '016' }">selected</c:if>>016</option>
					</select>
					<span class='minus'>-</span> <input type='text' class='text_phone' name='s_phone' value='${ dto.s_phone }' maxlength="4" autocomplete="off">
					<span class='minus'>-</span> <input type='text' class='text_phone' name='t_phone' value='${ dto.t_phone }' maxlength="4" autocomplete="off">
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type='text' name='mail' value="${ dto.mail }" class='text_box' autocomplete="off"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<c:choose>
						<c:when test="${ dto.gender eq 'male'}">
							<i class="fas fa-male"></i>
							<i class="fas fa-suitcase-rolling"></i>
							<span class='gender'>a Male traveler</span>
						</c:when>
						<c:when test="${ dto.gender eq 'female'}">
							<i class="fas fa-female"></i>
							<i class="fas fa-suitcase-rolling"></i>
							<span class='gender'>a Female traveler</span>
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>보유 포인트</td>
				<td>${ dto.point } P </td>
			</tr>
			<tr class='last_tr'>
				<td colspan='2'>
					<input type='submit' value='수정' id='modify_button'>
					<input type='button' value='회원탈퇴' onclick="delete_info()">
					<a href='main_page.do'><input type='button' value='메인페이지'></a>
				</td>
			</tr>
		</table>
	</form>
	</section>
</body>
</html>
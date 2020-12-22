<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="HTML Study">
<meta name="keywords" content="HTML,CSS,XML,JavaScript">
<meta name="author" content="Bruce">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel='stylesheet' href="css_file/admin.css">
<script>
	function set_point() {
		alert("포인트 지급완료.")
	}
	function delete_user() {
		alert("유저 추방완료.")
	}
</script>
</head>
<body>
<jsp:include page="admin_page.jsp"/>
<div class='radio'>
	<input type='radio' id='select_admin' name='select_people'><label for='select_admin'>관리자 목록</label>
	<input type='radio' id='select_user' name='select_people'><label for='select_user'>유저 목록</label>
<br>
<table border='1' id='admin_table'>
	<tr>
		<th colspan='7'>어드민 목록 ( ${ admin_count } )명</th>
	</tr>
	<tr>
		<td>아이디</td>
		<td>이름</td>
		<td>생년월일</td>
		<td>전화번호</td>
		<td>이메일</td>
		<td>성별</td>
		<td>계정관리</td>
	</tr>
	<c:forEach var='admin' items='${ admin_list }'>
		<tr>
			<td>${ admin.id }</td>
			<td>${ admin.name }</td>
			<td>${ fn:substring(admin.person_num,0,6) }</td>
			<td>${ admin.phone}</td>
			<td>${ admin.mail }</td>
			<td>${ admin.gender }</td>
			<td><a href='kick.do?id=${ admin.id }'><input type='button' value='탈퇴'></a></td>
		</tr>
	</c:forEach>
</table>
<table border='1' id='user_table'>
	<tr>
		<th colspan="12">유저 목록( ${ user_count } )명</th>
	</tr>
	<tr>
		<c:set var="curPage" value="${ param.curPage }"/>
		<c:if test="${ curPage eq null }">
			<c:set var="curPage" value="0"/>
		</c:if>
		<td colspan="12">		
			<c:forEach var="i" begin="0" end="${ maxPage }" >
				<c:if test="${ curPage eq i }">${ i+1 } / </c:if>
				<c:if test="${ curPage ne i }"><a href="admin_user.do?curPage=${ i }">${ i+1 } / </a></c:if>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>이름</td>
		<td>생년월일</td>
		<td>주소</td>
		<td>전화번호</td>
		<td>이메일</td>
		<td>E-MAIL</td>
		<td>SNS</td>
		<td>성별</td>
		<td>포인트</td>
		<td>회원가입일</td>
		<td>계정관리</td>
	</tr>
	<c:forEach var='user' items='${ user_list }'>
		<tr>
			<td>${ user.id }</td>
			<td>${ user.name }</td>
			<td>${ fn:substring(user.person_num,0,6) }</td>
			<td>${ user.address }</td>
			<td>${ user.phone}</td>
			<td>${ user.mail }</td>
			<td>
				<c:if test="${ user.get_email eq 'email_agree' }">O</c:if>
				<c:if test="${ user.get_email eq 'email_no' }">X</c:if>
			</td>
			<td>
				<c:if test="${ user.get_sns eq 'phone_agree' }">O</c:if>
				<c:if test="${ user.get_sns eq 'phone_no' }">X</c:if>
			</td>
			<td>${ user.gender }</td>
			<td>
				<form method='post' action='givePoint.do'>
				<input type='text' name='point' value="${ user.point }">
			</td>
			<td>
				${fn:substring(user.createtime,0,10)}
			</td>
			<td>
				<input type='hidden' name='id' value="${ user.id }">
				<input type='submit' value='포인트 지급' onclick="set_point()">
				</form>
				<a href='kick.do?id=${ user.id }'><input type='button' value='추방' onclick="delete_user()"></a>
			</td>
		</tr>
	</c:forEach>
</table>
</div>
</body>
</html>
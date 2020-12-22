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
<link rel="stylesheet" href="css_file/idCheckOK.css">
<title>ID 중복체크</title>
<script>
	function id_okay(id){
		opener.document.insert_info.id.value=id;
		window.close(); //창닫기
	}
</script>
</head>
<body>
	<p id='logo'>PASS WORLD</p>
	<p id='user_id'>회원님께서 입력하신 아이디는 <span id='id_text'>[ ${ id } ]</span> 입니다.</p>
	<c:choose>
		<c:when test="${ flag }">
			<p class='select_text'>사용가능한 아이디입니다!</p>
			<input type='button' id="ok_id" value='적용하기' onclick="id_okay('${ id }')">
		</c:when>
		<c:otherwise>
			<p class='select_text'>이미 사용중인 아이디입니다..</p>
			<a href="javascript:history.back()" class='fail_select'>다시시도</a>
			<a href="javascript:window.close()" class='fail_select'>취소</a>
		</c:otherwise>
	</c:choose>
</body>
</html>

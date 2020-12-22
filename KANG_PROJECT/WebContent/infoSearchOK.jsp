<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="css_file/infoSearchOK.css">
<script>
	function beforePage() {
		history.go(-1);
	}
</script>
</head>
<body>
	<c:if test="${ flag eq 2 }">
		<p>${ id }님의 비밀번호는</p>
		<p>[ ${ pw } ] 입니다.</p>
	</c:if>
	
	<c:if test="${ flag eq 1 }">
		<p>찾으시는 아이디는 </p> [
			<c:forEach var="list" items="${ list }">
				${ list.id } /
			</c:forEach>
		] <p>입니다.</p>
	</c:if>
	
	<c:if test="${ flag eq 0 }">
		<p>없는 사용자입니다.</p>
	</c:if>
	<a onclick="beforePage()">[ 이전으로 ]</a>
	<a href="javascript:window.close()">[ 닫기 ]</a>
</body>
</html>
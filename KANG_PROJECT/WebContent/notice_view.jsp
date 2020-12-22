<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="HTML Study">
<meta name="keywords" content="HTML,CSS,XML,JavaScript">
<meta name="author" content="Bruce">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css_file/notice_view.css">
<title>공지 [ ${ dto.title } ]</title>

</head>
<body>
	<header>
			<a href="main_page.do" id="logo">PASS WORLD</a>
	</header>
	<section id='r_body'>
		<form method='post' action='notice_modify.do'>
			<p id='tag'>공지사항</p>
			<c:if test="${ admin eq 0 }">
				<p id='title'>${ dto.title }</p>
			</c:if>
			<c:if test="${ admin eq 1 }">
				<input type='text' name='title' value="${ dto.title }"><br>
			</c:if>
			<span id='left'>조회수 : ${ dto.hit }</span>
			<span id='right'>작성일 : ${ fn:substring(dto.wTime,0,10) }</span>
			<hr> 
			<textarea name='contents' <c:if test="${ admin eq 0 }">readonly</c:if>>${ dto.contents }</textarea>
			<footer>
				<input type='hidden' name='no' value='${ dto.no }'>
				<c:if test="${ admin eq 0 }"><a href="notice_page.do"><input type='button' value='목록' class='button'></a></c:if>
				<c:if test="${ admin eq 1 }"><a href="admin_notice.do"><input type='button' value='목록' class='button'></a></c:if>
				<c:if test="${ admin eq 1 }"><input type='submit' value='수정' class='button'></c:if>
			</footer>
		</form>
	</section>
</body>
</html>
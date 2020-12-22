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
<title>게시글 작성</title>
<link rel="stylesheet" href="css_file/qnaWrite.css">
</head>
<body>
<a href="main_page.do" id="logo">PASS WORLD</a>
<form method='post' action='qnawriteOK.do'>
	<table>
		<tr id="first_tr">
			<td>문의유형</td>
			<td>
				<select name="frame">
					<c:forEach var="list" items="${ list }">
						<option value="${ list.frame }"> - ${ list.frame }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type='text' name='title' placeholder="제목을 입력해주세요." maxlength="30" autocomplete="off" required></td>
		</tr>
		<tr>
			<td colspan="2"><textarea name='contents' placeholder="문의사항을 입력해주세요"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type='hidden' name='id' value="${ sessionScope.id }">
				<input type='submit' value='문의하기' class='button'>
				<a href='qnaBoard.do'><input type='button' value='목록' class='button'></a>
			</td>
		</tr>	
	</table>
</form>
</body>
</html>
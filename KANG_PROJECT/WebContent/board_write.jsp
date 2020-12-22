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
<link rel="stylesheet" href="css_file/board_write.css">
</head>
<body>
<a href="main_page.do" id="logo">PASS WORLD</a>
<form method='post' action='board_writeOK.do' enctype="multipart/form-data">
	<table>
		<tr>
			<td><input type='text' name='title' placeholder="제목을 입력해주세요." maxlength="30" autocomplete="off" required></td>
		</tr>
		<tr>
			<td>
				<input type='file' name='img' id='file'>
			</td>
		</tr>
		<tr>
			<td><textarea name='contents' placeholder="---게시판 이용수칙 ---
* 글을 쓰실 때에는 예의를 꼭 지켜주세요.
* 욕설, 비방 등의 글은 무통보 삭제됩니다.
* 여행정보 / 후기에 대해 글을 써주세요"></textarea></td>
		</tr>
		<tr>
			<td>
				<input type='hidden' name='id' value="${ sessionScope.id }">
				<input type='hidden' name='admin' value="${ admin }">
				<input type='submit' value='글쓰기' class='button'>
				<a href='user_board.do'><input type='button' value='목록' class='button'></a>
			</td>
		</tr>	
	</table>
</form>
</body>
</html>
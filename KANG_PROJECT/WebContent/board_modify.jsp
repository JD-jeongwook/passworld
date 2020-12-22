<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="HTML Study">
<meta name="keywords" content="HTML,CSS,XML,JavaScript">
<meta name="author" content="Bruce">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 수정</title>
<link rel="stylesheet" href="css_file/board_modify.css">
</head>
<body>
<a href="main_page.do" id="logo">PASS WORLD</a>
<p id='modify_text'>수정 페이지</p>
<form method='post' action='board_modifyOK.do' enctype="multipart/form-data">
	<table>
		<tr>
			<td><input type='text' name='title' placeholder="제목을 입력해주세요." autocomplete="off" required value="${ dto.title }"></td>
		</tr>
		<tr>
			<td id='file'>
				<input type='file' name='img' id='file'>
			</td>
		</tr>
		<tr>
			<td id='file_comment'>현재 이미지는 [ ${ dto.img } ] 입니다.</td>
		</tr>
		<tr>
			<td><textarea name='contents' placeholder="내용을 입력해주세요">${ dto.contents }</textarea></td>
		</tr>
		
		<tr>
			<td>
				<input type='hidden' name='no' value="${ dto.no }">
				<input type='hidden' name='img' value="${ dto.img }">
				<input type='submit' value='수정' class='button two'>
				<a href='user_board.do'><input type='button' value='목록' class='button'></a>
			</td>
		</tr>	
	</table>
</form>
</body>
</html>
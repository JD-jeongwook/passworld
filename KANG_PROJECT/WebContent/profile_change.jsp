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
<link rel="stylesheet" href="css_file/profile.css">
<title>프로필 변경</title>
</head>
<body>
	<p><a href="javascript:window.close()" id='logo'>PASS WORLD</a></p>	
	<p id='profile_text'>프로필 사진 변경하기</p>
	<hr>
	<form method='post' action='profile_OK.do' enctype="multipart/form-data">
		<span>프로필 선택</span> <input type="file" name='profile'><br>
		<input type='submit' value='프로필 변경'> 
	</form>
</body>
</html>
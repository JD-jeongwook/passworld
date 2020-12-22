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
<title>Insert title here</title>
<script>
	function pClose() {
		window.close();
	}
</script>
</head>
<body>

<form method='post' action='main_img_modify.do' enctype="multipart/form-data">
	<input type='file' name='img'><br>
	<input type='text' name='country' placeholder="나라입력"><br>
	<input type='text' name='city' placeholder="도시입력"><br>
	<input type='hidden' name='no' value="${ no }">
	<input type='submit' value="수정">
	<input type='button' value="닫기" onclick="pClose()">
</form>
</body>
</html>
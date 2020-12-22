%@ page language="java" contentType="text/html; charset=UTF-8"
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
</head>
<body>
	<form method='post' action='insert.do'>
		나라 : <input type='text' name='country' autofocus="autofocus" required><br>
		도시 : <input type='text' name='city' required autocomplete="off"><br>
		공항 : <input type='text' name='airport' required style='width:500px;' autocomplete="off"><br>
		<input type='submit'>
	</form>
</body>
</html>
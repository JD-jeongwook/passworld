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
<title>WELCOME!</title>
<script>
	function goQna() {
		opener.parent.location="qnaBoard.do";
		window.close();
	}
</script>
</head>
<body>
	<p><a id='logo'>PASS WORLD</a></p>	
	<p>${ sessionScope.id }님 반갑습니다!</p>
	<p>문의주신 내용에 대한 답변이 준비됐습니다!</p>
	<a href="javascript:window.close()"><input type='button' value='다음에 볼게요' class='button'></a>
	<input type='button' value='지금 볼게요' onclick="goQna()" class='button'>
</body>
</html>
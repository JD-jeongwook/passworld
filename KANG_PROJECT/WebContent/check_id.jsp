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
<title>ID 중복체크</title>
<link rel='stylesheet' href='css_file/check_id.css'>
<script>
	function id_length(users) {
		var id = users.id.value;
		id = id.trim();
		if(id.length <= 5) {
			alert("아이디는 6글자 이상으로 입력해주세요.");
			return false;
		} else {
			return true;
		} 
	}
</script>
</head>
<body>
<p id='logo'>PASS WORLD</p>
<form method='post' action='idCheckOK.do' onsubmit="return id_length(this)">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type='text' name='id' placeholder="아이디를 입력해주세요." required maxlength="15" autocomplete="off"></td>
		</tr>
	</table>
	<input type='submit' value='확인'>
</form>
</body>
</html>
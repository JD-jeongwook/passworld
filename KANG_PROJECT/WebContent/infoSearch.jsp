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
<script src="https://kit.fontawesome.com/d355e2785c.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css_file/infoSearch.css">
<title>회원정보 찾기</title>
</head>
<body>
	<input type="radio" name="search" id="idSearch">
	<label for="idSearch" id="border-right" class='label_1'><i class="far fa-id-badge"></i> 아이디 찾기</label>
	<input type="radio" name="search" id="pwSearch">
	<label for="pwSearch" class='label_2'><i class="fas fa-unlock-alt"></i> 비밀번호 찾기</label>
	
	<form id="id" method='post' action="search_info.do">
		<table id='id_table'>
			<tr>
				<td>이름</td>
				<td><input type='text' name='name' required autocomplete="off"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
					<select name='f_phone'>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
					</select>
					-
					<input type='text' name='s_phone' class='phone' required autocomplete="off"> -
					<input type='text' name='t_phone' class='phone' required autocomplete="off">
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type='email' name='mail' required autocomplete="off"></td>
			</tr>
			<tr>
				<td colspan='2' class='last'><input type='submit' value='전송'></td>
			</tr>
		</table>
	</form>
	<form id="pw" method='post' action="search_info.do">
		<table id='pw_table'>
			<tr>
				<td>아이디</td>
				<td><input type='text' name='id' required autocomplete="off"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
					<select name='f_phone'>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
					</select>
					-
					<input type='text' name='s_phone' class='phone' required autocomplete="off"> -
					<input type='text' name='t_phone' class='phone' required autocomplete="off">
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type='email' name='mail' required autocomplete="off"></td>
			</tr>
			<tr>
				<td colspan='2' class='last'><input type='submit' value='전송'></td>
			</tr>
		</table>
	</form>
</body>
</html>
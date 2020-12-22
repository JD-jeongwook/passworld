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
<link rel="stylesheet" href="css_file/notice_write.css">
</head>
<body>
	<form method='post' action='notice_writeOK.do'>
		<table border='1'>
			<tr>	
				<th colspan='2'>공지작성</th>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type='text' name='title' required placeholder="제목을 입력해주세요"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name='contents' placeholder="공지를 입력해주세요." required></textarea>
				</td>
			</tr>
			<tr>
				<td colspan='2'>
					<input type='submit' value='작성'>
					<a href="admin_notice.do"><input type='button' value='취소'></a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
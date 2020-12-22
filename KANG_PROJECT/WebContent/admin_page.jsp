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
<title>관리자 페이지</title>
<link rel="stylesheet" href="css_file/admin.css">
</head>
<body>
	<table border='1' id="admin_section">
		<tr>
			<td colspan="2">(관리자) ${ sessionScope.id }님</td>
		</tr>
		<tr>
			<td>
				<a href="main_page.do"><input type='button' value='메인페이지'></a>
				<a href="newInfo.do?admin=1"><input type='button' value='어드민 계정 추가'></a>
				<a href="logOut.do"><input type='button' value='로그아웃'></a>
			</td>
		</tr>
	</table>
	<div id="header">
		<ul>
			<li><a href="admin_user.do" class='admin_page'>유저 관리 페이지</a></li>
			<li><a href="admin_board.do" class='admin_page'>게시판 관리 페이지</a></li>
			<li><a href="admin_frame.do" class='admin_page'>프레임 관리 페이지</a></li>
			<li><a href="admin_event.do" class='admin_page'>이벤트 관리 페이지</a></li>
			<li><a href="admin_notice.do" class='admin_page'>공지 관리 페이지</a></li>
			<li><a href="admin_qna.do" class='admin_page'>문의 관리 페이지</a></li>
			<li><a href="admin_shop.do" class='admin_page'>상점 관리 페이지</a></li>
		</ul>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="HTML Study">
<meta name="keywords" content="HTML,CSS,XML,JavaScript">
<meta name="author" content="Bruce">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="css_file/admin.css">
</head>
<body>
<jsp:include page="admin_page.jsp"/>

	<%-- ======================= QNA FRAME ======================== --%>
	
	<div id='frame_div'>
			<table border='1' id="qna_table">
				<tr>
					<th>현재 QNA 선택지</th>
					<th>QNA 선택지 관리</th>
				</tr>
				<c:forEach var="list" items="${ list }">
					<tr>
						<td>${ list.frame }</td>
						<td><a href="admin_frame_delete.do?no=${ list.frame_no }"><input type='button' value='삭제'></a></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="2">
						<form method='post' action="admin_frame_insert.do" name="form" onsubmit="return frame_length()">
							<input type='text' name='frame'>
							<input type='submit' value='추가'>
						</form>
					</td>
				</tr>
			</table>
		<%-- ======================= SHOP FRAME ======================== --%>
		
			<table border='1' id="shop_table">
				<tr>
					<th>현재 상품 분류</th>
					<th>상품 분류 관리</th>
				</tr>
				<c:forEach var="slist" items="${ slist }">
					<tr>
						<td>${ slist.frame }</td>
						<td><a href="admin_shopframe_delete.do?no=${ slist.no }"><input type='button' value='삭제'></a></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="2">
						<form method='post' action="admin_shopframe_insert.do" name="form" onsubmit="return frame_length()">
							<input type='text' name='sframe'>
							<input type='submit' value='추가'>
						</form>
					</td>
				</tr>
			</table>
	</div>
</body>
</html>
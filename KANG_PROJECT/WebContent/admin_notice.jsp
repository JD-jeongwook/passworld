<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
<table border='1' id='notice_table'>
	<tr>
		<th colspan='5'>공지사항 목록 ( ${ count }개 )</th>
	</tr>
	<tr>
		<td colspan='5'>
			<c:set var="curPage" value="${ param.curPage }"/>
			<c:if test="${ curPage eq null }">
				<c:set var="curPage" value="0" />
			</c:if>
			<c:forEach var='i' begin='0' end='${ maxPage }'>
				<c:if test="${ i eq curPage }">${ i+1 }</c:if>
				<c:if test="${ i ne curPage }"><a href="admin_notice.do?curPage=${ i }">${ i+1 }</a></c:if>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성시간</td>
		<td>조회수</td>
		<td>관리</td>
	</tr>
	<c:forEach var="list" items="${ list }">
		<tr>	
			<td>${ list.no }</td>
			<td><a href="notice_view.do?no=${ list.no }">${ list.title }</a></td>
			<td>${ list.wTime }</td>
			<td>${ list.hit }</td>
			<td><a href="notice_delete.do?no=${ list.no }"><input type='button' value='삭제'></a></td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan='5'>
			<a href="notice_write.do"><input type='button' value='공지작성'></a>
		</td>
	</tr>
</table>
</body>
</html>
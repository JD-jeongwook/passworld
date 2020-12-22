<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="HTML Study">
<meta name="keywords" content="HTML,CSS,XML,JavaScript">
<meta name="author" content="Bruce">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel='stylesheet' href="css_file/admin.css">
</head>
<body>
<jsp:include page="admin_page.jsp"/>
<table border='1' id='event_table'>
	<tr>
		<th colspan='8'>이벤트 목록 ( ${ count }개 )</th>
	</tr>
	<tr>
		<td colspan='8'>
			<c:set var="curPage" value="${ param.curPage }"/>
			<c:if test="${ curPage eq null }">
				<c:set var="curPage" value="0"/>
			</c:if>
			<c:forEach var='i' begin='0' end='${ maxPage }'>
				<c:if test="${ curPage eq i }">${ i+1 }</c:if>
				<c:if test="${ curPage ne i }"><a href="admin_event.do?curPage=${i}">${ i+1 }</a></c:if>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td>진행상태</td>
		<td>번호</td>
		<td>제목</td>
		<td>설명</td>
		<td>시작일</td>
		<td>종료일</td>
		<td>조회수</td>
		<td>관리</td>
	</tr>
	<c:forEach var="list" items="${ list }">
		<tr>
			<td>
				<c:if test="${ list.state eq 'doing' }">진행중</c:if>
				<c:if test="${ list.state eq 'done' }">종료</c:if>
			</td>
			<td>${ list.no }</td>
			<td><a href='event_view.do?no=${ list.no}'>${ list.title }</a></td>
			<td>${ list.comment }</td>
			<td>${ fn:substring(list.start,0,10) }</td>
			<td>${ fn:substring(list.end,0,10) }</td>
			<td>${ list.hit }</td>
			<td>
				<a href="event_delete.do?no=${ list.no }"><input type='button' value="삭제"></a>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>
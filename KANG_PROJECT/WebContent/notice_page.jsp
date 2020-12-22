<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="HTML Study">
<meta name="keywords" content="HTML,CSS,XML,JavaScript">
<meta name="author" content="Bruce">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css_file/notice_page.css">
<title>Insert title here</title>
</head>
<body>
	<header>
			<a href="main_page.do" id="logo">PASS WORLD</a>
	</header>
	<section id='r_body'>
		<p id='tag'>공지사항</p>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="list" items='${ list }'>
				<tr>
					<td>${ list.no }</td>
					<td><a href="notice_view.do?no=${ list.no }">${ list.title }</a></td>
					<td>${ fn:substring(list.wTime,0,10) }</td>
					<td>${ list.hit }</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan='4'>
					<c:set var="curPage" value="${ param.curPage }"/>
					<c:if test="${ curPage eq null }">
						<c:set var="curPage" value="0"/>
					</c:if>
					<c:forEach var='i' begin='0' end='${ maxPage }'>
						<c:if test="${ curPage eq i }">${ i+1 }</c:if>
						<c:if test="${ curPage ne i }"><a href='notice_page.do?curPage=${ i }'>${ i+1 }</a></c:if>
					</c:forEach>
				</td>
			</tr>
		</table>
	</section>
</body>
</html>
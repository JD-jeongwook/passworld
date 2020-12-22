<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="HTML Study">
<meta name="keywords" content="HTML,CSS,XML,JavaScript">
<meta name="author" content="Bruce">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>1:1 문의</title>
<link rel="stylesheet" href="css_file/qnaBoard.css">
<script>
	function needLogin() {
		alert("로그인이 필요한 서비스입니다.")
	}
	function loginOK() {
		location.href="qnaWrite.do";
	}
</script>
</head>
<body>
	<header>
			<a href="main_page.do" id="logo">PASS WORLD</a>
	</header>
	<section id="r_body">
		<p id='headText'>${ sessionScope.id } 님의 1:1 문의</p>
		<table>
			<tr>
				<th>처리상태</th>
				<th>문의유형</th>
				<th>제목</th>
				<th>작성시간</th>
			</tr>
			<c:forEach var="list" items="${ list }">
				<tr>
					<c:if test="${ list.complete eq 'no' }"><td><span class="ans wait">답변대기중</span></td></c:if>
					<c:if test="${ list.complete eq 'await' }"><td><span class="ans look_wait">확인대기중</span></td></c:if>
					<c:if test="${ list.complete eq 'yes' }"><td><span class="ans clear">답변완료</span></td></c:if>
					<td>${ list.frame }</td>
					<td><a href="qnaView.do?no=${ list.no }">${ list.title }</a></td>
					<td>${ fn:substring(list.wTime,0,10) }</td>
				</tr>
			</c:forEach>
			<tr id="last_tr">
				<c:set var="curPage" value="${ param.curPage }"/>
				<c:if test="${ curPage eq null }">
					 <c:set var="curPage" value="0"/>
				</c:if>
				<c:forEach var="i" begin="0" end="${ maxPage }">
					<c:if test="${ curPage eq i }"><td colspan="4">${ i+1 }</td></c:if>
					<c:if test="${ curPage ne i }"><td colspan="4"><a href="qnaBoard.do?curPage=${ i }">${ i+1 }</a></td></c:if>
				</c:forEach>
			</tr>
		</table>
		<c:if test="${ sessionScope.id eq null }"><input type='button' value="글쓰기" onclick="needLogin()"></c:if>
		<c:if test="${ sessionScope.id ne null }"><input type='button' value="글쓰기" onclick="loginOK()"></c:if>
	</section>
</body>
</html>
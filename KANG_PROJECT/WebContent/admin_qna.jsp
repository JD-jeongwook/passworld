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
<link rel="stylesheet" href="css_file/admin.css">
</head>
<body>
<jsp:include page="admin_page.jsp"/>
<table border='1' id="admin_qna">
	<tr>
		<th colspan="6">질문목록( ${ count } 개 )</th>
		<%-- list로 질문 받아와서 paging 하고 ,  qnaview.do?에 admin=1 answer 테이블에 입력할수있게 함.--%>
	</tr>
	<tr>
		<td colspan="6">	
			<c:set var="curPage" value="${ param.curPage }"/>
			<c:if test="${ curPage eq null }">
				<c:set var="curPage" value="0"/>
			</c:if>
			<c:forEach var="i" begin="0" end="${ maxPage }">
				<c:if test="${ i eq curPage }">${ i+1 }</c:if>
				<c:if test="${ i ne curPage }"><a href="admin_qna.do?curPage=${ i }">${ i+1 }</a></c:if>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td>처리상태</td>
		<td>질문유형</td>
		<td>제목</td>
		<td>작성시간</td>
		<td>작성유저</td>
		<td>관리</td>
	</tr>
	<c:forEach var="list" items="${ list }">
		<tr>
			<c:if test="${ list.complete eq 'no' }"><td><span class="ans wait">답변대기중</span></td></c:if>
			<c:if test="${ list.complete eq 'await' }"><td><span class="ans look_wait">확인대기중</span></td></c:if>
			<c:if test="${ list.complete eq 'yes' }"><td><span class="ans clear">답변완료</span></td></c:if>
			<td>${ list.frame }</td>
			<td>
				<c:choose>
					<c:when test="${ list.complete eq 'await' }">
						${ list.title }
					</c:when>
					<c:otherwise>
						<a href="qnaView.do?no=${ list.no }&admin=1" id="qna_title">${ list.title }</a>
					</c:otherwise>
				</c:choose>
			</td>
			<td>${ fn:substring(list.wTime,0,10) }</td>
			<td>${ list.id }</td>
			<td><a href="admin_qnaDelete.do?no=${ list.no }"><input type='button' value='삭제' class="button"></a></td>
		</tr>
	</c:forEach>
</table>
</body>
</html>
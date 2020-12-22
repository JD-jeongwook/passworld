<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
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
<script>
	function board_delete() {
		alert("게시글 삭제 완료")
	}
</script>
</head>
<body>
<jsp:include page="admin_page.jsp"/>
<table border='1' id="board_table">
	<tr>
		<th colspan="11">게시판 목록 ( ${ pagecnt } 개 )</th>
	</tr>
	<tr>
		<td colspan="11">
			<c:set var="curPage" value="${ param.curPage }"/>
			<c:if test=" ${ curPage eq null } ">
				<c:set var="curPage" value="0"/>
			</c:if>
			<c:forEach var="i" begin="0" end="${ maxPage }">
				<c:if test="${ i eq curPage }">${ i+1 }</c:if>
				<c:if test="${ i ne curPage }"><a href="admin_board.do?curPage=${ i }">${ i+1 }</a></c:if>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>내용</td>
		<td>작성자</td>
		<td>조회수</td>
		<td>추천수</td>
		<td>이미지 유무</td>
		<td>댓글수</td>
		<td>작성시간</td>
		<td>유저 구분</td>
		<td>관리</td>
	</tr>
	<c:forEach var="list" items="${ list }">
	<tr>
		<td>${ list.no }</td>
		<td>
			<c:choose>
				<c:when test="${ fn:length(list.title) > 15 }">
					${ fn:substring(list.title,0,15) }...
				</c:when>
				<c:otherwise>
					${ list.title }
				</c:otherwise>
			</c:choose>
		</td>
		<td>
			<c:choose>
				<c:when test="${ fn:length(list.contents) > 15 }">
					${ fn:substring(list.contents,0,15) }...
				</c:when>
				<c:when test="${ fn:length(list.contents) eq 0 }">
					게시글 없음
				</c:when>
				<c:otherwise>
					${ list.contents }
				</c:otherwise>
			</c:choose>
		</td>
		<td>${ list.id }</td>
		<td>${ list.hit }</td>
		<td>${ list.recommend }</td>
		<td>
			<c:if test="${ list.img eq null }">X</c:if>
			<c:if test="${ list.img ne null }">O</c:if>
		</td>
		<td>${ list.comment }</td>
		<td>${ fn:substring(list.wTime,0,10) }</td>
		<td>
			<c:if test="${ list.admin eq 1 }">admin</c:if>
			<c:if test="${ list.admin eq 0 }">user</c:if>
		</td>
		<td>
			<a href="board_view.do?no=${ list.no }"><input type="button" value="게시글 보기"></a>
			<a href="admin_board_delete.do?no=${ list.no }"><input type='button' value='삭제' onclick="board_delete()"></a>
		</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>
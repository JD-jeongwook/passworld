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
<link rel="stylesheet" href="css_file/event_page.css">
<title>Insert title here</title>
</head>
<body>
	<a href="main_page.do" id="logo">PASS WORLD</a>
	<section id="section">
		<input type='radio' name='event' id="doing">
		<input type='radio' name='event' id="done">
		<label for="doing" id="doing_lb">진행중인 이벤트</label>
		<label for="done" id="done_lb">지난 이벤트</label>
		
	<c:if test="${ admin eq 1 }">
		<a href="event_write.do"><input type='button' value="이벤트 작성하기" id="event_write"></a>
	</c:if>
		
<%-- =============================진행중인 이벤트=========================== --%>

		<div id="doing_div">
			<c:forEach var="list" items='${ list }'>
				<div class="outer">
					<img src="picture/event_picture/${ list.thumbnail }">
					<div class='bgcolor'>
						<div class='contents'>
						<c:choose>
							<c:when test="${ fn:length(list.title) > 10 }">
								<p class='title' title="${ list.title }">${ fn:substring(list.title,0,10) }...</p>
							</c:when>
							<c:otherwise>
								<p class='title'>${ list.title }</p>
							</c:otherwise>
						</c:choose>
						<p class='eventtime'>이벤트 기간</p>
						<span>
							${fn:substring(list.start,2,10) } ~ 
							${fn:substring(list.end,2,10) }
						</span>
							<a href="event_view.do?no=${ list.no }" class='goView'>바로가기 +</a>
						</div>
					</div>
				</div>
			</c:forEach>
			<div id="paging">
				<c:set var="curPage" value="${ param.curPage }"/>
				<c:if test="${ curPage eq null }">
					<c:set var="curPage" value="0"/>
				</c:if>
				<c:forEach var="i" begin="0" end="${ doingMaxPage }">
					<c:if test="${ curPage eq i }"><span id='none_page'>${ i+1 }</span></c:if>
					<c:if test="${ curPage ne i }"><a href="event_page.do?curPage=${ i }" class='page'>${ i+1 }</a></c:if>
				</c:forEach>
			</div>
		</div>
		
<%-- =============================끝난 이벤트=========================== --%>
		
		<div id="done_div">
		<table id="done_table">
			<tr>
				<th>no.</th>
				<th>제 목</th>
				<th>기 간</th>
			</tr>
			<c:forEach var="endlist" items="${ endlist }">
				<tr>
					<td>${ endlist.no }</td>
					<td>
						<a href="event_view.do?no=${ endlist.no }">${ endlist.title }</a>
					</td>
					<td>
						${ fn:substring(endlist.start,0,10) } ~ 
						${ fn:substring(endlist.end,0,10) }
					</td>
				</tr>
			</c:forEach>
		</table>
		
		</div>
		
 	</section>
 	
</body>
</html>
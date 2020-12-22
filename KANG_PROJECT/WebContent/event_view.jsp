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
<link rel="stylesheet" href="css_file/event_view.css">
<script src="https://kit.fontawesome.com/d355e2785c.js" crossorigin="anonymous"></script>
</head>
<body>
<a href="main_page.do" id="logo">PASS WORLD</a>
<section>
	<c:if test="${ dto.state eq 'doing' }"><p id='event_now'>진행중인 이벤트</p></c:if>
	<c:if test="${ dto.state eq 'done' }"><p id='event_now'>종료한 이벤트</p></c:if>
	<table class='otherPage'>
		<tr>
			<td><i class="fas fa-caret-up triangle"></i>이전 이벤트</td>
			<td>
				<c:if test="${ bdto.title ne null }">
					<a href="event_view.do?no=${ bdto.no }">
					<c:if test="${ bdto.state eq 'done' }">( 종료 )</c:if>
						<c:if test="${ fn:length(bdto.title) > 25 }">${ fn:substring(bdto.title,0,25) }...</c:if>
						<c:if test="${ fn:length(bdto.title) <= 25 }">${ bdto.title }</c:if>
					</a>
					<div class='event_time'>
						${ fn:substring( bdto.start,0,10 ) } ~ ${ fn:substring( bdto.end,0,10 ) }
					</div>
				</c:if>
				<c:if test="${ bdto.title eq null }">이전 이벤트가 없습니다.</c:if>
			</td>
			<td rowspan="2" id='plus_td'><a href="event_page.do" id='list_go'><i class="fas fa-list-ul"></i> 목록</a></td>
		</tr>
		<tr>
			<td><i class="fas fa-caret-down triangle"></i>다음 이벤트</td>
			<td>
				<c:if test="${ adto.title ne null }">
					<a href="event_view.do?no=${ adto.no }">
					<c:if test="${ adto.state eq 'done' }">( 종료 )</c:if>
						<c:if test="${ fn:length(adto.title) > 25 }">${ fn:substring(adto.title,0,25) }...</c:if>
						<c:if test="${ fn:length(adto.title) <= 25 }">${ adto.title }</c:if>
					</a>
					<div class='event_time'>
						${ fn:substring( adto.start,0,10 ) } ~ ${ fn:substring( adto.end,0,10 ) }
					</div>
				</c:if>
				<c:if test="${ adto.title eq null }">다음 이벤트가 없습니다.</c:if>
			</td>
		</tr>
	</table>
	<div id="event">
		<div id="event_header">
			<p>${ dto.title }</p>
			<p>( ${ dto.comment } )</p>
			<span>${ fn:substring( dto.start,0,10 ) } ~ ${ fn:substring( dto.end,0,10 ) }</span>
		</div>
		<img src="picture/event_picture/${ dto.img1 }">
		<c:if test="${ dto.img2 ne null }"><img src="picture/event_picture/${ dto.img2 }"></c:if>
		<c:if test="${ dto.img3 ne null }"><img src="picture/event_picture/${ dto.img3 }"></c:if>
		<c:if test="${ dto.img4 ne null }"><img src="picture/event_picture/${ dto.img4 }"></c:if>
		<c:if test="${ dto.img5 ne null }"><img src="picture/event_picture/${ dto.img5 }"></c:if>
		<c:if test="${ dto.img6 ne null }"><img src="picture/event_picture/${ dto.img6 }"></c:if>
		<c:if test="${ dto.img7 ne null }"><img src="picture/event_picture/${ dto.img7 }"></c:if>
		<c:if test="${ dto.img8 ne null }"><img src="picture/event_picture/${ dto.img8 }"></c:if>
		<c:if test="${ dto.img9 ne null }"><img src="picture/event_picture/${ dto.img9 }"></c:if>
	</div>
	<table class='otherPage'>
		<tr>
			<td><i class="fas fa-caret-up triangle"></i>이전 이벤트</td>
			<td>
				<c:if test="${ bdto.title ne null }">
					<a href="event_view.do?no=${ bdto.no }">
					<c:if test="${ bdto.state eq 'done' }">( 종료 )</c:if>
						<c:if test="${ fn:length(bdto.title) > 25 }">${ fn:substring(bdto.title,0,25) }...</c:if>
						<c:if test="${ fn:length(bdto.title) <= 25 }">${ bdto.title }</c:if>
					</a>
					<div class='event_time'>
						${ fn:substring( bdto.start,0,10 ) } ~ ${ fn:substring( bdto.end,0,10 ) }
					</div>
				</c:if>
				<c:if test="${ bdto.title eq null }">이전 이벤트가 없습니다.</c:if>
			</td>
			<td rowspan="2" id='plus_td'><a href="event_page.do" id='list_go'><i class="fas fa-list-ul"></i> 목록</a></td>
		</tr>
		<tr>
			<td><i class="fas fa-caret-down triangle"></i>다음 이벤트</td>
			<td>
				<c:if test="${ adto.title ne null }">
					<a href="event_view.do?no=${ adto.no }">
					<c:if test="${ adto.state eq 'done' }">( 종료 )</c:if>
						<c:if test="${ fn:length(adto.title) > 25 }">${ fn:substring(adto.title,0,25) }...</c:if>
						<c:if test="${ fn:length(adto.title) <= 25 }">${ adto.title }</c:if>
					</a>
					<div class='event_time'>
						${ fn:substring( adto.start,0,10 ) } ~ ${ fn:substring( adto.end,0,10 ) }
					</div>
				</c:if>
				<c:if test="${ adto.title eq null }">다음 이벤트가 없습니다.</c:if>
			</td>
		</tr>
	</table>
</section>
</body>
</html>
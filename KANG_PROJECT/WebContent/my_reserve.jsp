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
<title>Insert title here</title>
<link rel="stylesheet" href="css_file/my_reserve.css">
<script src="https://kit.fontawesome.com/d355e2785c.js" crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<a href="javascript:window.close()" id="logo">PASS WORLD</a>
	</header>
	<section>
		<c:forEach var="list" items="${ list }">
			<div class='n_blank'>
				<p>출발지 : ${ list.st_country } / ${ list.st_airport }</p>
				<p>도착지 : ${ list.arr_country } / ${ list.arr_airport }</p>
				<p>항공사 : ${ list.air_line }</p>
				<p>여행일 : ${ fn:substring(list.st_day,0,10) } ~ ${ fn:substring(list.arr_day,0,10) }</p>
				<a href="delete_reserve.do?no=${ list.no }" class='x_box'><i class="fas fa-window-close"></i></a>
			</div>
		</c:forEach>
		<c:forEach begin="1" end="${ list_size }" >
			<div class='blank'>
				<a href="javascript:window.close()"><i class="fas fa-plus"></i></a>
			</div>
		</c:forEach>
	</section>
</body>
</html>
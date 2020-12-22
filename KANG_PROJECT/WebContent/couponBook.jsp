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
<link rel="stylesheet" href="css_file/couponBook.css">
<script>
</script>
</head>
<body>
	<header>
		<a id="logo" href="javascript:window.close()">PASS WORLD</a>
		<p> ${ sessionScope.id } 님의 쿠폰북 ( ${ count }개 )</p>
	</header>
	<div id="blank"></div>
	<c:forEach var="list" items="${ list }">
		<div class='coupon_div'>
			<img src="picture/item_pic/${ list.img }">
			<p>[ ${ list.market } ]</p>
			<p>${ list.item }</p>
			<p>발급일 : ${ fn:substring(list.start,0,10) }</p>
			<p>만기일 : ${ fn:substring(list.end,0,10) } </p>
		</div>
	</c:forEach>
</body>
</html>
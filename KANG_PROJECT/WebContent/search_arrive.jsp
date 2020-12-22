<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="HTML Study">
<meta name="keywords" content="HTML,CSS,XML,JavaScript">
<meta name="author" content="Bruce">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="css_file/search_port.css">
</head>
<script>
	function okay(c) {
		var select = document.querySelector('.select');
		var airport = select.options[select.selectedIndex].value;
		var country = c;
		
		opener.document.air_form.arr_airport.value = airport;
		opener.document.air_form.arr_country.value = country;
		window.close();
	}
</script>
<body>
	<header>
		<a href="javascript:window.close()" id="logo">PASS WORLD</a>
	</header>
	<form method='post' action='search_arrive.do' onsubmit="return getFlag(${flag})">
		<input type='text' name='country' placeholder="나라를 입력해주세요." required value='${ country }'>
		<input type='submit' value='검색'>
	</form>
	<c:if test="${ country ne null }">	
		<c:if test="${ flag }">
			<select class='select'>
				<c:forEach var="list" items="${ list }">
					<option value='${ list.airport }'>${ list.city } / ${ list.airport }</option>
				</c:forEach>
			</select>
			<input type='button' value='적용' onclick="okay('${ country}')">
		</c:if>
		<c:if test="${ !flag }">
			없는 나라입니다.
		</c:if>
	</c:if>
</body>
</html>
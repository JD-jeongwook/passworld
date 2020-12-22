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
<link rel="stylesheet" href="css_file/myPicture.css">
<script src="https://kit.fontawesome.com/d355e2785c.js" crossorigin="anonymous"></script>
<title>My Gallery</title>
<script>
	function closePage() {
		window.close();
	}
	function goView(no) {
		opener.parent.location="board_view.do?no="+no;
		window.close();
	}
	function goWrite() {
		opener.parent.location="board_write.do";
		window.close();
	}
</script>
</head>
<%-- 페이지 크기 width=800 height=500 --%>
<body>
	<div id='fixed'>
		<p onclick="closePage()" id="logo">M y&nbsp;&nbsp;&nbsp;G a l l e r y</p>
	</div>
	<div id="blank"></div>
	
	<c:forEach var="list" items="${ list }">
			<div class="img"><a onclick="goView(${list.no})"><img src="picture/user_picture/${ list.img }" title="${ list.title }"></a></div>
	</c:forEach>
	<div class="img" id="img_null" onclick="goWrite()"><i class="fas fa-plus"></i></div>
</body>
</html>

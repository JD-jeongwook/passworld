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
<link rel="stylesheet" href="css_file/event_write.css">
<script>
	function timecheck(f) {
		var start = f.start.value;
		var end = f.end.value;
		if(start > end) {
			alert("종료일이 시작일보다 빠릅니다.");
			return false;
		} else if(start == end) {
			alert("시작일과 종료일이 같습니다.");
			return false;
		} else {
			alert("이벤트 등록완료 !");
			return true;
		}
	}
</script>
</head>
<body>
<form method='post' action="event_writeOK.do" enctype="multipart/form-data" onsubmit="return timecheck(this)">
	<table border='1'>
		<tr>
			<th colspan='2'>이벤트 추가</th>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type='text' name='title' placeholder='이벤트 제목을 정해주세요.' required></td>
		</tr>
		<tr>
			<td>설명</td>
			<td><input type='text' name='comment' placeholder='이벤트 내용을 짧게 설명해주세요.' required></td>
		</tr>
		<tr>
			<td>썸네일</td>
			<td>
				<input type='file' name='thumbnail'><br>
				<span class='smallT'>이벤트 썸네일을 지정해주세요.</span>
			</td>
		</tr>
		<tr>
			<td>이벤트 이미지</td>
			<td>
				<input type='file' name='img1' required><br>
				<c:forEach var="no" begin="2" end="9">
					<input type='file' name='img${ no }'><br>
				</c:forEach>
				<span class='smallT'>이벤트에 들어갈 이미지를 넣어주세요.</span>
			</td>
		</tr>
		<tr>
			<td>이벤트 시작일</td>
			<td><input type='date' name='start' required></td>
		</tr>
		<tr>
			<td>이벤트 종료일</td>
			<td><input type='date' name='end' required></td>
		</tr>
		<tr>
			<td colspan='2'>
				<input type='submit' value='이벤트 등록'>
				<a href="event_page.do"><input type='button' value='등록취소'></a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
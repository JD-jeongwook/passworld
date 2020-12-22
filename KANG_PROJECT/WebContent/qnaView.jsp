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
<link rel="stylesheet" href="css_file/qnaView.css">
</head>
<body>
	<a href="main_page.do" id="logo">PASS WORLD</a>	
	<form method='post' action="qnaModify.do">
		<table>
			<tr>
				<th colspan="2">${ dto.id }님의 문의사항</th>
			</tr>
			<tr id="first_tr">
				<td>문의유형</td>
				<td>
					<c:if test="${ !flag }">
						<select name='frame'>
							<c:forEach var="list" items="${ list }">
								<option value="${ list.frame }" <c:if test="${ list.frame eq dto.frame }">selected</c:if>> - ${ list.frame }</option>
							</c:forEach>
						</select>
					</c:if>
					<c:if test="${ flag }">
						<span id="select_frame">${ dto.frame }</span>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type='text' name="title" value="${ dto.title }" <c:if test="${ flag }">readonly</c:if>></td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="contents" <c:if test="${ flag }">readonly</c:if>>${ dto.contents }</textarea></td>
				
			</tr>
			<tr>
				<td colspan="2">
					<input type='hidden' name="no" value="${ dto.no }">
					<c:if test="${ !flag }"><input type='submit' value='수정' class="button"></c:if>
					<c:if test="${ !flag }"><a href="qnaDelete.do?no=${ dto.no }"><input type='button' value='삭제' class="button"></a></c:if>
					<c:if test="${ flag }"><a href="admin_qnaDelete.do?no=${ dto.no }"><input type='button' value='삭제' class="button"></a></c:if>
					<c:if test="${ !flag }">
						<a href="qnaBoard.do"><input type='button' value='목록' class="button"></a>
					</c:if>
					<c:if test="${ flag }">
						<a href="admin_qna.do"><input type='button' value='목록' class="button"></a>
					</c:if>
					
				</td>
			</tr>
		</table>
	</form>
	<hr id="user_line">
	<h1>- 관리자 답변</h1>
	<form method='post' action='qna_answer.do'>
		<textarea id="admin_contents" placeholder="아직 답변이 되지않은 게시글입니다." name='answer' <c:if test="${ !flag }">readonly</c:if>>${ ans.contents }</textarea>
		<input type="hidden" name="qna_no" value="${ dto.no }">
		<c:if test="${ flag }">
			<input type='submit' value='답변하기' class="button" id="answer">
		</c:if>
	</form>
</body>
</html>
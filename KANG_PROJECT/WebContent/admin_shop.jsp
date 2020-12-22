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
<link rel="stylesheet" href="css_file/admin.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="admin_page.jsp"/>
	
	<section id='shop_section'>
		<input type='radio' name='shop' id="shop_insert">
		<label for="shop_insert">메뉴추가</label>
		<input type='radio' name='shop' id="shop_management" <c:if test="${ flag }">checked</c:if>>
		<label for="shop_management">메뉴관리</label>
		<form id="insert_form" method='post' action='shop_insert.do' enctype="multipart/form-data">
			<table border='1'>
				<tr>
					<td>사용처</td>
					<td><input type="text" name="market" required placeholder="사용가능한 곳을 입력해주세요." autocomplete="off"></td>
				</tr>
				<tr>
					<td>상품이름</td>
					<td><input type='text' name='item' required placeholder="상품이름을 입력해주세요" autocomplete="off"></td>
				</tr>
				<tr>
					<td>상품분류</td>
					<td>
						<select name='frame'>
							<c:forEach var="list" items="${ flist }">
								<option value="${ list.frame }">${ list.frame }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>상품이미지</td>
					<td><input type='file' name='img' required></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type='text' name='price' required placeholder="해당 상품구매시 소진되는 포인트를 입력해주세요" autocomplete="off"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type='submit' value='상품등록'>
						<input type='reset' value='리셋'>
					</td>
				</tr>
			</table>
		</form>
		
		<table id='management_table' border='1'>
			<tr>
				<c:choose>
						<c:when test="${ ( frame eq 'all') or (frame eq null) }">
							<th colspan="6">전체목록 ( ${ count } 개)</th>
						</c:when>
						<c:otherwise>
							<th colspan="6">${ frame } 목록 ( ${ count } 개)</th>
						</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td colspan="6">
					<form method='post' action='admin_shop.do'>
						<select name='frame2'>
							<option value="all">전체보기</option>
							<c:forEach var="list" items="${ flist }">
								<option value="${ list.frame }" <c:if test="${ list.frame eq frame }">selected</c:if>>${ list.frame }</option>
							</c:forEach>
						</select>
						<input type='submit' value='검색'>
					</form>
				</td>
			</tr>
			<tr>
				<td colspan='6'>
					<c:set var="curPage" value="${ param.curPage }"/>
					<c:if test="${ curPage eq null }">
						<c:set var="curPage" value="0"/>
					</c:if>
					<c:forEach var="i" begin="0" end="${ maxPage }">
						<c:if test="${ i eq curPage }">${ i+1 }</c:if>
						<c:if test="${ i ne curPage }"><a href="admin_shop.do?curPage=${ i }&frame2=${ frame }">${ i+1 }</a></c:if>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>상품번호</th>
				<th>상품분류</th>
				<th>사용처</th>
				<th>상품이름</th>
				<th>가격</th>
				<th>상품관리</th>
			</tr>
			<c:forEach var="mlist" items="${ mlist }">
				<tr>
					<td>${ mlist.no }</td>
					<td>${ mlist.frame }</td>
					<td>${ mlist.market }</td>
					<td>${ mlist.item }</td>
					<td>${ mlist.price }</td>
					<td>
						<a href="shop_delete.do?no=${ mlist.no }"><input type='button' value='삭제'></a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</section>
</body>
</html>
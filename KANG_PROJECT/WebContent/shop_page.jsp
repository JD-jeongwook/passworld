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
<link rel="stylesheet" href="css_file/shop_page.css">
<title>Insert title here</title>
<script>
	function notbuy() {
		alert("보유중인 포인트가 부족합니다.")
	}
	function buy_check() {
		if(confirm("정말 구매하시겠습니까?")==true) {
			alert("구매 성공!");
			return true;
		} else {
			alert("취소하셨습니다.");
			return false;
		}
	}
	function openCouponBook() {
		window.open("couponBook.do","couponBook","width=375 height=300 left=650 top=100")
	}
</script>
</head>
<body>
	<header>
		<a href="main_page.do" id="logo">PASS WORLD</a>
		<div id="info_box">
			<p id="info">${ idto.name }님의 잔여포인트 : ${ idto.point } P</p>
			<a href="logOut.do"><input type='button' value='로그아웃'></a>
			<input type='button' value='쿠폰함' onclick="openCouponBook()">
		</div>
	</header>
	<hr id="header_line">
	<section>
		<div id="s_header">
			<form method='post' action="shop_page.do">
				<select id='frame' name="frame">
					<option value='all'>전체보기</option>
					<c:forEach var="flist" items="${ flist }">
						<option value="${ flist.frame }" <c:if test="${ frame eq flist.frame }">selected</c:if>>${ flist.frame }</option>
						
					</c:forEach>
				</select>
				<input type='submit' value='보기' id="look">
			</form>
		</div>
		<c:forEach var="list" items="${ list }">
			<article>
				<img src="picture/item_pic/${ list.img }">
				<p class='market'>[ ${ list.market } ]</p>
				<c:choose>
				<c:when test="${ fn:length(list.item) <= 12 }">
					<p>${ list.item }</p>
				</c:when>
				<c:otherwise>
					<p title="${ list.item }">${ fn:substring(list.item,0,12) }...</p>
				</c:otherwise>
				</c:choose>
				<p>${ list.price } P</p>
				<form method='post' action='coupon_buy.do' onsubmit="return buy_check()">
					<input type="hidden" name="price" value="${ list.price }">
					<input type='hidden' name="market" value="${ list.market }">
					<input type='hidden' name="item" value="${ list.item }">
					<input type='hidden' name='img' value="${ list.img }">
					<c:if test="${ list.price > idto.point }">
						<input type='button' value='구매하기' onclick="notbuy()">
					</c:if>
					<c:if test="${ list.price <= idto.point }">
						<input type='submit' value='구매하기'>
					</c:if>
				</form>
			</article>
		</c:forEach>
		<div id="paging">
			<c:set var="curPage" value="${ param.curPage }"/>
			<c:if test="${ curPage eq null }">
				<c:set var="curPage" value="0"/>
			</c:if>
			<c:forEach var="i" begin="0" end="${ maxPage }">
				<c:if test="${ curPage eq i }"><span>${ i+1 }</span></c:if>
				<c:if test="${ curPage ne i }"><a href="shop_page.do?curPage=${ i }&frame=${ frame }">${ i+1 }</a></c:if>
			</c:forEach>
		</div>
	</section>
</body>
</html>
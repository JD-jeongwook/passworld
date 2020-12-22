<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="HTML Study">
<meta name="keywords" content="HTML,CSS,XML,JavaScript">
<meta name="author" content="Bruce">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유 게시판</title>
<link rel='stylesheet' href='css_file/user_board.css'>
<script src="https://kit.fontawesome.com/d355e2785c.js" crossorigin="anonymous"></script>
<script src="js_file/user_board.js"></script>
<script>
	function wherego(f) {
		var keyword = f.search_keyword.value;
		if(keyword.length == 0) {
			location.href="user_board.do";
			return false;
		}
		else 
			return true;
	}
	function infoSearch() {
		window.open("infoSearch.do","infoSearch","width=600 height=300 left=500 top=200")
	}
</script>
</head>
<body>
	<c:set var="curPage" value="${ param.curPage }"/>
	<c:if test="${ curPage eq null }">
					<c:set var="curPage" value="0"/>
	</c:if>
	<header>
		<a href="main_page.do" id="logo">PASS WORLD</a>
	</header>
	<section>
		<div id='head'>
			<p> <i class="fas fa-clipboard-list"></i> 자유 게시판</p>
		</div>
		<nav>
			<%-- 로그인창 --%>
        <c:choose>
        	<c:when test="${ empty sessionScope.id }">
		        <article id="logout">
		            <form method="post" action="login_board.do">
		                <label for="id">ID : </label>
		                <input type="text" id="id" name="id" required autocomplete="off" maxlength="20"><br>
		                <label for="pw">P/W : </label>
		                <input type="password" id="pw" name="pw" required autocomplete="off" maxlength="16"><br>
		                <div id="info">
		                    <a href="newInfo.do">회원가입</a><span> / </span>
		                     <a onclick="infoSearch()">아이디 or 비밀번호 찾기</a>
		                </div>
		                <input type="submit" id="loginbox">
		                <label for="loginbox" id='login_label'>로그인</label>
		            </form>
		        </article>
	        </c:when>
	    	<c:otherwise>
	        	<article id="login">
	        		<c:choose>
	        			<c:when test="${ dto.profile eq null }">
	        				<c:if test="${ dto.gender eq 'male' }">
	        					<img src="profile_pic/male.jpg" onclick="profile_change()">
	        				</c:if>
	        				<c:if test="${ dto.gender eq 'female' }">
	        					<img src="profile_pic/female.png" onclick="profile_change()">
	        				</c:if>
		            		
		            	</c:when>
		            	<c:otherwise>
		            		<img src="profile_pic/${ dto.profile }" onclick="profile_change()">
		            	</c:otherwise>
		            </c:choose>
		            <span>${ dto.name } 님 안녕하세요!</span>
		            <span>아이디 : ${ dto.id }</span>
		            <span>보유 포인트 : ${ dto.point } P</span>
		            <c:if test="${ dto.admin eq 0 }">
		           		<a href="my_page.do" id="my_page">내 정보</a>
		            </c:if>
		            <c:if test="${ dto.admin eq 1 }">
		           		<a href="admin_page.do" id="my_page">관리자 홈</a>
		            </c:if>
		            <a href="logOut_board.do" id="logout_box">로그아웃</a>
	       		 </article>
       		</c:otherwise>
        </c:choose>
        <section id='best_section'>
        <input type='checkbox' id='check_best'>
        <label for='check_best' id='best_checked' class='check_font'> - 추천게시물 Best 7 보기 <i class="fas fa-angle-down"></i></label>
	        <div id='best_list'>
	        	<ul>
	        		<c:forEach var="best" items="${ b_list }">
	        			<li><i class="fas fa-caret-right"></i> <a href='board_view.do?no=${ best.no }' class='best_address'>${ best.title }</a></li>
	        		</c:forEach>
	        	</ul>
	        	 <label for='check_best' id='best_unChecked' class='check_font'> - 추천게시물 Best 7 그만보기 <i class="fas fa-angle-up"></i></label>
	        </div>
        </section>
        <hr>
        <section id='my_section'>
	    <input type='checkbox' id='check_my'>
	 	<c:if test="${ sessionScope.id eq null }">
	 		<label id='my_checked' class='check_font'> - 나의 최근 게시글 보기 <i class="fas fa-angle-down"></i></label>
	 		<p id='none_log'>로그인이 필요한 서비스입니다.</p>
	 	</c:if>
	 	<c:if test="${ sessionScope.id ne null }">
	 	<label for='check_my' id='my_checked' class='check_font'> - 나의 최근 게시글 보기 <i class="fas fa-angle-down"></i></label>
	 	<div id='my_list'>
	        	<ul>
	        		<c:forEach var="my" items="${ m_list }">
	        			<li><i class="fas fa-caret-right"></i> <a href='board_view.do?no=${ my.no }' class='best_address'>${ my.title }</a></li>
	        		</c:forEach>
	        	</ul>
	        	<label for='check_my' id='my_unChecked' class='check_font'> - 나의 최근 게시글 그만보기 <i class="fas fa-angle-up"></i></label>
	    </div>
	    </c:if>
        </section>
		</nav>
		<article>
			<table>
				<tr id='table_head'>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>추천</th>
					<th>조회수</th>
				</tr>
				<c:forEach var="dto" items="${ list }">
					<tr>
						<td>${ dto.no }</td>
						<td><a href="board_view.do?no=${ dto.no }&returnPage=${ curPage }" <c:if test="${ dto.admin eq 1 }"> style="color:red"</c:if>>${ dto.title }
							<c:if test="${ dto.img ne null }"><i class="fas fa-camera-retro"></i></c:if>
							<c:if test="${ dto.comment ne 0 }"><span class='comment_cnt'><strong>[${ dto.comment }]</strong></span></c:if>
						</a></td>
						<td>${ dto.id }</td>
						<td>${ dto.recommend }</td>
						<td>${ dto.hit }</td>
					</tr>
				</c:forEach>
			</table>
			<div id='paging'>
				
				
			<c:forEach var="i" begin="0" end="${ maxPage }">
				<c:if test="${ curPage eq i }"><span id="select_page">${ i+1 }</span></c:if>
				<c:if test="${ curPage ne i }"><a href="user_board.do?curPage=${ i }" id="none_select_page">${ i+1 }</a></c:if>
			</c:forEach>
			</div>
			<c:if test="${ sessionScope.id ne null }">
				<input type='button' value='글쓰기' id='write' onclick="loginOK()">
			</c:if>
			<c:if test="${ sessionScope.id eq null }">
				<input type='button' value='글쓰기' id='write' onclick="loginNo()">
			</c:if>
			<div id="searching">
				<form method='post' action='search_board.do' onsubmit="return wherego(this)">
					<select name='search_select' id="search_list">
						<option value='title'>제목</option>
						<option value='titleandcontents'>제목 + 내용</option>
						<option value='writer'>작성자</option>
					</select>
					<input type='text' name='search_keyword' autocomplete="off" maxlength="20" placeholder="검색어를 입력해주세요.">
					<input type='submit' value='검색'>
				</form>
			</div>
		</article>
		
	</section>
</body>
</html>
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
<link rel="stylesheet" href="css_file/board_view.css">
<script src="https://kit.fontawesome.com/d355e2785c.js" crossorigin="anonymous"></script>
<title>게시글 보기</title>
<script>
	function delete_confirm(no) {
		if(confirm("정말 삭제하시겠습니까 ?") == true)
			location.href="board_delete.do?no="+no;
	}
	function golist() {
		history.go(-1);
	}
</script>
</head>
<body>
	<div id='contents'>
		<header>
			<a href="user_board.do" id="logo">PASS WORLD</a>
		</header>
		
		<section>
			<div id="head">
				<p id='title'>${ dto.title }</p>
				<div id="writer">
					<c:if test="${ idto.profile ne null }">
						<img src="profile_pic/${ idto.profile }">
					</c:if>
					<c:if test="${ idto.profile eq null }">
						<c:if test="${ idto.gender eq 'male' }">
		        			<img src="profile_pic/male.jpg">
		        		</c:if>
		        		<c:if test="${ idto.gender eq 'female' }">
		        			<img src="profile_pic/female.png">
		        		</c:if>
					</c:if>
					<c:if test="${ idto.id eq null }">
						<img src="profile_pic/male.jpg">
					</c:if>
					<p id='writer_id'>${ dto.id }</p>
					<p class='small_text'>${ dto.wTime }</p>
					<p class='small_text'>조회수 : ${ dto.hit }</p>
				</div>
			</div>
			<hr/>
			<div id="contents_box">
				<c:if test="${ dto.img ne null }">
						<img src="picture/user_picture/${ dto.img }" id="user_picture"><br>
				</c:if>
				<textarea id='contents_text' readonly>${ dto.contents }</textarea>
			</div>
			<hr>
				<footer id='move_list'>
					<a href="search_board.do?curPage=${ returnPage }&search_select=${ select }&search_keyword=${ keyword }"><input type='button' value='목록' class='list two'></a>
					<%--<form method='post' action='search_board.do' id="ib">
						<input type='hidden' name='curPage' value="${ returnPage }">
						<input type='hidden' name='search_select' value="${ select }">
						<input type='hidden' name='search_keyword' value="${ keyword }">
						<input type='submit' value="목록" class='list two'>
					</form> --%>
					<%-- <input type='button' value='목록' class='list two' onclick="golist()"> --%>
					<c:if test="${ (sessionScope.id eq dto.id) or ( cdto.admin eq 1) }">
						<input type='button' value='삭제' class='list two' onclick="delete_confirm(${ dto.no })">
					</c:if>
					<c:if test="${ sessionScope.id eq dto.id }">
						<a href="board_modify.do?no=${ dto.no }"><input type='button' value='수정' class='list two'></a>
					</c:if>
				</footer>
				<div id='likey'>
					<input type='checkbox' id='recommend'>
					<label for='recommend'><i class="fas fa-heart"></i><span id='like_cnt'>${ dto.recommend }</span></label>
				</div>
			<hr>
		</section>
		<footer id='comment'>
			<c:if test="${ sessionScope.id ne null }">
			<form method='post' action='search_comment.do'>
				<c:choose>
					        <c:when test="${ cdto.profile eq null }">
	        				<c:if test="${ cdto.gender eq 'male' }">
	        					<img src="profile_pic/male.jpg" id="user_profile">
	        				</c:if>
	        				<c:if test="${ cdto.gender eq 'female' }">
	        					<img src="profile_pic/female.png" id="user_profile">
	        				</c:if>
		            		
		            	</c:when>
		            	<c:otherwise>
		            		<img src="profile_pic/${ cdto.profile }" id="user_profile">
		            	</c:otherwise>
		            	</c:choose>
				<div id='comment_box'>
					<p>${ cdto.id } 님</p>
					<textarea name='comment' maxlength="200" placeholder="댓글을 적어주세요 (최대 200글자)" required></textarea>
				</div>
				<c:if test="${ cdto.profile ne null }">
					<input type='hidden' name='profile' value="${ cdto.profile }">
				</c:if>
				<input type='hidden' name='list_no' value="${ dto.no }">
				<input type='hidden' name='id' value='${ cdto.id }'>
				<input type='hidden' name='gender' value="${ cdto.gender }">
				<div id='select_box'>
					<input type='reset' value='취소'>
					<input type='hidden' name='returnPage' value="${ returnPage }">
					<input type='hidden' name='select' value="${ select }">
					<input type='hidden' name='keyword' value="${ keyword }">
					<input type='hidden' name='admin' value='${ cdto.admin }'>
					<input type='submit' value='댓글달기'>
				</div>
			</form>
			<br><br>
			<hr id='line'>
			</c:if>
				<span id='c_count'>Comment [ ${ count } 개 ]</span>
			
			<c:forEach var="cList" items="${ list }">
				<div class='commentOK'>
				<c:choose>
					    <c:when test="${ cList.profile eq null }">
					   
	        			 <c:if test="${ cList.gender eq 'male' }">
	        				<img src="profile_pic/male.jpg" class="comment_img">
	        			</c:if>
	        			<c:if test="${ cList.gender eq 'female' }">
	        				<img src="profile_pic/female.png" class="comment_img">
	        			</c:if>
		            	</c:when>
		            	<c:otherwise>
		            		<img src="profile_pic/${ cList.profile }" class="comment_img">
		            	</c:otherwise>
		            	</c:choose>
			
				<span class="comment_user">${ cList.id }</span>
				<c:choose>
					<c:when test="${ cList.admin eq 1 }"><span class='admin_writer'>관리자</span></c:when>
					<c:when test="${ dto.id eq cList.id }"><span class='same_writer'>작성자</span></c:when>
				</c:choose>
				<span class='small_text'>${ cList.wTime }</span>
				<br>
				
				<c:choose>
					<c:when test="${ (sessionScope.id eq cList.id) or ( cdto.admin eq 1)}" >
						<form method='post' action='search_comment_modify.do' name='comment_form'>
							<textarea class="comment_contents writeOK" name='comment' placeholder="수정이 가능합니다." maxlength="200" required>${ cList.comment }</textarea>
							<input type='hidden' name='no' value="${ cList.no }">
							<input type='hidden' name='view_no' value="${ dto.no }">
							<input type='hidden' name='returnPage' value="${ returnPage }">
							<input type='hidden' name='select' value="${ select }">
							<input type='hidden' name='keyword' value="${ keyword }">
							<input type='submit' value='수정' class='select_button modify_button'>
							<a href="search_comment_delete.do?no=${ cList.no }&view_no=${ dto.no }&returnPage=${ returnPage }&select=${ select }&keyword=${ keyword }"><input type='button' value='삭제' class='select_button delete_button'></a>
						</form>
					</c:when>
					<c:when test="${ sessionScope.id ne cList.id }">
						<textarea class="comment_contents" readonly>${ cList.comment }</textarea>
					</c:when>
				</c:choose>
				</div>
			</c:forEach>
		</footer>
	</div>
</body>
</html>
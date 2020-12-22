<%@page import="com.project.www.dto.InfoDTO"%>
<%@page import="com.mysql.cj.Session"%>
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
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>PASS WORLD</title>
<link rel="stylesheet" href="css_file/main.css">
<script src="https://kit.fontawesome.com/d355e2785c.js" crossorigin="anonymous"></script>
<script>
	function login_on(jsp,name,size) {
		window.open(jsp,name,size);
	}
	function clause() {
		window.open("clause.jsp","clause","width=400 height=500 left=200 top=200")
	}
	function profile_change() {
		window.open("profile_change.jsp","profile_change","width=500 height=200 left=1050 top=200")
	}
	function myPicture() {
		window.open("myPicture.do","myPicture","width=813 height=500 left=530 top=220")
	}
	function needLogin() {
		alert("로그인이 필요한 서비스입니다!");
	}
	function page_img_set(no) {
		window.open("page_img_set.do?no="+no,"page_img_set","width=500 height=150 left=200 top=200")
	}
	function infoSearch() {
		window.open("infoSearch.do","infoSearch","width=477 height=300 left=500 top=200")
	}
	function search_arrive() {
		window.open("search_arrive.jsp","search_country","width=550 height=300 top=50 left=700");
	}
	function search_start() {
		window.open("search_start.jsp","search_country","width=550 height=300 top=50 left=700");
	}
	function my_reserve() {
		window.open("my_reserve.do","myreserve","width=475 height=555 top=250 left=650")
	}
	function go_reservation() {
		var st_airport = document.forms["air_form"]["st_airport"].value;
		var arr_airport = document.forms["air_form"]["arr_airport"].value;
		var st_day = document.forms["air_form"]["st_day"].value;
		var arr_day = document.forms["air_form"]["arr_day"].value;
		var child = document.forms["air_form"]["child"].value;
		var adult = document.forms["air_form"]["adult"].value;
		var airline = document.forms["air_form"]["air_line"].value;
		
		document.getElementById("st_port").innerHTML = st_airport;
		document.getElementById("arr_port").innerHTML = arr_airport;
		document.getElementById("st_d").innerHTML = st_day;
		document.getElementById("arr_d").innerHTML = arr_day;
		document.getElementById("airline").innerHTML = airline;
		document.getElementById("adult_cnt").innerHTML = adult;
		document.getElementById("child_cnt").innerHTML = child;
	}
	function check_id(id) {
		if(id == null) {
			alert("로그인이 필요한 서비스입니다.");
			return false;
		} else if (id != null){
			return true;
		}
	}
</script>
</head>

<body <c:if test="${ (sessionScope.id ne null) and flag }">onload="login_on('welcome.do','welcome','width=400 height=200 left=700 top=100')"</c:if>>

    <header>
        <div id="logo">
            <a href="main_page.do">
                <p id="logotext">PASS WORLD</p>
            </a>
        </div>
        <div id="rside">
            <ul>
                <div id="rfirst">
                    <a href="#">
                        <li id="weather"><i class="fas fa-sun"></i>
                            <span>날씨</span></li>
                    </a>
                    <div id="weathers">
                        <a href="https://www.kma.go.kr/m/world/city.jsp" target="_blank">세계 날씨 보기</a>
                        <a href="https://www.weather.go.kr/w/index.do#close" target="_blank">국내 날씨 보기</a>
                        <a href="http://web.kma.go.kr/global/footer/copyright.jsp" target="_blank">기상청 저작권 정책</a>
                    </div>
                </div>
                <div>
                    <a href="https://finance.naver.com/marketindex/?tabSel=exchange#tab_section" target="_blank">
                        <li id="money"><i class="fas fa-search-dollar"></i><span>환율</span></li>
                    </a>
                </div>
                <div>
                    <a href="https://vclock.kr/time/" target="_blank">
                        <li id="worldtime"><i class="fas fa-globe-americas"></i><span>세계시간</span></li>
                    </a>
                </div>
            </ul>
        </div>
        
        <%-- top10 유저 사진 --%>
        
        <nav id="userpic">
            <div id="imgSlider">
            	<div id="indexImg">
            		<ul>
            			<c:forEach var='imglist' items="${ imglist }">
            				<li><img src="picture/user_picture/${ imglist.img }"><p>${ imglist.id } 님</p></li>
            			</c:forEach>
            		</ul>
            	</div>
            </div>
        </nav>
        <script type="text/javascript">
			$('#indexImg>ul>li').hide(); 
			$('#indexImg>ul>li:first-child').show(); 
			setInterval(function(){ 
				$('#indexImg>ul>li:first-child').fadeOut().next().fadeIn().end(1000).appendTo('#indexImg>ul');},4500);
		</script>
        
        <%-- 로그인창 --%>
        <c:choose>
        	<c:when test="${ empty sessionScope.id }">
		        <article id="logout">
		            <form method="post" action="login.do">
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
	        					<div id="profile_img"><img src="profile_pic/male.jpg" onclick="profile_change()"></div>
	        				</c:if>
	        				<c:if test="${ dto.gender eq 'female' }">
	        					<div id="profile_img"><img src="profile_pic/female.png" onclick="profile_change()"></div>
	        				</c:if>
		            		
		            	</c:when>
		            	<c:otherwise>
		            		<div id="profile_img"><img src="profile_pic/${ dto.profile }" onclick="profile_change()"></div>
		            	</c:otherwise>
		            </c:choose>
		            <span>${ dto.name } 님 안녕하세요!</span>
		            <span>아이디 : ${ dto.id }</span>
		            <span>보유 포인트 : ${ dto.point } P</span>
		            <c:if test="${ dto.admin eq 0 }">
		            	<a href="my_page.do" id="my_page">내 정보</a>
		            </c:if>
		            <c:if test="${ dto.admin eq 1 }">
		            	<%-- <a href="admin_user.do" id="my_page">회원관리</a> --%>
		            	<a href="admin_page.do" id="my_page">관리자 홈</a>
		            </c:if>
		            <a href="logOut.do" id="logout_box">로그아웃</a>
	       		 </article>
       		</c:otherwise>
        </c:choose>
        <fieldset>
            <legend>여행자 노트<i class="fas fa-book" id="note"></i></i></legend>
            <ul id='traveler_note'>
                <li>
              		<c:if test="${ sessionScope.id ne null }"><a href="shop_page.do"><i class="fas fa-store"></i>&nbsp&nbsp포인트 스토어</a></c:if>
              		<c:if test="${ sessionScope.id eq null }"><a onclick="needLogin()"><i class="fas fa-store"></i>&nbsp&nbsp포인트 스토어</a></c:if>
                </li>
                <li>
                    <a href="user_board.do"><i class="fas fa-comments"></i>&nbsp&nbsp게시판 가기</a>
                </li>
                <li>
                    <c:if test="${ sessionScope.id ne null }"><a onclick="myPicture()" id='mp'><i class="fas fa-photo-video"></i>&nbsp&nbsp내가 올린 사진 보기</a></c:if>
                    <c:if test="${ sessionScope.id eq null }"><a onclick="needLogin()" id='mp'><i class="fas fa-photo-video"></i>&nbsp&nbsp내가 올린 사진 보기</a></c:if>
                </li>
                <li>
                    <c:if test="${ dto.admin eq 0 }"><a href="notice_page.do"><i class="fas fa-bullhorn"></i>&nbsp&nbsp공지사항</a></c:if>
                    <c:if test="${ dto.admin eq 1 }"><a href="admin_notice.do"><i class="fas fa-bullhorn"></i>&nbsp&nbsp공지사항</a></c:if>
                     / <a href="event_page.do"><i class="fas fa-gifts"></i>&nbsp&nbsp이벤트</a>
                </li>
            </ul>
        </fieldset>
    </header>
    <section id="reserve">
        <form method="post" action="reserve.do" name='air_form' onsubmit="return check_id(${ sessionScope.id })">
            <div id="airport">
                <div id="startport">
                 	<input type="text" placeholder="출발나라" required name='st_country' readonly>
                    <i class="fas fa-search" onclick="search_start()"></i>
                    <input type='text' placeholder='출발공항' required readonly name='st_airport' id='start_airport'>
                	<%--<select>
                		 <option disabled selected hidden>출발공항</option>
                		<c:forEach var="list" items="${ startport }">
                			<option value='${ list.airport }'>${ list.airport }</option>
                		</c:forEach>
                	</select>--%>
                </div>
                <i class="fas fa-plane-departure airplane"></i>
                <div id="endport">
                    <input type="text" placeholder="도착나라" required name='arr_country' readonly>
                    <i class="fas fa-search" onclick="search_arrive()"></i>
                    <input type='text' placeholder='도착공항' required readonly name='arr_airport' id='arrive_airport'>
                </div>
            </div>
            <div id="trip_day">
                <div id="trip_start">
                    <label for="startday">출국날</label><br>
                    <input type="date" id="startday" required name='st_day'>
                </div>
                <div id="trip_end">
                    <label for="endday">귀국날</label><br>
                    <input type="date" id="endday" required name='arr_day'>
                </div>
                <div id="aircom">
                    <select name="air_line">
                    	<option disabled hidden selected>선택하세요</option>
                    	<c:forEach var="list" items="${ alist }">
                    		<option value='${ list.airline }'>${ list.airline }</option>
                    	</c:forEach>
                    </select>
                </div>
                <div id="nth_people">
                    <div id="adult_select">
                        <label for="adult"><i class="far fa-user"></i>성인 ( 15세 이상 )</label>
                        <select id="adult" name="adult">
                            <c:forEach var="no" begin="0" end="9">
                            <option value="${ no }">( ${ no } 명 )</option>
                        </c:forEach>
                        </select>
                    </div>
                    <div id="child_select">
                        <label for="child"><i class="far fa-user"></i> 유/소아 ( 14세 이하 )</label>
                        <select id="child" name="child">
                        <c:forEach var="no" begin="0" end="9">
                            <option value="${ no }">( ${ no } 명 )</option>
                        </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <fieldset id="ticket_check">
                <legend>티켓 확인</legend>
                <ul>
                    <li>출발공항 : <span id='st_port'></span></li>
                    <li>도착공항 : <span id='arr_port'></span></li>
                    <li>출국날 : <span id='st_d'></span></li>
                    <li>귀국날 : <span id='arr_d'></span></li>
                    <li>항공사 : <span id='airline'></span></li>
                    <li>인원 : 성인 <span id='adult_cnt'></span> 명 , 유/소아 <span id='child_cnt'></span> 명</li>
                    <hr>
                    <input type='button' value='예매확인' id='reservation' onclick="go_reservation()">
                </ul>
            </fieldset>
            <input type="submit" id="buy_ticket">
            <label for="buy_ticket"><span>예매하기</span><i class="fas fa-suitcase-rolling"></i>
            </label>
             <c:if test="${ sessionScope.id ne null }">
            	<input type='button' value='나의 예매현황' onclick="my_reserve()" id="reserve_check">
            </c:if>
        </form>
    </section>
    <section id="recommend">
        <span id="rclogo">
            추천 여행지 <i class="fas fa-hand-holding-heart"></i>
        </span>
        <c:if test="${ dto.admin eq 1 }"><span id="admin_text">[ 관리자 / 사진을 클릭하시면 수정가능합니다. ]</span></c:if>
        <c:forEach var="no" items="${ mlist }">
        	<c:if test="${ sessionScope.id ne null }">
	        	<article id="recommend_${ no.no }">
	        		<img src="picture/main_picture/${ no.img }" <c:if test="${ dto.admin eq 1}">onclick="page_img_set(${ no.no })"</c:if>>
	        		<div>
	        			<p>${ no.country }</p>
	        			<p>${ no.city }</p>
	        		</div>
	        	</article>
        	</c:if>
        	<c:if test="${ sessionScope.id eq null }">
        		<article id="recommend_${ no.no }">
	        		<img src="picture/main_picture/${ no.img }">
	        		<div>
	        			<p>${ no.country }</p>
	        			<p>${ no.city }</p>
	        		</div>
	        	</article>
        	</c:if>
        </c:forEach>
     </section>
    <footer>
        <div id="manual">
            <ul>
                <li><a onclick="clause()"> 이용약관</a></li>
                <li>
                	<c:if test="${ dto.admin eq 0 }"><a href="notice_page.do">공지사항</a></c:if>
                    <c:if test="${ dto.admin eq 1 }"><a href="admin_notice.do">공지사항</a></c:if>
                </li>
                <c:if test="${ dto.admin eq 0 }"><li><a href="qnaBoard.do"> 1:1 문의</a></li></c:if>
                <c:if test="${ dto.admin eq 1 }"><li><a href="admin_qna.do"> 1:1 문의</a></li></c:if>
            </ul>
        </div>
        <p id="pwcompany"><strong>PASS WORLD㈜ </strong> <span>만든사람 강정욱</span></p>
        <p id="address">주소 : 서울특별시 강남구 그린컴퓨터아트학원 / 전화번호 : 010 - XXXX - XXXX</p>
        <p id="copy">Copyright &copy; PassWorld Corp. All rights reserved.</p>
    </footer>
</body>
</html>
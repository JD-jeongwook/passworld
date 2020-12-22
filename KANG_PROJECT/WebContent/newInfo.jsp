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
<title>회원가입</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js_file/newInfo.js"></script>
<link rel="stylesheet" href="css_file/newInfo.css">
</head>
<body>
    <a href="main_page.do" id="logo">PASS WORLD</a>
    <form name='insert_info' method="post" action="create_info.do" onsubmit="return pwChk()">

        <!-- 필수입력 -->
        <div id="must">
            <p id="must_line">회원가입</p>

            <!-- 아이디 -->

            <label for="id">아이디</label>
            <input type="text" id="id" name="id" required readonly>
         
            <input type="button" onClick="idCheck()" value="중복확인" id='idChk'>
            
            <!-- 비밀번호 -->

            <label for="pw">비밀번호</label>
            <input type="password" id="pw" name="pw" required minlength="8" maxlength="16" autocomplete="off">
            <p id="pwmanual">비밀번호는 8 ~ 16자 영어,숫자,특수문자를 조합해서 만들어주세요.</p>

            <label for="pw2">비밀번호 확인</label>
            <input type="password" id='pw2' name='pw2' required minlength="8" maxlength="16" autocomplete="off"><p id='blank'></p>

            <!-- 이름 -->

            <label for="name">이름</label>
            <input type="text" id="name" name="name" required autocomplete="off" maxlength="10">

            <!-- 주민번호 -->

            <label for="person_num">주민번호</label>
            <input type="text" id="person_num" name="person_num" required maxlength="13" autocomplete="off">

			<!-- 주소 -->

			<label>주소</label>

			<input type="text" id="sample4_postcode" name="postcode" placeholder="우편번호" style="width:100px;" readonly>
			<input name='postbutton' id='post_search' type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br> 
			<input type="text" id="sample4_roadAddress" name="address_1" placeholder="도로명주소" readonly> 
			<input type="text" id="sample4_jibunAddress" name="address_2" placeholder="지번주소" readonly><span id="guide" style="color: #999; display: none" style="margin-left:70px; margin-top:10px;"></span>
			<input type="text" id="sample4_detailAddress" name="detail_address" placeholder="상세주소" style="width:327px;" autocomplete="off"> 
			<input type="text" id="sample4_extraAddress" name="extra_address" placeholder="참고항목" style="width:100px; margin-left:0px;" readonly>

			<!-- 휴대폰 -->
            <label for="phone_company">휴대폰 번호</label>
            <select id="phone_company" name="phone_company">
                <option value="skt">SKT</option>
                <option value="kt">KT</option>
                <option value="lg">LG</option>
            </select>
            <select id="f_phone" name="f_phone">
                <option value="010">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
            </select>-
            <input type="text" name="s_phone" id="s_phone" required autocomplete="off" maxlength="4">-
            <input type="text" name="t_phone" id="t_phone" required autocomplete="off" maxlength="4">
        </div>

            <!-- 이메일 -->
            <label for="mail">E - mail</label>
            <input type="email" id="mail" name="mail" autocomplete="off">
            <div class="email_agree">
                <label>이메일 수신여부</label>
                <p>각종 이벤트와 할인소식을 이메일로 보내드립니다.</p>
                <input type="radio" id="email_agree" name="get_email" value="email_agree">
                <label for="email_agree">네</label>
                <input type="radio" id="email_no" name="get_email" value="email_no">
                <label for="email_no">아니요</label>
            </div>
            
            <!-- SNS수신여부 -->
            <div class="phone_agree">
                <label>SNS 수신여부</label>
                <p>각종 이벤트와 할인소식을 SNS로 보내드립니다.</p>
                <input type="radio" id="phone_agree" name="get_sns" value="phone_agree">
                <label for="phone_agree">네</label>
                <input type="radio" id="phone_no" name="get_sns" value="phone_no">
                <label for="phone_no">아니요</label>
            </div>

            <!-- 성별 -->
            <div class="gender">
                <label>성별</label>
                <input type="radio" value="male" name="gender" id="male" required><label for="male">남자</label>
                <input type="radio" value="female" name="gender" id="female"><label for="female">여자</label>
            </div>
    
        <!-- 가입완료 -->
        <div id="complete">
        	<input type='hidden' name='admin' value="${ admin }">
            <input type="submit" value="가입완료">
            <a href="main_page.do">취소하기</a>
        </div>
        
    </form>
</body>
</html>
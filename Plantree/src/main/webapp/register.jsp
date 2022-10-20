<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- 이름은 Plantree, 너비는 사용자 기기에 맞추고, 기본 크기로 초기화 -->
	<meta name="Plantree"  content="width=device-width, initial-scale=1.0">
	<!-- style.css 파일의 스타일을 적용 -->
	<link rel="stylesheet" href="style.css">
	<!-- 헤더 텍스트(브라우저 탭에 표시되는 이름) -->
	<title>함께 성장하는 우리, 플랜트리</title>
	<!-- fontawesome 사이트에서 아이콘 받아오기  -->
	<script src="https://kit.fontawesome.com/070c8c8282.js" crossorigin></script>
	<!-- 구글 폰트 사이트에서 폰트 받아오기 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&family=Noto+Serif+KR:wght@500&display=swap" rel="stylesheet">
	<script>
		function idc(){
			var uid = document.reg.uid.value;
			if (uid == "") {
				alert("사용하실 ID를 입력해주세요.");
			} else {
				idcd = window.open("id_check.jsp?uid="+uid, "idcheck", "width=400, height=250");
				window.focus();
				}
		}
		function nickc(){
			var nick = document.reg.nick.value;
			if (nick == "") {
				alert("사용하실 닉네임을 입력해주세요.");
			} else {
				nickcd = window.open("nick_check.jsp?nick="+nick, "nickcheck", "width=400, height=250");
				window.focus();
				}
		}
	</script>
</head>
<body>
	<nav class="navbar">
		<div class="navbar_logo">
			<i class="fa-solid fa-tree-city"></i>
			<a href="index.jsp">Plantree</a>
		</div>
		<ul class="navbar_menu">
			<li><a href="boardA_list.jsp">새소식</a></li>
			<li><a href="">소개</a></li>
		</ul>
		<div class="navbar_login">
			<a href="login.jsp">로그인</a>
		</div>
		<a href="#" class="navbar_toggleBtn">
		<i class="fa-solid fa-bars"></i>
		</a>
	</nav>
	<div class="register_box">
		<h1>회원가입</h1>
		<form action="register_ok.jsp" name="reg" method="post">
			<input type="text" placeholder="아이디" name="uid" maxlength="20" size="30" required>
			<input type="button" value="중복 확인" onclick="idc()">
			<input type="password" placeholder="비밀번호" name="pw" maxlength="20" size="30" required>
			<input type="password" placeholder="비밀번호 확인" name="pw2" maxlength="20" size="30" required>
			<input type="text" placeholder="닉네임" name="nick" maxlength="20" size="30" required>
			<input type="button" value="중복 확인" onclick="nickc();" formmethod="post"><br>
			<input type="text" placeholder="이름" name="uname" maxlength="20" size="30" required>
			<input type="date" data-placeholder="생년월일" name="birthday" size="30" required>
			<input type="text" placeholder="이메일" name="email" maxlength="40" size="30" required>
			<select name="tel" required>
				<option value="">통신사</option>
				<option value="SKT">SKT</option>
				<option value="KT">KT</option>
				<option value="LG U+">LG U+</option>
			</select>
			<div class="register_box_phoneNumber">
			<input type="text" name="ph1" size="7" required>-<input type="text" name="ph2" size="7" required>-<input type="text" name="ph3" size="7" required>
			</div>
			<div class="register_box_sex">
			<input type="radio" name="sex" value="m" required>남성
			<input type="radio" name="sex" value="f"required>여성
			</div>
			<br>
			<div class="register_box_ad">
			광고 수신 동의 : 
			<input type="checkbox" name="ad" value="email">이메일
			<input type="checkbox" name="ad" value="phone">휴대폰
			</div>
			<div class="register_box_introduce">
			자기소개 글 : 
			<textarea name="introduce" placeholder="프로필에 나를 소개하는 글을 적어보세요."></textarea>
			</div>
			<input type="submit" value="가입" >
			<input type="reset" value="다시 쓰기">
		</form>
	</div>
</body>
</html>
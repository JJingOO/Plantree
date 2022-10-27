<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 메인 페이지 소스 -->
<head>
	<meta charset="UTF-8">
    <!-- 인터넷 익스플로러 접속시 최신 버전으로 표시 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" charset="UTF-8">
    <!-- 사용자 기기에 맞게 크기 고정, 확대 할 수 없도록 막기 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <!-- 컨텐츠가 노치 부분까지 커버하기 -->
    <meta neme="viewport" content="viewport-fit=cover">
    <!-- ios에서 전화번호가 링크로 표시되는 것을 방지하는 태그 -->
    <meta name="format-detection" content="telephone=no">
	<!-- style.css 파일의 스타일을 적용 -->
	<link rel="stylesheet" href="style.css?after">
	<!-- 헤더 텍스트(브라우저 탭에 표시되는 이름) -->
	<title>함께 성장하는 우리, 플랜트리</title>
	<!-- fontawesome 사이트에서 아이콘 받아오기  -->
	<script src="https://kit.fontawesome.com/070c8c8282.js" crossorigin></script>
	<!-- 구글 폰트 사이트에서 폰트 받아오기 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&family=Noto+Serif+KR:wght@500&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
</head>
<body>
	<!-- 네비게이션바(상단 메뉴바) -->
	<nav class="navbar_m">
		<div class="navbar_logo_m">
			<a href="index.jsp"> <i class="fa-solid fa-tree-city"></i> Plantree</a>
		</div>
		<%
			try { // 아래 코드를 실행한다
			String s = (String)session.getAttribute("sNAME"); // 로그인 된 사용자의 닉네임을 가져와서 s에 저장
			if (!s.equals("null")) { // s가 null이 아니면(로그인 된 상태가 맞으면)
		%>
		<div class="navbar_login_dd">
		<!-- s의 값(닉네임)을 표시하고 마우스를 올리면 메뉴가 두둥등장 -->
			<span class="login_dd"><%=s %>님</span>
			<div class="login_dd_content">
				<!-- a href="">마이페이지(작업 중)</a>-->
				<a href="mem_upd.jsp">정보수정</a>
				<a href="logout.jsp">로그아웃</a>
			</div>
		</div>
		<%
			// 위 try 코드가 제대로 실행되지 않은 경우 (로그인 상태가 아니라서 닉네임을 가져오지 못한 경우)
			}	} catch (Exception e) { // 예외 e(아래 코드)를 실행한다
		%>		
		<div class="navbar_login_m">
		<!--  로그인이 안 된 상태니까 로그인 버튼이 두둥등장 -->
			<a href="login.jsp">로그인</a>
		</div>
		<%
			} // 잊지말고 괄호 닫아주기
		%>
	</nav>
	<div class="mainpage">
		<div data-aos="fade-up"
				data-aos-offset="200"
				data-aos-easing="ease-out-back"
				data-aos-duration="750"
				data-aos-delay="1000"
				class="welcome_p1"
		>
			<span class="hi">반가워요!</span>
		</div>
		<div data-aos="fade-up"
				data-aos-offset="150"
				data-aos-easing="ease-out-back"
				data-aos-duration="750"
				data-aos-delay="1500"
				class="welcome_p1"
		>
			<span class="hi_1">
				우리 같이 쉽고 빠르게 시작해볼까요?
			</span>
		</div>
		<div data-aos="fade"
				data-aos-offset="100"
				data-aos-easing="ease-out-back"
				data-aos-duration="750"
				data-aos-delay="2000"
				class="welcome_p1"
		>
			<br><br><br>
			<span class="hi_2">
				<i class="fa-solid fa-bolt"></i>
				<a href="login.jsp">시작하기</a>
			</span>
		</div>
		<br>
		<div data-aos="fade"
				data-aos-offset="300"
				data-aos-easing="ease-out-back"
				data-aos-duration="500"
				data-aos-delay="3000"
				class="welcome_p1"
		>
			<span class="hi_3">
				<i class="fa-solid fa-computer-mouse"></i>
				스크롤을 내려보세요
			</span>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<script>
		AOS.init();
	</script>
</body>
<footer>
	<!-- 사이트 아래쪽에 표시되는 부분 (SNS, 메뉴, 연락처, 이용약관, 저작권 등 표시) -->
	<p>Copyright 2022. Team Need Doraemon. All rights reserved.
</footer>
</html>
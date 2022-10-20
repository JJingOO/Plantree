<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<!-- 닉네임 중복체크 팝업 소스 -->
<head>
		<meta charset="UTF-8">
	<!-- 이름은 Plantree, 너비는 사용자 기기에 맞추고, 기본 크기로 초기화 -->
	<meta name="Plantree"  content="wnickth=device-wnickth, initial-scale=1.0">
	<!-- style.css 파일의 스타일을 적용 -->
	<link rel="stylesheet" href="style.css">
	<!-- 헤더 텍스트(브라우저 탭에 표시되는 이름) -->
	<title>플랜트리 : 닉네임 중복체크</title>
	<!-- fontawesome 사이트에서 아이콘 받아오기  -->
	<script src="https://kit.fontawesome.com/070c8c8282.js" crossorigin></script>
	<!-- 구글 폰트 사이트에서 폰트 받아오기 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&family=Noto+Serif+KR:wght@500&display=swap" rel="stylesheet">
	<!-- 헤더 텍스트 (브라우저 탭에 표시되는 이름) -->
	<script>
		// 닉네임을 입력했는지 확인해주는 함수
		function nick_search(){
			// 닉네임칸이 비어있는 경우에 입력해달라고 하는 코드
			if (document.nick.nick.value == "") {
				alert("사용하실 닉네임을 입력해주세요.");
				document.nick.nick.focus(); // 닉네임칸으로 포커스
				return false; // false를 반환해서 다시 입력 상태로
			} else { // 닉네임을 입력했다면
				document.nick.submit(); // DB에서 중복 체크
			}
		}

		function nick_ok(a){
			opener.document.reg.nick.value = a;
			self.close();
		}
	</script>
</head>
<body>
	<div class="idCheck">
	<br>
	<%
		// 회원가입 페이지에서 입력한 닉네임값(nick) 가져오기
		String nick = request.getParameter("nick");
	%>
		<!-- 폼에 입력한 값을 nick_check.jsp 에서 처리 -->
		<form name="nick" action="nick_check.jsp" method="post">
		<!-- 입력한 nick값이 들어간 상태로 표시 -->
		<input type="text" name="nick" value=<%= nick %>>
		<!-- 검색 버튼 클릭 시 맨위의 코드(nick_search() 함수) 실행 후 아래 명령 수행 -->
		<input type="button" value="검색" onclick="nick_search()">
		</form>
	<%
		boolean fnd=false; // 닉네임 중복 여부를 판단할 fnd boolean 변수 선언
		if (nick == null) { // 가져온 nick가 없다면 (값을 제대로 못 가져온 경우)
			nick = ""; // nick를 null 대신 빈 문자열로 대체 ()
		} else {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = null;
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "root");
	
			PreparedStatement pstmt = null;
			ResultSet rs = null;
	
			String sql = "select nick from member where nick=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nick);
			rs = pstmt.executeQuery();
	
			if (rs.next()) 
				fnd = true;
			
			if (nick != null && fnd == false) {
	%>
	사용 가능한 닉네임이에요!<br>
	<a href="javascript:nick_ok('<%= nick %>')">확인</a>을 누르시면<br>회원가입 화면으로 돌아갈게요.
	<%
			} else {
	%>
	아쉽게도 누군가가 <br>이미 사용중인 닉네임이에요.<br>
	<%
			}
		}
	%>
	</div>
</body>
</html>
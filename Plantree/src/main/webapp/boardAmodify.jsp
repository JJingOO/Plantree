<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
   <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- 이름은 Plantree, 너비는 사용자 기기에 맞추고, 기본 크기로 초기화 -->
	<meta name="Plantree"  content="width=device-width, initial-scale=1.0">
	<!-- style.css 파일의 스타일을 적용 -->
	<link rel="stylesheet" href="style.css">
	<!-- 헤더 텍스트(브라우저 탭에 표시되는 이름) -->
	<title>플랜트리 : 게시글 수정</title>
	<!-- fontawesome 사이트에서 아이콘 받아오기  -->
	<script src="https://kit.fontawesome.com/070c8c8282.js" crossorigin></script>
	<!-- 구글 폰트 사이트에서 폰트 받아오기 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&family=Noto+Serif+KR:wght@500&display=swap" rel="stylesheet">
<script>
function submit_modify(){
	document.form1.action="boardAmodify_ok.jsp";
	document.form1.submit();
}
function submit_delete(){
	alert("정말로 삭제하시겠습니까?");
	document.form1.action="boardAdelete.jsp";
	document.form1.submit();
}
function submit_list(){
	document.form1.action="boardA_list.jsp";
	document.form1.submit();
}
</script>
</head>
<body>
	<!-- 네비게이션바(상단 메뉴바) -->
	<nav class="navbar">
		<div class="navbar_logo">
			<i class="fa-solid fa-tree-city"></i>
			<a href="index.jsp">Plantree</a>
		</div>
		<ul class="navbar_menu">
			<li><a href="boardA_list.jsp">새소식</a></li>
			<li><a href="">소개</a></li>
		</ul>
		<%
			try { // 아래 코드를 실행한다
			String s = (String)session.getAttribute("sNAME"); // 로그인 된 사용자의 닉네임을 가져와서 s에 저장
			if (!s.equals("null")) { // s가 null이 아니면(로그인 된 상태가 맞으면)
		%>
		<div class="navbar_login_dd">
		<!-- s의 값(닉네임)을 표시하고 마우스를 올리면 메뉴가 두둥등장 -->
			<span class="login_dd"><%=s %>님</span>
			<div class="login_dd_content">
				<a href="">마이페이지(작업 중)</a>
				<a href="mem_upd.jsp">회원 정보 수정</a>
				<a href="logout.jsp">로그아웃</a>
			</div>
		</div>
		<%
			// 위 try 코드가 제대로 실행되지 않은 경우 (로그인 상태가 아니라서 닉네임을 가져오지 못한 경우)
			}	} catch (Exception e) { // 예외 e(아래 코드)를 실행한다
		%>		
		<div class="navbar_login">
		<!--  로그인이 안 된 상태니까 로그인 버튼이 두둥등장 -->
			<a href="login.jsp">로그인</a>
		</div>
		<%
			} // 잊지말고 괄호 닫아주기
		%>
		<!-- 네비게이션바 토글 버튼 (화면이 작을 때(모바일) 표시되고, 클릭 시 메뉴가 펼쳐짐) -->
		<a href="#" class="navbar_toggleBtn">
		<i class="fa-solid fa-bars"></i>
		</a>
	</nav>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
String url = "jdbc:mysql://localhost:3306/jsp";
con = DriverManager.getConnection(url, "root", "root");

PreparedStatement pstmt = null;
ResultSet rs = null;

int num = Integer.parseInt(request.getParameter("num"));

String sql = "select num, title, contents, writer, readcnt from boarda where num=?";
pstmt = con.prepareStatement(sql);
pstmt.setInt(1, num);
rs = pstmt.executeQuery();
if(rs.next() == false)
	out.print("등록된 게시물이 없습니다");
else{
	String title = rs.getString("title");
	String contents = rs.getString("contents");
	String writer = rs.getString("writer");
	
	%>
	<div class="boardAview">
	<h1>새소식</h1>
	<form name = "form1" action = "boadAmodify_ok.jsp" method = "post">
	<table>
	<tr>
	<td width = "40%">작성자</td>
	<td width = "60%"><%=writer %></td>
	</tr>
	<tr>
	<td width = "40%">제목</td>
	<td width = "60%"><input type="text" name="title" value="<%=title %>"></td>
	</tr>
	<tr>
	<td width = "40%">내용</td>
	<td width = "60%">
	<textarea rows="5" cols = "60" name="contents"><%=contents %></textarea>
	</td>
	</tr>
	<tr>
	<td colspan="2">
	<input type = "button" value="수정완료" onclick="submit_modify()">&nbsp;&nbsp;
	<input type = "button" value="목록으로" onclick="submit_list()">&nbsp;&nbsp;
	<input type = "hidden" name = "num" value = <%=num %>>
	</td>
	</tr>
	</table>
<%
}
%>
</form>
</div>
</body>
</html>
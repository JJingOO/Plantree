<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<%@ page import="java.util.*"  %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function incorrect() { // 아이디, 비밀번호 중 하나가 틀리면 incorrect() 스크립트 실행
		alert('아이디 또는 비밀번호를 확인해주세요.');
		history.back(); // 로그인 화면으로 돌아감
	}
</script>
<title>플랜트리 : 로그인</title>
</head>
<body>
<%
	// 아이디, 비밀번호 값 가져오기
	String uid = request.getParameter("uid");
	String pw = request.getParameter("pw");
	
	// jdbc를 통해 mysql db 연결
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = null;
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "root");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select nick from member where uid=? and pw=?";
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, uid);
	pstmt.setString(2, pw);
	
	rs = pstmt.executeQuery();
	
	// 관리자ID :  admin, 1234로 로그인 가능
	if ((uid.equals("admin")) && (pw.equals("1234"))) {
		session.setAttribute("sID", uid);
		session.setAttribute("sNAME", "관리자");
		session.setMaxInactiveInterval(60*10);
		out.print("관리자 로그인 성공");
		response.sendRedirect("index.jsp");
	}
	// 아이디, 비밀번호가 일치하면 G_ID에 uid 값을, G_NAME에는...
	else if (rs.next() != false){
		session.setAttribute("sID", uid);
		session.setAttribute("sNAME", rs.getString(1));
		session.setMaxInactiveInterval(60*10); // 세션 60초*10 = 10분 유지
		response.sendRedirect("index.jsp"); // 메인화면으로 보냄
	}
	// 일치하지 않으면 맨 위의 incorrect() 스크립트 실행
	else { %>
		<script>incorrect();</script>
		<% } %>
</body>
</html>
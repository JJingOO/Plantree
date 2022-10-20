<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.sql.*" %>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플랜트리 : 회원 리스트</title>
</head>
<body>
<h3>회원 리스트</h3>
<table border="1" width="1000">
<tr>
<th>아이디</th>
<th>패스워드</th>
<th>닉네임</th>
<th>이름</th>
<th>생일</th>
<th>이메일</th>
<th>핸드폰번호</th>
<th>성별</th>
<th>자기소개</th>
<th>광고수신</th>
<th>가입일자</th>
</tr>
<%
	//1단계
	Class.forName("com.mysql.jdbc.Driver");
	//2단계
	Connection conn = null;
	String url = "jdbc:mysql://localhost:3306/jsp";;
	conn = DriverManager.getConnection(url, "root", "root");
	//3단계
	Statement stmt = null;
	ResultSet rs = null;
	stmt = conn.createStatement();
	String sql = "select uid, pw, nick, uname, birthday, email, hp, sex, introduce, ad, regidate from member";
	rs = stmt.executeQuery(sql);
	while (rs.next()) {
		String uid = rs.getString("uid");
		String pw = rs.getString("pw");
		String nick = rs.getString("nick");
		String uname = rs.getString("uname");
		String birthday = rs.getString("birthday");
		String email = rs.getString("email");
		String hp = rs.getString("hp");
		String sex = rs.getString("sex");
		String introduce = rs.getString("introduce");
		String ad = rs.getString("ad");
		String regidate = rs.getString("regidate");
		if (sex==null)
			sex="";
		else if (sex.equals("m"))
			sex = "남자";
		else if (sex.equals("f"))
			sex = "여자";
		else
			sex = "기타";
%>
<tr><td><a href="mem_upd.jsp?uid'<%=uid%>'"><%=uid %></a></td>
<td><%=pw %></td>
<td><%=nick %></td>
<td><%=uname %></td>
<td><%=birthday %></td>
<td><%=email %></td>
<td><%=hp %></td>
<td><%=sex %></td>
<td><%=introduce %></td>
<td><%=ad %></td>
<td><%=regidate %></td>
</tr>
<%} %>
</table><br><br>
<input type="button" value="메인으로" onclick="javascript:location.href='index.jsp'">
</body>
</html>
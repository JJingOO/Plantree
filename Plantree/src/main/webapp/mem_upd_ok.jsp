<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String pw = request.getParameter("pw");
String sex = request.getParameter("sex");

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "root");

PreparedStatement pstmt = null;
String uid = (String)session.getAttribute("sID");

String sql = "update member set pw = ?, sex = ? where uid = ?";
pstmt = con.prepareStatement(sql);

pstmt.setString(1, pw);
pstmt.setString(2, sex);
pstmt.setString(3, uid);

pstmt.executeUpdate();
response.sendRedirect("member_list.jsp");

%>
</body>
</html>
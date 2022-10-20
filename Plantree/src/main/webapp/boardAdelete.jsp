<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");

Connection con = null;
String url = "jdbc:mysql://localhost:3306/jsp";
con = DriverManager.getConnection(url, "root", "root");

PreparedStatement pstmt=null;
int num = Integer.parseInt(request.getParameter("num"));
String sql = "delete from boarda where num=?";
pstmt = con.prepareStatement(sql);
pstmt.setInt(1, num);
pstmt.executeUpdate();
response.sendRedirect("boardA_list.jsp");


%>

</body>
</html>
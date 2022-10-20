<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>
   <%request.setCharacterEncoding("utf-8"); %>
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

PreparedStatement pstmt = null;
int num = Integer.parseInt(request.getParameter("num"));
String title = request.getParameter("title");
String contents = request.getParameter("contents");
String sql = "update boarda set title=?, contents=?, updatedtm=? where num=?";
pstmt = con.prepareStatement(sql);
Calendar today = Calendar.getInstance();
String t = Integer.toString(today.get(Calendar.YEAR));
t = t + "-" + Integer.toString(today.get(Calendar.MONTH)+1);
t = t + "-" + Integer.toString(today.get(Calendar.DATE));
t = t + "-" + Integer.toString(today.get(Calendar.HOUR_OF_DAY));
t = t + "-" + Integer.toString(today.get(Calendar.MINUTE));
pstmt.setString(1, title);
pstmt.setString(2, contents);
pstmt.setString(3, t);
pstmt.setInt(4, num);
pstmt.executeUpdate();
response.sendRedirect("boardA_list.jsp");

%>
</body>
</html>
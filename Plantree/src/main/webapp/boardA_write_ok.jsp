<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>
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
try{
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	String sql = "insert into boarda (title, writer, contents, writedtm, updatedtm) values(?,?,?,?,?)";
	
	pstmt = con.prepareStatement(sql);
	Calendar today = Calendar.getInstance();
	String t = Integer.toString(today.get(Calendar.YEAR));
	t = t + "-" + Integer.toString(today.get(Calendar.MONTH)+1);
	t = t + "-" + Integer.toString(today.get(Calendar.DATE));
	t = t + "-" + Integer.toString(today.get(Calendar.HOUR_OF_DAY));
	t = t + "-" + Integer.toString(today.get(Calendar.MINUTE));
	
	pstmt.setString(1, title);
	pstmt.setString(2, writer);
	pstmt.setString(3, contents);
	pstmt.setString(4, t);
	pstmt.setString(5, t);
	pstmt.executeUpdate();
}
catch(SQLException e) {
	out.print(e.getMessage());
}
finally{
	if( pstmt != null) pstmt.close();
	if( con != null) con.close();
}
response.sendRedirect("boardA_list.jsp");
%>

</body>
</html>
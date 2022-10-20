<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*, java.util.*" %>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content = "width=device-width">

<title>플랜트리 : 회원 정보 수정</title>
</head>
<script>

</script>
<body>

<h2>회원 정보 수정</h2>
<%
Class.forName("com.mysql.jdbc.Driver");
	Connection con=null;
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "root");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String in_userid = (String)session.getAttribute("sID");
	String sql = "select * from member where uid=?";
	
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, in_userid);
	
	rs = pstmt.executeQuery();
	
	if (rs.next() == false) {
		out.print("등록되지 않은 회원입니다");
		out.print("<a href='login.jsp')로그인</a>");
	} else {
		String uname = rs.getString("uname");
		String pw = rs.getString("pw");
		String sex = rs.getString("sex");
		String job = rs.getString("ad");
		
	
	%>
	
<form action="mem_upd_ok.jsp" method="post" name="form1">
	<fieldset>
		
		<b>아이디</b> <br> <input type="text" name="uid" class="text" value="<%=in_userid%>" ReadOnly>&nbsp;<br><br>
		<b>비밀번호</b> <br> <input type="password" name="pw" class="text" placeholder="비밀번호"><br><br>
		<b>이름</b> <br> <input type="text" name="uname"><br><br>
		<b>생년월일</b> <br> <input type="date" name="birthday" value="<%=uname%>" ReadOnly><br><br>
		<b>남자</b> <br> <input type="radio" name="sex" value="m" <%if (sex.equals("m")) out.print("checked"); %>>
		<b>여자</b> <br> <input type="radio" name="sex" value="f" <%if (sex.equals("f")) out.print("checked"); %>>
		<b>기타</b> <br> <input type="radio" name="sex" value="r" <%if (sex.equals("r")) out.print("checked"); %>>
		<br><br>
광고 수신 동의 :
<input type="checkbox" name="hobby" value="1">이메일
<input type="checkbox" name="hobby" value="2">휴대폰
<br>
		<br><br>
		<b>휴대전화</b> <br> 
		<input type="text" name="ph1" size="3">-
		<input type="text" name="ph2" size="4">-
		<input type="text" name="ph3" size="4"><br><br>
		<input type="submit" class="btn" value="수정하기">&nbsp;
		<input type="button" class="btn" value="삭제하기" onclick="mem_delete();">&nbsp;
		<input type="reset" class="btn" value="취소하기">
		
	</fieldset>
</form>
</body>
<% } %>
</html>
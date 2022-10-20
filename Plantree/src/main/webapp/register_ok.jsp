<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<%@ page import="java.util.*"  %>
<% request.setCharacterEncoding("utf-8"); %>
<%
	//단계1 jdbc 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver");
	
	//커넥션 객체
	Connection con=null; 
	String url="jdbc:mysql://localhost:3306/jsp";
	con=DriverManager.getConnection(url,"root","root");
	
	//단계3 PreparedStatement
	PreparedStatement pstmt=null;
	
	try {
	//단계4 폼에서 입력값 받아오기
	String uid=request.getParameter("uid");
	String pw=request.getParameter("pw");
	String nick=request.getParameter("nick");
	String uname=request.getParameter("uname");
	String birthday=request.getParameter("birthday");
	String email=request.getParameter("email");
	String tel=request.getParameter("tel");
	String ph1=request.getParameter("ph1");
	String ph2=request.getParameter("ph2");
	String ph3=request.getParameter("ph3");
	String sex=request.getParameter("sex");
	String introduce=request.getParameter("introduce");

	String[] ad=request.getParameterValues("ad");
	String adstr = "";
	if (ad !=null) {
		for (int i=0; i<ad.length; i++) {
			adstr += ad[i];
		}
	}

	String hp=tel+")"+ph1+"-"+ph2+"-"+ph3;

	Calendar dateIn=Calendar.getInstance();
	String regidate=Integer.toString(dateIn.get(Calendar.YEAR))+"-";
	regidate=regidate+Integer.toString(dateIn.get(Calendar.MONTH)+1)+"-";
	regidate=regidate+Integer.toString(dateIn.get(Calendar.DATE));
	
	//단계5 preparestatement 객체로 실행할 sql문 작성
	String sql="insert into member (uid,pw,nick,uname,birthday,email,hp,sex,introduce,ad,regidate) values (?,?,?,?,?,?,?,?,?,?,?)";
	pstmt=con.prepareStatement(sql);
	
	//단계6 ?에 값을 넣기
	pstmt.setString(1,uid);
	pstmt.setString(2,pw);
	pstmt.setString(3,nick);
	pstmt.setString(4,uname);
	pstmt.setString(5,birthday);
	pstmt.setString(6,email);
	pstmt.setString(7,hp);
	pstmt.setString(8,sex);
	pstmt.setString(9,introduce);
	pstmt.setString(10,adstr);
	pstmt.setString(11,regidate);
	
	//단계7 실행하기
	int result = pstmt.executeUpdate();
	
	if (result == 1) {
		response.sendRedirect("register_succ.jsp");
	} else {
		response.sendRedirect("register_fail.jsp");
	}
	
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
			try {
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플랜트리 : 회원가입</title>
</head>
<body>

</body>
</html>
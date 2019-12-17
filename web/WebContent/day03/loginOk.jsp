<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>잘~ 넘어옵니다</h1>

	<%
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@192.168.0.35:1521:orcl";
		String user = "scott";
		String pwd = "tiger";
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();

		Class.forName(driver);
		conn = DriverManager.getConnection(url, user, pwd);
		sb.append("SELECT ID, ENAME, PWD FROM ROOMSIX WHERE ID ='" + id + "' AND PWD = '" + pw + "'");
		pstmt = conn.prepareStatement(sb.toString());
		rs = pstmt.executeQuery();
		if (rs.next()) {
			out.println("<h1> TRUE </h1>");
		} else {
			out.println("<h1> FALSE </h1>");
		}

		rs.close();
		pstmt.close();
		conn.close();
		id = null;
		pw = null;
	%>
</body>
</html>
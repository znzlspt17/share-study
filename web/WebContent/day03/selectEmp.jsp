<%@page import="java.text.SimpleDateFormat"%>
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
<style>
table>tbody>tr>td {
	border: 1px solid red;
	padding: 2px;
	margin: 1px;
	text-align: center;
	padding: 2px;
}

table, th {
	border: 2px solid green;
}

table, th, tbody, tr, td {
	border-collapse: collapse;
}

table {
	width: 800px;
	margin: 0px auto;
}

th {
	background-color: skyblue;
}

tbody>tr:nth-of-type(odd) {
	background-color: gray;
}

tbody>tr:nth-of-type(even) {
	background-color: pink;
}

tbody>tr:hover {
	background-color: maroon;
}

tbody>tr>td:hover {
	color: red;
}
</style>

</head>
<body>
	<table>
		<tr>
			<th>사원번호</th>
			<th>이름</th>
			<th>직무</th>
			<th>급여</th>
			<th>입사일</th>
			<th>부서번호</th>
		</tr>
		<%
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@192.168.0.35:1521:orcl";
			String user = "scott";
			String pwd = "tiger";

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StringBuffer sb = new StringBuffer();

			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pwd);
			sb.append("SELECT empno, ename, sal, job, TO_CHAR(hiredate,'YYYY/MM/DD') hiredate, deptno FROM emp");
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int empno = rs.getInt("empno");
				String ename = rs.getString("ename");
				String job = rs.getString("job");
				int sal = rs.getInt("sal");
				String hireDate = rs.getString("hiredate");
				int deptno = rs.getInt("deptno");
				out.println("<tr>");
				out.println("<td><h4>" + empno + "</h4></td><td><h4>" + ename + "</h4></td><td><h4>" + job
						+ "</h4></td><td><h4>" + sal + "</h4></td><td><h4>" + hireDate + "</h4></td><td><h4>" + deptno
						+ "</h4></td>");
				out.println("</tr>");
			}
			rs.close();
			pstmt.close();
			conn.close();
			sb.delete(0, sb.length() - 1);
		%>
	</table>
</body>
</html>
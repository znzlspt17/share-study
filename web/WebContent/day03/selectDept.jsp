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
</style>

</head>
<body>
	<table>
		<tr>
			<th>부서번호호</th>
			<th>부서명</th>
			<th>부서위치</th>
		</tr>
		<tr>
			<td>10</td>
			<td>영업</td>
			<td>서울</td>
		</tr>
		<tr>
			<%
				String driver = "oracle.jdbc.driver.OracleDriver";
				String url = "jdbc:oracle:thin:@192.168.0.35:1521:orcl";
				String user = "scott";
				String pwd = "tiger";
				Connection conn = null;
				PreparedStatement pstmt = null;
				StringBuffer sb = new StringBuffer();
				ResultSet rs = null;

				Class.forName(driver);
				conn = DriverManager.getConnection(url, user, pwd);
				sb.append("SELECT * FROM dept");
				pstmt = conn.prepareStatement(sb.toString());
				rs = pstmt.executeQuery();
				while (rs.next()) {
					int deptno = rs.getInt("deptno");
					String dname = rs.getString("dname");
					String loc = rs.getString("loc");
					out.println("<tr>");
					out.println(
							"<td><h4>" + deptno + "</h4></td><td><h4>" + dname + "</h4></td><td><h4>" + loc + "</h4></td>");
					out.println("</tr>");
				}
				rs.close();
				sb.delete(0, sb.length() - 1);
				pstmt.close();
				conn.close();
			%>
		
	</table>
</body>
</html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.MakeConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
img {
	width: 50px;
	height: 50px;
}

table {
	width: 1000px;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
	<table>
		<tr>
			<th>파일번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>내용</th>
			<th>첨부이미지</th>
		</tr>
		<%
			Connection conn = MakeConnection.getInstance().getConnection();
			ResultSet rs = null;
			StringBuffer sb = new StringBuffer();
			sb.append("SELECT FNO, TITLE, WRITER, CONTENTS, FILEPATH FROM FILEUPLOADTEST");
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int fno = rs.getInt(1);
				String title = rs.getString(2);
				String writer = rs.getString(3);
				String contents = rs.getString(4);
				String filepath = rs.getString(5);
		%>
		<tr>
			<td><%=fno%></td>
			<td><%=title%></td>
			<td><%=writer%></td>
			<td><%=contents%></td>
			<td>
				<img src="<%=filepath%>" alt="" />
			</td>
		</tr>
		<%
			}
			conn.close();
		%>
	</table>
</body>
</html>
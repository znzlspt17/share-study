<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	width: 900px;
	margin: auto;
	border-bottom: 1px solid black;
}

table, th, td {
	border-top: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}

#col1 {
	width: 10%
}

#col2 {
	width: 20%
}

#col3 {
	width: 60%
}

#col4 {
	width: 10%
}
</style>
</head>
<body>
	<table>
		<tr>
			<th id="col1">게시물 번호</th>
			<th id="col2">제목</th>
			<th id="col3">작성자</th>
			<th id="col4">조회수</th>
		</tr>
		<%
			BoardDAO dao = new BoardDAO();
			ArrayList<BoardVO> voList = dao.selectAll();
			for (BoardVO vo : voList) {
		%>

		<tr>
			<td><%=vo.getBno()%></td>
			<td>
				<a href="detail.jsp?bno=<%=vo.getBno()%>"><%=vo.getTitle()%></a>
			</td>
			<td><%=vo.getWriter()%></td>
			<td><%=vo.getHits()%></td>
		</tr>


		<%
			}
		%>
		<tr>
			<td colspan="4">
				<a href="write.jsp"><input type="button" value="글쓰기" /></a>
			</td>

		</tr>
	</table>
</body>
</html>
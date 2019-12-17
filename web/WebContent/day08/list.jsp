<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>게시물 번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
		<%
			BoardDAO dao = new BoardDAO();
			ArrayList<BoardVO> voList = dao.selectAll();
			for (BoardVO vo : voList) {
		%>

		<tr>
			<td><%=vo.getBno()%></td>
			<td><%=vo.getTitle()%></td>
			<td><%=vo.getWriter()%></td>
			<td><%=vo.getHits()%></td>
		</tr>


		<%
			}
		%>

	</table>
</body>
</html>
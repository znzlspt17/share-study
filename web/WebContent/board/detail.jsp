<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width: 900px;
	margin: auto;
}

table, th, td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<%
		String req = request.getParameter("bno");
		if (req != null) {
			int bno = Integer.parseInt(req);
			BoardDAO dao = new BoardDAO();
			BoardVO vo = new BoardVO();
			vo = dao.selectOne(bno);
			dao.raiseHits(bno);
	%>

	<table>
		<tr>
			<th>작성자</th>
			<td><%=vo.getWriter()%></td>
			<th>조회수</th>
			<td><%=vo.getHits()%></td>
			<th>작성일시</th>
			<td><%=vo.getRegdate()%></td>
		</tr>

		<tr>
			<th>제목</th>
			<td colspan="5"><%=vo.getTitle()%></td>
		</tr>

		<tr>
			<th>내용</th>
			<td colspan="5">
				<%=vo.getContents()%>
			</td>
		</tr>

		<tr>
			<th>내용</th>
			<td colspan="6">
				<a href="deleteOk.jsp?bno=<%=vo.getBno()%>"> <input type="button" value="삭제" />
				</a> <a href="modifyForm.jsp?bno=<%=vo.getBno()%>"> <input type="button" value="수정" />
				</a> <a href="list.jsp"> <input type="button" value="목록" />
				</a>
			</td>
		</tr>
	</table>

	<%
		}
	%>
</body>
</html>

<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String b = request.getParameter("bno");
	if (b != null) {
		int bno = Integer.parseInt(b);

		BoardDAO dao = new BoardDAO();

		BoardVO vo = dao.selectOne(Integer.parseInt(b));
%>
<form action="modifyOk.jsp">
	<table>
		<tr>
			<th>작성자</th>
			<td><%=vo.getWriter()%></td>
			<th>조회수</th>
			<td><%=vo.getHits()%></td>
			<th>작성일시</th>
			<td><%=vo.getRegdate()%></td>

			<input type="hidden" name="bno" value="<%=vo.getBno()%>" />
		</tr>

		<tr>
			<th>제목</th>
			<td colspan="5">
				<input type="text" name="title" value="<%=vo.getTitle()%>" id="" />
			</td>
		</tr>

		<tr>
			<th>내용</th>
			<td colspan="5">
				<textarea name="contents" id="" cols="30" rows="10">
			<%=vo.getContents()%>
			</textarea>
			</td>
		</tr>

		<tr>
			<th>내용</th>
			<td colspan="6">
				<input type="submit" value="확인" />
				<a href="list.jsp"> <input type="button" value="목록" />
				</a>
			</td>
		</tr>
	</table>
</form>
<%
	}
%>
</html>
<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String b = request.getParameter("bno");
	if (b != null) {
		int bno = Integer.parseInt(b);
		BoardDAO dao = new BoardDAO();
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		dao.modify(bno, title, contents);
	}
	response.sendRedirect("../board/list.jsp");
%>

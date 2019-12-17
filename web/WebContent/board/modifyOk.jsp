<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	BoardDAO dao = new BoardDAO();
	int bno = Integer.parseInt(request.getParameter("bno"));
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	dao.modify(bno, title, contents);
	response.sendRedirect("../board/list.jsp");
%>

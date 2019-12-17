<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	String b = request.getParameter("bno");
	if (b != null) {
		int bno = Integer.parseInt(b);
		BoardDAO dao = new BoardDAO();
		dao.delete(bno);
	}
	response.sendRedirect("../board/list.jsp");
%>
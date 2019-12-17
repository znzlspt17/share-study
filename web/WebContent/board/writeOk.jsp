<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();

	vo.setWriter(request.getParameter("writer"));
	vo.setTitle(request.getParameter("title"));
	vo.setContents(request.getParameter("contents"));
	vo.setIp(request.getRemoteAddr());

	dao.add(vo);
	dao.close();
	response.sendRedirect("list.jsp");
%>
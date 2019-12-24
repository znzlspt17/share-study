<%@page import="vo.DeptVO"%>
<%@page import="dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String txt = request.getParameter("txt");
	int no = 10;
	DeptDAO dao = new DeptDAO();
	if (txt != null) {
		no = Integer.parseInt(txt);
	}
	DeptVO vo = dao.selectOne(no);
	out.println("<h1>" + vo.getDeptno() + " : " + vo.getDname() + " : " + vo.getLoc() + "</h1>");
%>

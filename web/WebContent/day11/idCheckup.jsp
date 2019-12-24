<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	MemberDAO dao = null;
	if (id != null) {
		dao = new MemberDAO();
		out.println(dao.duplicateCheck(id).trim());
	}
	if (dao != null)
		dao.close();
%>

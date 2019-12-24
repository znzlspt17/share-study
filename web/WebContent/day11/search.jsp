<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("utf-8");
	String txt = request.getParameter("txt");

	if (txt != null) {
		ProductDAO dao = new ProductDAO();
		ProductVO vo = dao.findByName(txt);
		System.out.println(vo.getImgfile());
		out.println(vo.getImgfile());

		dao.close();
	}
%>

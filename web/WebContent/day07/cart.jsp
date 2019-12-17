<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 세션에 cart라는 이름의 속성객체 얻어오기
	Object obj = session.getAttribute("cart");
	if (obj == null) {
		ArrayList<Integer> cart = new ArrayList<Integer>();
		//세션에 속성으로 지정
		session.setAttribute("cart", cart);
		//세션에서 속성 가져오기
		obj = session.getAttribute("cart");
	}
	//ArrayList 객체로 형 변환
	ArrayList<Integer> cart = (ArrayList<Integer>) obj;
	out.println("cart" + cart);

	String pno = request.getParameter("no");
	int p = Integer.parseInt(pno);
	cart.add(p);

	System.out.println("cart" + cart);

	response.sendRedirect("productDetail.jsp?pno=" + p);
%>
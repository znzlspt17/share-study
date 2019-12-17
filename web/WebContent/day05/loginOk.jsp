<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>잘~ 넘어옵니다</h1>

	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.isExists(id, pw);

		if (vo != null) {
			System.out.println("됩니다 되요");
			session.setAttribute("vo", vo);
			response.sendRedirect("layout.jsp");
		} else {
			System.out.println("안됩니다 안되요");
			response.sendRedirect("layout.jsp");
		}
		dao.close();
	%>
</body>
</html>
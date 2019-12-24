<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name, email, pwd;
		name = request.getParameter("name");
		email = request.getParameter("email");
		pwd = request.getParameter("pwd");

		MemberDAO dao = new MemberDAO();
		boolean b;
		b = dao.insertOne(email, name, pwd);
		if (b) {
			out.println("<h1>뭔가 잘 안되었습니다</h1>");
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			request.setAttribute("status", "fail");
			rd.forward(request, response);
		} else {
			out.println("<h1>뭔가 잘 되었습니다</h1>");
			response.sendRedirect("login.jsp");
		}
	%>
</body>
</html>
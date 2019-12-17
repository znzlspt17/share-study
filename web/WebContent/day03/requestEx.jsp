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
		request.setCharacterEncoding("UTF-8");
		String method = request.getMethod();
		String val = request.getParameter("data");
		String ip = request.getRemoteAddr();
		String queryString = request.getQueryString();
		out.println("<h2> method : " + method + "</h2>");
		out.println("<h2> method : " + val + "</h2>");
		out.println("<h2> method : " + ip + "</h2>");
		out.println("<h2> method : " + queryString + "</h2>");
	%>
</body>
</html>